# PRD – US03: Hôm nay còn được tiêu

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn thấy số tiền còn được tiêu hôm nay, để không tiêu quá tay. |
| Nguồn | HMW2 · P3, P5, P6 · F5 – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | Must · 3 · Sprint 2 |
| Màn hình | `docs/design/screens/HomeScreen.md` (`DailyAllowanceCard`, `ProgressBar`) · `OnboardingScreen.md` |
| Phụ thuộc | US01, US02; kết quả test A3 (`docs/evidence/prototype-tests/a3-test-guide.md`) |
| Dữ liệu | `data-analysis.md` mục 11 dòng US03; công thức 10.1; BR-01, BR-03, BR-04, BR-06, BR-21, BR-23, BR-91, BR-120, BR-121; EC-02, EC-05, EC-06, EC-07, EC-08 |

## 1. Bối cảnh

68% sinh viên được khảo sát từng hết tiền trước cuối tháng (34/50) `[SƠ CẤP]` (`00-research-log.md`). Persona Minh biết tổng ngân sách nhưng không biết hôm nay tiêu bao nhiêu là vừa (P3, P5, P6). "Hôm nay còn được tiêu" là điểm khác biệt chính so với đối thủ (F5): một con số, đổi màu khi sắp hết.

## 2. Luồng thao tác chính

1. Mở app lần đầu → `SplashScreen` → `OnboardingScreen` 3 trang ("Ghi một khoản chi trong 5 giây" → "Luôn biết hôm nay còn được tiêu bao nhiêu" → "Dữ liệu chỉ nằm trên điện thoại của bạn") → "Bắt đầu" → `OnboardingBudgetScreen` (US02).
2. Ở `HomeScreen`, thẻ "Hôm nay còn được tiêu" hiện số theo `budget-logic` 4.2 và màu theo trạng thái.
3. Ghi một khoản chi (US01) → về Home, số giảm đúng bằng số vừa chi, màu đổi nếu chạm ngưỡng.
4. Thanh "Ngân sách tháng đã dùng x% (<đã dùng> / <ngân sách>)" cập nhật theo.

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E01 `Transaction` | R | `type`, `amount`, `date`, `deletedAt` – tổng thu tháng, tổng chi từ ngày 1 đến hôm qua, tổng chi hôm nay | `budget-logic` 4.2 |
| E02 `MonthlyBudget` | R | `month`, `amount` | `budget-logic` 4.1 |
| E04 `Settings` | R U | `onboardingDoneAt` | BR-120, BR-121 |

Truy vấn chính: tổng thu tháng, chi đến hôm qua, chi hôm nay (`data-analysis.md` mục 11). **Không lưu** hạn mức hay số dư – luôn tính lại (BR-06).

**Quy tắc nghiệp vụ áp dụng:** BR-01, BR-03, BR-04, BR-06, BR-21 (đề xuất Q1), BR-23, BR-91, BR-120, BR-121 (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Dữ liệu của từng dòng TC1 – TC11 | Tính hạn mức hôm nay, "còn được tiêu", trạng thái | Đúng từng dòng bảng `budget-logic` 4.4 (TC17 thêm khi PO duyệt Q18) | Unit test | 06 AC1 · BR-23 |
| AC2 | Hôm nay "còn được tiêu" 53.000đ | Ghi thêm khoản chi 30.000đ | Số giảm còn 23.000đ | Điện thoại + unit test | 06 AC2 |
| AC3 | Tỷ lệ chi hôm nay / hạn mức < 0,7 | Xem thẻ | `SAFE`: số màu `--color-success-text`, không có dòng phụ | Điện thoại | 06 AC3 · `HomeScreen.md` mục 2 |
| AC4 | Tỷ lệ 0,7 – 1 | Xem thẻ | `WARNING`: số màu `--color-warning-text`, dòng phụ "Sắp chạm hạn mức hôm nay" | Điện thoại | 06 AC3 |
| AC5 | Tỷ lệ > 1 (TC4: còn −15.000đ) | Xem thẻ | `OVER`: số âm `−15.000đ` màu `--color-danger-text`, dòng phụ "Đã vượt 15.000đ" | Điện thoại | 06 AC3 · TC4 |
| AC6 | Quỹ còn lại đầu ngày ≤ 0 (TC5) | Xem thẻ | `OUT_OF_BUDGET`: số `0đ` màu `--color-danger-text`, dòng phụ "Đã dùng hết ngân sách tháng" (Q17 có thể thêm số tiền vượt) | Điện thoại | 06 AC3 · TC5 · Q17 |
| AC7 | Đang mở app lúc 23:59 | Sang 00:00 rồi quay lại app | Hạn mức tính lại cho ngày mới; khoản ghi lúc 23:59 thuộc hôm trước | Điện thoại (đổi giờ máy) + unit test | 06 AC4 · EC-02 · EC-07 |
| AC8 | Tháng 28, 30, 31 ngày | Tính số ngày còn lại | Đúng (TC9 tháng 2/2027, TC8 ngày cuối tháng) | Unit test | 06 AC5 · EC-08 |
| AC9 | Tháng có ngân sách | Xem thanh dưới số | "Ngân sách tháng đã dùng x% (<đã dùng> / <ngân sách>)"; ví dụ 1.577.000đ / 3.000.000đ → "52%" (làm tròn xuống, mẫu số = ngân sách + tổng thu tháng – Q19 đề xuất, đặc tả chốt 26/11) | Unit test + điện thoại | 06 AC6 · Q19 |
| AC10 | Có một khoản đã xoá mềm (`deletedAt` có giá trị) | Tính số | Khoản đó không được tính | Unit test | 06 AC7 · BR-91 |
| AC11 | `onboardingDoneAt` rỗng | Mở app | Splash → `OnboardingScreen` trang 1; vuốt / "Tiếp tục" qua 3 trang; trang 3 nút "Bắt đầu" → `OnboardingBudgetScreen` | Điện thoại | BR-120 · `OnboardingScreen.md` |
| AC12 | Đang ở bất kỳ trang onboarding nào | Bấm "Bỏ qua" | Ghi `onboardingDoneAt`; sang Home `NO_BUDGET`; lần mở sau không hiện onboarding nữa | Điện thoại | BR-120 · BR-121 |

## 5. Test case

### 5.1 Tính tiền (dẫn tới `budget-logic` mục 4.4)

| Test case | AC liên quan |
| :--- | :--- |
| TC1, TC2, TC6, TC7, TC8 | AC1, AC3 |
| TC3 | AC1, AC4 |
| TC4 | AC1, AC5 |
| TC5 | AC1, AC6 |
| TC9 | AC8 |
| TC10 | AC1 (`NO_BUDGET`, hiển thị thuộc US02) |
| TC11 | AC1, AC4 |
| TC17 (khi PO duyệt Q18) | AC1 |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Cài mới, mở app | 3 trang onboarding đúng chữ; "Bắt đầu" sang màn đặt ngân sách | AC11 |
| 2 | Đặt ngân sách 3.000.000đ ngày 01/11 (đổi giờ máy) | Thẻ hiện `100.000đ` màu xanh | AC3 |
| 3 | Ghi 75.000đ | Còn `25.000đ`, màu vàng, "Sắp chạm hạn mức hôm nay" | AC2, AC4 |
| 4 | Ghi thêm 40.000đ | `−15.000đ` màu đỏ, "Đã vượt 15.000đ" | AC5 |
| 5 | Đổi giờ máy sang 02/11 (đã chi trước hôm nay 115.000đ), giảm ngân sách xuống 100.000đ | Quỹ còn lại đầu ngày = −15.000đ → `0đ`, "Đã dùng hết ngân sách tháng" | AC6 |
| 6 | Đổi giờ máy sang 23:59 rồi 00:01 | Số tính lại cho ngày mới | AC7 |

## 6. Ngoài phạm vi

- Trạng thái `NO_BUDGET` và màn đặt ngân sách – US02.
- Khoản thu làm tăng hạn mức – US07 (công thức đã cộng tổng thu; US07 tạo dữ liệu thu).
- Sửa / xoá khoản làm số tính lại (TC16) – US06.
- Dành sẵn khoản cố định (BR-25, công thức 10.2) – R2.

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `budget-logic` | 4.2, 4.4, 6 | Hàm thuần tính hạn mức, "còn được tiêu", trạng thái – TDD với TC1 – TC11 |
| `frontend-ui` | 4, 6 | `DailyAllowanceCard` trên `HomeScreen`, `OnboardingScreen` |
| `design-system` | 4.2, 4.3, 6 | Màu trạng thái, `DailyAllowanceCard`, `ProgressBar`, `ProgressDots`, `Button` |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | Q1 – khoản thu cộng vào tháng theo ngày ghi (PRD theo đề xuất A) | PO | chưa có |
| 2 | Q17 – `OUT_OF_BUDGET` có thêm số tiền đã vượt không (PRD theo đặc tả hiện có) | PO, cặp UI/UX | chưa có |
| 3 | Q18 – hạn mức 0 mà đã chi → `OVER`, thêm TC17 | PO | chưa có |
| 4 | Q19 – cách tính "đã dùng x%" | PO, cặp UI/UX | chưa có |
| 5 | Kết quả test A3 (5 sinh viên hiểu con số?) – không đạt thì sửa nhãn trong `HomeScreen.md` trước khi duyệt PRD (rủi ro R4) | Cặp nghiên cứu | chưa có |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
