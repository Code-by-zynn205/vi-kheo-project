# Thiết kế kỹ thuật – US02 Ngân sách tháng

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – AI (Claude Code) chốt theo uỷ quyền 26/11/2026 · **Phụ trách:** Nguyễn Đức Minh Nghĩa · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US02-monthly-budget.md` · **Nền móng:** `2026-11-26-US01-add-expense-design.md` phần A

## Quyết định

| Việc | Cách làm | Lý do |
| :--- | :--- | :--- |
| Hạn mức ngày cho khung xem trước | Hàm thuần `computeDayLimit` ở `src/logic/dailyAllowance.ts` – **US02 viết, US03 dùng lại** | Xem trước và thẻ ở Home phải ra cùng một số (`budget-logic` 4.2); một hàm, một bộ test |
| Ô số tiền | Dùng lại `applyAmountKey` (US01); lỗi ở màn này là "Ngân sách tối đa 99.999.999đ" | Một quy tắc nhập tiền cho mọi ô (Q3 đề xuất) |
| `source` | `COPIED_FROM_PREVIOUS` khi bấm "Dùng lại số này" và lưu đúng số đó; còn lại `MANUAL` | PRD câu hỏi mở 3 (đề xuất) |
| Quay về sau khi lưu | Route nhận tham số `from=home`; có thì `router.back()`, không thì ở lại | `BudgetScreen.md` mục 2 "Đã lưu" |
| Thẻ `NO_BUDGET` ở Home | Component `DailyAllowanceCard` dựng ở US02 với **một** trạng thái `NO_BUDGET`; US03 thêm 4 trạng thái còn lại | Thứ tự hàng đợi: US02 trước US03 |
| Tab "Ngân sách" | Bỏ `href: null` của tab `budget` | `HomeScreen.md` "Dựng theo story" |
| `OnboardingBudgetScreen` | Dựng màn và route `onboarding-budget`; lối vào từ `OnboardingScreen` làm ở US03 | PRD mục 6 |

**Phương án đã loại:** tính xem trước ngay trong màn hình (lệch số với Home) · lưu ngân sách ngay khi bấm "Dùng lại số này" (trái BR-22).

## Giao diện tạo ra cho story sau

- `computeDayLimit(input: { budget: number; incomeThisMonth: number; spentBeforeToday: number; today: string }): { fundAtStartOfDay: number; daysLeft: number; dayLimit: number }`
- `getBudget(month)`, `setBudget(b)` (chữ ký `budget-logic` 4.1), `getPreviousBudget(month: string): Promise<MonthlyBudget | null>`
- Dùng lại `sumByType` của US01 (`src/logic/sums.ts`)

## Để lại cho người code

Cách bố trí state trong màn hình; tách component con.
