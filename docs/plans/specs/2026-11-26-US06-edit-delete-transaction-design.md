# Thiết kế kỹ thuật – US06 Sửa / xoá giao dịch

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – AI (Claude Code) chốt theo uỷ quyền 26/11/2026 · **Phụ trách:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US06-edit-delete-transaction.md` · **Nền móng:** `2026-11-26-US01-add-expense-design.md` phần A

## Quyết định

| Việc | Cách làm | Lý do |
| :--- | :--- | :--- |
| Lưu trữ | `updateTransaction` (chỉ `amount`, `categoryId`, `note`, `updatedAt` – không đổi `type`, `date`), `deleteTransaction` (đặt `deletedAt`), `restoreTransaction` (xoá `deletedAt`) | BR-11, BR-90, ADR-02 |
| Nút "Lưu thay đổi" | Hàm thuần `isEdited(original, draft): boolean` | `EditTransactionSheet.md` mục 2 |
| Màn sửa | Route `edit/[id]` (modal); dùng lại `NumericKeypad`, `QuickCategoryChip`, `NoteInput` của US01 | Đặc tả: "dùng lại bố cục `AddExpenseScreen`" |
| Hoàn tác | Sau xoá, `router.back()` rồi `Snackbar` ở Home với nút "Hoàn tác" 8 giây; bấm → `restoreTransaction` + đọc lại | BR-90; `Snackbar` 8 giây (`design-system` 4.3) |
| Báo cho nhắc nhở | Sau xoá / hoàn tác gọi `syncReminders()` nếu US05 đã có | ADR-04 mục 6.4 |

**Phương án đã loại:** xoá hẳn rồi chèn lại khi Hoàn tác (mất `createdAt`, sai thứ tự – trái AC7).

## Để lại cho người code

Cách truyền `Snackbar` từ màn sửa về Home (tham số route hoặc context nhỏ).
