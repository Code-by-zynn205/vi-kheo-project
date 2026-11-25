# Thiết kế kỹ thuật – US03 Hôm nay còn được tiêu

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3), budget-logic (mục 4.2) · **Trạng thái:** Nháp – AI (Claude Code) chốt theo uỷ quyền 26/11/2026 · **Phụ trách:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến (logic), Lê Thị Phát (giao diện) · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US03-daily-allowance.md` · **Nền móng:** `2026-11-26-US01-add-expense-design.md` phần A

## Quyết định

| Việc | Cách làm | Lý do |
| :--- | :--- | :--- |
| Con số và trạng thái | Hàm thuần `computeDailyAllowance` dùng `computeDayLimit` (US02) rồi áp quy tắc trạng thái `budget-logic` 4.2 **đúng nguyên văn hiện tại** | Q18 chưa duyệt; PO duyệt thì thêm TC17 và sửa đúng một nhánh `if` |
| `OUT_OF_BUDGET` | Trả `remainingToday = 0`; dòng phụ "Đã dùng hết ngân sách tháng" | Đặc tả `HomeScreen.md`; Q17 nếu duyệt chỉ thêm số tiền vào dòng phụ |
| Thanh "đã dùng x%" | Hàm thuần `computeMonthUsage`: `percent = Math.round(spentThisMonth × 100 / (budget + incomeThisMonth))` | Q19 đề xuất (sửa 26/11): phần trăm làm tròn gần nhất, mẫu số gồm khoản thu |
| Qua 00:00 | `useToday()` (US01) đổi giá trị → hook Home đọc lại → số tính lại | EC-02, AC7 |
| Onboarding | Route `onboarding` (3 trang, vuốt bằng `FlatList` ngang có `pagingEnabled` của React Native); `_layout.tsx` gốc chuyển tới đây khi `onboardingDoneAt` rỗng | BR-120; không thêm thư viện trượt trang |

**Phương án đã loại:** lưu hạn mức ngày vào DB (trái BR-06) · thư viện carousel (không cần cho 3 trang).

## Giao diện tạo ra cho story sau

- `computeDailyAllowance(input: { budget: MonthlyBudget | null; transactions: Transaction[]; today: string }): DailyAllowance` với `DailyAllowance = { status: 'SAFE' | 'WARNING' | 'OVER' | 'OUT_OF_BUDGET' | 'NO_BUDGET'; dayLimit: number | null; remainingToday: number | null; overBy: number }`
- `computeMonthUsage(input: { budget: number; incomeThisMonth: number; spentThisMonth: number }): { percent: number; used: number; base: number }`

## Để lại cho người code

Hiệu ứng đổi màu; cách chia component con của `DailyAllowanceCard`.
