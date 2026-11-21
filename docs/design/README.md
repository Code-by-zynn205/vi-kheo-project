# Thiết kế (giai đoạn 2 – Design System & Prototype)

Thiết kế làm trên **Figma**; repo giữ token và đặc tả để AI agent đọc (AGENTS.md quy tắc 6, `design-system` mục 4.4 – 4.6).

**File Figma của nhóm:** [Ví Khéo](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o) – file key `r3QiOYkP7orX9dNyDEDmvl`. Link frame từng màn hình ghi ở dòng "Figma" trong đặc tả. 4 frame hiện có là bản demo.

**Kế hoạch dựng file Figma hoàn chỉnh** (cấu trúc trang, Variables, component, 40 frame, prototype, lịch): [figma-plan.md](figma-plan.md).

| Phần | Vị trí | Skill |
| :--- | :--- | :--- |
| Bố cục, hình ảnh, prototype bấm thử | File Figma: trang `00 Tokens`, `01 Components`, `02 Screens`, `03 Prototype` | `design-system` |
| Token, component, nguyên tắc | `.agents/skills/design-system/SKILL.md` | `design-system` |
| Đặc tả từng màn hình | `screens/<ScreenName>.md` (mẫu `.agents/skills/design-system/templates/screen-spec.md`) | `design-system` |
| Prototype HTML để test với sinh viên | `prototype/<english-name>.html` | `design-system` (gợi ý thêm từ `frontend-design`) |

| Màn hình | User Story | Sprint | Trạng thái |
| :--- | :--- | :--- | :--- |
| [HomeScreen](screens/HomeScreen.md) | US01, US03 | 1 – 2 | Đang làm – chờ UI/UX duyệt |
| [AddExpenseScreen](screens/AddExpenseScreen.md) | US01, US07 | 1 – 2 | Đang làm – chờ UI/UX duyệt |
| [BudgetScreen](screens/BudgetScreen.md) | US02 | 2 | Đang làm – chờ UI/UX duyệt, PO Q2, Q3 |
| [ReportScreen](screens/ReportScreen.md) | US04 | 3 | Đang làm – chờ UI/UX duyệt |
| [EditTransactionSheet](screens/EditTransactionSheet.md) | US06 | 3 | Đang làm – chờ UI/UX duyệt, PO Q6, Q7, Q15 |
| [SettingsScreen](screens/SettingsScreen.md) | US05 | 3 | Đang làm – chờ UI/UX duyệt, PO Q5, Q8 |
| [HistoryScreen](screens/HistoryScreen.md) | US08 | 3 – nếu kịp | Đang làm – chờ UI/UX duyệt |

| Prototype | Dùng để | Trạng thái |
| :--- | :--- | :--- |
| [prototype/home.html](prototype/home.html) | Test giả định A3 – hướng dẫn: [a3-test-guide.md](../evidence/prototype-tests/a3-test-guide.md). Đổi trạng thái bằng `#warning`, `#over`, `#out`, `#nobudget`, `#empty` | Xong – chờ chạy test |
