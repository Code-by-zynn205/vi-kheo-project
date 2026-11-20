# Màn hình `BudgetScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Cần bổ sung · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US02
- **Sprint:** 2
- **Prototype:** Chưa có
- **Mở từ:** tab `Ngân sách`, icon cài đặt trên `HomeScreen`, nút "Đặt ngân sách tháng"

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Tiêu đề màn hình.
2. Ô nhập ngân sách tháng (ví dụ `3.000.000đ`) + `NumericKeypad`.
3. Khung xem trước: "Với ngân sách này, mỗi ngày còn lại bạn được tiêu khoảng **100.000đ**."
4. Nút `Cập nhật ngân sách`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Chưa đặt | Tháng mới, chưa có ngân sách | Gợi ý sẵn số tiền tháng trước (chờ PO chốt – `budget-logic` mục 4.2) |
| Đã đặt | Có ngân sách tháng này | Hiện số hiện tại, sửa được |
| Lỗi | Số tiền = 0 | Nút cập nhật vô hiệu |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Gõ số tiền | Khung xem trước tính lại ngay |
| Bấm `Cập nhật ngân sách` | Lưu, `HomeScreen` dùng ngân sách mới ngay |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | Cần bổ sung |
| Xem trước | "Với ngân sách này, mỗi ngày còn lại bạn được tiêu khoảng <số>." |
| Nút | "Cập nhật ngân sách" |

## 5. Ngoài phạm vi

- Không phân bổ ngân sách theo danh mục (Could-have).
