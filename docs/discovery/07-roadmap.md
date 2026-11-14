# 07. Lộ trình Triển khai 4 Tuần & Definition of Done

## 1. Lộ trình 4 Sprint (1 tuần / Sprint)

### Sprint 0: Research & Discovery (09/11 – 15/11/2026)
- **Mục tiêu:** Chốt vấn đề, chân dung người dùng, tầm nhìn sản phẩm, Product Backlog và bộ Skill AI (`product-discovery` & `design-system`).
- **Đầu ra:**
  - Hoàn thành khảo sát 50 sinh viên trên Google Form và tổng hợp dữ liệu thật vào `docs/research/survey-n50.md`.
  - Hoàn thiện bộ 7 tài liệu `.md` trong `docs/discovery/` và 2 skill trong `.claude/skills/`.
  - Kiểm thử nhanh luồng màn hình với 5 sinh viên (giả định A3).
  - Chốt tech stack: React Native (`design-system §1`).

### Sprint 1: Lõi Ghi chép Chi tiêu (16/11 – 22/11/2026)
- **Mục tiêu:** Xây dựng chức năng ghi nhận giao dịch siêu tốc và lưu trữ dữ liệu cục bộ trên thiết bị.
- **User Story:** `US01` (Màn hình `HomeScreen` khung cơ bản + `AddExpenseScreen` + 6 danh mục sinh viên + lưu dữ liệu cục bộ theo tech stack đã chốt).

### Sprint 2: Quản lý Ngân sách & Hạn mức Ngày (23/11 – 29/11/2026)
- **Mục tiêu:** Hoàn thiện thuật toán tính số tiền còn được tiêu hôm nay và cảnh báo trực quan.
- **User Stories:** `US02` (Màn hình `BudgetScreen` đặt ngân sách tháng) + `US03` (Thẻ `DailyAllowanceCard` tính toán tự động trên màn hình chính).
- **Cuối Sprint:** Phát bản dùng thử (gồm `US01`–`US03`) cho sinh viên để bắt đầu đo giả định A4 từ 30/11.

### Sprint 3: Báo cáo, Nhắc nhở & Kiểm thử Thực tế (30/11 – 06/12/2026)
- **Mục tiêu:** Hoàn thiện biểu đồ thống kê, tính năng nhắc nhở và cho sinh viên dùng thử thực tế trước ngày chốt MVP (13/12/2026).
- **User Stories:** `US04` (Màn hình `ReportScreen` biểu đồ tròn theo danh mục) + `US05` (Nhắc nhở buổi tối) + `US06` (Sửa/xóa giao dịch). `US07` (Lịch sử theo ngày) chỉ làm nếu kịp tiến độ và đã có đặc tả màn hình.
- **Hoạt động kiểm chứng:** Sinh viên dùng thử bản MVP trong 7 ngày (30/11 – 06/12): mục tiêu **≥ 20 sinh viên**, tối thiểu 5 sinh viên. Đo giả định A4 và tỷ lệ giữ chân 7 ngày (`05 §1`), đồng thời thu thập phản hồi.

### Tuần chốt MVP (07/12 – 13/12/2026, ngoài 4 Sprint)
- Tổng hợp số liệu dùng thử vào `docs/research/` và cập nhật trạng thái giả định ở `05 §3`.
- Sửa lỗi phát sinh từ đợt dùng thử, chốt bản MVP trước 13/12/2026.
- Chuẩn bị báo cáo tổng kết môn học.

---

## 2. Tiêu chuẩn Hoàn thành (Definition of Done – DoD)
Một thẻ công việc / User Story chỉ được coi là hoàn thành (`Done`) khi đáp ứng đủ 4 tiêu chí sau:
1. **Đúng chuẩn Design System:** Giao diện sinh ra khớp với bảng màu, font chữ và component quy định trong `.claude/skills/design-system/SKILL.md`, và qua được checklist ở §10 của file đó.
2. **Code sạch & Có Review:** Mã nguồn được đẩy lên GitHub và được ít nhất 1 thành viên khác trong cặp/nhóm review, không lỗi biên dịch.
3. **Chạy thực tế:** Tính năng chạy ổn định trên thiết bị di động / trình giả lập và vượt qua các tiêu chí chấp nhận (Acceptance Criteria) của User Story trong `06 §5`.
4. **Cập nhật quản lý:** Đã tích hoàn thành đầy đủ checklist và chuyển trạng thái trên bảng Trello của nhóm.
