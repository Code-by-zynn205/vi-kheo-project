# 06. Customer Journey, Câu hỏi HMW & Generate Features

## 1. Bản đồ Hành trình Chi tiêu của Sinh viên (Customer Journey Map)

| Giai đoạn | 1. Nhận tiền đầu tháng | 2. Chi tiêu lắt nhắt hằng ngày | 3. Muốn ghi chép lại | 4. Tuần thứ 3–4 cuối tháng |
| :--- | :--- | :--- | :--- | :--- |
| **Hành động** | Nhận tiền gia đình / lương làm thêm; ước lượng nhẩm trong đầu. | Mua đồ ăn, gửi xe, quét QR liên tục các khoản nhỏ 5k–30k. | Mở app tài chính hiện có để nhập khoản vừa tiêu. | Kiểm tra số dư tài khoản ngân hàng / ví tiền mặt. |
| **Cảm xúc** | Hào hứng, thoải mái (😊) | Vô tư, không để ý tổng tiền đã tiêu (😐) | Khó chịu vì app load chậm, nhiều bước, dính quảng cáo (😤) | Hoang mang, hụt hẫng vì sắp hết tiền (😰) |
| **Điểm đau** | Không chia ngân sách tháng thành hạn mức ngày cụ thể. | Tổng các khoản nhỏ cộng lại rất lớn nhưng không nhớ. | Bỏ cuộc giữa chừng, ngừng ghi chép sau 2–3 ngày. | Phải vay bạn bè hoặc cắt giảm ăn uống cuối tháng. |
| **Cơ hội của Ví Khéo** | Cho phép nhập tổng ngân sách tháng chỉ với 1 bước. | Hiển thị ngay số tiền còn được tiêu trong ngày. | Thiết kế màn hình nhập liệu mở lên là gõ số tiền ngay (< 5s). | Cảnh báo sớm khi mức tiêu vượt ngưỡng an toàn. |

---

## 2. Câu hỏi "Làm thế nào để...?" (How Might We – HMW)
Từ các điểm đau trên, nhóm đặt ra 3 câu hỏi HMW trọng tâm:
1. **HMW1:** Làm thế nào để sinh viên ghi lại một khoản chi **nhanh đến mức không thấy phiền** (dưới 5 giây)?
2. **HMW2:** Làm thế nào để sinh viên **luôn biết ngay hôm nay mình còn được tiêu bao nhiêu** mà không cần tự cộng trừ?
3. **HMW3:** Làm thế nào để nhắc nhở sinh viên duy trì thói quen ghi chép mỗi tối một cách nhẹ nhàng, không gây khó chịu?

---

## 3. Generate Features & Phân loại Phạm vi MVP (MoSCoW)
Từ 3 câu hỏi HMW trên, nhóm đề xuất **14 tính năng** và sàng lọc theo nguyên tắc **MoSCoW** để đảm bảo hoàn thành trong 3 Sprint:

### Must-Have (Bắt buộc có trong MVP – Giải quyết trực tiếp HMW1 & HMW2)
1. **Ghi khoản chi/thu siêu tốc (`US01`):** Mở app là hiện sẵn ô nhập số tiền và bàn phím số; chỉ cần chọn danh mục là lưu.
2. **Bộ danh mục chuẩn cho sinh viên (`US01`):** 6 danh mục trực quan (Ăn uống, Di chuyển, Nhà trọ, Tài liệu, Mua sắm, Khác).
3. **Đặt ngân sách tháng (`US02`):** Nhập tổng số tiền dự kiến chi tiêu trong tháng.
4. **Tính toán "Hôm nay còn được tiêu" (`US03`):** Tự động lấy ngân sách còn lại chia cho số ngày còn lại trong tháng, đổi màu cảnh báo trực quan.
5. **Báo cáo chi tiêu theo danh mục (`US04`):** Biểu đồ tròn và danh sách xếp hạng nhóm chi tiêu tốn tiền nhất.

### Should-Have (Nên có nếu kịp tiến độ Sprint 3 – Giải quyết HMW3)
6. **Nhắc nhở ghi chép buổi tối (`US05`):** Thông báo nhẹ lúc 21:00 hằng ngày (*"Hôm nay bạn có khoản chi nào chưa ghi không?"*).
7. **Sửa / Xóa giao dịch:** Cho phép chỉnh sửa nhanh khi nhập nhầm số tiền.
8. **Xem lịch sử giao dịch theo ngày:** Tra cứu lại các khoản đã tiêu của những ngày trước.

### Could-Have (Có thì tốt – Dành cho phiên bản mở rộng)
9. Chia tiền phòng trọ / đi chơi nhóm.
10. Chuỗi ngày ghi chép liên tục (Streak) tạo động lực.
11. Giao diện tối (Dark Mode).

### Won't-Have (Loại bỏ khỏi phạm vi để tránh "AI Slop" & phình to dự án)
12. Liên kết trực tiếp tài khoản ngân hàng (phức tạp bảo mật, không kịp 3 Sprint).
13. AI quét hóa đơn (OCR) – sinh viên chủ yếu ăn quán bình dân/gửi xe không có hóa đơn giấy.
14. Quản lý danh mục đầu tư, chứng khoán, vay nợ phức tạp.

---

## 4. Product Backlog Ban đầu (Initial User Stories)

| ID | User Story | Liên kết HMW | Độ ưu tiên | Story Points |
| :--- | :--- | :--- | :--- | :---: |
| **US01** | Là sinh viên, tôi muốn ghi một khoản chi chỉ bằng số tiền và chọn danh mục để hoàn tất trong dưới 5 giây. | HMW1 | Cao (Must) | 3 |
| **US02** | Là sinh viên, tôi muốn đặt ngân sách tổng cho cả tháng để xác định giới hạn chi tiêu của bản thân. | HMW2 | Cao (Must) | 2 |
| **US03** | Là sinh viên, tôi muốn nhìn thấy ngay số tiền còn được tiêu hôm nay trên màn hình chính để không tiêu quá tay. | HMW2 | Cao (Must) | 3 |
| **US04** | Là sinh viên, tôi muốn xem báo cáo chi tiêu theo từng danh mục để biết tiền của mình đi đâu nhiều nhất. | HMW2 | Trung bình (Must) | 5 |
| **US05** | Là sinh viên, tôi muốn nhận thông báo nhắc ghi chép mỗi tối để không bị quên các khoản chi trong ngày. | HMW3 | Trung bình (Should) | 2 |
