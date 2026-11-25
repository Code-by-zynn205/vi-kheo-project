# Màn hình `HomeScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** design-system (mục 4.4a) · **Trạng thái:** Xong – Nguyễn Diên Tiến chốt thay nhóm 26/11/2026; cặp UI/UX soát lại khi cập nhật Figma (`figma-gap-report.md` A18 – A21) · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 26/11/2026

- **User Story:** US01 (danh sách hôm nay), US03 (`DailyAllowanceCard`), lối vào US05, US06, US08
- **Sprint:** 2 – US01 (thanh trên, "Chi tiêu hôm nay", nút nổi) · US03 (`DailyAllowanceCard`, thanh ngân sách) · US02 (trạng thái `NO_BUDGET`)
- **Dựng theo story (chốt 26/11/2026):** mỗi lối vào chỉ hiện khi story của nó xong – tab `Ngân sách` từ US02, icon cài đặt từ US19, tab `Báo cáo` từ US04, "Xem các ngày trước" từ US08. Bản dùng thử 03/12: tab `Trang chủ`, `Ngân sách`, icon cài đặt
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=106-13) – `HomeScreen / SAFE`; trạng thái khác ở hàng `HomeScreen – states` và `HomeScreen / Deleted`, `HomeScreen / InviteReminder` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** [trang Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) (Figma) · `docs/design/prototype/home.html` (HTML, chỉ HomeScreen)
- **Mở từ:** mở app; tab `Trang chủ`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. **Thanh trên** – trái: "Hôm nay" (tiêu đề màn hình, 20px/600) và dòng ngày "Thứ Sáu, 20/11" (12px, `--color-text-secondary`); phải: icon cài đặt (vùng bấm 48 × 48) → `SettingsScreen`.
2. **`DailyAllowanceCard`** – nền `--color-primary-light`, bo góc 16px:
   - Nhãn "Hôm nay còn được tiêu" (14px).
   - Số Hero `86.000đ` (36px/700) – ví dụ ngày 20/11, ngân sách 3.000.000đ, đã chi trước hôm nay 1.530.000đ, hôm nay 47.000đ → hạn mức 133.000đ, còn 86.000đ, màu theo trạng thái (mục 2).
   - Dòng phụ theo trạng thái (mục 2), 12px.
   - `ProgressBar` + chữ "Ngân sách tháng đã dùng 52% (1.577.000đ / 3.000.000đ)" – phần trăm làm tròn xuống, mẫu số = ngân sách + tổng thu tháng (Q19 đề xuất, PO duyệt cùng PRD US03); trên 100% hiện đúng số %, thanh đầy.
3. **Mục "Chi tiêu hôm nay"** – tiêu đề mục (16px/600) + tổng bên phải "−47.000đ"; danh sách `TransactionItem`, mới nhất trên cùng: Tài liệu −12.000đ · Gửi xe −5.000đ · Cơm trưa −30.000đ.
4. **Liên kết** "Xem các ngày trước" (chữ `--color-primary`, vùng bấm 48px) → `HistoryScreen` (US08 – chỉ hiện khi US08 đã làm).
5. **Thanh điều hướng dưới** – `Trang chủ` · `Ngân sách` · `Báo cáo`; nút nổi `+ Ghi khoản chi` màu `--color-primary`, nằm giữa phía trên thanh điều hướng → `AddExpenseScreen`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| `SAFE` | Đã tiêu hôm nay < 70% hạn mức | Số Hero `--color-success-text`; không có dòng phụ |
| `WARNING` | 70% – 100% | Số Hero `--color-warning-text`; dòng phụ "Sắp chạm hạn mức hôm nay" |
| `OVER` | > 100% | Số Hero hiện **số âm** `−15.000đ` màu `--color-danger-text`; dòng phụ "Đã vượt 15.000đ" |
| `OUT_OF_BUDGET` | Quỹ còn lại đầu ngày ≤ 0 | Số Hero `0đ` màu `--color-danger-text`; dòng phụ "Đã dùng hết ngân sách tháng" |
| `NO_BUDGET` | Chưa đặt ngân sách tháng này | Thay số Hero bằng câu "Đặt ngân sách để biết hôm nay được tiêu bao nhiêu" + nút "Đặt ngân sách tháng" → `BudgetScreen`; ẩn `ProgressBar` |
| Trống | Hôm nay chưa có khoản nào | Mục 3 thay bằng `EmptyState`: "Chưa có khoản chi nào hôm nay" + nút "+ Ghi khoản chi" |
| Có khoản thu hôm nay | Có `INCOME` hôm nay | Khoản thu hiện trong danh sách với `+1.200.000đ` màu `--color-success-text`; tổng mục 3 chỉ cộng khoản chi |
| Lỗi đọc dữ liệu | Không đọc được dữ liệu trên máy | `EmptyState`: "Không tải được dữ liệu. Thử mở lại app." + nút "Thử lại" |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm `+ Ghi khoản chi` | Mở `AddExpenseScreen` |
| Bấm icon cài đặt | Mở `SettingsScreen` |
| Bấm tab `Ngân sách` / nút "Đặt ngân sách tháng" | Mở `BudgetScreen` |
| Bấm tab `Báo cáo` | Mở `ReportScreen` |
| Bấm một `TransactionItem` | Mở `EditTransactionSheet` (US06) |
| Bấm "Xem các ngày trước" | Mở `HistoryScreen` (US08) |
| Quay lại app sau 00:00 | Ngày, hạn mức, danh sách tự tính lại cho ngày mới |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Hôm nay" |
| Dòng ngày | "<Thứ>, <dd/mm>" – ví dụ "Thứ Sáu, 20/11" |
| Nhãn thẻ | "Hôm nay còn được tiêu" |
| Dòng ngân sách | "Ngân sách tháng đã dùng <x>% (<đã dùng> / <ngân sách>)" |
| Tiêu đề danh sách | "Chi tiêu hôm nay" |
| Liên kết lịch sử | "Xem các ngày trước" |
| Nút nổi | "+ Ghi khoản chi" |
| Tab | "Trang chủ" · "Ngân sách" · "Báo cáo" |
| `NO_BUDGET` | "Đặt ngân sách để biết hôm nay được tiêu bao nhiêu" · nút "Đặt ngân sách tháng" |

Tên thứ: "Thứ Hai" … "Thứ Bảy", "Chủ Nhật".

## 5. Ngoài phạm vi

- Không có biểu đồ (biểu đồ ở `ReportScreen`).
- Không lời chào theo tên (app không hỏi tên người dùng).
- Không quảng cáo, không đăng nhập.
