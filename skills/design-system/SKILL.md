---
name: design-system-vi-kheo
description: Hệ thống thiết kế giao diện (Design System) và đặc tả màn hình (UI Spec) cho ứng dụng Ví Khéo, giúp AI Agent generate trực tiếp source code giao diện mobile-first mà không cần qua Figma.
---

# Skill: Design System & UI Spec – Ví Khéo

## 1. Triết lý thiết kế (Design Principles)
- **Tốc độ dưới 5 giây:** Mọi thao tác ghi khoản chi mới phải hoàn tất trong tối đa 2 lần chạm (nhập số tiền -> chọn danh mục -> tự động/bấm lưu).
- **Zero Clutter (Không gây ngợp):** Màn hình chính loại bỏ hoàn toàn các biểu đồ rối mắt, chỉ hiển thị duy nhất con số định hướng hành động: **"Hôm nay còn được tiêu"**.
- **Mobile-First & Thumb-Friendly:** Các nút bấm quan trọng và bàn phím số được đặt ở nửa dưới màn hình, tối ưu cho thao tác một tay.

## 2. Design Tokens (Hệ thống màu sắc, chữ & khoảng cách)

### Bảng màu (Color Palette)
- `--color-primary`: `#4F46E5` (Indigo 600 – Nút hành động chính `+ Ghi khoản chi`, tab đang chọn).
- `--color-primary-light`: `#EEF2FF` (Indigo 50 – Nền highlight thẻ ngân sách).
- `--color-success`: `#10B981` (Emerald 500 – Trạng thái an toàn, đã tiêu < 70% ngân sách).
- `--color-warning`: `#F59E0B` (Amber 500 – Cảnh báo sắp chạm hạn mức, 70% – 90%).
- `--color-danger`: `#EF4444` (Red 500 – Vượt hạn mức ngày hoặc số tiền chi tiêu `-`).
- `--color-bg-page`: `#F9FAFB` (Gray 50 – Nền tổng thể ứng dụng).
- `--color-bg-card`: `#FFFFFF` (White – Nền các thẻ Card và Bottom Sheet).
- `--color-text-primary`: `#111827` (Gray 900 – Tiêu đề, số tiền chính).
- `--color-text-secondary`: `#6B7280` (Gray 500 – Nhãn mô tả, ngày giờ).
- `--color-border`: `#E5E7EB` (Gray 200 – Đường viền phân cách mảnh).

### Typography (Kiểu chữ)
- **Font Family:** `'Inter', 'Roboto', sans-serif` (Hỗ trợ đầy đủ dấu tiếng Việt).
- **Hero Metric (Số tiền được tiêu hôm nay):** `36px` (`2.25rem`), `font-weight: 700`, `line-height: 1.1`.
- **Screen Title (Tiêu đề màn hình):** `20px` (`1.25rem`), `font-weight: 600`.
- **Section Heading:** `16px` (`1rem`), `font-weight: 600`.
- **Body Text:** `14px` (`0.875rem`), `font-weight: 400`.
- **Caption / Subtext:** `12px` (`0.75rem`), `font-weight: 400`.

### Spacing & Border Radius
- **Page Padding:** `16px` trái/phải.
- **Card Padding:** `16px`.
- **Card Border Radius:** `16px`.
- **Button & Input Border Radius:** `12px`.
- **Shadow:** `0 1px 3px rgba(0, 0, 0, 0.08)` (Đổ bóng nhẹ, phẳng hiện đại).

## 3. Thư viện Component chuẩn
1. `DailyAllowanceCard`: Thẻ hiển thị số tiền còn được tiêu hôm nay, màu chữ tự đổi theo tỷ lệ ngân sách còn lại (`--color-success` / `--color-warning` / `--color-danger`), kèm thanh `ProgressBar` ngân sách tháng.
2. `QuickCategoryChip`: Nút chọn danh mục dạng lưới (Grid 3 cột x 2 hàng) gồm Icon + Tên ngắn gọn:
   - `Ăn uống` (icon bát cơm/dao nĩa)
   - `Di chuyển` (icon xe máy/xăng)
   - `Nhà trọ & Điện nước` (icon ngôi nhà)
   - `Học tập & Tài liệu` (icon quyển sách)
   - `Mua sắm & Sinh hoạt` (icon giỏ hàng)
   - `Khác` (icon dấu ba chấm)
3. `TransactionItem`: Hàng hiển thị 1 giao dịch gồm: Icon danh mục (bên trái), Tên ghi chú + Giờ (ở giữa), Số tiền `-XX.000đ` màu `--color-danger` (bên phải).
4. `NumericKeypad`: Bàn phím số tích hợp sẵn trên màn hình nhập liệu (các phím `0-9`, `000`, nút xóa lùi), chiều cao tối thiểu mỗi phím `48px`.

## 4. Đặc tả 4 Màn hình Cốt lõi (Screen Specs cho AI Gen Code)

### Screen 1: `HomeScreen` (Màn hình chính – "Hôm nay còn được tiêu")
- **Top Bar:** Lời chào ngắn ("Chào Minh 👋") + Nút icon cài đặt ngân sách ở góc phải.
- **Hero Section:** Component `DailyAllowanceCard` hiển thị:
  - Nhãn: `Hôm nay còn được tiêu`
  - Số tiền lớn: `86.000₫`
  - Thanh tiến trình: `Ngân sách tháng đã dùng: 62% (1.860.000đ / 3.000.000đ)`
- **Recent Transactions Section:** Tiêu đề `Chi tiêu hôm nay` + danh sách các `TransactionItem` (ví dụ: Cơm trưa `-30.000₫`, Gửi xe `-5.000₫`, Tài liệu `-12.000₫`).
- **Bottom Navigation / CTA:** Thanh điều hướng dưới cùng gồm 3 tab (`Trang chủ`, `Ngân sách`, `Báo cáo`) và nút Floating Action Button (FAB) màu `--color-primary` nổi bật: **`+ Ghi khoản chi`**.

### Screen 2: `AddExpenseScreen` (Màn hình Ghi khoản chi siêu tốc)
- **Layout:** Dạng Bottom Sheet toàn màn hình hoặc trang riêng có nút đóng `X` ở góc trên.
- **Amount Input:** Ô nhập số tiền căn giữa, tự động focus khi mở màn hình, hiển thị định dạng phân tách hàng nghìn (ví dụ: `35.000 đ`).
- **Category Selector:** Lưới 6 `QuickCategoryChip` (mặc định chọn sẵn `Ăn uống` vì tần suất cao nhất ở sinh viên).
- **Optional Note:** 1 ô input nhỏ placeholder `"Ghi chú nhanh (không bắt buộc)..."`.
- **Primary Action:** Nút **`Lưu khoản chi`** rộng 100% chiều ngang, màu `--color-primary`, đặt ngay phía trên `NumericKeypad`.

### Screen 3: `BudgetScreen` (Màn hình Đặt ngân sách tháng)
- **Monthly Limit Input:** Thẻ nhập tổng ngân sách tháng hiện tại (ví dụ: `3.000.000 đ`).
- **Auto-Calculation Preview:** Khung thông báo tự động tính toán: *"Với ngân sách này, trung bình mỗi ngày còn lại bạn được tiêu **100.000đ/ngày**."*
- **Category Allocation (Tùy chọn):** Thanh trượt phân bổ nhanh cho các nhóm cố định (Tiền trọ) và chi tiêu biến đổi (Ăn uống, Đi lại).
- **Save Button:** Nút **`Cập nhật ngân sách`**.

### Screen 4: `ReportScreen` (Màn hình Báo cáo theo danh mục)
- **Filter Tabs:** Bộ chuyển đổi thời gian `Tuần này` | `Tháng này`.
- **Visualization:** Biểu đồ tròn rỗng giữa (`DonutChart`) hiển thị tổng chi ở tâm biểu đồ và tỷ lệ % từng danh mục bằng màu sắc phân biệt rõ ràng.
- **Breakdown List:** Danh sách xếp hạng các danh mục từ chi nhiều nhất đến ít nhất, mỗi dòng gồm: Tên danh mục + Thanh % nhỏ + Tổng tiền đã chi.
