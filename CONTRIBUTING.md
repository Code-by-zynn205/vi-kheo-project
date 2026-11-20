# Quy trình đóng góp – Nhóm Messi

Mục tiêu: **mỗi thành viên tự commit phần việc của mình bằng tài khoản GitHub của mình**, để lịch sử Git chứng minh cả nhóm cùng làm.

## 1. Nhánh

| Loại | Tên nhánh | Ví dụ |
| :--- | :--- | :--- |
| Tài liệu, đặc tả màn hình, PRD, skill | `docs/<nội-dung>` | `docs/US01-prd` |
| Tính năng | `feature/USxx-<mô-tả>` | `feature/US01-add-expense` |
| Sửa lỗi | `fix/<mô-tả>` | `fix/daily-allowance-rounding` |

Không commit thẳng vào `main`. Mọi thay đổi vào `main` qua Pull Request. Nhánh `feature/USxx-*` chỉ được tạo khi PRD của USxx đã `Đã duyệt`.

## 2. Commit

Định dạng: `<loại>(<phạm vi>): <mô tả ngắn>`

```
docs(US01): PRD ghi khoản chi
docs(design): đặc tả AddExpenseScreen
feat(US01): màn hình AddExpenseScreen với bàn phím số
fix(budget-logic): làm tròn xuống 1.000đ cho hạn mức ngày
```

## 3. Pull Request

1. Tiêu đề ghi rõ User Story hoặc tài liệu liên quan.
2. Mô tả theo mẫu `.agents/skills/frontend-ui/templates/pr-description.md`: link PRD, plan, AI agent và skill đã dùng, kết quả từng AC, ảnh chụp nếu là giao diện.
3. **Ít nhất 1 người ở cặp khác review** (xem cột "Review" trong [docs/skill-standard.md](docs/skill-standard.md)).
4. Merge xong → chuyển thẻ Trello sang Done (Definition of Done ở [docs/discovery/07-roadmap.md](docs/discovery/07-roadmap.md)).

## 4. Sửa skill

1. Sửa trong `.agents/skills/<tên>/` theo [docs/skill-standard.md](docs/skill-standard.md). Không sửa tay `.claude/skills/`.
2. Chạy `bash scripts/sync-skills.sh` (Git Bash). Script báo lỗi nếu skill thiếu mục hoặc thiếu file mẫu.
3. Commit cả `.agents/skills/` và `.claude/skills/`.
4. Skill bên ngoài: ghi thay đổi vào [third_party/README.md](third_party/README.md).

## 5. Quy tắc dữ liệu

- Không viết số liệu khảo sát/phỏng vấn nếu không có trong Google Sheets hoặc biên bản phỏng vấn.
- Số liệu mới gắn nhãn `[SƠ CẤP]` / `[THỨ CẤP]` / `[NHẬN ĐỊNH]` và ghi vào [docs/discovery/00-research-log.md](docs/discovery/00-research-log.md).
- Khi dùng AI, người commit chịu trách nhiệm kiểm tra lại từng con số và từng dòng code.
