# Danh mục màn hình và kế hoạch thiết kế lại

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đề xuất – chờ PO và cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng (điều phối), cả nhóm (mục 5) · **Cập nhật:** 21/11/2026

## 0. Vì sao phải làm lại

| Vấn đề | Bằng chứng |
| :--- | :--- |
| UI mới phủ **5 trên 32 thực thể** dữ liệu | 40 khung hiện có chỉ dùng E01 – E05 (lớp R1) của `docs/requirements/data-analysis.md`; E06 – E32 (ví, định kỳ, mục tiêu, vay nợ, chia tiền, danh mục tự tạo, hạn mức danh mục, sao lưu, tài khoản, quản trị) **chưa có màn nào** |
| Nghiệp vụ trên UI quá ít | ~70 quy tắc BR trong `data-analysis.md` mục 8, UI mới thể hiện khoảng 15 (BR-01 – BR-23, BR-90) |
| Prototype hẹp | Trang `Prototype` chỉ có 14 khung, 3 luồng – không đủ để mỗi người trong nhóm 10 người demo phần mình |
| Thiếu màn hình cơ bản của một app thật | Chưa có mở app lần đầu (onboarding), giới thiệu quyền riêng tư, xem thông tin dùng thử (đo A4), thông báo trên màn khoá, xoá toàn bộ dữ liệu |

**Mục tiêu mới:** **161 khung** (≥ 100), phủ cả 3 lớp dữ liệu R1 – R2 – R3, chia 4 đợt, mỗi thành viên phụ trách một nhóm màn hình (mục 5).

**Về phạm vi (AGENTS.md quy tắc 3):** chỉ **R1** được code trong MVP. Khung **R2, R3** là **thiết kế trước** để trình bày tầm nhìn sản phẩm và để PO quyết User Story (`06-journey-features.md` mục 4.2); mỗi khung R2, R3 trên Figma phải gắn nhãn "Sau MVP". R3 có đăng nhập và trang quản trị – hiện là Won't-have.

---

## 1. Tổng hợp

| Lớp | Nhóm | Số khung | Đã có | Cần dựng | Đợt |
| :-: | :--- | :-: | :-: | :-: | :-: |
| R1 | M0 – M7: MVP (mở app, Home, ghi chi/thu, ngân sách, báo cáo, lịch sử, sửa/xoá, cài đặt) | 61 | 40 | 21 | 1 |
| R2 | M8 Ví & chuyển tiền · M9 Định kỳ & dành sẵn · M14 Hạn mức danh mục · M2+ Ghi chi nâng cao | 32 | 0 | 32 | 2 |
| R2 | M10 Mục tiêu · M11 Vay nợ · M12 Chia tiền nhóm · M13 Danh mục · M15 Nhãn, chuỗi ngày, sao lưu | 42 | 0 | 42 | 3 |
| R3 | M16 Tài khoản, đồng bộ, sổ chung (app) · M17 Trang quản trị (web 1440px) | 26 | 0 | 26 | 4 |
| | **Tổng** | **161** | **40** | **121** | |

Prototype: từ 3 luồng lên **18 luồng** (mục 4).

---

## 2. Danh mục khung theo nhóm

Cột "Dữ liệu" và "Quy tắc" dẫn tới `docs/requirements/data-analysis.md` (E = thực thể, BR = quy tắc, EC = trường hợp biên). Quy tắc mới `BR-12x` ở mục 3. **Đậm** = khung mới cần dựng.

### R1 – MVP (61 khung)

| Nhóm | Khung | Dữ liệu | Quy tắc |
| :--- | :--- | :--- | :--- |
| **M0 Mở app lần đầu** (5) | **`SplashScreen / Default`** · **`OnboardingScreen / FastEntry`** · **`OnboardingScreen / DailyNumber`** · **`OnboardingScreen / PrivacyOnDevice`** · **`OnboardingBudgetScreen / Default`** | E04 `onboardingDoneAt`, E05 `firstOpenDate`, E02 | BR-120, BR-121 |
| **M1 Home** (13) | `SAFE` · `WARNING` · `OVER` · `OUT_OF_BUDGET` · `NO_BUDGET` · `Empty` · `WithIncome` · `LoadError` · `Deleted` · `InviteReminder` · **`NewMonth`** (thẻ gợi ý ngân sách tháng mới) · **`ManyItems`** (12 khoản, cuộn) · **`AfterMidnight`** (hạn mức ngày mới) | E01, E02 | BR-03, BR-20 – BR-23, EC-02, EC-05 |
| **M2 Ghi chi/thu** (10) | `Default` · `Empty` · `Income` · `ErrorMax` · `NoteFull` · `Saving` · `SaveError` · `DiscardConfirm` · **`CategoryChanged`** · **`TypingNote`** (bàn phím hệ thống mở) | E01, E03 | BR-01, BR-10, EC-09, EC-11 |
| **M3 Ngân sách** (6) | `NewMonthSuggestion` · `FirstTime` · `Set` · `Invalid` · `ErrorMax` · `BelowSpent` | E02 | BR-20 – BR-22, EC-06 |
| **M4 Báo cáo** (6) | `Month` · `Week` · `Empty` · `SingleCategory` · **`WeekEmpty`** · **`AllCategories`** (đủ 6 danh mục) | E01, E03 | BR-05, BR-43 |
| **M5 Lịch sử** (6) | `WithData` · `Empty` · `Today` · `FirstDay` · **`DatePickerOpen`** · **`WithIncome`** | E01, E05 | BR-04 |
| **M6 Sửa/xoá** (6) | `Default` · `Edited` · `DiscardConfirm` · `DeleteConfirm` · **`Income`** · **`ErrorMax`** | E01 | BR-11, BR-90, BR-91, EC-03, EC-04 |
| **M7 Cài đặt & khác** (9) | `ReminderOn` · `ReminderOff` · `BlockedByPhone` · `PermissionExplain` · **`AboutScreen / Default`** · **`PrivacyScreen / Default`** · **`TrialInfoScreen / Default`** (đo A4) · **`DeleteAllDataScreen / TypeToConfirm`** · **`NotificationMock / Reminder2100`** (màn khoá) | E04, E05 | BR-126, BR-127, BR-129, Q4, Q5, Q8, Q16 |

### R2 – Đợt 2 (32 khung) – *Sau MVP*

| Nhóm | Khung | Dữ liệu | Quy tắc |
| :--- | :--- | :--- | :--- |
| **M8 Ví & chuyển tiền** (12) | `WalletListScreen / Default` · `/ Empty` · `/ NegativeBalance` · `WalletFormScreen / Create` · `/ Edit` · `/ NameDuplicate` · `WalletDetailScreen / Default` · `TransferSheet / Default` · `/ SameWalletError` · `/ Success` · `ReconcileSheet / Default` · `WalletArchiveDialog / HasBalance` | E06, E01 (`TRANSFER_*`, `ADJUSTMENT`) | BR-30 – BR-36, EC-17, EC-18 |
| **M2+ Ghi chi nâng cao** (5) | `AddExpenseScreen / WalletPicker` · `/ PastDate` · `/ DateTooOld` · `SplitCategoriesSheet / Default` · `/ SumMismatch` | E01, E06, E07 | BR-12, BR-14 |
| **M9 Định kỳ & dành sẵn** (10) | `RecurringListScreen / Default` · `/ Empty` · `/ Paused` · `RecurringFormScreen / Create` · `/ MonthlyDay31` · `/ Edit` · `HomeScreen / PendingRecurring` · `ConfirmRecurringSheet / Default` · `/ EditAmount` · `BudgetScreen / ReserveFixedCosts` | E10, E11, E02 | BR-25, BR-50 – BR-55, BR-122, EC-14 – EC-16 |
| **M14 Hạn mức danh mục** (5) | `CategoryBudgetScreen / Default` · `/ OverLimit` · `/ SumExceedsBudget` · `CategoryBudgetSheet / Edit` (chuyển phần dư) · `ReportCategoryDetailScreen / Default` | E09, E03, E01 | BR-26, BR-27 |

### R2 – Đợt 3 (42 khung) – *Sau MVP*

| Nhóm | Khung | Dữ liệu | Quy tắc |
| :--- | :--- | :--- | :--- |
| **M10 Mục tiêu tiết kiệm** (10) | `GoalListScreen / Default` · `/ Empty` · `GoalFormScreen / Create` · `GoalDetailScreen / InProgress` · `/ Achieved` · `/ BehindSchedule` · `ContributeSheet / Deposit` · `/ Withdraw` · `/ OverWithdrawError` · `GoalCancelDialog / Default` | E12, E13 | BR-60 – BR-63, BR-124, EC-21 |
| **M11 Vay mượn bạn bè** (11) | `DebtListScreen / IOwe` · `/ OwedToMe` · `/ Empty` · `DebtFormScreen / Create` · `DebtDetailScreen / Open` · `/ PartiallyPaid` · `/ Overdue` · `/ Settled` · `DebtPaymentSheet / Default` · `/ OverpayError` · `DebtForgiveDialog / Default` | E14, E15 | BR-70 – BR-75, BR-123, EC-20 |
| **M12 Chia tiền nhóm** (10) | `SplitGroupListScreen / Default` · `/ Empty` · `SplitGroupFormScreen / Create` · `SplitGroupDetailScreen / Balances` · `SharedExpenseSheet / Equal` · `/ Exact` · `/ Percent` · `/ SumMismatch` · `SettleUpScreen / Suggestions` · `SettlementSheet / Default` | E16 – E18 | BR-80 – BR-84, EC-19 |
| **M13 Danh mục tự tạo** (5) | `CategoryManageScreen / Default` · `CategoryFormScreen / Create` · `/ Duplicate` · `CategoryHideDialog / HasTransactions` · `CategoryMergeDialog / Default` | E03 | BR-40 – BR-43, EC-22 |
| **M15 Nhãn, chuỗi ngày, sao lưu** (6) | `TagPickerSheet / Default` · `HomeScreen / Streak` · `BackupScreen / Default` · `/ Exported` · `/ RestoreConfirm` · `/ NewerSchemaError` | E08, E19, E05 | BR-92, BR-93, BR-125, BR-128, EC-23 |

### R3 – Đợt 4 (26 khung) – *Sau MVP, cần quyết định sản phẩm và pháp lý*

| Nhóm | Khung | Dữ liệu | Quy tắc |
| :--- | :--- | :--- | :--- |
| **M16 Tài khoản & đồng bộ** (app, 10) | `SignInScreen / Default` · `/ Error` · `SyncStatusSheet / Synced` · `/ Offline` · `/ Conflict` · `DeviceListScreen / Default` · `BookMembersScreen / Default` · `InviteMemberSheet / Default` · `DeleteAccountScreen / Confirm` · `/ Pending` | E20 – E23, E31, E32 | BR-100 – BR-105, BR-116, EC-24 – EC-27 |
| **M17 Trang quản trị** (web 1440px, 16) | `AdminLogin / Default` · `/ MFA` · `AdminDashboard / Default` · `AdminUserList / Default` · `AdminUserDetail / Default` · `/ SuspendDialog` · `AdminFeedbackInbox / Default` · `AdminFeedbackDetail / Default` · `AdminAnnouncementList / Default` · `AdminAnnouncementEditor / Draft` · `AdminSystemCategories / Default` · `AdminAppConfig / Default` · `AdminDataRequests / Default` · `AdminAuditLog / Default` · `AdminRoles / Default` · `AdminPermissionDenied / Default` | E24 – E32 | BR-110 – BR-116, BR-130 |

---

## 3. Quy tắc nghiệp vụ bổ sung (phát hiện khi lập danh mục)

Đã thêm vào `docs/requirements/data-analysis.md` mục 8.13 – trạng thái **Đề xuất**.

| Mã | Quy tắc | Màn liên quan |
| :--- | :--- | :--- |
| BR-120 | Onboarding chỉ hiện khi `onboardingDoneAt` rỗng; xong hoặc bỏ qua đều ghi `onboardingDoneAt` | M0 |
| BR-121 | Bỏ qua bước đặt ngân sách → vào Home trạng thái `NO_BUDGET`; không chặn ghi chi | M0, M1 |
| BR-122 | Nhắc khoản định kỳ trước `remindDaysBefore` ngày, lúc 20:00 – tách khỏi nhắc ghi chép 21:00 | M9 |
| BR-123 | Nhắc nợ đến hạn trước 1 ngày; quá hạn nhắc lại tối đa 1 lần/3 ngày | M11 |
| BR-124 | Đạt mục tiêu tiết kiệm: chúc mừng **1 lần**; rút xuống rồi đạt lại không chúc mừng lại trong 30 ngày | M10 |
| BR-125 | Chuỗi ngày ghi chép: tính tới hôm qua nếu hôm nay chưa ghi (không mất chuỗi trước 00:00) | M15 |
| BR-126 | Màn "Thông tin dùng thử" chỉ hiện `firstOpenDate`, số ngày có ghi chép / số ngày đã dùng – không hiện số tiền (đo A4, Q4) | M7 |
| BR-127 | Mọi loại thông báo: tối đa 1 lần/ngày mỗi loại; tổng tối đa 3 thông báo/ngày | M7, M9, M11 |
| BR-128 | File xuất đặt tên `vi-kheo-YYYYMMDD.csv` / `.json`, không chứa thông tin định danh | M15 |
| BR-129 | Xoá toàn bộ dữ liệu: phải gõ đúng chữ `XOÁ` mới bật nút (thao tác nguy hiểm, không hoàn tác – theo NN/g, `po-decision-proposals.md` Q15) | M7 |
| BR-130 | Bảng điều khiển quản trị: DAU = số thiết bị có ≥ 1 giao dịch trong ngày; giữ chân ngày 7 = % thiết bị còn ghi vào ngày thứ 7 – chỉ hiện nhóm ≥ 10 thiết bị (BR-115) | M17 |

---

## 4. Prototype – 18 luồng

| # | Luồng | Đợt |
| :-: | :--- | :-: |
| P1 | Mở app lần đầu → onboarding → đặt ngân sách → Home | 1 |
| P2 | Ghi khoản chi (có đổi danh mục, ghi chú) → Home đã lưu | 1 |
| P3 | Ghi khoản thu → Home có thu | 1 |
| P4 | Đặt / sửa ngân sách, tháng mới dùng lại số cũ | 1 |
| P5 | Sửa, xoá, hoàn tác | 1 |
| P6 | Báo cáo tháng ⇄ tuần, xem đủ danh mục | 1 |
| P7 | Lịch sử: lùi ngày, mở lịch, sửa khoản cũ | 1 |
| P8 | Bật nhắc: lời mời → giải thích → bật; máy chặn → mở cài đặt | 1 |
| P9 | Xem thông tin dùng thử, xoá toàn bộ dữ liệu | 1 |
| P10 | Tạo ví, chuyển tiền giữa ví, đối chiếu số dư | 2 |
| P11 | Khai báo tiền trọ định kỳ → Home có khoản chờ xác nhận → xác nhận | 2 |
| P12 | Đặt hạn mức danh mục → vượt hạn mức → xem chi tiết danh mục | 2 |
| P13 | Tạo mục tiêu → góp → đạt mục tiêu | 3 |
| P14 | Ghi khoản vay bạn → trả một phần → quá hạn → trả hết | 3 |
| P15 | Tạo nhóm phòng trọ → khoản chung chia đều → gợi ý thanh toán | 3 |
| P16 | Sao lưu → khôi phục | 3 |
| P17 | Đăng nhập → đồng bộ → xung đột | 4 |
| P18 | Quản trị: đăng nhập 2 lớp → bảng điều khiển → xử lý góp ý | 4 |

Trang `Prototype` giữ các khung là bản sao cấp trang (Figma chỉ nối được tới khung nằm thẳng trên trang). Mỗi đợt dựng xong thì nối luồng của đợt đó.

---

## 5. Phân công (đề xuất – SM chốt ở Sprint Planning)

AI dựng bản nháp theo danh mục này; **mỗi thành viên phụ trách duyệt và chỉnh** nhóm màn của mình, viết đặc tả `.md` cho màn mới (mẫu `design-system/templates/screen-spec.md`), mở Pull Request. Lịch sử commit là bằng chứng đóng góp.

| Thành viên | Nhóm màn phụ trách | Người review |
| :--- | :--- | :--- |
| Lê Thị Nhật Vy | M0 Mở app lần đầu, M7 Cài đặt & khác | Phạm Viết Hưng |
| Phạm Viết Hưng | M1 Home, M2 / M2+ Ghi chi/thu | Lê Thị Nhật Vy |
| Lê Thị Phát | M4 Báo cáo, M5 Lịch sử, M14 Hạn mức danh mục | Nguyễn Đức Minh Nghĩa |
| Nguyễn Đức Minh Nghĩa | M3 Ngân sách, M6 Sửa/xoá, M13 Danh mục | Lê Thị Phát |
| Nguyễn Thị Bình Minh | M8 Ví & chuyển tiền | Nguyễn Diên Tiến |
| Nguyễn Diên Tiến | M9 Định kỳ & dành sẵn, M15 Sao lưu | Nguyễn Thị Bình Minh |
| Nguyễn Thị Thương | M10 Mục tiêu tiết kiệm | Nguyễn Tuấn Kiệt |
| Nguyễn Tuấn Kiệt | M11 Vay nợ, M12 Chia tiền nhóm | Nguyễn Thị Thương |
| Trần Ninh Nhật Tân (SM) | M17 Trang quản trị | Dương Văn Hoan |
| Dương Văn Hoan (PO) | M16 Tài khoản & đồng bộ; duyệt nhãn "Sau MVP" | Trần Ninh Nhật Tân |

---

## 6. Lịch dựng

| Đợt | Nội dung | Khung | Cần có trước | Hạn đề xuất |
| :-: | :--- | :-: | :--- | :--- |
| 1 | Hoàn thiện R1: M0, khung bổ sung M1 – M7; component mới: `ProgressDots`, `TextField`, `ListRow`, `CalendarSheet`, `NotificationCard`, `Button / danger`; kiểu chữ `Display` | 21 | Danh mục này được duyệt | **Xong 21/11** (AI dựng) – 61/161 khung; chờ chủ nhóm màn duyệt và viết đặc tả cho 8 màn mới |
| 2 | R2 cốt lõi: M8, M2+, M9, M14; component: `Badge` (Sau MVP), `WalletIcon`, `WalletCard`, `WalletTypeChip`, `RecurringItem`, `CategoryBudgetRow`, `AmountSplitRow`, `FrequencyPicker` | 32 | Đợt 1 | **Xong 21/11** (AI dựng) – 93/161 khung; 4 hàng `R2 · …`, mỗi khung gắn nhãn "Sau MVP"; chờ chủ nhóm màn duyệt |
| 3 | R2 mở rộng: M10 – M13, M15; component: `StatusChip`, `MemberAvatar`, `GoalCard`, `DebtCard`, `BalanceRow`, `TagChip`, `StreakCard` | 42 | Đợt 2 | **Xong 21/11** (AI dựng) – 135/161 khung; 5 hàng `R2 · …`, nhãn "Sau MVP"; chờ chủ nhóm màn duyệt |
| 4 | R3: M16 (app), M17 (web 1440px); component: `AdminNavItem` (default/active), `AdminSidebar`, `AdminTopBar`, `MetricCard`, 9 icon `AdminIcon/*` (bảng dữ liệu dựng bằng auto layout, chưa tách component) | 26 | Đợt 3; PO đồng ý trình bày R3 | **Xong 21/11** (AI dựng) – 161/161 khung; hàng `R3 · M16 Tài khoản & đồng bộ`, `R3 · M17 Trang quản trị (web)`, nhãn "R3 · Sau MVP"; chờ chủ nhóm màn duyệt và PO đồng ý trình bày R3 |

Sau mỗi đợt: soát tự động (màu gắn biến, kiểu chữ, vùng bấm ≥ 48), chụp kiểm tra, nối luồng prototype, cập nhật trang `00 Cover`.

**Không làm chậm Sprint:** đợt 1 phục vụ MVP; đợt 2 – 4 chạy song song với code R1, không chiếm giờ code của cặp giao diện và cặp dữ liệu nếu SM thấy quá tải.
