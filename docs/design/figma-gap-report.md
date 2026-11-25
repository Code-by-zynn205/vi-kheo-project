# Đối chiếu Figma với đặc tả màn hình

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** design-system (mục 4.6) · **Trạng thái:** Đang làm – chờ cặp UI/UX và PO xử lý mục 2 · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Người đọc Figma:** AI (Claude Code, kết nối Figma bản web, chỉ đọc) · **Cập nhật:** 21/11/2026

## 0. Nguồn

| Mục | Giá trị |
| :--- | :--- |
| File | [Ví Khéo](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o) – trang `Highframe` (node `18:2`) |
| Trang khác trong file | `Wireframe` (`0:1`), `Page 3` (`94:2`) – chưa đọc |
| Cách đọc | Cấu trúc layer và chữ (metadata), ngày 21/11/2026; chưa đọc màu, cỡ chữ, Variables |
| Bản chất | **Bản demo** (theo nhóm xác nhận ngày 21/11) – file này ghi chỗ lệch để vẽ lại theo `docs/design/figma-plan.md`, không phải để sửa đặc tả theo demo |

| Frame Figma | Node | Kích thước | Ứng với đặc tả |
| :--- | :--- | :--- | :--- |
| `01_NganSachThang` | `18:3` | 390 × 844 | [`BudgetScreen.md`](screens/BudgetScreen.md) |
| `02_HomNay` | `18:59` | 390 × 844 | [`HomeScreen.md`](screens/HomeScreen.md) |
| `03_GhiKhoanChi` | `18:112` | 390 × 844 | [`AddExpenseScreen.md`](screens/AddExpenseScreen.md) |
| `04_BaoCaoDanhMuc` | `18:172` | 390 × 844 | [`ReportScreen.md`](screens/ReportScreen.md) |
| — | — | — | `EditTransactionSheet`, `SettingsScreen`, `HistoryScreen`: **chưa có frame** |

---

## 1. Lệch chung cho cả file

| # | Figma | Đặc tả / quy tắc | Xử lý đề xuất |
| :-: | :--- | :--- | :--- |
| G1 | Khung 390 × 844 (cỡ iPhone) | `figma-plan.md` mục 2: 360 × 800 (Android, khớp "rộng 360px không vỡ") | **Cần chốt** (mục 2, D1) |
| G2 | Tên frame, layer tiếng Việt: `02_HomNay`, "Nội dung", "Biểu tượng", "Điều hướng chính" | AGENTS.md quy tắc 4, `design-system` 4.4: tên tiếng Anh `HomeScreen / SAFE`, component `TabBar`, `Icon` | Đổi tên khi vẽ lại |
| G3 | Tiền viết `125.000 đ` (có dấu cách) | `35.000đ` – liền nhau (AGENTS.md quy tắc 5) | Sửa chữ trên frame |
| G4 | Nút chính còn chữ giữ chỗ "Nút chính", layer `WF / Nút chính` | Chữ nút theo đặc tả mục 4 ("Lưu khoản chi", "Cập nhật ngân sách") | Điền chữ thật |
| G5 | Không thấy component, Variables (layer vẽ rời) | `figma-plan.md` mục 3, 4: dựng Variables + component trước | Làm bước F2, F3 của kế hoạch |
| G6 | Có thanh trạng thái iPhone (giờ, sóng, pin) và vạch Home indicator | Không quy định | Giữ được; nên làm thành 1 component `StatusBar` để không vẽ lặp |
| G7 | Mỗi màn chỉ 1 trạng thái | Đặc tả mỗi màn có 4 – 8 trạng thái (`figma-plan.md` mục 5: 40 frame) | Vẽ thêm theo mục 5 kế hoạch |
| G8 | Thanh điều hướng 3 tab "Hôm nay · Ngân sách · Báo cáo", **không có nút nổi** | Tab "Trang chủ · Ngân sách · Báo cáo" + nút nổi `+ Ghi khoản chi` (`HomeScreen.md` mục 1.5) | **Cần chốt** tên tab (D6); thêm nút nổi |

---

## 2. Quyết định cần chốt trước khi vẽ lại

| # | Câu hỏi | Figma demo | Đặc tả hiện tại | Đề xuất | Ai chốt |
| :-: | :--- | :--- | :--- | :--- | :--- |
| D1 | Khung thiết kế | 390 × 844 | 360 × 800 | 360 × 800 (sinh viên dùng nhiều máy Android tầm trung `[NHẬN ĐỊNH]`); nếu giữ 390 thì vẫn phải kiểm ở 360 | Cặp UI/UX |
| D2 | Bộ danh mục | 5: Ăn uống, Di chuyển, Mua sắm, **Hóa đơn**, Khác | 6: Ăn uống, Di chuyển, **Nhà trọ & Điện nước**, **Học tập & Tài liệu**, Mua sắm & Sinh hoạt, Khác (`budget-logic` 4.1, `data-analysis.md` 3.3) | Giữ 6 của đặc tả – đã gắn với dữ liệu, test case, Persona (tiền trọ, tài liệu) | **PO** |
| D3 | Cách chọn danh mục | Danh sách thả xuống + dòng chip | Lưới 6 chip, chọn sẵn "Ăn uống" | Lưới chip – ít thao tác hơn (HMW1) | Cặp UI/UX |
| D4 | Có chọn ngày khi ghi khoản chi | Có ô "Ngày chi" | Không – luôn là hôm nay (Q7, BR-11) | Không | **PO** (Q7) |
| D5 | Màn ghi chi: số ô nhập | 4 ô (số tiền, danh mục, ngày, ghi chú) + chú thích "* Thông tin bắt buộc" | Số tiền + chip + ghi chú tuỳ chọn; ≤ 3 thao tác (US01 AC8) | Theo đặc tả | Cặp UI/UX |
| D6 | Tên tab đầu | "Hôm nay" | "Trang chủ" | Chọn 1 rồi sửa cả hai nơi; "Hôm nay" khớp tiêu đề màn hình – có thể đổi đặc tả | Cặp UI/UX |
| D7 | Màn ngân sách cho chọn tháng | Có "‹ Tháng 11 / 2026 ›" | Chỉ tháng hiện tại (`BudgetScreen.md` mục 5) | Theo đặc tả | PO |
| D8 | Màn báo cáo: chọn kỳ | "‹ Tháng 11 / 2026 ›" | `Tuần này | Tháng này` | Theo đặc tả (US04 AC1) | PO |

---

## 3. Lệch theo từng màn hình

### 3.1 `02_HomNay` ↔ `HomeScreen.md`

| Phần | Figma | Đặc tả | Ghi chú |
| :--- | :--- | :--- | :--- |
| Tiêu đề | "Ví Khéo" + "Thứ Bảy, 14 tháng 11" | "Hôm nay" + "Thứ Sáu, 20/11" | Định dạng ngày khác |
| Thẻ chính | "Hôm nay còn được tiêu" · `125.000 đ` · "Hạn mức hôm nay 200.000 đ / Đã chi hôm nay 75.000 đ" · "Bạn vẫn trong hạn mức hôm nay." | Số Hero + dòng phụ theo trạng thái (SAFE không có dòng phụ) + `ProgressBar` ngân sách tháng | Figma hiện thêm hạn mức và đã chi – **ý hay**, có thể giúp test A3; cần cặp UI/UX quyết thêm vào đặc tả hay không |
| Nút | "Nút chính" (giữ chỗ) giữa thẻ và tóm tắt | Nút nổi `+ Ghi khoản chi` trên thanh điều hướng | |
| Tóm tắt tháng | Khung riêng "Ngân sách tháng 11 · Đã chi 2.675.000 / 6.000.000 đ · Còn lại 3.325.000 đ" + thanh tiến độ | Một dòng "Ngân sách tháng đã dùng x% (…)" trong thẻ chính | Figma thêm một khối – cân nhắc nguyên tắc "Một con số" |
| Danh sách | "Khoản chi hôm nay": 2 khoản dạng chữ | "Chi tiêu hôm nay" + tổng; `TransactionItem` có icon, giờ | Tiêu đề mục khác chữ |
| Số minh hoạ | Ngân sách 6.000.000; hạn mức 200.000 ngày 14/11 | Ngân sách 3.000.000; 86.000 ngày 20/11 | Số Figma **khớp công thức** `budget-logic` 4.2: ngày 14/11 còn 17 ngày; chi trước hôm nay 2.675.000 − 75.000 = 2.600.000 → quỹ đầu ngày 3.400.000 → hạn mức 3.400.000 ÷ 17 = 200.000đ → còn 125.000đ. Hai bộ số đều đúng; chọn một bộ dùng chung cho Figma và đặc tả |

### 3.2 `03_GhiKhoanChi` ↔ `AddExpenseScreen.md`

| Phần | Figma | Đặc tả |
| :--- | :--- | :--- |
| Dạng màn hình | Màn đầy đủ, có thanh điều hướng dưới, tiêu đề "‹ Ghi khoản chi" | Bottom sheet toàn màn hình, nút `X`, **không** có thanh điều hướng |
| Công tắc Chi/Thu | Không có | Có (US07, Sprint 2) |
| Số tiền | Ô "Số tiền *" `50.000 đ` | Ô số tiền cỡ Hero, tự focus, `NumericKeypad` bên dưới |
| Danh mục | Thả xuống "Ăn uống ▾" + dòng chip | Lưới 6 `QuickCategoryChip` |
| Ngày | Ô "Ngày chi *" `14 / 11 / 2026` | Không có (D4) |
| Ghi chú | "Ghi chú (không bắt buộc)" – placeholder "Ví dụ: Bữa trưa" | Placeholder "Ghi chú nhanh (không bắt buộc)…" |
| Bàn phím số | Không có | `NumericKeypad` nửa dưới (nguyên tắc "Một tay") |
| Dòng chú thích | "Sau khi lưu: cập nhật hạn mức hôm nay và báo cáo của tháng đã chọn." | Không có; sau khi lưu có `Snackbar` "Đã lưu" |

### 3.3 `01_NganSachThang` ↔ `BudgetScreen.md`

| Phần | Figma | Đặc tả |
| :--- | :--- | :--- |
| Tiêu đề | "Đặt ngân sách tháng" + "Bạn muốn dành bao nhiêu để chi tiêu?" | "Ngân sách tháng 11/2026" |
| Chọn tháng | "‹ Tháng 11 / 2026 ›" | Không (D7) |
| Ô số tiền | "Ngân sách chi tiêu *" `6.000.000 đ` | Ô cỡ Hero + `NumericKeypad` |
| Xem trước | "Bình quân mỗi ngày 200.000 đ · 6.000.000 đ ÷ 30 ngày" | "Từ hôm nay đến hết tháng, mỗi ngày bạn được tiêu khoảng …" – tính theo **ngày còn lại** và số đã chi (`budget-logic` 4.2). Cách chia ÷ 30 của Figma chỉ đúng vào ngày 01 |
| Gợi ý tháng trước | Không có | Thẻ "Tháng trước bạn đặt …" (Q2) |
| Chú thích | "Ngân sách tổng cho tất cả danh mục. Có thể điều chỉnh trong tháng." | Không có – có thể thêm vào đặc tả |
| Thanh điều hướng | Có, tab "Ngân sách" đang chọn | Có (tab) – khớp |

### 3.4 `04_BaoCaoDanhMuc` ↔ `ReportScreen.md`

| Phần | Figma | Đặc tả |
| :--- | :--- | :--- |
| Tiêu đề | "Báo cáo theo danh mục" | "Báo cáo" |
| Kỳ báo cáo | "‹ Tháng 11 / 2026 ›" | `Tuần này | Tháng này` (D8) |
| Tổng | Khung "Tổng đã chi 2.675.000 đ · 45% ngân sách tháng" | Tổng ở tâm `DonutChart`; không có % ngân sách |
| Biểu đồ | Thanh ngang theo từng danh mục | `DonutChart` + danh sách có thanh % |
| Phần trăm | Số lẻ: 44,9% · 22,4% · 18,7% · 14,0% | Số nguyên (US04 AC3) |
| Dòng kết luận | "Ăn uống là danh mục chi nhiều nhất." | Không có – **ý hay**, có thể thêm vào đặc tả |
| Kiểm tra số | 1.200.000 + 600.000 + 500.000 + 375.000 = 2.675.000 – khớp tổng | |

---

## 4. Ý hay từ bản demo nên cân nhắc đưa vào đặc tả

1. Thẻ chính hiện thêm "Hạn mức hôm nay … · Đã chi hôm nay …" – giúp hiểu con số (liên quan test A3).
2. Dòng trạng thái bằng chữ "Bạn vẫn trong hạn mức hôm nay." cho trạng thái `SAFE`.
3. Chú thích ở màn ngân sách "Ngân sách tổng cho tất cả danh mục. Có thể điều chỉnh trong tháng."
4. Dòng kết luận ở báo cáo "Ăn uống là danh mục chi nhiều nhất."
5. Tên tab "Hôm nay" khớp tiêu đề màn chính.

Muốn dùng → cặp UI/UX sửa đặc tả qua Pull Request (AGENTS.md quy tắc 6), rồi vẽ theo đặc tả.

---

## 5. Việc tiếp theo

| # | Việc | Ai | Cần có trước |
| :-: | :--- | :--- | :--- |
| 1 | Chốt D1 – D8 | PO (D2, D4, D7, D8), cặp UI/UX (D1, D3, D5, D6) | — |
| 2 | Quyết đưa các ý ở mục 4 vào đặc tả | Cặp UI/UX | 1 |
| 3 | Dựng file theo `figma-plan.md` (bước F1 – F6), chuyển 4 frame demo sang `_Archive` | Vy, Hưng | 1 |
| 4 | AI đối chiếu lại frame mới với đặc tả, cập nhật file này | AI + người review | 3 |

**Lưu ý giới hạn:** tài khoản Figma đang kết nối là ghế View gói Starter – khoảng **20 lần đọc/tháng** qua kết nối AI. Chỉ nhờ AI đối chiếu sau khi vẽ xong từng màn hình.

---

## 6. Lệch giữa bản Demo UI (AI dựng 21/11) và đặc tả

Trang `Demo UI` dựng theo đặc tả, nhưng có vài chỗ AI tự chọn. Cặp UI/UX chọn giữ (sửa đặc tả) hoặc bỏ (sửa Figma) – AGENTS.md quy tắc 6.

| # | Màn / khung | Figma (Demo UI) | Đặc tả | Đề xuất |
| :-: | :--- | :--- | :--- | :--- |
| A1 | `HomeScreen / SAFE` | Có dòng phụ "Bạn vẫn trong hạn mức hôm nay" (ý từ bản demo cũ, mục 4.2) | `SAFE` không có dòng phụ | Giữ – thêm vào đặc tả mục 2 |
| A2 | `HomeScreen / Saved` (trang Prototype) | Snackbar "Đã lưu khoản chi 35.000đ" | "Đã lưu" | Chọn một câu |
| A3 | `EditTransactionSheet / Default` | Không vẽ bàn phím số (thiếu chỗ trong 800px), có dòng ghi chú "Bàn phím số hiện khi chạm vào số tiền" | Có `NumericKeypad` | Sửa đặc tả: bàn phím hiện khi chạm ô số tiền |
| A4 | `BudgetScreen / FirstTime` | Ô số tiền hiện chữ mờ "Nhập số tiền" | Ô trống | Giữ – thêm vào đặc tả mục 4 |
| A5 | `SettingsScreen / PermissionExplain` | Hộp thoại "Bật nhắc ghi chép?" với nút "Bật nhắc" / "Để sau" | Câu giải thích rồi tới hộp quyền của hệ điều hành; chưa có chữ nút | Thêm 2 chữ nút vào đặc tả mục 4 |
| A6 | Mọi màn | Có thanh trạng thái "9:41" ở trên cùng | Không quy định | Giữ (chỉ để trình bày) |
| A7 | Token | Thêm `color/warning-light` (#FFFBEB – nền khung cảnh báo), `color/scrim` (#111827 – lớp phủ hộp thoại, mờ 45%) | Đã thêm vào `design-system` mục 4.2 ngày 21/11 | Cặp UI/UX duyệt qua Pull Request |
| A8 | Khung chuẩn | 360 × 800 | `figma-plan.md` – trả lời D1 | Xong |
| A9 | `SettingsScreen / ReminderOn` | Thêm mục "Khác": Thông tin dùng thử, Quyền riêng tư, Giới thiệu, Xoá toàn bộ dữ liệu (đợt 1) | Đã thêm vào đặc tả mục 1 và 4 (21/11) | Xong – chờ cặp UI/UX duyệt |
| A10 | 8 màn mới đợt 1 | `SplashScreen`, `OnboardingScreen` (3), `OnboardingBudgetScreen`, `AboutScreen`, `PrivacyScreen`, `TrialInfoScreen`, `DeleteAllDataScreen`, `NotificationMock` | AI viết nháp 7 đặc tả từ mẫu `screen-spec.md` (21/11); `NotificationMock` ghi trong `SettingsScreen.md` | Chủ nhóm màn (Vy – M0, M7) đọc lại, PO gắn User Story cho các màn chưa có US |
| A11 | Component `DailyAllowanceCard`, `TransactionItem` (đợt 2) | Dòng chữ dài giờ xuống dòng (thẻ số tiền) hoặc cắt "…" sau 1 dòng (tên, mô tả giao dịch) | Đặc tả chưa nói cách xử lý chữ dài | Thêm vào `design-system` mục 4.3 |
| A12 | 32 khung R2 (đợt 2) | Chưa có đặc tả `.md` cho `WalletListScreen`, `WalletFormScreen`, `WalletDetailScreen`, `TransferSheet`, `ReconcileSheet`, `SplitCategoriesSheet`, `RecurringListScreen`, `RecurringFormScreen`, `ConfirmRecurringSheet`, `CategoryBudgetScreen`, `CategoryBudgetSheet`, `ReportCategoryDetailScreen` | Thiết kế trước, **chưa có User Story** | Chỉ viết đặc tả khi PO nâng US09, US13, US14 vào Backlog |
| A13 | 42 khung R2 (đợt 3) | Mục tiêu, vay nợ, chia tiền nhóm, danh mục tự tạo, nhãn, chuỗi ngày, sao lưu – thiết kế theo BR-40 – BR-93, BR-124, BR-125, BR-128 | Chưa có User Story (US10 – US12, US15, US16) | Chỉ viết đặc tả khi PO nâng các US này vào Backlog |
| A14 | `DebtCard`, `GoalCard`, `BalanceRow` | Phân biệt "Mình nợ" / "Nợ mình" bằng nút chọn ở đầu màn và màu số dư; vay nợ không đổi hạn mức ngày (BR-72, BR-73) | Chưa có đặc tả | Cặp dữ liệu xác nhận cách hiển thị đúng quy tắc |
| A15 | 26 khung R3 (đợt 4) | M16: đăng nhập không mật khẩu (Google, Apple, mã qua email), trạng thái đồng bộ, xung đột giữ bản máy chủ ghi nhận sau cùng, thiết bị, sổ chung, xoá tài khoản; M17: trang quản trị web theo BR-110 – BR-116, BR-130 | Chưa có User Story chi tiết (US17, US18 đang `Won't`) | Chỉ viết đặc tả khi PO nâng US17, US18; cặp dữ liệu xác nhận cách giải xung đột đồng bộ |
| A16 | `DeleteAccountScreen`, `AdminDataRequests` | Thời hạn xoá hẳn dữ liệu ghi "Cần kiểm chứng (Q14)" | Chưa có căn cứ pháp lý | PO và giảng viên chốt Q14 rồi sửa chữ trên khung |
| A17 | Số liệu trên `AdminDashboard`, `AdminUserList` | Số trên trang quản trị là minh hoạ, có nhãn "Số liệu minh hoạ, không phải số liệu thật" | — | Không dùng các số này trong báo cáo hay slide |
