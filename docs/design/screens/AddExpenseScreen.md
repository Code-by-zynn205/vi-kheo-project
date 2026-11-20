# Màn hình `AddExpenseScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Cần bổ sung · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US01 (ghi khoản chi), US07 (ghi khoản thu – Sprint 2)
- **Sprint:** 1
- **Prototype:** Chưa có
- **Mở từ:** nút `+ Ghi khoản chi` trên `HomeScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Bottom sheet toàn màn hình, nút `X` đóng (trên phải).
2. Công tắc `Chi | Thu`, mặc định `Chi` (`Thu` dùng từ Sprint 2 – US07).
3. Ô số tiền căn giữa, tự focus, hiển thị `35.000đ` khi gõ (cỡ Hero).
4. Lưới 6 `QuickCategoryChip` (3 × 2), mặc định chọn `Ăn uống`. Ẩn khi chọn `Thu`.
5. Ô ghi chú tuỳ chọn.
6. Nút `Lưu khoản chi` rộng 100%, ngay trên `NumericKeypad`.
7. `NumericKeypad` ở nửa dưới màn hình.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Mới mở | Vừa bấm `+ Ghi khoản chi` | Số tiền `0đ`, nút Lưu vô hiệu, `Ăn uống` được chọn |
| Hợp lệ | 0 < số tiền ≤ 99.999.999 | Nút Lưu bật |
| Lỗi | Số tiền > 99.999.999 | Dòng đỏ dưới ô số tiền: "Số tiền tối đa 99.999.999đ", nút Lưu vô hiệu |
| Đã lưu | Bấm Lưu | Đóng sheet, về `HomeScreen`, khoản mới ở đầu danh sách, thông báo nhỏ "Đã lưu" |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Gõ phím số | Cập nhật số tiền, định dạng `35.000đ` |
| Bấm chip danh mục | Chọn danh mục đó |
| Bấm `Lưu khoản chi` | Lưu, đóng sheet |
| Bấm `X` | Đóng, không lưu |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Công tắc | "Chi" · "Thu" |
| Placeholder ghi chú | "Ghi chú nhanh (không bắt buộc)…" |
| Nút lưu | "Lưu khoản chi" |
| Lỗi | "Số tiền tối đa 99.999.999đ" |
| Thông báo | "Đã lưu" |

## 5. Ngoài phạm vi

- Không chọn ngày (luôn là hôm nay) – Cần bổ sung nếu PO muốn.
- Không chụp hoá đơn, không nhập bằng giọng nói.
