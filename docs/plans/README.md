# Spec và plan khi code (giai đoạn 4 – Vibe Code)

Thư mục này chứa file do skill superpowers sinh ra khi code một User Story (xem `AGENTS.md` mục 3):

| File | Skill sinh ra | Đặt tên |
| :--- | :--- | :--- |
| `specs/…-design.md` | `brainstorming` | `specs/YYYY-MM-DD-USxx-<mô-tả>-design.md` |
| `…md` | `writing-plans` | `YYYY-MM-DD-USxx-<mô-tả>.md` |

Mỗi plan bắt buộc có:

- Phần đầu: dòng `**PRD:**` và `**Skill nhóm áp dụng:**`.
- Global Constraints: chép nguyên văn mục "Khi viết plan" của từng skill nhóm được áp dụng.
- Task giao diện theo `.agents/skills/frontend-ui/templates/screen-task.md`; task tính tiền theo `.agents/skills/budget-logic/templates/logic-task.md`.
