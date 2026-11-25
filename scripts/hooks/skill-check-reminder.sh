#!/usr/bin/env bash
# Hook UserPromptSubmit (.claude/settings.json): mỗi prompt, nhắc AI quét skill trước khi làm.
# Codex / Antigravity không có hook – quy tắc tương ứng nằm ở AGENTS.md mục 3.
cat <<'EOF'
[Nhắc tự động – scripts/hooks/skill-check-reminder.sh] Trước khi làm prompt này:
1. Quét danh sách skill (skill nhóm, superpowers, 6 skill cách làm việc – AGENTS.md mục 2, 3) và chọn skill khớp việc.
2. Mở đầu câu trả lời bằng một dòng: "Skill: <tên> – <vì sao>" hoặc "Skill: không cần – <vì sao>".
3. Gọi Skill tool cho skill đã chọn trước khi đọc file, viết file hay hỏi lại.
4. Prompt dài, nhiều ý, mơ hồ hoặc gõ vội → restate-intent trước.
EOF
