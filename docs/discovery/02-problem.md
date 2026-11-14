# 02. Problem Statement & Bằng chứng Nghiên cứu

## 1. Tuyên bố vấn đề (Problem Statement)
> **Sinh viên đại học (18–22 tuổi) sống xa nhà hoặc ở trọ, lần đầu tự quản lý khoản tiền cố định hằng tháng, thường xuyên không kiểm soát được dòng tiền đã chi đi đâu và ngại sử dụng các ứng dụng ghi chép rườm rà — dẫn đến tình trạng "cháy túi" trước cuối tháng, phải vay mượn bạn bè và chịu áp lực tâm lý ảnh hưởng trực tiếp đến việc học.**

## 2. Phân tích 3 lớp của vấn đề
- **Đối tượng chịu tác động (Who):** Sinh viên 18–22 tuổi đang học đại học (khảo sát thực tế tại Đà Nẵng / VKU và sinh viên sống xa nhà), nhận trợ cấp từ gia đình hoặc lương làm thêm theo tháng.
- **Bối cảnh & Nguyên nhân gốc rễ (Context & Root Cause):**
  - Khoản chi của sinh viên diễn ra lắt nhắt nhiều lần trong ngày (ăn sáng, gửi xe, cà phê, tài liệu, chuyển khoản QR) với giá trị nhỏ nhưng cộng dồn lớn.
  - Sinh viên thiếu kỹ năng lập kế hoạch ngân sách theo ngày/tháng.
  - Các ứng dụng quản lý tài chính hiện nay quá nhiều tính năng phức tạp, thao tác nhập một khoản chi mất nhiều bước và chứa quảng cáo khiến sinh viên bỏ cuộc chỉ sau vài ngày.
- **Hậu quả (Consequences):** Hết tiền vào tuần thứ 3 hoặc tuần thứ 4 trong tháng, phải ăn uống kham khổ, vay mượn bạn bè hoặc xin thêm gia đình, gây căng thẳng kéo dài.

## 3. Bằng chứng từ Nghiên cứu Thứ cấp (Secondary Research)
Theo nghiên cứu của **Nguyễn Thị Hoài Lê (2023)** (*"Kiến thức tài chính của sinh viên Việt Nam: Thực trạng và các vấn đề đặt ra"*, Tạp chí Khoa học & Đào tạo Ngân hàng, số 254) khảo sát trên **4.140 sinh viên** tại các trường đại học trên cả nước:
- Điểm trung bình phần kiến thức tài chính căn bản chỉ đạt **3,63 / 8 điểm**.
- **Lập kế hoạch tài chính cá nhân** là nội dung có tỷ lệ trả lời đúng thấp nhất trong toàn bộ 11 câu hỏi khảo sát: chỉ **26,6%** sinh viên trả lời đúng.
- Có tới **33,2%** sinh viên chọn phương án *"Tôi không biết"* ở câu hỏi về lập kế hoạch tài chính cá nhân.
- **Kết luận rút ra:** Sinh viên không thiếu công cụ tính toán phức tạp, mà đang thiếu một công cụ trực quan giúp **lập kế hoạch và giới hạn mức chi tiêu hằng ngày**.

## 4. Bằng chứng từ Khảo sát Thực tế của Nhóm (`n = 50` sinh viên)
Nhóm đã triển khai khảo sát trực tuyến qua Google Form thu về **50 phản hồi hợp lệ** từ sinh viên đại học (chủ yếu năm 1 – năm 3, mức chi tiêu phổ biến từ 2–5 triệu đồng/tháng):
- **68% (34/50 sinh viên)** xác nhận đã từng rơi vào tình trạng **hết tiền trước cuối tháng** (thường xuyên hoặc thỉnh thoảng).
- **Chỉ 24% (12/50 sinh viên)** hiện đang duy trì thói quen ghi chép chi tiêu hằng ngày; 76% còn lại không ghi chép hoặc chỉ ước lượng trong đầu.
- **58% (29/50 sinh viên)** cho biết đã **từng tải app quản lý chi tiêu nhưng sau đó xóa hoặc bỏ dở**.
- **Lý do bỏ app đứng #1 (64%):** *"Ngại nhập liệu mất thời gian / Hay quên ghi vì thao tác rườm rà"*, xếp thứ hai là *"Giao diện rối, nhiều tính năng không dùng tới và có quảng cáo"* (42%).
  > `[CẦN ĐỐI CHIẾU]` Chưa rõ mẫu số của 64% và 42%. Nếu mẫu số là 29 người từng bỏ app thì 64% ứng với 18,56 người và 42% ứng với 12,18 người (không hợp lệ). Nếu mẫu số là 50 người thì ứng với 32/50 và 21/50. Nhóm User Research cần đối chiếu Google Sheet, rồi ghi lại dạng `x/n` tại đây và trong `docs/research/survey-n50.md`.
- **Thời gian nhập liệu kỳ vọng:** **82% (41/50 sinh viên)** mong muốn việc ghi lại một khoản chi chỉ mất **dưới 10 giây** và cần một con số rõ ràng cho biết *hôm nay còn được tiêu bao nhiêu*. Dựa trên số liệu này, nhóm đặt mục tiêu thiết kế chặt hơn: **dưới 5 giây** (xem `05 §1`).
