---
name: ux-copy
description: Viết hoặc rà soát UX copy — microcopy, thông báo lỗi, trạng thái rỗng (empty states), CTA. Kích hoạt với các yêu cầu như "write copy for", "what should this button say?", "review this error message", "viết UX copy cho", hoặc khi đặt tên nút CTA, viết hộp thoại xác nhận (confirmation dialog), điền nội dung cho empty state hay viết văn bản onboarding.
argument-hint: "<ngữ cảnh hoặc nội dung copy cần rà soát>"
---

# /ux-copy

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/design/skills/ux-copy/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Viết hoặc rà soát UX copy cho mọi ngữ cảnh giao diện.

## Cách dùng

```
/ux-copy $ARGUMENTS
```

## Thông tin tôi cần từ bạn

- **Ngữ cảnh**: Màn hình, luồng hoặc tính năng nào?
- **Trạng thái người dùng**: Người dùng đang cố làm gì? Họ đang cảm thấy thế nào?
- **Giọng văn (Tone)**: Trang trọng, thân thiện, vui tươi hay trấn an?
- **Ràng buộc**: Giới hạn ký tự, hướng dẫn của nền tảng (platform guidelines)?

## Nguyên tắc

1. **Rõ ràng**: Nói chính xác điều bạn muốn truyền đạt. Không dùng biệt ngữ, không gây mơ hồ.
2. **Súc tích**: Dùng ít từ nhất nhưng vẫn truyền tải trọn vẹn ý nghĩa.
3. **Nhất quán**: Dùng cùng một thuật ngữ cho cùng một khái niệm ở mọi nơi.
4. **Hữu ích**: Mọi từ ngữ đều phải giúp người dùng đạt được mục tiêu của họ.
5. **Tự nhiên như con người**: Viết như một người hỗ trợ tận tâm, không phải như một cỗ máy.

## Các mẫu UX Copy (Copy Patterns)

### Nút kêu gọi hành động (CTAs)
- Bắt đầu bằng động từ: "Dùng thử miễn phí", "Lưu thay đổi", "Tải báo cáo"
- Cụ thể: "Tạo tài khoản" thay vì "Gửi" (Submit)
- Khớp nhãn nút với kết quả thực tế xảy ra

### Thông báo lỗi (Error Messages)
Cấu trúc: Chuyện gì đã xảy ra + Tại sao + Cách khắc phục
- "Thanh toán bị từ chối. Thẻ của bạn đã bị ngân hàng từ chối. Hãy thử thẻ khác hoặc liên hệ ngân hàng của bạn."

### Trạng thái rỗng (Empty States)
Cấu trúc: Đây là khu vực gì + Tại sao đang trống + Cách bắt đầu
- "Chưa có dự án nào. Hãy tạo dự án đầu tiên để bắt đầu cộng tác cùng đội nhóm của bạn."

### Hộp thoại xác nhận (Confirmation Dialogs)
- Nêu rõ hành động: "Xóa 3 tệp?" thay vì "Bạn có chắc chắn không?"
- Mô tả hệ quả: "Hành động này không thể hoàn tác"
- Đặt nhãn nút theo đúng hành động: "Xóa tệp" / "Giữ lại tệp" thay vì "OK" / "Hủy"

### Tooltips
- Ngắn gọn, hữu ích, không bao giờ nói điều hiển nhiên

### Trạng thái đang tải (Loading States)
- Định hình kỳ vọng, giảm bớt sự lo lắng chờ đợi

### Onboarding
- Hé lộ thông tin từng bước (progressive disclosure), mỗi lần chỉ giới thiệu một khái niệm

## Giọng văn và Sắc thái (Voice and Tone)

Điều chỉnh sắc thái theo ngữ cảnh:
- **Thành công (Success)**: Chúc mừng nhưng không quá đà
- **Lỗi (Error)**: Đồng cảm và sẵn sàng hỗ trợ
- **Cảnh báo (Warning)**: Rõ ràng và có hướng xử lý cụ thể
- **Trung tính (Neutral)**: Đầy đủ thông tin và súc tích

## Đầu ra (Output)

```markdown
## UX Copy: [Ngữ cảnh]

### Copy đề xuất
**[Thành phần]**: [Nội dung copy]

### Các phương án thay thế
| Phương án | Nội dung copy | Giọng văn | Phù hợp nhất khi |
|-----------|---------------|-----------|------------------|
| A | [Copy] | [Tone] | [Khi nào nên dùng] |
| B | [Copy] | [Tone] | [Khi nào nên dùng] |
| C | [Copy] | [Tone] | [Khi nào nên dùng] |

### Lý giải
[Tại sao copy này hiệu quả — ngữ cảnh người dùng, độ rõ ràng, định hướng hành động]

### Ghi chú bản địa hóa (Localization Notes)
[Những điều người dịch cần lưu ý — thành ngữ cần tránh, độ giãn ký tự, bối cảnh văn hóa]
```

## Khi có Connector khả dụng

Nếu **~~knowledge base** đã được kết nối:
- Lấy tài liệu hướng dẫn giọng điệu thương hiệu (brand voice) và quy chuẩn nội dung (content style guide)
- Kiểm tra các mẫu copy và bộ thuật ngữ chuẩn hiện có

Nếu **~~design tool** đã được kết nối:
- Xem ngữ cảnh màn hình trong Figma để hiểu toàn bộ luồng người dùng
- Kiểm tra giới hạn ký tự và ràng buộc bố cục từ thiết kế

## Mẹo thực hành

1. **Cụ thể về ngữ cảnh** — "Thông báo lỗi khi thanh toán thất bại" tốt hơn nhiều so với chỉ nói "thông báo lỗi".
2. **Chia sẻ giọng điệu thương hiệu** — "Chúng tôi chuyên nghiệp nhưng ấm áp" giúp tôi điều chỉnh đúng sắc thái của bạn.
3. **Cân nhắc trạng thái cảm xúc của người dùng** — Thông báo lỗi cần sự đồng cảm. Thông báo thành công có thể mang tính chúc mừng.
