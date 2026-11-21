---
name: research-synthesis
description: Tổng hợp dữ liệu nghiên cứu người dùng thành các chủ đề (themes), insight và khuyến nghị hành động. Sử dụng khi bạn có bản ghi phỏng vấn, kết quả khảo sát, ghi chú kiểm thử khả năng sử dụng (usability test), ticket hỗ trợ hoặc phản hồi NPS cần chắt lọc thành các mô thức (patterns), phân khúc người dùng và các bước tiếp theo theo thứ tự ưu tiên.
argument-hint: "<dữ liệu nghiên cứu, bản ghi phỏng vấn hoặc kết quả khảo sát>"
---

# /research-synthesis

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/design/skills/research-synthesis/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Tổng hợp dữ liệu nghiên cứu người dùng thành các insight có thể hành động. Xem thêm skill **user-research** để biết các phương pháp nghiên cứu, hướng dẫn phỏng vấn và khung phân tích.

## Cách dùng

```
/research-synthesis $ARGUMENTS
```

## Dữ liệu đầu vào được hỗ trợ

- Bản ghi (transcript) hoặc ghi chú phỏng vấn
- Kết quả khảo sát (CSV, dữ liệu dán trực tiếp)
- Bản ghi hoặc ghi chú kiểm thử khả năng sử dụng (usability test)
- Ticket hỗ trợ hoặc phản hồi người dùng
- Phản hồi NPS/CSAT
- Đánh giá trên kho ứng dụng (App Store / Google Play)

## Đầu ra (Output)

```markdown
## Tổng hợp nghiên cứu (Research Synthesis): [Tên nghiên cứu]
**Phương pháp:** [Phỏng vấn / Khảo sát / Usability Test] | **Số người tham gia:** [X]
**Thời gian:** [Khoảng ngày] | **Người nghiên cứu:** [Tên]

### Tóm tắt điều hành (Executive Summary)
[Tổng quan 3-4 câu về các phát hiện chính]

### Các chủ đề chính (Key Themes)

#### Chủ đề 1: [Tên chủ đề]
**Mức độ phổ biến:** [X trên Y người tham gia]
**Tóm tắt:** [Chủ đề này nói về điều gì]
**Bằng chứng hỗ trợ:**
- "[Trích dẫn]" — P[X]
- "[Trích dẫn]" — P[X]
**Hàm ý:** [Điều này có ý nghĩa gì đối với sản phẩm]

#### Chủ đề 2: [Tên chủ đề]
[Theo cùng định dạng]

### Insight → Cơ hội (Opportunities)

| Insight | Cơ hội | Tác động (Impact) | Nỗ lực (Effort) |
|---------|--------|-------------------|-----------------|
| [Điều chúng ta học được] | [Điều chúng ta có thể làm] | Cao/TB/Thấp | Cao/TB/Thấp |

### Các phân khúc người dùng được nhận diện
| Phân khúc | Đặc điểm | Nhu cầu | Quy mô |
|-----------|----------|---------|--------|
| [Tên] | [Mô tả] | [Nhu cầu chính] | [Khoảng %] |

### Khuyến nghị
1. **[Ưu tiên cao]** — [Lý do, dựa trên các phát hiện nào]
2. **[Ưu tiên trung bình]** — [Lý do]
3. **[Ưu tiên thấp hơn]** — [Lý do]

### Câu hỏi cần nghiên cứu thêm
- [Những điều chúng ta vẫn chưa biết]

### Ghi chú phương pháp luận
[Cách nghiên cứu được tiến hành, mọi giới hạn hoặc thiên lệch (bias) cần lưu ý]
```

## Khi có Connector khả dụng

Nếu **~~user feedback** đã được kết nối:
- Kéo thêm ticket hỗ trợ, yêu cầu tính năng và phản hồi NPS để bổ sung dữ liệu nghiên cứu
- Đối chiếu chéo các chủ đề với khiếu nại và yêu cầu thực tế của người dùng

Nếu **~~product analytics** đã được kết nối:
- Kiểm chứng các phát hiện định tính bằng dữ liệu sử dụng và chỉ số hành vi
- Định lượng mức độ tác động của các điểm nghẽn (pain points) đã xác định

Nếu **~~knowledge base** đã được kết nối:
- Tìm kiếm các nghiên cứu và phát hiện trước đây để so sánh đối chiếu
- Xuất bản bản tổng hợp lên kho lưu trữ nghiên cứu của nhóm

## Mẹo thực hành

1. **Đưa vào trích dẫn nguyên văn** — Câu nói trực tiếp từ người tham gia giúp insight thuyết phục và dễ nhớ hơn.
2. **Tách biệt quan sát và diễn giải** — "5 trên 8 người dùng bấm nhầm nút" là quan sát. "Vị trí đặt nút gây nhầm lẫn" là diễn giải.
3. **Định lượng bất cứ khi nào có thể** — "Hầu hết người dùng" là mơ hồ. "7 trên 10 người dùng" là cụ thể.
