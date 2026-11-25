# Sprint 2 Planning – Ghi chi, ngân sách, con số hôm nay (24/11 – 03/12/2026)

> **Giai đoạn:** 3, 4 · **Skill:** scrum-sprint (mục 4.2) · **Trạng thái:** Đang làm – bản đề xuất ngày 26/11/2026 (Sprint Planning trễ 2 ngày), chờ SM, PO chốt · **Phụ trách:** Trần Ninh Nhật Tân (SM) · **Cập nhật:** 26/11/2026

**Sprint Goal:** Trước 03/12, sinh viên dùng Android cài được bản dùng thử, ghi được khoản chi (và khoản thu), đặt ngân sách tháng và luôn thấy "Hôm nay còn được tiêu" – kèm màn "Thông tin dùng thử" để nhóm đo A4 trong tuần 04/12 – 10/12.

**Bối cảnh:** Sprint 1 chưa có dòng code (`00-master-plan.md` mục 1). Từ 26/11 đã có ADR-01 (React Native, Expo, Android), ADR-02 (SQLite trên máy), ADR-03 đề xuất (APK qua EAS), `technical-design.md` bản đầu và 5 PRD `Chờ duyệt`. Cả 8 Developer đều code tốt (Nguyễn Diên Tiến, 26/11) nên chia việc theo cặp phụ trách, không theo năng lực.

## 1. User Story trong Sprint

| Story | Story Point | Đặc tả màn hình (hạn) | PRD (hạn) | Spec + plan (hạn) | Code + PR (hạn) | Người code | Người review |
| :--- | :-: | :--- | :--- | :--- | :--- | :--- | :--- |
| US01 Ghi khoản chi (kèm dựng khung) | 3 | `AddExpenseScreen.md`, `HomeScreen.md`, `SplashScreen.md` (27/11) | `US01-add-expense.md` (duyệt 27/11) | 28/11 | 30/11 | Phát, Nghĩa (giao diện, khung); Bình Minh, Tiến (`storage` SQLite, migration) | Vy (giao diện) · Hưng |
| US02 Ngân sách tháng | 2 | `BudgetScreen.md`, `OnboardingBudgetScreen.md` (27/11) | `US02-monthly-budget.md` (duyệt 28/11) | 28/11 | 01/12 | Nghĩa | Bình Minh |
| US03 Hôm nay còn được tiêu | 3 | `HomeScreen.md`, `OnboardingScreen.md` (27/11, sau A3) | `US03-daily-allowance.md` (duyệt 28/11) | 29/11 | 01/12 | Bình Minh, Tiến (hàm tính, TDD); Phát (`DailyAllowanceCard`, onboarding) | Nghĩa |
| US19 Thông tin dùng thử | 1 | `TrialInfoScreen.md`, `SettingsScreen.md` phần khung (27/11) | `US19-trial-info.md` (PO duyệt Backlog + PRD 28/11) | 29/11 | 02/12 | Thương, Kiệt | Phát |
| US07 Ghi khoản thu | 1 | `AddExpenseScreen.md` chế độ Thu (27/11) | `US07-add-income.md` (duyệt 28/11) | 29/11 | 02/12 | Phát | Tiến |

**Tổng Story Point cam kết:** 10.

**Đường cắt 01/12:** bản dùng thử bắt buộc có US01, US02, US03, US19. US01 – US03 chưa xong ngày 01/12 thì cắt US07 sang Sprint 3.

**Làm song song để kịp:** ngày 28/11, cặp dữ liệu dựng `src/storage/` và `src/logic/` (TDD, không cần giao diện) cùng lúc cặp giao diện dựng khung app và màn hình với dữ liệu giả. Hai bên chỉ phải khớp nhau ở chữ ký `storage` trong `budget-logic` 4.1.

## 2. Việc hỗ trợ (mở khoá User Story)

| Việc | Skill | Mở khoá | Người làm | Hạn |
| :--- | :--- | :--- | :--- | :--- |
| PO chốt Q1, Q2, Q3, Q17, Q18, Q19; duyệt US19, US20; duyệt 5 PRD | `product-requirements` 4.2 | Bước PRD của cả 5 story | Hoan (PO) | 27/11 – 28/11 |
| Duyệt 7 đặc tả màn hình (đặt `Xong`), trả lời câu hỏi UI/UX trong 5 PRD | `design-system` 4.4a | Bước PRD của cả 5 story | Vy, Hưng | 27/11 |
| Test A3 với 5 sinh viên bằng `home.html` / prototype Figma | `user-research` | PRD US03 (rủi ro R4) | Thương, Kiệt | 27/11 |
| Duyệt `technical-design.md`, chốt ADR-03; tạo tài khoản Expo của nhóm | `tech-decision` | Spec + plan của mọi story; bản build | Phát (giao diện) + Bình Minh (dữ liệu); Tân (tài khoản) | 27/11 |
| Sửa `budget-logic` 4.1: `type` viết hoa, thêm `MonthlyBudget.source`, `Settings`, `AppMeta`; thêm TC17 khi PO duyệt Q18 | `budget-logic`, `writing-skills` | Plan US01, US03 | Bình Minh, Tiến | 28/11 |
| Bản build thử đầu tiên, **thử cài đè** giữ dữ liệu | `tech-decision` (ADR-03) | B1 – bản dùng thử | Phát, Nghĩa | 01/12 |
| Tuyển 20 sinh viên **dùng Android** (tối thiểu 5), hướng dẫn cài 3 bước | `user-research` | Dùng thử 04/12 | Thương, Kiệt | 01/12 |
| Đóng gói bản dùng thử, gửi link | `frontend-ui`, ADR-03 | Dùng thử 04/12 | Phát, Nghĩa | 03/12 |
| Viết ADR-04 (thông báo 21:00) | `tech-decision` | US05 (Sprint 3) | Nghĩa | 01/12 |
| Đặc tả, PRD cho Sprint 3 (US05, US06, US04; US20, US08 nếu kịp) | `design-system`, `product-requirements` | Sprint 3 code ngay 04/12 | Vy, Hưng; PA | 03/12 |
| Sprint 1 Review, Sprint 2 Review | `scrum-sprint` 4.2 | — | Tân (SM) | 26/11, 03/12 |

## 3. Kiểm tra phân công

| Thành viên | Thẻ nhận | PR sẽ review |
| :--- | :--- | :--- |
| Dương Văn Hoan (PO) | Chốt Q1 – Q19, duyệt US19/US20, duyệt 5 PRD | PR tài liệu PRD (5 PR) |
| Trần Ninh Nhật Tân (SM) | Sprint Planning/Review, tài khoản Expo, theo dõi đường cắt 01/12 | PR `sprint-2-review.md` của mình được PO duyệt; review PR ADR-03 |
| Nguyễn Thị Thương | US19 (giao diện), test A3, tuyển người dùng thử | PR US07 (đọc AC) |
| Nguyễn Tuấn Kiệt | US19 (hàm đếm ngày, test T1 – T5), test A3, tuyển người dùng thử | PR US02 (đọc AC) |
| Lê Thị Nhật Vy | Duyệt đặc tả, đặc tả Sprint 3 | PR US01, US03 (giao diện) |
| Phạm Viết Hưng | Duyệt đặc tả, đặc tả Sprint 3 | PR US01, US07, US19 (giao diện) |
| Lê Thị Phát | US01 khung + màn hình, US03 thẻ, US07, đóng gói bản dùng thử | PR US19 |
| Nguyễn Đức Minh Nghĩa | US01 màn hình, US02, ADR-04, đóng gói | PR US03 |
| Nguyễn Thị Bình Minh | US01 `storage`, US03 hàm tính (TDD), sửa `budget-logic` | PR US02 |
| Nguyễn Diên Tiến | US01 `storage` + migration, US03 hàm tính (TDD), sửa `budget-logic` | PR US07 |

Đủ 10 người; mỗi người có ít nhất 1 thẻ và 1 PR review ở cặp khác.

## 4. Rủi ro

- **Thời gian (R5):** còn 7 ngày, chưa có code → đường cắt 01/12; cặp dữ liệu và cặp giao diện làm song song từ 28/11.
- **PO chưa chốt câu hỏi (R2):** PRD đã viết theo đề xuất – PO duyệt PRD là duyệt luôn câu trả lời; quá 28/11 vẫn chưa duyệt thì code theo đề xuất, ghi vào PR.
- **A3 không đạt (R4):** sửa nhãn ở `HomeScreen.md` trước khi duyệt PRD US03; không đổi công thức.
- **Mất dữ liệu khi cập nhật (R6):** một tài khoản Expo, một khoá ký; thử cài đè trước mỗi lần phát.
- **Tuyển không đủ 5 người dùng Android:** báo PO ngày 01/12; xem lại điều kiện ADR-01 mục 7.
