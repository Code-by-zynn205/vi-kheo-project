# Hướng dẫn cho AI Agent – Dự án Ví Khéo

File này dùng chung cho Codex (đọc trực tiếp `AGENTS.md`), Claude Code (qua `CLAUDE.md`) và Gemini CLI (qua `GEMINI.md`).

## 1. Dự án

**Ví Khéo** – app quản lý chi tiêu tối giản cho sinh viên: ghi một khoản chi trong dưới 5 giây, luôn biết "Hôm nay còn được tiêu bao nhiêu". Dự án môn Quản lý dự án Agile/Scrum, nhóm 10 người, MVP trước 13/12/2026.

- Tổng quan, lộ trình: `README.md`, `docs/discovery/07-roadmap.md`
- Vấn đề, persona, Backlog + tiêu chí chấp nhận: `docs/discovery/02`, `03`, `06`
- Nguồn của mọi con số: `docs/discovery/00-research-log.md`

## 2. Skill

Skill nằm ở `.agents/skills/` (Codex, Gemini CLI) và `.claude/skills/` (Claude Code). Đầu mỗi phiên, đọc skill `using-superpowers`. Ghi `superpowers:<tên>` nghĩa là skill `<tên>` trong các thư mục trên.

### Skill của nhóm (nội dung dự án – ưu tiên khi có xung đột)

| Việc | Skill |
| :--- | :--- |
| Xử lý khảo sát, phỏng vấn, kiểm tra một con số | `user-research` |
| Sửa tài liệu Discovery, thêm/đổi User Story | `product-discovery` |
| Giao diện: màu, chữ, component, màn hình | `design-system` |
| Code màn hình theo User Story | `frontend-ui` |
| Lưu dữ liệu, công thức tính tiền, unit test | `budget-logic` |
| Sprint Planning, báo cáo tuần, Review, Retro | `scrum-sprint` |

### Skill superpowers (quy trình làm việc)

| Khi | Skill |
| :--- | :--- |
| Bắt đầu một User Story/tính năng mới | `brainstorming` → `writing-plans` |
| Làm theo plan | `executing-plans` (mặc định) hoặc `subagent-driven-development` |
| Viết code tính tiền, logic | `test-driven-development` |
| Gặp lỗi, test fail | `systematic-debugging` |
| Trước khi báo "xong" | `verification-before-completion` |
| Trước khi mở / khi nhận review Pull Request | `requesting-code-review` / `receiving-code-review` |
| Xong nhánh | `finishing-a-development-branch` |

Thứ tự áp dụng: skill superpowers quyết định *cách làm*, skill của nhóm quyết định *làm cái gì* (nội dung, màu, công thức, AC).

## 3. Quy tắc bắt buộc

1. **Không bịa số liệu, trích dẫn.** Con số phải có trong `00-research-log.md`. Gắn nhãn `[SƠ CẤP]` / `[THỨ CẤP]` / `[NHẬN ĐỊNH]`.
2. **Giữ phạm vi MVP.** Không thêm liên kết ngân hàng, OCR/AI, đầu tư, đăng nhập. Tính năng mới phải có User Story do PO duyệt.
3. **Tài liệu và giao diện viết tiếng Việt có dấu.** Trạng thái ghi bằng chữ (Xong / Đang làm / Chưa làm / Cần bổ sung), không dùng emoji. Không dùng LaTeX (`$\ge$`) – dùng `≥`, `→`.
4. **Tiền là số nguyên VND**, hiển thị `35.000đ`. Công thức và test case theo `budget-logic`.
5. **Definition of Done:** đạt AC · chạy trên điện thoại thật · đúng design system · đã review qua Pull Request (phần tính tiền có unit test) · thẻ Trello sang Done.
6. **Git:** không commit thẳng vào `main`. Nhánh `feature/USxx-<mô-tả>`, `docs/<nội-dung>`, `fix/<mô-tả>`. Commit `<loại>(<phạm vi>): <mô tả>` (xem `CONTRIBUTING.md`).
7. **Không đưa dữ liệu cá nhân** của người được khảo sát/phỏng vấn lên repo.

## 4. Sửa skill

- Skill của nhóm: sửa trong `skills/<tên>/`.
- Skill superpowers: sửa trong `.agents/skills/<tên>/` (ghi lại thay đổi ở `third_party/superpowers/README.md`).
- **Không sửa tay `.claude/skills/`.** Sau khi sửa, chạy `bash scripts/sync-agent-skills.sh` rồi commit cả 3 thư mục.
