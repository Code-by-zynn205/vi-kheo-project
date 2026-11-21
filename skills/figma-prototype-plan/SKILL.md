---
name: figma-prototype-plan
description: "Lập kế hoạch tương tác và luồng cho prototype phục vụ kiểm thử người dùng (user testing) trong Figma. Sử dụng khi được yêu cầu lên kế hoạch prototype Figma, thiết lập tương tác prototype, xác định phần nào cần làm prototype cho bài kiểm thử người dùng hoặc chuẩn bị prototype Figma cho kiểm thử khả năng sử dụng (usability testing). Tạo ra phạm vi prototype, đặc tả tương tác, kịch bản tác vụ kiểm thử và hướng dẫn thiết lập Figma."
---

# Skill: Lập kế hoạch Prototype Figma (Figma Prototype Plan)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-prototype-plan/SKILL.md) (mohitagw15856).

Lên kế hoạch những gì cần làm prototype trong Figma và cách thực hiện — khoanh vùng đúng theo nhu cầu kiểm thử người dùng, định nghĩa từng tương tác và thiết lập các kịch bản kiểm thử. Tránh việc dựng thừa thãi (over-building) và đảm bảo prototype trả lời đúng câu hỏi nghiên cứu.

## Đầu vào Bắt buộc

- **Câu hỏi nghiên cứu** (bạn đang cố gắng tìm hiểu điều gì?)
- **Tính năng hoặc luồng cần làm prototype**
- **Độ chi tiết của prototype** (wireframe thấp / có chức năng mức trung bình / sắc nét từng pixel ở mức cao)
- **Phương pháp kiểm thử** (có người điều phối trực tiếp / có người điều phối từ xa / không có người điều phối)
- **Số lượng tác vụ kiểm thử (test tasks)**

## Cấu trúc Đầu ra

### 1. Phạm vi Prototype (Prototype Scope)

**Trong phạm vi (In scope):** [Các luồng có tương tác thật — liệt kê cụ thể từng màn hình]
**Ngoài phạm vi (Out of scope):** [Các màn hình chỉ hiển thị dạng tĩnh — không đáng công dựng tương tác]
**Lý do (Rationale):** Prototype chỉ nên ở mức tối thiểu cần thiết để kiểm chứng giả thuyết.

### 2. Đặc tả Tương tác (Interaction Specification)

**Tương tác N: [Mô tả]**
- Kích hoạt (Trigger): Tap/Swipe/Hover/Form submit
- Phần tử (Element): [Tên layer trong Figma]
- Đích đến (Destination): [Tên frame trong Figma]
- Hiệu ứng chuyển (Animation): Instant/Dissolve/Push left/Push right/Slide up
- Thời gian (Timing): [ms]
- Đặt lại sau khi chạy (Reset after): Có/Không (Yes/No)

### 3. Sơ đồ Luồng Prototype (Prototype Flow Diagram)

```
[Start frame]
  -> Tap "Action"
[Next frame]
  -> Tap "Complete" -> [Success frame]
  -> Tap "Cancel"   -> [Back to start]
```

### 4. Kịch bản Tác vụ Kiểm thử (Test Task Scripts)

**Tác vụ N: [Tiêu đề]**

Tình huống (đọc cho người tham gia):
"[Tình huống thực tế cung cấp bối cảnh mà không chỉ đường nhấp chuột]"

Điểm cần quan sát (Observing):
- [Những gì cần theo dõi]

Thành công khi: [Tín hiệu kích hoạt cụ thể]

### 5. Hướng dẫn Thiết lập Figma (Figma Setup Guide)
- Frame bắt đầu (Starting frame): [Tên]
- Thiết bị xem trước (Device preview): [Thiết bị]
- Cài đặt Prototype: màu nền, hiển thị khung thiết bị, loại prototype
- Chia sẻ: Liên kết chỉ xem (Can view link), quy trình đặt lại (reset) giữa các người tham gia

### 6. Bảng Phân định Làm thật vs Giả lập (Build vs Fake Table)

| Phần tử | Làm thật (Build) | Giả lập (Fake) | Ghi chú |
|---|---|---|---|
| Luồng CTA chính | Có | | Trọng tâm nghiên cứu |
| Thanh điều hướng phụ | | Có | Không nằm trong phạm vi test |
| Trạng thái lỗi | Có | | Kiểm thử khả năng khôi phục lỗi |

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Phạm vi giới hạn đúng theo những gì câu hỏi nghiên cứu yêu cầu
- [ ] Mọi tương tác đều có tên frame đích cụ thể
- [ ] Kịch bản tác vụ viết theo tình huống thực tế (không phải kiểu "bấm vào nút X")
- [ ] Có tiêu chí thành công rõ ràng cho từng tác vụ
- [ ] Đã định nghĩa quy trình đặt lại (reset) giữa các lượt người tham gia

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không làm prototype cho mọi thứ — phạm vi phải giới hạn ở những tương tác giúp trả lời đúng các câu hỏi nghiên cứu cụ thể
- [ ] Không thiết kế luồng prototype mà thiếu kịch bản tác vụ kiểm thử đi kèm — cả hai phải khớp hoàn toàn với nhau
- [ ] Không bỏ qua quy trình reset giữa các người tham gia — trạng thái prototype chưa đặt lại sẽ làm sai lệch kết quả kiểm thử
- [ ] Không lên kế hoạch prototype mà thiếu phân định rõ tương tác nào bấm được và phần nào để tĩnh — sự mơ hồ gây phình phạm vi (scope creep)
- [ ] Không khoanh vùng prototype khi chưa xác định rõ các câu hỏi nghiên cứu cần giải đáp

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Plan the Figma prototype for our user test on [feature]"
- "What interactions do I need to build for this prototype?"
- "Help me set up a Figma prototype for [research question]"
- "Write the test task scripts for our [feature] prototype"
- "What should I prototype vs leave as static screens?"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-prototype-plan.html
