# 07. Lộ trình Triển khai 4 Tuần & Definition of Done

## 1. Lộ trình 4 Sprint (1 tuần / Sprint)

### Sprint 0: Research & Discovery (Hiện tại – Hoàn tất trước 16/11/2026)
- **Mục tiêu:** Chốt vấn đề, chân dung người dùng, tầm nhìn sản phẩm, Product Backlog và bộ Skill AI (`product-discovery` & `design-system`).
- **Đầu ra:**
  - Hoàn thành khảo sát 50 sinh viên trên Google Form và tổng hợp dữ liệu thật.
  - Hoàn thiện bộ 7 tài liệu `.md` trong `docs/discovery/` và 2 file `SKILL.md` trong `skills/`.
  - Kiểm thử nhanh luồng màn hình với 5 sinh viên.

### Sprint 1: Lõi Ghi chép Chi tiêu (16/11 – 22/11/2026)
- **Mục tiêu:** Xây dựng chức năng ghi nhận giao dịch siêu tốc và lưu trữ dữ liệu cục bộ trên thiết bị.
- **User Story:** `US01` (Màn hình `HomeScreen` khung cơ bản + `AddExpenseScreen` + 6 danh mục sinh viên + Lưu dữ liệu Local Storage/SQLite).

### Sprint 2: Quản lý Ngân sách & Hạn mức Ngày (23/11 – 29/11/2026)
- **Mục tiêu:** Hoàn thiện thuật toán tính số tiền còn được tiêu hôm nay và cảnh báo trực quan.
- **User Stories:** `US02` (Màn hình `BudgetScreen` đặt ngân sách tháng) + `US03` (Thẻ `DailyAllowanceCard` tính toán tự động trên màn hình chính).

### Sprint 3: Báo cáo, Nhắc nhở & Kiểm thử Thực tế (30/11 – 06/12/2026)
- **Mục tiêu:** Hoàn thiện biểu đồ thống kê, tính năng nhắc nhở và cho sinh viên dùng thử thực tế trước ngày chốt MVP (13/12/2026).
- **User Stories:** `US04` (Màn hình `ReportScreen` biểu đồ tròn theo danh mục) + `US05` (Nhắc nhở buổi tối & Sửa/xóa giao dịch).
- **Hoạt động kiểm chứng:** Demo và cho **5–20 sinh viên thật** dùng thử, thu thập phản hồi để chuẩn bị báo cáo tổng kết môn học.

---

## 2. Tiêu chuẩn Hoàn thành (Definition of Done – DoD)
Một thẻ công việc / User Story chỉ được coi là hoàn thành (`Done`) khi đáp ứng đủ 4 tiêu chí sau:
1. **Đúng chuẩn Design System:** Giao diện sinh ra khớp với bảng màu, font chữ và component quy định trong `skills/design-system/SKILL.md`.
2. **Code sạch & Có Review:** Mã nguồn được đẩy lên GitHub và được ít nhất 1 thành viên khác trong cặp/nhóm review, không lỗi biên dịch.
3. **Chạy thực tế:** Tính năng chạy ổn định trên thiết bị di động / trình giả lập và vượt qua các tiêu chí chấp nhận (Acceptance Criteria).
4. **Cập nhật quản lý:** Đã tích hoàn thành đầy đủ checklist và chuyển trạng thái trên bảng Trello của nhóm.
