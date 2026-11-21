---
name: design-critique
description: Nhận phản hồi thiết kế có cấu trúc về tính khả dụng (usability), phân cấp thị giác (hierarchy) và tính nhất quán (consistency). Kích hoạt với các yêu cầu như "review this design", "critique this mockup", "what do you think of this screen?", "nhận xét thiết kế này", hoặc khi chia sẻ liên kết Figma hay ảnh chụp màn hình để lấy góp ý ở bất kỳ giai đoạn nào từ khám phá ý tưởng đến hoàn thiện cuối cùng.
argument-hint: "<URL Figma, ảnh chụp màn hình hoặc mô tả>"
---

# /design-critique

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/design/skills/design-critique/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Nhận phản hồi thiết kế có cấu trúc trên nhiều khía cạnh.

## Cách dùng

```
/design-critique $ARGUMENTS
```

Đánh giá thiết kế: @$1

Nếu có URL Figma được cung cấp, hãy lấy thiết kế từ Figma. Nếu có tệp được tham chiếu, hãy đọc tệp đó. Nếu không, hãy yêu cầu người dùng mô tả hoặc chia sẻ thiết kế của họ.

## Thông tin tôi cần từ bạn

- **Thiết kế**: URL Figma, ảnh chụp màn hình hoặc mô tả chi tiết
- **Ngữ cảnh**: Đây là màn hình/tính năng gì? Dành cho ai? Đang ở giai đoạn nào (khám phá, tinh chỉnh, hoàn thiện)?
- **Trọng tâm** (tùy chọn): Ví dụ "Tập trung vào mobile" hoặc "Tập trung vào luồng onboarding"

## Khung đánh giá thiết kế (Critique Framework)

### 1. Ấn tượng đầu tiên (2 giây)
- Điều gì thu hút ánh nhìn đầu tiên? Điều đó đã đúng trọng tâm chưa?
- Cảm xúc gợi lên là gì?
- Mục đích của màn hình có rõ ràng ngay lập tức không?

### 2. Tính khả dụng (Usability)
- Người dùng có thể hoàn thành mục tiêu của họ không?
- Điều hướng có trực quan không?
- Các phần tử tương tác có dễ nhận biết không?
- Có bước nào dư thừa không?

### 3. Phân cấp thị giác (Visual Hierarchy)
- Có thứ tự đọc rõ ràng không?
- Các thành phần quan trọng có được nhấn mạnh đúng mức không?
- Khoảng trắng (whitespace) có được sử dụng hiệu quả không?
- Kiểu chữ (typography) có tạo ra hệ thống phân cấp phù hợp không?

### 4. Tính nhất quán (Consistency)
- Thiết kế có tuân thủ design system không?
- Khoảng cách, màu sắc và typography có đồng nhất không?
- Các thành phần tương tự có hành vi giống nhau không?

### 5. Khả năng tiếp cận (Accessibility)
- Tỷ lệ tương phản màu sắc
- Kích thước vùng chạm (touch target)
- Khả năng đọc của văn bản
- Văn bản thay thế (alt text) cho hình ảnh

## Cách đưa ra phản hồi

- **Cụ thể**: Nói "Nút CTA đang cạnh tranh sự chú ý với thanh điều hướng" thay vì "bố cục rối"
- **Giải thích lý do**: Gắn phản hồi với nguyên lý thiết kế hoặc nhu cầu người dùng
- **Đề xuất giải pháp**: Không chỉ chỉ ra vấn đề, hãy gợi ý hướng khắc phục
- **Ghi nhận điểm tốt**: Phản hồi chất lượng luôn bao gồm cả những nhận xét tích cực
- **Phù hợp giai đoạn**: Giai đoạn khám phá ban đầu cần góc nhìn khác với giai đoạn tinh chỉnh cuối cùng

## Đầu ra (Output)

```markdown
## Đánh giá thiết kế (Design Critique): [Tên thiết kế]

### Ấn tượng tổng quan
[1-2 câu phản hồi đầu tiên — điểm làm tốt và cơ hội cải thiện lớn nhất]

### Tính khả dụng (Usability)
| Phát hiện | Mức độ | Khuyến nghị |
|-----------|--------|-------------|
| [Vấn đề] | 🔴 Nghiêm trọng / 🟡 Trung bình / 🟢 Nhỏ | [Cách khắc phục] |

### Phân cấp thị giác (Visual Hierarchy)
- **Điểm thu hút ánh nhìn đầu tiên**: [Thành phần] — [Đã hợp lý chưa?]
- **Luồng đọc**: [Ánh mắt di chuyển qua bố cục như thế nào?]
- **Điểm nhấn**: [Các yếu tố quan trọng đã được nhấn mạnh đúng chưa?]

### Tính nhất quán (Consistency)
| Thành phần | Vấn đề | Khuyến nghị |
|------------|--------|-------------|
| [Typography/spacing/color] | [Điểm chưa nhất quán] | [Cách khắc phục] |

### Khả năng tiếp cận (Accessibility)
- **Tương phản màu**: [Đạt/chưa đạt cho các đoạn văn bản chính]
- **Vùng chạm (Touch targets)**: [Kích thước đã đủ lớn chưa?]
- **Độ dễ đọc của chữ**: [Cỡ chữ, chiều cao dòng]

### Điểm làm tốt
- [Nhận xét tích cực 1]
- [Nhận xét tích cực 2]

### Khuyến nghị ưu tiên
1. **[Thay đổi tác động lớn nhất]** — [Tại sao và làm thế nào]
2. **[Ưu tiên thứ hai]** — [Tại sao và làm thế nào]
3. **[Ưu tiên thứ ba]** — [Tại sao và làm thế nào]
```

## Khi có Connector khả dụng

Nếu **~~design tool** đã được kết nối:
- Lấy trực tiếp thiết kế từ Figma để kiểm tra các component, token và layer
- Đối chiếu với design system hiện có để đảm bảo tính nhất quán

Nếu **~~user feedback** đã được kết nối:
- Đối chiếu chéo các quyết định thiết kế với phản hồi người dùng và ticket hỗ trợ gần đây

## Mẹo thực hành

1. **Chia sẻ ngữ cảnh** — "Đây là luồng thanh toán cho B2B SaaS" giúp tôi đưa ra nhận xét sát thực tế hơn.
2. **Nêu rõ giai đoạn** — Giai đoạn khám phá ý tưởng cần góp ý khác với giai đoạn hoàn thiện chi tiết.
3. **Yêu cầu tập trung nếu cần** — "Chỉ xem giúp phần điều hướng" sẽ giúp nhận được phân tích sâu hơn vào một khu vực cụ thể.
