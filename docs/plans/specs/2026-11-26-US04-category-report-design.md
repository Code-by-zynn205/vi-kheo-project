# Thiết kế kỹ thuật – US04 Báo cáo theo danh mục

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3), budget-logic (mục 4.3) · **Trạng thái:** Nháp – AI (Claude Code) chốt theo uỷ quyền 26/11/2026 · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US04-category-report.md` · **Nền móng:** `2026-11-26-US01-add-expense-design.md` phần A

## Quyết định

| Việc | Cách làm | Lý do |
| :--- | :--- | :--- |
| Thống kê | Hàm thuần `reportByCategory(transactions, range)` ở `src/logic/reportByCategory.ts` | `budget-logic` 4.3; TC18 – TC20 |
| Khoảng ngày | `weekRange(today)` (thứ Hai → Chủ nhật, BR-05), `monthRange(today)` ở `src/utils/date.ts` | Dùng chung, có test |
| Vẽ `DonutChart` | `react-native-svg` (cài bằng `npx expo install react-native-svg`), vẽ cung bằng `Path` | Trả lời câu hỏi mở 1 của PRD (lựa chọn của AI); vẽ tay bằng `View` không ra vòng cung. **Phải thêm vào `technical-design.md` mục 6 trong PR** |
| Tab "Báo cáo" | Bỏ `href: null` của tab `report` | `HomeScreen.md` "Dựng theo story" |

**Phương án đã loại:** thư viện biểu đồ trọn gói (to, khó ép đúng token `--color-cat-*`).

## Giao diện tạo ra

- `reportByCategory(transactions: Transaction[], range: { from: string; to: string }): { total: number; rows: { categoryId: CategoryId; amount: number; percent: number }[] }`
- `weekRange(today: string)`, `monthRange(today: string)`: `{ from: string; to: string }`

## Để lại cho người code

Độ dày vòng, khoảng hở giữa các cung (theo frame Figma).
