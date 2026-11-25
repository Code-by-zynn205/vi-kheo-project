# PRD – US02: Ngân sách tháng

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn đặt ngân sách cho cả tháng, để biết giới hạn chi tiêu của mình. |
| Nguồn | HMW2 – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | Must · 2 · Sprint 2 |
| Màn hình | `docs/design/screens/BudgetScreen.md` · `OnboardingBudgetScreen.md` · `HomeScreen.md` (trạng thái `NO_BUDGET`) |
| Phụ thuộc | US01 (khung app, lớp `storage`) |
| Dữ liệu | `data-analysis.md` mục 11 dòng US02; BR-01, BR-20, BR-21, BR-22, BR-121; ERR_BUDGET_INVALID; EC-05, EC-06 |

## 1. Bối cảnh

68% sinh viên được khảo sát từng hết tiền trước cuối tháng (34/50) `[SƠ CẤP]` (`00-research-log.md`). Không có ngân sách tháng thì app không tính được "Hôm nay còn được tiêu" (US03). US02 cho sinh viên đặt một con số cho cả tháng và thấy ngay mỗi ngày được tiêu khoảng bao nhiêu.

## 2. Luồng thao tác chính

1. Từ tab "Ngân sách" hoặc nút "Đặt ngân sách tháng" trên `HomeScreen` → `BudgetScreen` "Ngân sách tháng <mm/yyyy>".
2. Tháng này chưa có ngân sách mà tháng trước có → thẻ "Tháng trước bạn đặt <số tiền>" + nút "Dùng lại số này".
3. Gõ số tiền (hoặc bấm "Dùng lại số này") → khung xem trước "Từ hôm nay đến hết tháng, mỗi ngày bạn được tiêu khoảng <số tiền>." và "Đã chi tháng này: <số tiền> · Còn <n> ngày" tính lại ngay.
4. Bấm "Cập nhật ngân sách" → lưu (ghi đè nếu đã có), `Snackbar` "Đã cập nhật ngân sách".
5. Lần đầu dùng app: `OnboardingBudgetScreen` "Tháng này bạn có bao nhiêu để chi tiêu?" → "Bắt đầu dùng" hoặc "Để sau" (lối vào từ `OnboardingScreen` làm ở US03).

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E02 `MonthlyBudget` | C U R | `month`, `amount`, `source` (`MANUAL` / `COPIED_FROM_PREVIOUS`) | `data-analysis.md` E02 · `budget-logic` 4.1 (thêm `source` – `technical-design.md` mục 3) |
| E01 `Transaction` | R | Tổng chi tháng (gồm hôm nay) cho dòng "Đã chi tháng này"; tổng thu tháng, chi đến hôm qua cho xem trước | `budget-logic` 4.2 |
| E04 `Settings` | U | `onboardingDoneAt` (ở `OnboardingBudgetScreen`) | `data-analysis.md` E04 |

Truy vấn chính: ngân sách tháng này, tháng trước; tổng chi tháng đến hôm qua (`data-analysis.md` mục 11).

**Quy tắc nghiệp vụ áp dụng:** BR-01, BR-20, BR-21, BR-22 (đề xuất Q2), BR-121 (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Ngày 01/11/2026, chưa chi gì | Nhập `3.000.000` | Xem trước "… mỗi ngày bạn được tiêu khoảng 100.000đ." và "Đã chi tháng này: 0đ · Còn 30 ngày" | Unit test + điện thoại | 06 AC1 · TC1 |
| AC2 | Đã nhập số hợp lệ | Bấm "Cập nhật ngân sách" | Lưu; `Snackbar` "Đã cập nhật ngân sách"; mở từ nút ở Home thì về Home, mở từ tab thì ở lại | Điện thoại | 06 AC2 · `BudgetScreen.md` mục 2 |
| AC3 | Tháng này đã có ngân sách 3.000.000đ | Nhập 2.500.000 và cập nhật | Chỉ còn 1 ngân sách tháng này = 2.500.000đ; con số ở Home dùng ngay số mới | Unit test lớp `storage` | 06 AC2 · BR-20 |
| AC4 | Ô số tiền = 0 | — | Nút "Cập nhật ngân sách" vô hiệu | Điện thoại | 06 AC3 · ERR_BUDGET_INVALID |
| AC5 | Ô đang `99.999.999đ` | Gõ thêm một chữ số | Không nhận phím; dòng lỗi "Ngân sách tối đa 99.999.999đ" | Điện thoại | 06 AC3 · Q3 (đề xuất) |
| AC6 | Sang tháng mới, chưa đặt ngân sách | Mở app | Thẻ ở Home thay số bằng "Đặt ngân sách để biết hôm nay được tiêu bao nhiêu" + nút "Đặt ngân sách tháng" → `BudgetScreen`; ẩn thanh ngân sách | Unit test (`NO_BUDGET`) + điện thoại | 06 AC4 · TC10 · BR-22 |
| AC7 | Tháng 12 chưa có ngân sách, tháng 11 đặt 3.000.000đ | Mở `BudgetScreen` | Thẻ "Tháng trước bạn đặt 3.000.000đ"; bấm "Dùng lại số này" chỉ điền số, **chưa lưu**; lưu khi bấm "Cập nhật ngân sách", `source = COPIED_FROM_PREVIOUS` nếu không sửa số | Unit test + điện thoại | 06 AC5 · BR-22 · Q2 (đề xuất) |
| AC8 | Ngày 20/11, đã chi trước hôm nay 1.530.000đ, hôm nay 47.000đ (tháng này 1.577.000đ) | Nhập ngân sách 1.000.000 | Dòng cảnh báo "Ngân sách thấp hơn số bạn đã chi tháng này (1.577.000đ)"; **không chặn** lưu; Home ra `OUT_OF_BUDGET` (Quỹ còn lại đầu ngày = −530.000đ) | Điện thoại + unit test | 06 AC6 · EC-05, EC-06 · TC5 |
| AC9 | Lần đầu dùng app, ở `OnboardingBudgetScreen` | Nhập 3.000.000, bấm "Bắt đầu dùng" | Lưu ngân sách tháng hiện tại; ghi `onboardingDoneAt`; sang Home | Điện thoại | `OnboardingBudgetScreen.md` mục 3 |
| AC10 | Ở `OnboardingBudgetScreen` | Bấm "Để sau" | Không lưu ngân sách; ghi `onboardingDoneAt`; Home ở `NO_BUDGET` | Điện thoại | BR-121 |
| AC11 | Ở `OnboardingBudgetScreen`, ô trống | — | Thẻ xem trước ẩn, "Bắt đầu dùng" vô hiệu; gõ số > 0 thì thẻ hiện "Từ hôm nay, mỗi ngày bạn được tiêu khoảng" + số tiền | Điện thoại | `OnboardingBudgetScreen.md` mục 2 |
| AC12 | Sau khi US02 xong | Xem `HomeScreen` | Tab "Ngân sách" hiện trên thanh điều hướng dưới | Điện thoại | US01 mục 6 |

## 5. Test case

### 5.1 Tính tiền (dẫn tới `budget-logic` mục 4.4)

| Test case | AC liên quan |
| :--- | :--- |
| TC1 | AC1 |
| TC5 | AC8 |
| TC10 | AC6 |
| TC11 | AC8 (đặt ngân sách muộn, hạn mức 0) |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Cài mới, đi qua onboarding tới `OnboardingBudgetScreen`, bấm "Để sau" | Home ở `NO_BUDGET`, có nút "Đặt ngân sách tháng" | AC10, AC6 |
| 2 | Bấm "Đặt ngân sách tháng", nhập `3000000` | Xem trước tính đúng theo ngày hôm nay | AC1 |
| 3 | Bấm "Cập nhật ngân sách" | "Đã cập nhật ngân sách", về Home | AC2 |
| 4 | Tab "Ngân sách", đổi thành 2.500.000, cập nhật | Ở lại màn ngân sách; Home dùng số mới | AC2, AC3 |
| 5 | Đổi giờ máy sang 01/12, mở `BudgetScreen` | Thẻ "Tháng trước bạn đặt 2.500.000đ"; bấm "Dùng lại số này" chưa lưu | AC7 |

## 6. Ngoài phạm vi

- Các trạng thái `SAFE`, `WARNING`, `OVER`, `OUT_OF_BUDGET` của thẻ và thanh "đã dùng x%" – US03.
- Lối vào `OnboardingBudgetScreen` từ `OnboardingScreen` – US03 (US02 chỉ dựng màn này).
- Ngân sách theo danh mục (US14), ngân sách cho tháng tương lai hoặc quá khứ.

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `frontend-ui` | 4, 6 | `BudgetScreen`, `OnboardingBudgetScreen`, trạng thái `NO_BUDGET` ở `HomeScreen` |
| `design-system` | 4.2, 4.3, 6 | `AmountInput`, `NumericKeypad`, `Button`, `Snackbar` |
| `budget-logic` | 4.1, 4.2, 4.4, 6 | `getBudget`, `setBudget`, xem trước hạn mức (TC1), `NO_BUDGET` (TC10) |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | Q2 – gợi ý ngân sách tháng trước (PRD theo đề xuất A) | PO | chưa có |
| 2 | Q3 – giới hạn 1 – 99.999.999đ (PRD theo đề xuất) | PO | chưa có |
| 3 | Bấm "Dùng lại số này" rồi sửa số: lưu `source = MANUAL` (đề xuất) | Cặp dữ liệu | chưa có |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
