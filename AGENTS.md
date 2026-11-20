# Hướng dẫn cho AI Agent – Dự án Ví Khéo

File này là hướng dẫn chung cho mọi AI agent của nhóm:

| Agent | Đọc hướng dẫn từ | Đọc skill từ |
| :--- | :--- | :--- |
| Codex | `AGENTS.md` | `.agents/skills/` |
| Antigravity | `AGENTS.md` | `.agents/skills/` |
| Claude Code | `CLAUDE.md` (trỏ về file này) | `.claude/skills/` (bản sao sinh tự động) |

## 1. Dự án

**Ví Khéo** – app quản lý chi tiêu tối giản cho sinh viên: ghi một khoản chi trong dưới 5 giây, luôn biết "Hôm nay còn được tiêu bao nhiêu". Môn Quản lý dự án Agile/Scrum, nhóm Messi 10 người, MVP trước 13/12/2026.

- Vấn đề, persona, Backlog, tiêu chí chấp nhận: `docs/discovery/02`, `03`, `06`
- Lộ trình, Definition of Done: `docs/discovery/07-roadmap.md`
- Nguồn của mọi con số: `docs/discovery/00-research-log.md`

## 2. Năm giai đoạn và skill tương ứng

Dự án đi theo 5 giai đoạn trong bảng đánh giá của giảng viên. Mỗi giai đoạn có skill của nhóm và **file đầu ra cố định**. Giai đoạn sau chỉ bắt đầu khi giai đoạn trước có đầu ra (xem quy tắc 1).

| # | Giai đoạn | Skill của nhóm | Skill hỗ trợ | Đầu ra (file .md) |
| :-: | :--- | :--- | :--- | :--- |
| 1 | Research & Discovery | `user-research`, `product-discovery` | — | `docs/discovery/`, `docs/evidence/` |
| 2 | Design System & Prototype | `design-system` | `frontend-design`, `ui-ux-pro-max` | `docs/design/screens/<Màn hình>.md`, `docs/design/prototype/*.html` |
| 3 | Product Requirements (PRD, User Story) | `product-requirements` | — | `docs/requirements/USxx-<mô-tả>.md` |
| 4 | Vibe Code | `tech-decision` (một lần, trước US đầu tiên), `frontend-ui`, `budget-logic` | superpowers (mục 3) | `docs/architecture/ADR-xx-*.md`, `docs/architecture/technical-design.md`, `docs/plans/specs/…-design.md`, `docs/plans/…md`, code trong `src/` |
| 5 | Present full product | `demo-present` | — | `docs/present/` |
| — | Xuyên suốt mỗi Sprint | `scrum-sprint` | — | `docs/sprints/sprint-N-*.md` |

Mỗi skill của nhóm có thư mục `templates/` chứa mẫu file đầu ra. **AI phải tạo file từ mẫu, không tự nghĩ ra định dạng.**

## 3. Skill superpowers – cách làm việc khi code

Đầu mỗi phiên, đọc skill `using-superpowers`. Ghi `superpowers:<tên>` nghĩa là skill `<tên>` trong thư mục skill ở trên.

| Khi | Skill |
| :--- | :--- |
| Bắt đầu code một User Story đã có PRD | `brainstorming` → `writing-plans` |
| Làm theo plan | `executing-plans` (mặc định) hoặc `subagent-driven-development` |
| Viết code tính tiền, logic | `test-driven-development` |
| Gặp lỗi, test fail | `systematic-debugging` |
| Trước khi báo "xong" | `verification-before-completion` |
| Trước khi mở / khi nhận review Pull Request | `requesting-code-review` / `receiving-code-review` |
| Xong nhánh | `finishing-a-development-branch` |
| Viết hoặc sửa skill của nhóm | `writing-skills` |

Thứ tự ưu tiên: **file này** → **skill của nhóm** (làm cái gì: nội dung, màu, công thức, AC) → **skill superpowers** (làm thế nào) → **skill hỗ trợ** (`frontend-design`, `ui-ux-pro-max` chỉ để gợi ý, không ghi đè `design-system`).

### Vị trí file và phần đầu plan (ghi đè mặc định của superpowers)

- Spec của `brainstorming`: `docs/plans/specs/YYYY-MM-DD-USxx-<mô-tả>-design.md`
- Plan của `writing-plans`: `docs/plans/YYYY-MM-DD-USxx-<mô-tả>.md`
- Phần đầu plan, ngay sau dòng `**Spec:**`, thêm 2 dòng bắt buộc:

```markdown
**PRD:** docs/requirements/USxx-<mô-tả>.md
**Skill nhóm áp dụng:** <tên skill> (mục <số>), <tên skill> (mục <số>)
```

- Mỗi task trong plan ghi skill nó dựa vào, ví dụ `### Task 2: Hàm tính hạn mức ngày [budget-logic §5, §7]`.
- Mục **Global Constraints** của plan phải chép nguyên văn mục "Khi viết plan" của từng skill nhóm được áp dụng, luôn gồm `tech-decision`.
- **Tech Stack**, đường dẫn file và lệnh kiểm tra của plan lấy từ `docs/architecture/technical-design.md`.

## 4. Quy tắc bắt buộc

### Nội dung và số liệu

1. **Đi đúng thứ tự giai đoạn.** Không viết code cho User Story chưa có PRD được PO duyệt (`docs/requirements/USxx-*.md`, trạng thái `Đã duyệt`). Không viết PRD cho màn hình chưa có đặc tả trong `docs/design/screens/`. Không viết plan code khi chưa có ADR nền tảng `Đã chấp nhận` và `docs/architecture/technical-design.md`.
2. **Không bịa số liệu, trích dẫn.** Con số phải có trong `00-research-log.md`, gắn nhãn `[SƠ CẤP]` / `[THỨ CẤP]` / `[NHẬN ĐỊNH]`. Chưa có dữ liệu thì ghi `Cần bổ sung`.
3. **Giữ phạm vi MVP.** Không thêm liên kết ngân hàng, OCR/AI, đầu tư, đăng nhập. Tính năng mới phải có User Story do PO duyệt.
4. **Tài liệu và giao diện viết tiếng Việt có dấu.** Trạng thái ghi bằng chữ (`Xong` / `Đang làm` / `Chưa làm` / `Cần bổ sung`), không dùng emoji. Không dùng LaTeX – dùng `≥`, `→`.
5. **Tiền là số nguyên VND**, hiển thị `35.000đ`. Công thức và test case theo `budget-logic`.
6. **Không dùng Figma.** Thiết kế = đặc tả màn hình `.md` + prototype HTML sinh từ `design-system`.

### Giao diện

7. **Chỉ dùng token của `design-system`.** Không viết cứng màu, cỡ chữ, font trong màn hình. Gợi ý từ `frontend-design` hoặc `ui-ux-pro-max` muốn dùng thì phải sửa `design-system` trước (qua Pull Request, cặp UI/UX duyệt).

### Code và Git

8. **Definition of Done:** đạt mọi AC trong PRD · chạy trên điện thoại thật · đúng design system · review qua Pull Request (phần tính tiền có unit test) · thẻ Trello sang Done.
9. **Không commit thẳng vào `main`.** Nhánh `feature/USxx-<mô-tả>`, `docs/<nội-dung>`, `fix/<mô-tả>`. Commit `<loại>(<phạm vi>): <mô tả>` (xem `CONTRIBUTING.md`).
10. **Pull Request ghi rõ:** User Story, link PRD và plan, AI agent đã dùng (Codex / Antigravity / Claude Code), skill đã dùng, ảnh chụp trên điện thoại thật nếu là giao diện.
11. **Người commit chịu trách nhiệm** đọc lại và chạy thử mọi dòng code, mọi con số AI sinh ra. Không dán code chưa chạy.

### An toàn

12. **Không đưa dữ liệu cá nhân** của người được khảo sát/phỏng vấn lên repo (họ tên, SĐT, MSSV).
13. **Không commit khoá API, token, mật khẩu**, file build, `node_modules`.
14. **Không cài skill, thư viện, script từ nguồn chưa duyệt.** Skill bên ngoài phải ghi nguồn, phiên bản, giấy phép trong `third_party/README.md`.

## 5. Sửa skill

- **Nguồn gốc duy nhất:** `.agents/skills/<tên>/`. Không sửa tay `.claude/skills/`.
- Sau khi sửa, chạy `bash scripts/sync-skills.sh` (Git Bash) – script kiểm tra cấu trúc rồi chép sang `.claude/skills/`. Commit cả 2 thư mục.
- Skill của nhóm phải đủ các mục theo `docs/skill-standard.md`.
- Sửa skill bên ngoài (superpowers, `frontend-design`, `ui-ux-pro-max`): ghi lại thay đổi ở `third_party/README.md`.
