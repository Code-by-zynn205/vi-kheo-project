# Màn hình `ReportScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US04
- **Sprint:** 3
- **Figma:** Cần bổ sung – link frame `ReportScreen`
- **Prototype:** Chưa có
- **Mở từ:** tab `Báo cáo`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Tiêu đề "Báo cáo" (20px/600).
2. Bộ lọc hai nút `Tuần này | Tháng này`, mặc định `Tháng này`; dòng phụ khoảng ngày "01/11 – 30/11" (12px).
3. `DonutChart` (design-system 4.3), ở tâm: "Tổng chi" (12px) + `1.577.000đ` (16px/600).
4. Danh sách danh mục, nhiều nhất trên cùng; mỗi hàng: chấm màu `--color-cat-*` · tên danh mục · `ProgressBar` theo % · phần trăm · số tiền. Ví dụ: Ăn uống 48% 757.000đ · Nhà trọ & Điện nước 32% 505.000đ · Di chuyển 9% 142.000đ · Học tập & Tài liệu 6% 95.000đ · Mua sắm & Sinh hoạt 5% 78.000đ.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Có dữ liệu | Có khoản chi trong khoảng lọc | Như mục 1; danh mục bằng 0 không hiện |
| Trống | Không có khoản chi trong khoảng lọc | `EmptyState`: "Chưa có khoản chi nào trong tuần này" (hoặc "tháng này") + nút "+ Ghi khoản chi" |
| Chỉ 1 danh mục | Mọi khoản cùng danh mục | Vòng tròn một màu, danh sách 1 hàng 100% |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Đổi bộ lọc | Tính lại theo `budget-logic` 4.3 (tuần từ thứ Hai – BR-05) |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Báo cáo" |
| Bộ lọc | "Tuần này" · "Tháng này" |
| Tâm biểu đồ | "Tổng chi" |
| Trạng thái trống | "Chưa có khoản chi nào trong tuần này" · "Chưa có khoản chi nào trong tháng này" · nút "+ Ghi khoản chi" |

Phần trăm làm tròn số nguyên; tổng các phần trăm có thể lệch 100% ±1 do làm tròn – chấp nhận.

## 5. Ngoài phạm vi

- Không so sánh giữa các tháng, không xuất file, không báo cáo khoản thu.
- Không bấm vào danh mục để xem chi tiết (sau MVP).
