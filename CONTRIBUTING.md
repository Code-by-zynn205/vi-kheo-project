# Quy trình đóng góp – Nhóm Messi

Mục tiêu: **mỗi thành viên tự commit phần việc của mình bằng tài khoản GitHub của mình**, để lịch sử Git chứng minh cả nhóm cùng làm.

## 1. Nhánh (branch)

| Loại | Tên nhánh | Ví dụ |
| :--- | :--- | :--- |
| Tài liệu / Skill | `docs/<nội-dung>` | `docs/persona-interview-quotes` |
| Tính năng | `feature/<USxx>-<mô-tả>` | `feature/US01-add-expense` |
| Sửa lỗi | `fix/<mô-tả>` | `fix/daily-allowance-rounding` |

Không commit thẳng vào `main`. Mọi thay đổi vào `main` qua Pull Request.

## 2. Commit

Định dạng: `<loại>(<phạm vi>): <mô tả ngắn>`

```
docs(personas): thêm trích dẫn phỏng vấn PV-02
feat(US01): màn hình AddExpenseScreen với bàn phím số
fix(budget-logic): làm tròn xuống 1.000đ cho hạn mức ngày
```

## 3. Pull Request

1. Tiêu đề ghi rõ User Story hoặc file tài liệu liên quan.
2. Mô tả: làm gì, kiểm tra thế nào, ảnh chụp màn hình nếu là giao diện.
3. **Ít nhất 1 người ở cặp khác review** (xem cột "Review chéo" trong [skills/README.md](skills/README.md)).
4. Merge xong → chuyển thẻ Trello sang cột Done (theo Definition of Done ở [docs/discovery/07-roadmap.md](docs/discovery/07-roadmap.md)).

## 4. Sửa skill

Sửa skill của nhóm trong `skills/<tên>/`, sau đó chạy `bash scripts/sync-agent-skills.sh` (Git Bash) và commit cả `.agents/skills/`, `.claude/skills/`. Không sửa tay `.claude/skills/`.

## 5. Quy tắc dữ liệu (bắt buộc)

- Không viết số liệu khảo sát/phỏng vấn nếu không có trong Google Sheets hoặc biên bản phỏng vấn.
- Số liệu mới phải gắn nhãn nguồn `[SƠ CẤP]` / `[THỨ CẤP]` / `[NHẬN ĐỊNH]` và ghi vào [docs/discovery/00-research-log.md](docs/discovery/00-research-log.md).
- Khi dùng AI để viết, người commit chịu trách nhiệm kiểm tra lại từng con số.
