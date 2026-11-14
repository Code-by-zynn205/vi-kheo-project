# Superpowers (bên thứ ba)

- **Nguồn:** https://github.com/obra/superpowers – tác giả Jesse Vincent
- **Giấy phép:** MIT (xem [LICENSE](LICENSE))
- **Phiên bản:** 7.0.2, commit `22f0b463e7a5e579904dd6211a520321035526f7` (03/11/2026)
- **Ngày đưa vào dự án:** 14/11/2026

Các skill được chép vào `.agents/skills/` (Codex, Gemini CLI) và sao sang `.claude/skills/` (Claude Code) bằng `scripts/sync-agent-skills.sh`.

## Skill đã chọn (12/15)

| Nhóm | Skill | Dùng trong dự án khi |
| :--- | :--- | :--- |
| Khởi động | `using-superpowers` | Đầu mỗi phiên – nhắc AI tìm và dùng skill phù hợp |
| Thiết kế & lập kế hoạch | `brainstorming` | Bắt đầu một User Story/tính năng mới: hỏi rõ yêu cầu trước khi code |
| | `writing-plans` | Chia User Story thành các bước nhỏ có test |
| Thực thi | `executing-plans` | Làm theo plan ngay trong phiên hiện tại |
| | `subagent-driven-development` | Làm theo plan bằng subagent (tốn token hơn). `executing-plans` cũng dùng script của skill này |
| | `using-git-worktrees` | Tách thư mục làm việc khi chạy plan (được 2 skill trên gọi tới) |
| Chất lượng | `test-driven-development` | Viết code tính tiền (`budget-logic`): viết test trước |
| | `systematic-debugging` | Gặp lỗi, test fail: tìm nguyên nhân gốc trước khi sửa |
| | `verification-before-completion` | Trước khi báo "xong": chạy kiểm tra thật – khớp Definition of Done |
| Review & merge | `requesting-code-review` | Trước khi mở Pull Request |
| | `receiving-code-review` | Khi nhận góp ý review từ cặp khác |
| | `finishing-a-development-branch` | Xong nhánh: chọn merge / mở PR / giữ nhánh |

## Không đưa vào

| Skill | Lý do |
| :--- | :--- |
| `dispatching-parallel-agents` | Chạy nhiều agent song song – tốn chi phí, không cần cho quy mô MVP |
| `writing-skills` | Quy trình viết skill kèm kiểm thử bằng subagent – nhóm đã có chuẩn 8 thành phần riêng ở `skills/README.md` |
| `diagnosing-superpowers` | Dùng để báo lỗi cho người phát triển superpowers, không liên quan dự án |

## Thay đổi so với bản gốc

1. `using-superpowers/SKILL.md`: mục *Platform Adaptation* chỉ giữ Claude Code, Codex, thêm Gemini CLI; thêm ghi chú `superpowers:<tên>` = skill `<tên>` trong repo.
2. `using-superpowers/references/`: xoá file cho Pi, Antigravity, Hermes, Muse (nhóm không dùng).

Các file còn lại giữ nguyên.

## Lưu ý

- Plan và spec do skill sinh ra lưu ở `docs/superpowers/plans/` và `docs/superpowers/specs/` (mặc định của superpowers).
- Thư mục làm việc tạm `.superpowers/` và `.worktrees/` đã được đưa vào `.gitignore`.
- `brainstorming` có "visual companion" (tuỳ chọn) tải logo từ máy chủ của tác giả để đếm lượt dùng. Tắt bằng biến môi trường `SUPERPOWERS_DISABLE_TELEMETRY=1`.
- Cập nhật phiên bản mới: chép lại các thư mục skill ở bảng trên từ repo gốc vào `.agents/skills/`, làm lại 2 thay đổi ở trên, rồi chạy `bash scripts/sync-agent-skills.sh`.
