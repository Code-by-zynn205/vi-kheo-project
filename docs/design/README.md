# Thiết kế (giai đoạn 2 – Design System & Prototype)

Thiết kế làm trên **Figma**; repo giữ token và đặc tả để AI agent đọc (AGENTS.md quy tắc 6, `design-system` mục 4.4 – 4.6).

**File Figma của nhóm:** [Ví Khéo](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o) – file key `r3QiOYkP7orX9dNyDEDmvl`. Link frame từng màn hình ghi ở dòng "Figma" trong đặc tả. 4 frame hiện có là bản demo.

**Kế hoạch dựng lại – 161 khung, phủ cả 3 lớp dữ liệu (21/11):** [screen-inventory.md](screen-inventory.md) – 4 đợt, 18 luồng prototype, phân công 10 thành viên. **Đợt 1 – 4 xong (161/161 khung), prototype đủ 18 luồng** – đợt 1: hàng `Onboarding – states` và 5 màn mới ở hàng `SettingsScreen – states`; đợt 2 (R2, nhãn "Sau MVP"): hàng `R2 · M8 Ví & chuyển tiền`, `R2 · M2+ Ghi chi nâng cao`, `R2 · M9 Định kỳ & dành sẵn`, `R2 · M14 Hạn mức danh mục`; đợt 3: `R2 · M10 Mục tiêu tiết kiệm`, `R2 · M11 Vay mượn bạn bè`, `R2 · M12 Chia tiền nhóm`, `R2 · M13 Danh mục tự tạo`, `R2 · M15 Nhãn, chuỗi ngày, sao lưu`; đợt 4 (R3, nhãn "R3 · Sau MVP"): `R3 · M16 Tài khoản & đồng bộ` (10 khung app), `R3 · M17 Trang quản trị (web)` (16 khung 1440×900).

**Trang trong file:** `00 Cover` (bảng trạng thái) · `Demo UI` · `Prototype` · `_Archive / …` (bản demo cũ).

**UI demo sản phẩm (21/11):** trang [`Demo UI`](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=102-2) – 9 màn: `HomeScreen / SAFE`, `HomeScreen / Deleted` (Snackbar Hoàn tác), `AddExpenseScreen / Default`, `BudgetScreen / NewMonthSuggestion`, `ReportScreen / Month`, `EditTransactionSheet / Default`, `SettingsScreen / ReminderOn`, `SettingsScreen / BlockedByPhone`, `HistoryScreen / WithData`. Dựng từ biến `Ví Khéo / Tokens` (28 biến), 6 kiểu chữ, 13 component (khung `Components`). Bên dưới có 3 hàng trạng thái (giai đoạn A, 21/11): `HomeScreen – states` (WARNING, OVER, OUT_OF_BUDGET, NO_BUDGET, Empty, WithIncome, LoadError), `AddExpenseScreen – states` (Empty, Income, ErrorMax, NoteFull, Saving, SaveError, DiscardConfirm), `BudgetScreen – states` (FirstTime, Set, Invalid, ErrorMax, BelowSpent) ; giai đoạn B (21/11): `ReportScreen – states` (Week, Empty, SingleCategory), `EditTransactionSheet – states` (Edited, DiscardConfirm, DeleteConfirm), `SettingsScreen – states` (ReminderOff, PermissionExplain, `HomeScreen / InviteReminder`), `HistoryScreen – states` (Empty, Today, FirstDay) – **đủ 40/40 khung** theo `figma-plan.md`. **Prototype (21/11):** trang [`Prototype`](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) – cập nhật 21/11 (sau đợt 4): 90 khung, 88 điểm bấm, **18 luồng P1 – P18** theo `screen-inventory.md` mục 4 (P10 – P16 là R2, P17 – P18 là R3, đều "Sau MVP"). Mở bằng nút Present (▶) trong Figma. Số liệu là minh hoạ. AI dựng theo yêu cầu của nhóm; cặp UI/UX duyệt và chỉnh tiếp.

**Đối chiếu bản demo với đặc tả (21/11):** [figma-gap-report.md](figma-gap-report.md) – 8 quyết định cần chốt trước khi vẽ lại.

**Kế hoạch dựng file Figma hoàn chỉnh** (cấu trúc trang, Variables, component, 40 frame, prototype, lịch): [figma-plan.md](figma-plan.md).

| Phần | Vị trí | Skill |
| :--- | :--- | :--- |
| Bố cục, hình ảnh, prototype bấm thử | File Figma: trang `00 Tokens`, `01 Components`, `02 Screens`, `03 Prototype` | `design-system` |
| Token, component, nguyên tắc | `.agents/skills/design-system/SKILL.md` | `design-system` |
| Đặc tả từng màn hình | `screens/<ScreenName>.md` (mẫu `.agents/skills/design-system/templates/screen-spec.md`) | `design-system` |
| Prototype HTML để test với sinh viên | `prototype/<english-name>.html` | `design-system` (gợi ý thêm từ `frontend-design`) |

| Màn hình | User Story | Sprint | Trạng thái |
| :--- | :--- | :--- | :--- |
| [SplashScreen](screens/SplashScreen.md) | US01 | 2 | Xong (26/11) |
| [HomeScreen](screens/HomeScreen.md) | US01, US02, US03 | 2 | Xong (26/11) |
| [AddExpenseScreen](screens/AddExpenseScreen.md) | US01, US07 | 2 | Xong (26/11) |
| [OnboardingScreen](screens/OnboardingScreen.md) | US03 | 2 | Xong (26/11) |
| [OnboardingBudgetScreen](screens/OnboardingBudgetScreen.md) | US02 | 2 | Xong (26/11) |
| [BudgetScreen](screens/BudgetScreen.md) | US02 | 2 | Xong (26/11) – Q2, Q3 theo đề xuất |
| [TrialInfoScreen](screens/TrialInfoScreen.md) | US19 | 2 | Xong (26/11) |
| [ReportScreen](screens/ReportScreen.md) | US04 | 3 | Đang làm – chờ UI/UX duyệt |
| [EditTransactionSheet](screens/EditTransactionSheet.md) | US06 | 3 | Đang làm – chờ UI/UX duyệt, PO Q6, Q7, Q15 |
| [SettingsScreen](screens/SettingsScreen.md) | US19 (khung), US05, US20 | 2 – 3 | Khung Xong (26/11); nhắc nhở chờ PO Q5, Q8 |
| [HistoryScreen](screens/HistoryScreen.md) | US08 | 3 – nếu kịp | Đang làm – chờ UI/UX duyệt |

| Prototype | Dùng để | Trạng thái |
| :--- | :--- | :--- |
| [prototype/home.html](prototype/home.html) | Test giả định A3 – hướng dẫn: [a3-test-guide.md](../evidence/prototype-tests/a3-test-guide.md). Đổi trạng thái bằng `#warning`, `#over`, `#out`, `#nobudget`, `#empty` | Xong – chờ chạy test |
