# Màn hình `ReportScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Cần bổ sung · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US04
- **Sprint:** 3
- **Prototype:** Chưa có
- **Mở từ:** tab `Báo cáo`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Bộ lọc `Tuần này | Tháng này`.
2. Biểu đồ tròn rỗng giữa (`DonutChart` – component mới, cần thêm vào `design-system` mục 4.3 trước khi code), tổng chi ở tâm.
3. Danh sách danh mục xếp từ chi nhiều đến ít: tên + thanh % + số tiền.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Có dữ liệu | Có khoản chi trong khoảng lọc | Như mục 1; danh mục bằng 0 không hiện |
| Trống | Không có khoản chi trong khoảng lọc | `EmptyState` – Cần bổ sung câu chữ |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Đổi bộ lọc | Tính lại theo `budget-logic` mục 4.3 |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Bộ lọc | "Tuần này" · "Tháng này" |
| Trạng thái trống | Cần bổ sung |

## 5. Ngoài phạm vi

- Không so sánh giữa các tháng, không xuất file.
