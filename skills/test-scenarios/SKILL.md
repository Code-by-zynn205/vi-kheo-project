---
name: test-scenarios
description: "Tạo các kịch bản kiểm thử (test scenarios) toàn diện từ user stories kèm mục tiêu kiểm thử, điều kiện bắt đầu, vai trò người dùng, các bước hành động chi tiết và kết quả kỳ vọng. Dùng khi viết QA test cases, lập test plans, định nghĩa acceptance tests, hoặc chuẩn bị kiểm chứng tính năng."
---
# Kịch bản kiểm thử (Test Scenarios)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [phuryn/pm-skills](https://github.com/phuryn/pm-skills/blob/main/pm-execution/skills/test-scenarios/SKILL.md) (phuryn).

Tạo các kịch bản kiểm thử toàn diện từ user stories với mục tiêu kiểm thử, điều kiện bắt đầu, vai trò người dùng, các bước kiểm thử chi tiết và kết quả kỳ vọng.

**Sử dụng khi:** Viết QA test cases, tạo test plans, định nghĩa các kịch bản acceptance test, hoặc kiểm chứng quá trình triển khai user story.

**Tham số đầu vào:**
- `$PRODUCT`: Tên sản phẩm hoặc hệ thống
- `$USER_STORY`: User story cần kiểm thử (tiêu đề và tiêu chí nghiệm thu)
- `$CONTEXT`: Bối cảnh kiểm thử hoặc các ràng buộc bổ sung

## Quy trình từng bước

1. **Rà soát user story** và các tiêu chí nghiệm thu
2. **Định nghĩa mục tiêu kiểm thử** - Hành vi cụ thể nào cần được xác thực
3. **Thiết lập điều kiện bắt đầu** - Trạng thái hệ thống, dữ liệu thiết lập, cấu hình
4. **Xác định vai trò người dùng** - Ai thực hiện các hành động kiểm thử
5. **Tạo các bước kiểm thử** - Phân rã các tương tác theo từng bước
6. **Định nghĩa kết quả kỳ vọng** - Kết quả quan sát được sau mỗi bước
7. **Xem xét các trường hợp biên (edge cases)** - Đầu vào không hợp lệ, điều kiện giới hạn
8. **Xuất các kịch bản kiểm thử chi tiết** - Sẵn sàng cho đội ngũ QA thực thi

## Mẫu Kịch bản (Scenario Template)

**Kịch bản kiểm thử (Test Scenario):** [Tên kịch bản rõ ràng]

**Mục tiêu kiểm thử (Test Objective):** [Bài kiểm thử này xác thực điều gì]

**Điều kiện bắt đầu (Starting Conditions):**
- [Trạng thái hệ thống yêu cầu]
- [Dữ liệu hoặc cấu hình cần thiết]
- [Thiết lập người dùng hoặc quyền hạn]

**Vai trò người dùng (User Role):** [Ai thực hiện kiểm thử]

**Các bước kiểm thử (Test Steps):**
1. [Hành động thứ nhất và kết quả kỳ vọng của nó]
2. [Hành động thứ hai và kết quả quan sát được]
3. [Hành động thứ ba và hành vi của hệ thống]
4. [Hành động hoàn tất và trạng thái cuối cùng]

**Kết quả kỳ vọng (Expected Outcomes):**
- [Kết quả quan sát được 1]
- [Kết quả quan sát được 2]
- [Kết quả quan sát được 3]

## Ví dụ Kịch bản kiểm thử

**Kịch bản kiểm thử (Test Scenario):** Xem các sản phẩm đã xem gần đây trên Trang sản phẩm

**Mục tiêu kiểm thử (Test Objective):** Xác minh rằng mục 'Đã xem gần đây' hiển thị chính xác và loại trừ sản phẩm hiện tại.

**Điều kiện bắt đầu (Starting Conditions):**
- Người dùng đã đăng nhập hoặc có bật lịch sử trình duyệt
- Người dùng đã xem ít nhất 2 sản phẩm trong phiên làm việc hiện tại
- Người dùng hiện đang ở một trang sản phẩm khác với các mặt hàng đã xem trước đó

**Vai trò người dùng (User Role):** Người mua sắm trực tuyến (Online Shopper)

**Các bước kiểm thử (Test Steps):**
1. Điều hướng tới bất kỳ trang sản phẩm nào → Mục này phải xuất hiện ở phía dưới cùng với các mặt hàng đã xem trước đó
2. Cuộn xuống cuối trang → Mục "Đã xem gần đây" hiển thị kèm các thẻ sản phẩm
3. Kiểm tra ảnh thu nhỏ của sản phẩm → Hình ảnh, tiêu đề và giá được hiển thị chính xác
4. Kiểm tra sản phẩm hiện tại → Sản phẩm hiện tại KHÔNG nằm trong danh sách đã xem gần đây
5. Nhấp vào một thẻ sản phẩm → Người dùng được điều hướng tới trang sản phẩm tương ứng

**Kết quả kỳ vọng (Expected Outcomes):**
- Mục Đã xem gần đây chỉ xuất hiện sau khi đã xem ít nhất 1 sản phẩm trước đó
- Mục hiển thị 4–8 thẻ sản phẩm với thông tin đầy đủ
- Sản phẩm hiện tại bị loại trừ khỏi danh sách
- Mỗi thẻ hiển thị dấu thời gian "Đã xem X phút/giờ trước"
- Nhấp vào thẻ sẽ điều hướng tới đúng trang sản phẩm
- Hiệu năng: Mục tải xong trong vòng 2 giây

## Kết quả đầu ra (Output Deliverables)

- Các kịch bản kiểm thử toàn diện cho từng tiêu chí nghiệm thu
- Mục tiêu kiểm thử rõ ràng bám sát ý định của user story
- Các bước hành động kiểm thử chi tiết từng bước
- Kết quả kỳ vọng quan sát được sau mỗi bước
- Bao phủ các trường hợp biên và kịch bản lỗi
- Sẵn sàng để đội ngũ QA thực thi và lưu tài liệu
