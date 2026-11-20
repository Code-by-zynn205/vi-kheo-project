#!/usr/bin/env bash
# Kiểm tra skill rồi chép .agents/skills (nguồn gốc) sang .claude/skills (bản sao cho Claude Code).
#   .agents/skills/<tên>/   Codex + Antigravity đọc trực tiếp – SỬA Ở ĐÂY
#   .claude/skills/<tên>/   Claude Code đọc – sinh bằng script này, KHÔNG sửa tay
#
# Chạy từ Git Bash:  bash scripts/sync-skills.sh
# Chỉ kiểm tra, không chép:  bash scripts/sync-skills.sh --check
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

# Skill của nhóm phải theo docs/skill-standard.md
team_skills="user-research product-discovery design-system product-requirements frontend-ui budget-logic scrum-sprint demo-present"
required_sections=(
  "## 1. Giai đoạn & phụ trách"
  "## 2. Khi nào dùng / không dùng"
  "## 3. Đầu vào"
  "## 4. Quy trình"
  "## 5. Đầu ra"
  "## 6. Khi viết plan"
  "## 7. Quy tắc bắt buộc"
  "## 8. Checklist"
)

errors=0
fail() { echo "LỖI: $1"; errors=$((errors + 1)); }

# 1. Mọi skill: có SKILL.md, frontmatter name trùng tên thư mục, có description
for dir in .agents/skills/*/; do
  name="$(basename "$dir")"
  file="$dir/SKILL.md"
  [ -f "$file" ] || { fail "$name: thiếu SKILL.md"; continue; }
  head -1 "$file" | grep -q '^---$' || fail "$name: SKILL.md phải bắt đầu bằng frontmatter '---'"
  fm_name="$(sed -n '2,10p' "$file" | grep -m1 '^name:' | sed 's/^name:[[:space:]]*//; s/^"//; s/"$//' || true)"
  [ "$fm_name" = "$name" ] || fail "$name: frontmatter name '$fm_name' khác tên thư mục"
  sed -n '2,10p' "$file" | grep -q '^description:' || fail "$name: thiếu description"
done

# 2. Skill của nhóm: đủ 8 mục, có templates/, mọi mẫu được nhắc tới đều tồn tại
for name in $team_skills; do
  dir=".agents/skills/$name"
  file="$dir/SKILL.md"
  [ -f "$file" ] || { fail "$name: chưa có skill của nhóm"; continue; }
  for s in "${required_sections[@]}"; do
    grep -qF "$s" "$file" || fail "$name: thiếu mục '$s'"
  done
  grep -q "description:.*Dùng khi" "$file" || fail "$name: description phải có 'Dùng khi …'"
  [ -d "$dir/templates" ] || fail "$name: thiếu thư mục templates/"
  # Chỉ xét mẫu của chính skill này (bỏ qua dạng <skill-khác>/templates/...)
  for t in $(grep -oE '(^|[^/A-Za-z0-9_-])templates/[A-Za-z0-9_-]+\.md' "$file" | grep -oE 'templates/.*' | sort -u); do
    [ -f "$dir/$t" ] || fail "$name: nhắc tới $t nhưng không có file"
  done
done

if [ "$errors" -gt 0 ]; then
  echo "Có $errors lỗi. Sửa trong .agents/skills/ rồi chạy lại."
  exit 1
fi
echo "Kiểm tra xong: $(ls -d .agents/skills/*/ | wc -l) skill, không có lỗi."

[ "${1:-}" = "--check" ] && exit 0

# 3. Chép sang .claude/skills
rm -rf .claude/skills
mkdir -p .claude
cp -r .agents/skills .claude/skills
find .claude/skills -name '__pycache__' -type d -prune -exec rm -rf {} +
echo "Đã chép sang .claude/skills. Nhớ commit cả .agents/skills và .claude/skills."
