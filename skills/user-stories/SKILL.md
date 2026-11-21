---
name: user-stories
description: "Tạo user stories theo mô hình 3 C's (Card, Conversation, Confirmation) và tiêu chí INVEST kèm phần mô tả, liên kết thiết kế và tiêu chí nghiệm thu (acceptance criteria). Dùng khi viết user stories, phân rã tính năng thành các backlog items, hoặc định nghĩa tiêu chí nghiệm thu."
---
# User Stories

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [phuryn/pm-skills](https://github.com/phuryn/pm-skills/blob/main/pm-execution/skills/user-stories/SKILL.md) (phuryn).

Tạo user stories theo mô hình 3 C's (Card, Conversation, Confirmation) và tiêu chí INVEST. Sinh ra các story kèm mô tả, liên kết thiết kế và tiêu chí nghiệm thu.

**Sử dụng khi:** Viết user stories, phân rã tính năng thành các story, tạo các backlog items, hoặc định nghĩa tiêu chí nghiệm thu (acceptance criteria).

**Tham số đầu vào:**
- `$PRODUCT`: Tên sản phẩm hoặc hệ thống
- `$FEATURE`: Tính năng mới cần phân rã thành các story
- `$DESIGN`: Liên kết tới tệp thiết kế (Figma, Miro, v.v.)
- `$ASSUMPTIONS`: Các giả định chính hoặc bối cảnh

## Quy trình từng bước

1. **Phân tích tính năng** dựa trên thiết kế và bối cảnh được cung cấp
2. **Xác định các vai trò người dùng** và các hành trình người dùng riêng biệt
3. **Áp dụng khung 3 C's:**
   - Card: Tiêu đề đơn giản và mô tả ngắn một dòng
   - Conversation: Thảo luận chi tiết về ý định và mục đích
   - Confirmation: Tiêu chí nghiệm thu rõ ràng
4. **Tuân thủ tiêu chí INVEST:** Independent (Độc lập), Negotiable (Có thể thương lượng), Valuable (Có giá trị), Estimable (Có thể ước lượng), Small (Nhỏ gọn), Testable (Có thể kiểm thử)
5. **Sử dụng ngôn ngữ đơn giản** mà một học sinh tốt nghiệp tiểu học có thể hiểu
6. **Gắn liên kết tới tệp thiết kế** để đối chiếu trực quan
7. **Xuất các user stories** theo định dạng có cấu trúc

## Mẫu Story (Story Template)

**Tiêu đề (Title):** [Tên tính năng]

**Mô tả (Description):** Là một [vai trò người dùng], tôi muốn [hành động], để [lợi ích].

**Thiết kế (Design):** [Liên kết tới tệp thiết kế]

**Tiêu chí nghiệm thu (Acceptance Criteria):**
1. [Tiêu chí rõ ràng, kiểm thử được]
2. [Hành vi quan sát được]
3. [Hệ thống kiểm tra hợp lệ đúng cách]
4. [Xử lý các trường hợp biên (edge cases)]
5. [Lưu ý về hiệu năng hoặc khả năng tiếp cận (accessibility)]
6. [Điểm tích hợp]

## Ví dụ User Story

**Tiêu đề (Title):** Mục Đã xem gần đây (Recently Viewed Section)

**Mô tả (Description):** Là một Người mua sắm trực tuyến (Online Shopper), tôi muốn thấy mục 'Đã xem gần đây' trên trang sản phẩm để dễ dàng xem lại các mặt hàng tôi đã cân nhắc.

**Thiết kế (Design):** [Figma link]

**Tiêu chí nghiệm thu (Acceptance Criteria):**
1. Mục 'Đã xem gần đây' được hiển thị ở cuối trang sản phẩm đối với mọi người dùng đã xem ít nhất 1 sản phẩm trước đó.
2. Mục này không hiển thị đối với người dùng truy cập trang sản phẩm đầu tiên trong phiên làm việc của họ.
3. Chính sản phẩm hiện tại được loại trừ khỏi danh sách các mặt hàng hiển thị.
4. Mục này hiển thị thẻ sản phẩm (product cards) hoặc ảnh thu nhỏ kèm hình ảnh, tiêu đề và giá.
5. Mỗi thẻ sản phẩm cho biết thời điểm nó được xem (ví dụ: 'Đã xem 5 phút trước').
6. Nhấp vào một thẻ sản phẩm sẽ dẫn người dùng tới trang sản phẩm tương ứng.

## Kết quả đầu ra (Output Deliverables)

- Bộ user stories hoàn chỉnh cho tính năng
- Mỗi story bao gồm tiêu đề, mô tả, liên kết thiết kế và 4–6 tiêu chí nghiệm thu
- Các story độc lập với nhau và có thể phát triển theo bất kỳ thứ tự nào
- Các story có kích thước phù hợp để hoàn thành trong một chu kỳ sprint
- Các story tham chiếu tới tài liệu thiết kế liên quan

---

### Tài liệu đọc thêm

- [How to Write User Stories: The Ultimate Guide](https://www.productcompass.pm/p/how-to-write-user-stories)
