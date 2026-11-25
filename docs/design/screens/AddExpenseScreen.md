# Màn hình `AddExpenseScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** design-system (mục 4.4a) · **Trạng thái:** Xong – Nguyễn Diên Tiến chốt thay nhóm 26/11/2026; cặp UI/UX soát lại khi cập nhật Figma (`figma-gap-report.md` A18 – A21) · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 26/11/2026

- **User Story:** US01 (ghi khoản chi), US07 (ghi khoản thu – Sprint 2)
- **Sprint:** 2 – chế độ Chi (US01), chế độ Thu (US07). Trước khi có US07, công tắc `Chi | Thu` ẩn
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=106-88) – `AddExpenseScreen / Default` (đang nhập); trạng thái khác ở hàng `AddExpenseScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** [trang Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) (Figma)
- **Mở từ:** nút `+ Ghi khoản chi` trên `HomeScreen`, `EmptyState` của Home, bấm thông báo nhắc 21:00 (US05)

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Bottom sheet toàn màn hình; trên cùng: tiêu đề "Ghi khoản chi" (hoặc "Ghi khoản thu") bên trái, nút `X` đóng bên phải.
2. Công tắc `Chi | Thu`, mặc định `Chi`. Chế độ `Thu` chỉ hiện từ Sprint 2 (US07).
3. Ô số tiền căn giữa, cỡ Hero, tự focus; hiển thị `0đ` lúc đầu, `35.000đ` khi gõ. Màu chữ: chi `--color-text-primary`, thu `--color-success-text`.
4. Dòng lỗi dưới ô số tiền (chỉ hiện khi lỗi), 12px, `--color-danger-text`.
5. Lưới 6 `QuickCategoryChip` (3 × 2), mặc định `Ăn uống`. **Ẩn ở chế độ Thu.**
6. Ô ghi chú một dòng, không bắt buộc; bộ đếm "0/100" bên phải, chỉ hiện khi đã gõ ≥ 80 ký tự.
7. Nút chính rộng 100%, ngay trên `NumericKeypad`: "Lưu khoản chi" (hoặc "Lưu khoản thu").
8. `NumericKeypad` ở nửa dưới: 1–9, `000`, 0, xoá lùi.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Mới mở | Vừa mở | `0đ`, nút Lưu vô hiệu, `Ăn uống` được chọn |
| Hợp lệ | 0 < số tiền ≤ 99.999.999 | Nút Lưu bật |
| Lỗi vượt mức | Gõ thêm số làm vượt 99.999.999 | Không nhận phím đó; dòng lỗi "Số tiền tối đa 99.999.999đ" trong 3 giây |
| Ghi chú đầy | Đủ 100 ký tự | Không nhận thêm ký tự; bộ đếm "100/100" màu `--color-warning-text` |
| Đang lưu | Vừa bấm Lưu | Nút Lưu vô hiệu ngay (chống bấm 2 lần – EC-11) |
| Đã lưu | Lưu xong | Đóng sheet, về `HomeScreen`, khoản mới ở đầu danh sách, `Snackbar` "Đã lưu" |
| Lỗi lưu | Không ghi được dữ liệu | Giữ nguyên sheet và số đã nhập; `Snackbar` "Chưa lưu được. Thử lại." |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Gõ phím số | Cập nhật số tiền, định dạng `35.000đ` |
| Bấm `000` | Thêm 3 số 0 (ví dụ `35` → `35.000đ`) |
| Bấm xoá lùi | Xoá chữ số cuối; giữ lâu xoá hết |
| Bấm chip danh mục | Chọn danh mục đó |
| Chuyển `Chi` → `Thu` | Ẩn lưới danh mục; đổi tiêu đề, chữ nút, màu số; giữ số tiền đã nhập |
| Bấm nút Lưu | Lưu, đóng sheet |
| Bấm `X` hoặc vuốt xuống | Đóng, không lưu; nếu đã nhập số tiền → hỏi "Bỏ khoản đang nhập?" với nút "Bỏ" / "Tiếp tục nhập" |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Ghi khoản chi" · "Ghi khoản thu" |
| Công tắc | "Chi" · "Thu" |
| Placeholder ghi chú (chi) | "Ghi chú nhanh (không bắt buộc)…" |
| Placeholder ghi chú (thu) | "Ví dụ: lương làm thêm, nhà gửi" |
| Nút lưu | "Lưu khoản chi" · "Lưu khoản thu" |
| Lỗi số tiền | "Số tiền tối đa 99.999.999đ" |
| Đã lưu | "Đã lưu" |
| Lỗi lưu | "Chưa lưu được. Thử lại." |
| Hỏi khi đóng | "Bỏ khoản đang nhập?" · "Bỏ" · "Tiếp tục nhập" |

## 5. Ngoài phạm vi

- Không chọn ngày – luôn là hôm nay (BR-11, Q7).
- Không chụp hoá đơn, không nhập bằng giọng nói, không chọn ví.
