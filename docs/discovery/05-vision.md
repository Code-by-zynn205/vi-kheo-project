# 05. Product Vision Board, Blueprint & Giả định Kiểm chứng

## 1. Product Vision Board (Theo khung Roman Pichler)
- **Tầm nhìn (Vision):** Giúp sinh viên Việt Nam tự tin làm chủ đồng tiền và hình thành thói quen chi tiêu lành mạnh ngay từ những năm đầu đại học.
- **Nhóm mục tiêu (Target Group):** Sinh viên đại học 18–22 tuổi sống xa nhà, ở trọ, tự quản lý khoản tiền cố định hằng tháng.
- **Nhu cầu cốt lõi (Needs):**
  - Biết rõ tiền đã đi đâu trong tháng.
  - Không bị hết tiền trước cuối tháng.
  - Ghi chép chi tiêu cực nhanh, không gây phiền toái hay áp lực.
- **Sản phẩm (Product):** Ứng dụng di động tối giản **Ví Khéo** tập trung vào 4 chức năng lõi: *Ghi chi tiêu dưới 5 giây, Đặt ngân sách tháng, Hiển thị "Tiền được tiêu hôm nay", và Báo cáo theo danh mục*.
  - *"Dưới 5 giây"* là mục tiêu thiết kế, đặt chặt hơn kỳ vọng dưới 10 giây của 82% (41/50) sinh viên khảo sát (`02 §4`). Mục tiêu này được kiểm chứng qua giả định A4.
- **Mục tiêu dự án (Business/Project Goals):**
  - Hoàn thiện bản MVP chạy ổn định sau 3 Sprint (trước ngày 13/12/2026).
  - Đạt tối thiểu **20 sinh viên** cài đặt dùng thử thực tế.
  - Đạt tỷ lệ giữ chân **≥ 50%** người dùng vẫn duy trì ghi chép sau 7 ngày.

## 2. Mô hình Vận hành & Hệ sinh thái (Solution Blueprint)
- **Giai đoạn MVP (Hiện tại – 4 Sprint):** Ứng dụng hoạt động độc lập (Offline-first / lưu dữ liệu cục bộ trên thiết bị), không yêu cầu đăng nhập, miễn phí 100% và không quảng cáo để tối đa hóa trải nghiệm người dùng đầu tiên. MVP chỉ ghi **khoản chi**, không ghi khoản thu. Thu nhập hằng tháng được thể hiện qua ngân sách tháng.
- **Hướng mở rộng tương lai (Post-MVP):**
  - Tích hợp gợi ý voucher/ưu đãi ăn uống, nhà sách dành riêng cho sinh viên quanh khu vực trường đại học.
  - Xuất báo cáo chi tiêu định kỳ và tính năng chia tiền phòng trọ cho nhóm sinh viên ở ghép.

## 3. Bảng Giả định Cần Kiểm chứng (Assumptions & Validation)

| Giả định (Assumption) | Phương pháp kiểm chứng | Tiêu chí thành công (Success Metric) | Trạng thái hiện tại |
| :--- | :--- | :--- | :--- |
| **A1** (PP-04): Nhiều sinh viên thật sự bị hết tiền trước cuối tháng. | Khảo sát online Google Form (`n = 50` SV). | ≥ 60% sinh viên xác nhận. | **Đã đạt:** 68% (34/50) xác nhận. |
| **A2** (PP-02, PP-05): Sinh viên thích app tối giản, không quảng cáo hơn app nhiều tính năng. | Khảo sát & Phỏng vấn sâu 5–8 sinh viên. | Đa số nêu quảng cáo/rườm rà là lý do bỏ app cũ. | **Đạt (khảo sát):** 64% nêu ngại nhập/rườm rà, 42% nêu giao diện rối/quảng cáo (mẫu số `[CẦN ĐỐI CHIẾU]`, xem `02 §4`). **Phỏng vấn sâu:** chưa có biên bản. |
| **A3** (PP-03, PP-05): Con số *"Tiền được tiêu hôm nay"* dễ hiểu và hữu ích hơn biểu đồ. | Test giao diện mẫu với 5 sinh viên. | ≥ 4/5 sinh viên hiểu ngay ý nghĩa trong 5 giây. | Đang triển khai cuối Sprint 0 |
| **A4** (PP-02): Sinh viên chịu ghi chép hằng ngày nếu thao tác dưới 5 giây. | Dữ liệu sử dụng 7 ngày (30/11 – 06/12/2026) của SV dùng thử bản MVP (mục tiêu ≥ 20 SV, tối thiểu 5 SV). | ≥ 60% SV dùng thử ghi chép đủ 7 ngày liên tục (tương đương ≥ 3/5 nếu chỉ có 5 SV). | Kiểm chứng ở Sprint 3 |
