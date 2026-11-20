# Màn hình `HomeScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Cần bổ sung · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US01 (khung, danh sách), US03 (`DailyAllowanceCard` có màu)
- **Sprint:** 1 khung · 2 hoàn thiện
- **Prototype:** `docs/design/prototype/home.html` – Chưa có (dùng để test giả định A3)
- **Mở từ:** mở app

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Thanh trên – lời chào ngắn (trái) + icon cài đặt ngân sách (phải) → mở `BudgetScreen`.
2. `DailyAllowanceCard` – "Hôm nay còn được tiêu" · `86.000đ` (Hero, màu theo trạng thái) · `ProgressBar` "Ngân sách tháng đã dùng 62% (1.860.000đ / 3.000.000đ)".
3. Mục "Chi tiêu hôm nay" – danh sách `TransactionItem`: Cơm trưa −30.000đ · Gửi xe −5.000đ · Tài liệu −12.000đ. Mới nhất ở trên.
4. Thanh điều hướng dưới – `Trang chủ` · `Ngân sách` · `Báo cáo`; nút nổi `+ Ghi khoản chi` màu `--color-primary` → mở `AddExpenseScreen`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Có dữ liệu | Có giao dịch hôm nay | Như mục 1 |
| Trống | Chưa có khoản chi hôm nay | `EmptyState`: "Chưa có khoản chi nào hôm nay" + nút "+ Ghi khoản chi" |
| `SAFE` / `WARNING` / `OVER` / `OUT_OF_BUDGET` | Theo `budget-logic` mục 4.2 | Màu và dòng phụ theo `design-system` mục 4.3 |
| `NO_BUDGET` | Chưa đặt ngân sách tháng này | Thay số Hero bằng nút "Đặt ngân sách tháng" |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm `+ Ghi khoản chi` | Mở `AddExpenseScreen` |
| Bấm icon cài đặt hoặc tab `Ngân sách` | Mở `BudgetScreen` |
| Bấm tab `Báo cáo` | Mở `ReportScreen` |
| Bấm giữ một `TransactionItem` | Sửa/xoá (Sprint 3 – US06) |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Nhãn thẻ | "Hôm nay còn được tiêu" |
| Dòng ngân sách | "Ngân sách tháng đã dùng <x>% (<đã dùng> / <ngân sách>)" |
| Tiêu đề danh sách | "Chi tiêu hôm nay" |
| Lời chào | Cần bổ sung |

## 5. Ngoài phạm vi

- Không có biểu đồ trên màn hình này (biểu đồ ở `ReportScreen`).
- Không có quảng cáo, không đăng nhập.
