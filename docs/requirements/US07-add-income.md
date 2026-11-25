# PRD – US07: Ghi khoản thu

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn ghi khoản thu (lương làm thêm, tiền nhà gửi thêm), để số tiền được tiêu tính đúng. |
| Nguồn | HMW2 – `docs/discovery/06-journey-features.md` (bổ sung 14/11, PO duyệt) |
| Ưu tiên · Story Point · Sprint | Must · 1 · Sprint 2 – **story đầu tiên bị cắt** nếu ngày 01/12 US01 – US03 chưa xong (`00-master-plan.md` mục 3.1) |
| Màn hình | `docs/design/screens/AddExpenseScreen.md` (chế độ Thu) · `HomeScreen.md` (trạng thái "Có khoản thu hôm nay") |
| Phụ thuộc | US01 (màn nhập, lớp `storage`), US03 (công thức đã cộng tổng thu) |
| Dữ liệu | `data-analysis.md` mục 11 dòng US07; BR-01, BR-02, BR-03, BR-10, BR-21; ERR_AMOUNT_ZERO, ERR_AMOUNT_MAX, ERR_NOTE_TOO_LONG |

## 1. Bối cảnh

Persona Minh có tiền làm thêm và tiền nhà gửi không cố định. Nếu không ghi khoản thu, "Hôm nay còn được tiêu" (US03) thấp hơn thực tế và mất tin cậy. US07 dùng lại màn nhập của US01, chỉ thêm công tắc `Chi | Thu`.

## 2. Luồng thao tác chính

1. Bấm "+ Ghi khoản chi" → `AddExpenseScreen` → chuyển công tắc sang "Thu".
2. Tiêu đề đổi thành "Ghi khoản thu", lưới danh mục ẩn, số tiền màu thu, nút đổi thành "Lưu khoản thu"; số tiền đã nhập được giữ.
3. Gõ `1200000`, (tuỳ chọn) ghi chú "Ví dụ: lương làm thêm, nhà gửi" → bấm "Lưu khoản thu".
4. Về `HomeScreen`: khoản "+1.200.000đ" màu thu trong danh sách; "Hôm nay còn được tiêu" tăng tương ứng.

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E01 `Transaction` | C | `type = INCOME`, `amount`, `categoryId = null` (R1), `note`, `date`, `createdAt`, `updatedAt` | `data-analysis.md` E01 · BR-10 · `budget-logic` 4.1 |
| E03 `Category` | — | Không dùng ở R1 (danh mục thu là R2) | BR-10 |

**Quy tắc nghiệp vụ áp dụng:** BR-01, BR-02 (khoản thu hiện dấu `+`), BR-03, BR-10, BR-21 (đề xuất Q1) (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Ở `AddExpenseScreen`, chế độ "Chi", đã gõ `50.000đ` | Chuyển sang "Thu" | Tiêu đề "Ghi khoản thu"; lưới danh mục ẩn; số tiền vẫn `50.000đ`, màu `--color-success-text`; nút "Lưu khoản thu"; placeholder ghi chú "Ví dụ: lương làm thêm, nhà gửi" | Điện thoại | 06 AC1 · `AddExpenseScreen.md` mục 3, 4 |
| AC2 | Chế độ "Thu", nhập `1200000` | Bấm "Lưu khoản thu" | Về Home; danh sách có "+1.200.000đ" màu `--color-success-text`; bản ghi `type = INCOME`, `categoryId = null` | Điện thoại + unit test | 06 AC1 · BR-02 · BR-10 |
| AC3 | Chế độ "Thu" | Số tiền 0 / vượt 99.999.999 / ghi chú > 100 ký tự | Giống US01 AC3, AC4, AC5 | Điện thoại | 06 AC2 · TC12, TC13, TC15 |
| AC4 | Ngày 16/11, ngân sách 2.500.000đ, đã chi trước hôm nay 2.000.000đ | Ghi khoản thu 1.200.000đ | Hạn mức hôm nay = 113.000đ | Unit test | 06 AC3 · TC7 · BR-21 |
| AC5 | Hôm nay có khoản chi 47.000đ và khoản thu 1.200.000đ | Xem mục "Chi tiêu hôm nay" | Khoản thu hiện trong danh sách; tổng mục chỉ cộng khoản chi: "−47.000đ" | Điện thoại + unit test | `HomeScreen.md` mục 2 |
| AC6 | Khoản thu ghi ngày 28/11 | Tính hạn mức tháng 11 và tháng 12 | Chỉ cộng vào quỹ tháng 11 (tháng theo `date`) | Unit test | BR-04 · BR-21 · Q1 |

## 5. Test case

### 5.1 Tính tiền (dẫn tới `budget-logic` mục 4.4)

| Test case | AC liên quan |
| :--- | :--- |
| TC7 | AC4 |
| TC12, TC13, TC15 | AC3 |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Mở màn nhập, gõ `50000`, chuyển "Thu" | Số giữ nguyên, đổi màu, ẩn danh mục, đổi chữ nút | AC1 |
| 2 | Xoá, gõ `1200000`, "Lưu khoản thu" | "+1.200.000đ" màu xanh ở Home; số "còn được tiêu" tăng | AC2, AC4 |
| 3 | Ghi thêm một khoản chi 47.000đ | Tổng "Chi tiêu hôm nay" là "−47.000đ" | AC5 |

## 6. Ngoài phạm vi

- Danh mục khoản thu, báo cáo khoản thu – R2.
- Chọn "dùng cho tháng sau" khi ghi khoản thu (Q1 phương án B) – R2 nếu phỏng vấn cho thấy cần.
- Nút riêng "+ Ghi khoản thu" trên Home – vào bằng công tắc ở màn nhập.

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `frontend-ui` | 4, 6 | Chế độ "Thu" của `AddExpenseScreen`, dòng khoản thu ở `HomeScreen` |
| `design-system` | 4.2, 4.3, 6 | Công tắc `Chi | Thu`, màu thu, `TransactionItem` |
| `budget-logic` | 4.1, 4.2, 4.4, 6 | Lưu `INCOME`; TC7 |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | Q1 – khoản thu cộng vào tháng theo ngày ghi (PRD theo đề xuất A) | PO | chưa có |
| 2 | Tiêu đề mục "Chi tiêu hôm nay" khi có cả khoản thu – giữ nguyên (đề xuất) | Cặp UI/UX | Giữ nguyên – chốt 26/11/2026 |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
