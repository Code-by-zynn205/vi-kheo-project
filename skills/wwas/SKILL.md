---
name: wwas
description: "Tạo các product backlog items theo định dạng Why-What-Acceptance — các hạng mục độc lập, có giá trị, kiểm thử được và có bối cảnh chiến lược. Dùng khi viết backlog items có cấu trúc, phân rã tính năng thành các work items, hoặc sử dụng định dạng WWA."
---
# Why-What-Acceptance (WWA)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [phuryn/pm-skills](https://github.com/phuryn/pm-skills/blob/main/pm-execution/skills/wwas/SKILL.md) (phuryn).

Tạo các product backlog items theo định dạng Why-What-Acceptance. Tạo ra các hạng mục độc lập, có giá trị, có thể kiểm thử và gắn với bối cảnh chiến lược.

**Sử dụng khi:** Viết backlog items, tạo các phần tăng trưởng sản phẩm (product increments), phân rã tính năng thành các work items, hoặc truyền đạt ý định chiến lược tới đội ngũ.

**Tham số đầu vào:**
- `$PRODUCT`: Tên sản phẩm hoặc hệ thống
- `$FEATURE`: Tính năng hoặc năng lực mới
- `$DESIGN`: Liên kết tới tệp thiết kế (Figma, Miro, v.v.)
- `$ASSUMPTIONS`: Các giả định chính và bối cảnh chiến lược

## Quy trình từng bước

1. **Xác định Why mang tính chiến lược** - Kết nối công việc với mục tiêu kinh doanh và mục tiêu đội ngũ
2. **Mô tả What** - Giữ mô tả ngắn gọn, tham chiếu tới thiết kế
3. **Viết Tiêu chí nghiệm thu (Acceptance Criteria)** - Ở mức tổng quan (high-level), không phải đặc tả chi tiết từng li từng tí
4. **Đảm bảo tính độc lập** - Các hạng mục có thể được phát triển theo bất kỳ thứ tự nào
5. **Giữ tính có thể thương lượng** - Gợi mở thảo luận trong đội ngũ, không áp đặt ràng buộc cứng nhắc
6. **Tạo hạng mục có giá trị** - Mỗi hạng mục mang lại giá trị đo lường được cho người dùng hoặc doanh nghiệp
7. **Đảm bảo khả năng kiểm thử** - Các kết quả quan sát được và xác minh được
8. **Ước lượng kích thước phù hợp** - Đủ nhỏ để ước lượng và hoàn thành trong một sprint

## Mẫu Hạng mục (Item Template)

**Tiêu đề (Title):** [Những gì sẽ được bàn giao]

**Tại sao (Why):** [1–2 câu kết nối với bối cảnh chiến lược và mục tiêu đội ngũ]

**Cái gì (What):** [Mô tả ngắn và liên kết thiết kế. Tối đa 1–2 đoạn. Là lời nhắc về cuộc thảo luận, không phải bản đặc tả chi tiết.]

**Tiêu chí nghiệm thu (Acceptance Criteria):**
- [Kết quả quan sát được 1]
- [Kết quả quan sát được 2]
- [Kết quả quan sát được 3]
- [Kết quả quan sát được 4]

## Ví dụ Hạng mục WWA

**Tiêu đề (Title):** Triển khai Trình theo dõi Chi tiêu Thời gian thực

**Tại sao (Why):** Người dùng cần phản hồi tức thì về mức chi tiêu để đưa ra quyết định ngân sách có ý thức. Điều này trực tiếp hỗ trợ mục tiêu nâng cao nhận thức tài chính và giảm tình trạng chi tiêu quá tay.

**Cái gì (What):** Bổ sung trình theo dõi chi tiêu thời gian thực, tự động cập nhật ngay khi người dùng ghi nhận khoản chi. Trình theo dõi hiển thị tổng chi tiêu tuần hiện tại so với ngân sách đã đặt. Thiết kế có sẵn tại [Figma link]. Đây là điểm gợi nhắc cho các cuộc thảo luận của chúng ta — đặc tả chi tiết sẽ được làm rõ trong các buổi trao đổi phát triển cùng đội ngũ.

**Tiêu chí nghiệm thu (Acceptance Criteria):**
- Tổng chi tiêu cập nhật trong vòng 2 giây sau khi ghi nhận một khoản chi
- Tiến độ ngân sách được hiển thị trực quan bằng một thanh tiến trình (progress bar)
- Người dùng có thể nhìn thấy ngay số ngân sách còn lại trong nháy mắt
- Hệ thống xử lý chính xác nhiều danh mục chi tiêu khác nhau

## Kết quả đầu ra (Output Deliverables)

- Bộ backlog items hoàn chỉnh cho tính năng
- Mỗi hạng mục bao gồm các phần Why, What và Acceptance Criteria
- Các hạng mục độc lập với nhau và có thể bàn giao theo bất kỳ thứ tự nào
- Các hạng mục có kích thước phù hợp để ước lượng và hoàn thành trong một sprint
- Bối cảnh chiến lược rõ ràng giúp đội ngũ dễ dàng ra quyết định
- Bao gồm các tham chiếu thiết kế để hướng dẫn triển khai

---

### Tài liệu đọc thêm

- [How to Write User Stories: The Ultimate Guide](https://www.productcompass.pm/p/how-to-write-user-stories)
