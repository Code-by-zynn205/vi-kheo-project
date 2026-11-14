#!/usr/bin/env bash
# Đồng bộ skill cho 3 AI agent:
#   skills/<tên>/           (skill của nhóm – nguồn gốc, sửa ở đây)
#   .agents/skills/<tên>/   (Codex + Gemini CLI; chứa thêm skill superpowers – sửa superpowers ở đây)
#   .claude/skills/<tên>/   (Claude Code – bản sao, KHÔNG sửa tay)
#
# Chạy từ thư mục gốc repo (Git Bash trên Windows):  bash scripts/sync-agent-skills.sh
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

# 1. Chép skill của nhóm vào .agents/skills (ghi đè thư mục cùng tên)
for dir in skills/*/; do
  name="$(basename "$dir")"
  [ -f "$dir/SKILL.md" ] || continue
  rm -rf ".agents/skills/$name"
  cp -r "$dir" ".agents/skills/$name"
done

# 2. Sao toàn bộ .agents/skills sang .claude/skills
rm -rf .claude/skills
mkdir -p .claude
cp -r .agents/skills .claude/skills

echo "Đã đồng bộ $(find .agents/skills -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l) skill vào .agents/skills và .claude/skills"
