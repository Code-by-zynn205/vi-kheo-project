# Màn hình `EditTransactionSheet`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt và PO trả lời Q6, Q7, Q15 · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US06
- **Sprint:** 3
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=108-255) – `EditTransactionSheet / Default`; trạng thái khác ở hàng `EditTransactionSheet – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** [trang Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) (Figma)
- **Mở từ:** bấm một `TransactionItem` trên `HomeScreen` hoặc `HistoryScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

Dùng lại bố cục `AddExpenseScreen`, khác ở các điểm sau:

1. Tiêu đề "Sửa khoản chi" (hoặc "Sửa khoản thu"); nút `X` đóng bên phải.
2. Dòng thông tin chỉ đọc: "Ghi lúc 12:05, Thứ Sáu 20/11" (12px, `--color-text-secondary`). **Không có** công tắc `Chi | Thu`, **không** chọn ngày (BR-11).
3. Ô số tiền, lưới danh mục (chỉ với khoản chi), ô ghi chú – điền sẵn giá trị hiện tại.
4. Nút chính "Lưu thay đổi"; vô hiệu khi chưa đổi gì hoặc số tiền = 0.
5. Nút phụ "Xoá khoản này" dạng chữ, màu `--color-danger-text`, ở dưới cùng, cách nút chính ≥ 24px để khó bấm nhầm.
6. `NumericKeypad`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Mới mở | Vừa mở | Giá trị hiện tại; "Lưu thay đổi" vô hiệu |
| Đã đổi | Đổi số tiền, danh mục hoặc ghi chú | "Lưu thay đổi" bật |
| Lỗi nhập | Như `AddExpenseScreen` | Như `AddExpenseScreen` |
| Đã lưu | Bấm "Lưu thay đổi" | Đóng sheet; `Snackbar` "Đã lưu thay đổi"; danh sách và con số cập nhật |
| Đã xoá | Bấm "Xoá khoản này" | Đóng sheet; khoản biến mất; `Snackbar` "Đã xoá khoản 30.000đ" + nút "Hoàn tác" trong 8 giây |
| Hoàn tác | Bấm "Hoàn tác" | Khoản hiện lại đúng vị trí cũ; con số tính lại |

**Xoá không có hộp xác nhận** – dùng Hoàn tác thay thế (đề xuất Q15, xem `docs/requirements/po-decision-proposals.md`). Nếu PO giữ xác nhận: dùng `ConfirmDialog` "Xoá khoản 30.000đ – Cơm trưa?" với nút "Xoá khoản này" / "Giữ lại".

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Sửa rồi bấm `X` | Hỏi "Bỏ thay đổi?" với "Bỏ" / "Tiếp tục sửa" |
| Bấm "Lưu thay đổi" | Ghi đè số tiền / danh mục / ghi chú; `updatedAt` mới |
| Bấm "Xoá khoản này" | Xoá mềm (`deletedAt`, BR-90) – Q6 |
| Bấm "Hoàn tác" trong 8 giây | Bỏ `deletedAt` |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Sửa khoản chi" · "Sửa khoản thu" |
| Thông tin | "Ghi lúc <HH:mm>, <Thứ> <dd/mm>" |
| Nút chính | "Lưu thay đổi" |
| Nút xoá | "Xoá khoản này" |
| Snackbar | "Đã lưu thay đổi" · "Đã xoá khoản <số tiền>" + "Hoàn tác" |
| Hỏi khi đóng | "Bỏ thay đổi?" · "Bỏ" · "Tiếp tục sửa" |

## 5. Ngoài phạm vi

- Không đổi ngày, không đổi Chi ↔ Thu (muốn đổi thì xoá rồi ghi lại).
- Không có thùng rác "Đã xoá gần đây".
- Không xoá nhiều khoản cùng lúc.
