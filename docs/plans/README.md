# Spec và plan khi code (giai đoạn 4 – Vibe Code)

**Thứ tự công việc của cả dự án và lệnh cho AI agent:** [00-master-plan.md](00-master-plan.md).

Thư mục này chứa file do skill superpowers sinh ra khi code một User Story (xem `AGENTS.md` mục 3):

| File | Skill sinh ra | Đặt tên |
| :--- | :--- | :--- |
| `specs/…-design.md` | `brainstorming` | `specs/YYYY-MM-DD-USxx-<english-slug>-design.md` |
| `…md` | `writing-plans` | `YYYY-MM-DD-USxx-<english-slug>.md` |

Trước plan đầu tiên phải có ADR nền tảng `Đã chấp nhận` và `docs/architecture/technical-design.md` (skill `tech-decision`).

Mỗi plan bắt buộc có:

- Phần đầu: dòng `**PRD:**` và `**Skill nhóm áp dụng:**`.
- Tech Stack, đường dẫn file, lệnh kiểm tra: lấy từ `docs/architecture/technical-design.md`.
- Global Constraints: chép nguyên văn mục "Khi viết plan" của từng skill nhóm được áp dụng, luôn gồm `tech-decision`.
- Task giao diện theo `.agents/skills/frontend-ui/templates/screen-task.md`; task tính tiền theo `.agents/skills/budget-logic/templates/logic-task.md`.
