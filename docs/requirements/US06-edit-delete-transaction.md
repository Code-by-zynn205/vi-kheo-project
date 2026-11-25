# PRD – US06: Sửa / xoá giao dịch

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn sửa hoặc xoá khoản đã ghi, để sửa khi nhập nhầm. |
| Nguồn | HMW1 – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | Should · 3 · Sprint 3 |
| Màn hình | `docs/design/screens/EditTransactionSheet.md` · `HomeScreen.md` (bấm `TransactionItem`, `Snackbar` Hoàn tác) |
| Phụ thuộc | US01, US03 (con số tính lại – TC16) |
| Dữ liệu | `data-analysis.md` mục 11 dòng US06; BR-11, BR-90, BR-91; EC-03, EC-04, EC-12; ERR_AMOUNT_ZERO, ERR_AMOUNT_MAX, ERR_NOTE_TOO_LONG; Q6 (đã chốt), Q7, Q15 |

## 1. Bối cảnh

Ghi nhanh (US01) thì dễ nhập nhầm. Không sửa được thì "Hôm nay còn được tiêu" sai và người dùng mất tin cậy. US06 cho sửa số tiền, danh mục, ghi chú và xoá có Hoàn tác 8 giây – không hỏi xác nhận cho thao tác hằng ngày (Q15).

## 2. Luồng thao tác chính

1. Bấm một khoản trong "Chi tiêu hôm nay" → `EditTransactionSheet` "Sửa khoản chi" (hoặc "Sửa khoản thu") với giá trị hiện tại và dòng "Ghi lúc <HH:mm>, <Thứ> <dd/mm>".
2. Sửa số tiền / danh mục / ghi chú → "Lưu thay đổi" bật → bấm → `Snackbar` "Đã lưu thay đổi"; danh sách và con số cập nhật.
3. Hoặc bấm "Xoá khoản này" → sheet đóng, khoản biến mất, `Snackbar` "Đã xoá khoản <số tiền>" + "Hoàn tác" trong 8 giây.

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E01 `Transaction` | R U D (xoá mềm) | `amount`, `categoryId`, `note`, `updatedAt`, `deletedAt`; **không đổi** `type`, `date` | `data-analysis.md` E01 · BR-11 · `budget-logic` 4.1 (`updateTransaction`, `deleteTransaction`, `restoreTransaction`) |
| E03 `Category` | R | 6 danh mục chi | E03 |

Truy vấn chính: một giao dịch theo `id` (`data-analysis.md` mục 11).

**Quy tắc nghiệp vụ áp dụng:** BR-11 (đề xuất Q7), BR-90 (Hoàn tác 8 giây, Q15 đề xuất), BR-91 (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Khoản chi "Cơm trưa" 30.000đ lúc 12:05 Thứ Sáu 20/11 | Bấm vào khoản đó | Sheet "Sửa khoản chi"; "Ghi lúc 12:05, Thứ Sáu 20/11"; số tiền, danh mục, ghi chú điền sẵn; "Lưu thay đổi" vô hiệu | Điện thoại | 06 AC1 · `EditTransactionSheet.md` |
| AC2 | Sheet đang mở | Đổi 30.000 → 35.000, bấm "Lưu thay đổi" | `Snackbar` "Đã lưu thay đổi"; danh sách hiện −35.000đ; "Hôm nay còn được tiêu" giảm 5.000đ; `updatedAt` mới | Điện thoại + unit test | 06 AC1 |
| AC3 | Sheet đang mở | Tìm cách đổi ngày hoặc Chi ↔ Thu | Không có công tắc `Chi | Thu`, không có chọn ngày | Điện thoại | 06 AC2 · BR-11 · Q7 |
| AC4 | Sheet đang mở | Số tiền = 0 / vượt 99.999.999 / ghi chú > 100 ký tự | Như US01 AC3, AC4, AC5 | Điện thoại | 06 AC3 · TC12, TC13, TC15 |
| AC5 | Ngày 16/11, dữ liệu TC3, có khoản chi hôm qua 50.000đ | Xoá khoản hôm qua | Hạn mức hôm nay = 83.000đ | Unit test | 06 AC4 · TC16 · EC-04 |
| AC6 | Sheet đang mở | Bấm "Xoá khoản này" | Không có hộp xác nhận; sheet đóng; khoản biến mất; `Snackbar` "Đã xoá khoản 30.000đ" + "Hoàn tác" trong 8 giây; bản ghi có `deletedAt` (xoá mềm) | Điện thoại + unit test | 06 AC4, AC5 · BR-90 · Q6 · Q15 |
| AC7 | Vừa xoá | Bấm "Hoàn tác" trong 8 giây | Khoản hiện lại đúng vị trí cũ; con số tính lại; `deletedAt` rỗng | Điện thoại + unit test | 06 AC5 · BR-90 |
| AC8 | Vừa xoá | Chờ 9 giây | `Snackbar` đã ẩn, không hoàn tác được | Điện thoại | EC-12 |
| AC9 | Khoản chi của tháng 10 | Sửa số tiền | Chỉ số liệu tháng 10 đổi; hạn mức hôm nay (tháng 11) không đổi | Unit test | 06 AC6 · EC-03 |
| AC10 | Đã sửa số tiền, chưa lưu | Bấm `X` | Hỏi "Bỏ thay đổi?" với "Bỏ" / "Tiếp tục sửa" | Điện thoại | `EditTransactionSheet.md` mục 3 |
| AC11 | Khoản thu +1.200.000đ | Bấm vào | Sheet "Sửa khoản thu", không có lưới danh mục | Điện thoại | `EditTransactionSheet.md` mục 1 |

## 5. Test case

### 5.1 Tính tiền (dẫn tới `budget-logic` mục 4.4)

| Test case | AC liên quan |
| :--- | :--- |
| TC16 | AC5 |
| TC12, TC13, TC15 | AC4 |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Ghi 30.000đ, bấm vào khoản đó | Sheet sửa, nút lưu vô hiệu | AC1 |
| 2 | Đổi thành 35.000, lưu | −35.000đ, con số giảm 5.000đ | AC2 |
| 3 | Bấm lại, "Xoá khoản này", bấm "Hoàn tác" | Khoản quay lại | AC6, AC7 |
| 4 | Xoá, chờ 9 giây | Không còn nút Hoàn tác | AC8 |

## 6. Ngoài phạm vi

- Đổi ngày, đổi Chi ↔ Thu (xoá rồi ghi lại), thùng rác "Đã xoá gần đây", xoá nhiều khoản cùng lúc.
- Sửa / xoá từ màn lịch sử – US08 (dùng lại sheet này).
- Dọn hẳn bản ghi đã xoá sau 30 ngày (BR-91) – sau tuần dùng thử.

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `frontend-ui` | 4, 6 | `EditTransactionSheet`, bấm `TransactionItem`, `Snackbar` Hoàn tác |
| `design-system` | 4.2, 4.3, 6 | `BottomSheet`, `AmountInput`, `QuickCategoryChip`, `NoteInput`, `Snackbar`, `Button` |
| `budget-logic` | 4.1, 4.4, 6 | `updateTransaction`, `deleteTransaction`, `restoreTransaction`; TC16 (task bắt buộc) |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | Q7 – không đổi ngày khi sửa (PRD theo đề xuất) | PO | chưa có |
| 2 | Q15 – Hoàn tác 8 giây, không hộp xác nhận (PRD theo đề xuất; PO giữ xác nhận thì dùng `ConfirmDialog` theo đặc tả) | PO | chưa có |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
