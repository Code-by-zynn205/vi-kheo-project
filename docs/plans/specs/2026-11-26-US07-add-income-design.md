# Thiết kế kỹ thuật – US07 Ghi khoản thu

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – AI (Claude Code) chốt theo uỷ quyền 26/11/2026 · **Phụ trách:** Lê Thị Phát · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US07-add-income.md` · **Nền móng:** `2026-11-26-US01-add-expense-design.md` phần A

## Quyết định

| Việc | Cách làm | Lý do |
| :--- | :--- | :--- |
| Tạo khoản thu | Dùng `createTransaction` của US01 với `type: 'INCOME'`; ép `categoryId = null` cho `INCOME` | BR-10; một hàm, một chỗ kiểm |
| Công tắc `Chi \| Thu` | `SegmentedControl` trên `AddExpenseScreen`; đổi chế độ giữ nguyên số tiền | `AddExpenseScreen.md` mục 3 |
| Tổng "Chi tiêu hôm nay" | Dùng `sumByType(…, 'EXPENSE', today, today)` (US01) | Khoản thu không cộng vào tổng (AC5) |
| Hạn mức | Không sửa logic: `computeDayLimit` đã cộng `incomeThisMonth` (US02, TC7) | US07 chỉ tạo dữ liệu thu |

**Phương án đã loại:** màn nhập riêng cho khoản thu (trái đặc tả, thêm thao tác).

## Để lại cho người code

Hiệu ứng ẩn / hiện lưới danh mục.
