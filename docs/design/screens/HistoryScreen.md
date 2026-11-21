# Màn hình `HistoryScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US08 (nếu kịp)
- **Sprint:** 3 – nếu kịp
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=108-370) – `HistoryScreen / WithData`; trạng thái khác ở hàng `HistoryScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** [trang Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) (Figma)
- **Mở từ:** liên kết "Xem các ngày trước" trên `HomeScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Thanh trên: nút quay lại (48 × 48) + tiêu đề "Lịch sử".
2. `DateNavigator`: `‹  Thứ Năm, 19/11  ›`; mặc định mở **hôm qua**.
3. Dòng tổng của ngày: "Chi −215.000đ · Thu +0đ".
4. Danh sách `TransactionItem` của ngày đó, mới nhất trên cùng.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Có dữ liệu | Ngày có khoản | Như mục 1 |
| Trống | Ngày không có khoản | `EmptyState`: "Ngày này không có khoản nào" (không có nút) |
| Hôm nay | Lùi tới hôm nay | Mũi tên `›` vô hiệu; tiêu đề ngày là "Hôm nay" |
| Ngày trước khi dùng app | Trước ngày mở app lần đầu (`firstOpenDate`) | Mũi tên `‹` vô hiệu ở ngày `firstOpenDate` |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm `‹` / `›` | Lùi / tiến 1 ngày |
| Bấm vào chữ ngày | Mở lịch chọn ngày (chỉ chọn được từ `firstOpenDate` tới hôm nay) |
| Bấm một khoản | Mở `EditTransactionSheet` |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Lịch sử" |
| Tổng ngày | "Chi <số tiền> · Thu <số tiền>" |
| Trống | "Ngày này không có khoản nào" |

## 5. Ngoài phạm vi

- Không tìm kiếm theo chữ, không lọc theo danh mục, không xem theo tuần/tháng (đã có `ReportScreen`).
