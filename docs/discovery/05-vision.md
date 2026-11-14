# 05. Product Vision Board, Blueprint & Giả định Kiểm chứng

## 1. Product Vision Board (Theo khung Roman Pichler)
- **Tầm nhìn (Vision):** Giúp sinh viên Việt Nam tự tin làm chủ đồng tiền và hình thành thói quen chi tiêu lành mạnh ngay từ những năm đầu đại học.
- **Nhóm mục tiêu (Target Group):** Sinh viên đại học 18–22 tuổi sống xa nhà, ở trọ, tự quản lý khoản tiền cố định hằng tháng.
- **Nhu cầu cốt lõi (Needs):**
  - Biết rõ tiền đã đi đâu trong tháng.
  - Không bị hết tiền trước cuối tháng.
  - Ghi chép chi tiêu cực nhanh, không gây phiền toái hay áp lực.
- **Sản phẩm (Product):** Ứng dụng di động tối giản **Ví Khéo** tập trung vào 4 chức năng lõi: *Ghi chi tiêu dưới 5 giây, Đặt ngân sách tháng, Hiển thị "Tiền được tiêu hôm nay", và Báo cáo theo danh mục*.
- **Mục tiêu dự án (Business/Project Goals):**
  - Hoàn thiện bản MVP chạy ổn định sau 3 Sprint (trước ngày 13/12/2026).
  - Đạt tối thiểu **20 sinh viên** cài đặt dùng thử thực tế.
  - Đạt tỷ lệ giữ chân **$\ge 50\%$** người dùng vẫn duy trì ghi chép sau 7 ngày.

## 2. Mô hình Vận hành & Hệ sinh thái (Solution Blueprint)
- **Giai đoạn MVP (Hiện tại – 4 tuần):** Ứng dụng hoạt động độc lập (Offline-first / Local Storage trên thiết bị), không yêu cầu đăng nhập phức tạp, miễn phí 100% và không quảng cáo để tối đa hóa trải nghiệm người dùng đầu tiên.
- **Hướng mở rộng tương lai (Post-MVP):**
  - Tích hợp gợi ý voucher/ưu đãi ăn uống, nhà sách dành riêng cho sinh viên quanh khu vực trường đại học.
  - Xuất báo cáo chi tiêu định kỳ và tính năng chia tiền phòng trọ cho nhóm sinh viên ở ghép.

## 3. Bảng Giả định Cần Kiểm chứng (Assumptions & Validation)

| Giả định (Assumption) | Phương pháp kiểm chứng | Tiêu chí thành công (Success Metric) | Trạng thái hiện tại |
| :--- | :--- | :--- | :--- |
| **A1:** Nhiều sinh viên thật sự bị hết tiền trước cuối tháng. | Khảo sát online Google Form (`n = 50` SV). | $\ge 60\%$ sinh viên xác nhận. | **Đã đạt (68% xác nhận)** |
| **A2:** Sinh viên thích app tối giản, không quảng cáo hơn app nhiều tính năng. | Khảo sát & Phỏng vấn sâu 5–8 sinh viên. | Đa số nêu quảng cáo/rườm rà là lý do bỏ app cũ. | **Đã đạt (64% nêu lý do ngại nhập/rườm rà)** |
| **A3:** Con số *"Tiền được tiêu hôm nay"* dễ hiểu và hữu ích hơn biểu đồ. | Test giao diện mẫu với 5 sinh viên. | $\ge 4/5$ sinh viên hiểu ngay ý nghĩa trong 5 giây. | Đang triển khai cuối Sprint 0 |
| **A4:** Sinh viên chịu ghi chép hằng ngày nếu thao tác dưới 5 giây. | Nhật ký chi tiêu thực tế 7 ngày trên bản MVP. | $\ge 3/5$ sinh viên ghi chép đủ 7 ngày liên tục. | Kiểm chứng ở Sprint 3 |
