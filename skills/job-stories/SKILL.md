---
name: job-stories
description: "Tạo job stories theo định dạng 'When [situation], I want to [motivation], so I can [outcome]' (Khi [tình huống], tôi muốn [động lực], để tôi có thể [kết quả]) kèm tiêu chí nghiệm thu chi tiết. Dùng khi viết job stories, tạo backlog items theo phong cách JTBD, hoặc diễn đạt tình huống và động lực của người dùng."
---
# Job Stories

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [phuryn/pm-skills](https://github.com/phuryn/pm-skills/blob/main/pm-execution/skills/job-stories/SKILL.md) (phuryn).

Tạo job stories theo định dạng 'When [situation], I want to [motivation], so I can [outcome]' (Khi [tình huống], tôi muốn [động lực], để tôi có thể [kết quả]). Sinh ra các story kèm tiêu chí nghiệm thu chi tiết tập trung vào tình huống và kết quả của người dùng.

**Sử dụng khi:** Viết job stories, diễn đạt tình huống và động lực của người dùng, tạo backlog items theo phong cách JTBD, hoặc tập trung vào ngữ cảnh người dùng thay vì vai trò (roles).

**Tham số đầu vào:**
- `$PRODUCT`: Tên sản phẩm hoặc hệ thống
- `$FEATURE`: Tính năng mới cần phân rã thành các job stories
- `$DESIGN`: Liên kết tới tệp thiết kế (Figma, Miro, v.v.)
- `$CONTEXT`: Các tình huống người dùng hoặc kịch bản công việc (job scenarios)

## Quy trình từng bước

1. **Xác định các tình huống người dùng** làm phát sinh nhu cầu
2. **Định nghĩa các động lực** ẩn sau hành vi của người dùng
3. **Làm rõ các kết quả** mà người dùng muốn đạt được
4. **Áp dụng khung JTBD:** Tập trung vào công việc cần hoàn thành (job), không phải vai trò (role)
5. **Tạo tiêu chí nghiệm thu** để xác thực rằng kết quả đã đạt được
6. **Sử dụng ngôn ngữ quan sát được và đo lường được**
7. **Gắn liên kết tới bản thiết kế (mockups)** hoặc nguyên mẫu (prototypes)
8. **Xuất các job stories** kèm tiêu chí nghiệm thu chi tiết

## Mẫu Story (Story Template)

**Tiêu đề (Title):** [Kết quả công việc]

**Mô tả (Description):** Khi [tình huống], tôi muốn [động lực], để tôi có thể [kết quả]. (When [situation], I want to [motivation], so I can [outcome].)

**Thiết kế (Design):** [Liên kết tới tệp thiết kế]

**Tiêu chí nghiệm thu (Acceptance Criteria):**
1. [Tình huống được nhận diện đúng]
2. [Hệ thống đáp ứng được động lực mong muốn]
3. [Tiến độ hoặc phản hồi hiển thị rõ ràng]
4. [Kết quả đạt được một cách hiệu quả]
5. [Các trường hợp biên (edge cases) được xử lý mượt mà]
6. [Tích hợp và thông báo hoạt động đúng]

## Ví dụ Job Story

**Tiêu đề (Title):** Theo dõi chi tiêu đồ ăn vặt hằng tuần

**Mô tả (Description):** Khi tôi đang chuẩn bị ngân sách ăn vặt hằng tuần (tình huống), tôi muốn xem nhanh mình đã tiêu bao nhiêu cho đến lúc này (động lực), để tôi có thể đảm bảo mình không hết tiền trước cuối tuần (kết quả).

**Thiết kế (Design):** [Figma link]

**Tiêu chí nghiệm thu (Acceptance Criteria):**
1. Hiển thị Bản tóm tắt Chi tiêu với mục 'Tổng quan Chi tiêu Hằng tuần' (Weekly Spending Overview)
2. Cập nhật theo thời gian thực khi một khoản chi được ghi nhận
3. Thanh chỉ báo tiến độ (thanh tiến trình hiển thị 0–100% ngân sách tuần)
4. Làm nổi bật Ngân sách còn lại bằng màu sắc dễ nhận biết
5. Nhật ký chi tiêu chi tiết có phân tách theo danh mục
6. Gửi thông báo tại ngưỡng 80% ngân sách
7. Nhắc nhở riêng cho cuối tuần ở ngưỡng 90% vào tối thứ Năm
8. Truy cập và điều hướng dễ dàng tới bảng phân tích chi tiết

## Kết quả đầu ra (Output Deliverables)

- Bộ job stories hoàn chỉnh cho tính năng
- Mỗi story tuân theo định dạng 'When...I want...so I can' (Khi...tôi muốn...để tôi có thể)
- 6–8 tiêu chí nghiệm thu tập trung vào kết quả (outcomes)
- Các story nhấn mạnh vào tình huống và động lực của người dùng
- Liên kết rõ ràng tới thiết kế và nguyên mẫu

---

### Tài liệu đọc thêm

- [Jobs-to-be-Done Masterclass with Tony Ulwick and Sabeen Sattar](https://www.productcompass.pm/p/jobs-to-be-done-masterclass-with) (khóa học video)
