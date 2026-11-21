---
name: figma-annotation-guide
description: "Tạo bộ chú thích bàn giao cho lập trình viên (developer handoff annotations) có cấu trúc cho một màn hình hoặc component Figma. Sử dụng khi được yêu cầu viết chú thích Figma, tạo ghi chú bàn giao cho dev (dev handoff notes), tài liệu hóa thiết kế Figma cho kỹ sư, hoặc viết đặc tả (specs) cho một màn hình. Tạo ra bộ chú thích đầy đủ bao gồm tương tác, trạng thái, khoảng cách, khả năng tiếp cận (accessibility) và các trường hợp biên (edge cases)."
---

# Skill: Hướng dẫn Chú thích Figma (Figma Annotation Guide)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-annotation-guide/SKILL.md) (mohitagw15856).

Tạo ra bộ chú thích bàn giao lập trình viên (developer handoff annotations) hoàn chỉnh cho một màn hình hoặc component Figma — những ghi chú biến thiết kế trực quan thành đặc tả có thể triển khai code.

## Đầu vào Bắt buộc

- **Mô tả màn hình hoặc component** (mô tả hoặc tóm tắt những gì đã được thiết kế)
- **Nền tảng** (iOS / Android / Web / React Native)
- **Loại tương tác** (tĩnh / có tương tác / có hiệu ứng chuyển động / biểu mẫu)
- **Đối tượng lập trình viên tiếp nhận** (mobile / frontend / full-stack)


## Công cụ Hỗ trợ Tự động (Programmatic Helper)

Độ tương phản (contrast ratio) không thể ước lượng bằng mắt thường. Ngưỡng chuẩn AA nằm ở mức 4.5:1, và màu `#777777` trên nền trắng đạt 4.478 (không đạt) trong khi `#767676` đạt 4.54 (đạt) — nhìn ảnh chụp màn hình không thể nào phân biệt được hai mức này. Hãy tính toán chính xác bằng lệnh:

```bash
npx --yes notugly fix "#8ab4f8" "#ffffff"     # ratio, APCA, and the nearest passing colour
npx --yes notugly onepager <url> --out review.html   # every pairing, printable
npx --yes notugly vision                      # which colours merge for colour-blind viewers
```

Lệnh `notugly fix` trả về tỷ lệ tương phản, độ tương phản sáng APCA và màu gần nhất với màu đã chọn mà đạt chuẩn — giữ nguyên sắc độ (hue) và độ bão hòa (chroma). Hãy dán các con số đó vào các bảng bên dưới thay vì tự ước lượng.

Công cụ mang tính tất định, không có dependency ngoài và **không gọi model AI** — do đó không tốn chi phí khi chạy và luôn cho ra cùng một kết quả mỗi lần.

Chú thích về độ tương phản cần ghi rõ tỷ lệ đã tính và mức mục tiêu, ví dụ: "4.52:1 — đạt chuẩn AA cho văn bản nội dung (body text)". Một chú thích chỉ ghi "kiểm tra tương phản" là một đầu việc, không phải chú thích kỹ thuật.

## Cấu trúc Đầu ra

### 1. Tổng quan Màn hình/Component
Tên, mục đích, điểm vào (entry points), điểm thoát (exit points).

### 2. Chú thích Tương tác (Interaction Annotations)

**[Tên phần tử]**
- Trạng thái mặc định (Default state): [Mô tả trực quan]
- Khi chạm/nhấp (On tap/click): [Hành động chính xác — gọi API, thay đổi trạng thái, điều hướng]
- Trạng thái đang tải (Loading state): [Mô tả]
- Trạng thái thành công (Success state): [Điều gì xảy ra sau đó]
- Trạng thái lỗi (Error state): [Lỗi hiển thị thế nào và các lựa chọn cho người dùng]
- Điều kiện vô hiệu hóa (Disabled condition): [Khi nào và tại sao]

### 3. Danh mục Trạng thái (State Inventory)

| Phần tử | Các trạng thái bắt buộc |
|---|---|
| [Phần tử] | Default, Hover, Active, Disabled, Loading, Error, Empty |

Cảnh báo các thiết kế còn thiếu: "Cảnh báo: Chưa thiết kế trạng thái Error — cần bổ sung trước khi build"

### 4. Ghi chú Khoảng cách và Bố cục (Spacing and Layout Notes)
Các phần tử cố định (fixed) so với co giãn (fluid), hành vi cuộn (scroll behaviour), breakpoints, safe areas.

### 5. Quy tắc Nội dung và Văn bản (Content and Copy Rules)
Giới hạn ký tự, nội dung động (dynamic) so với tĩnh (static), quy tắc cắt ngắn chuỗi (truncation), trạng thái trống (empty states).

### 6. Chú thích Khả năng Tiếp cận (Accessibility Annotations)
Vùng chạm (touch targets), nhãn trình đọc màn hình (screen reader labels), thứ tự focus (focus order), độ tương phản màu (colour contrast), tùy chọn chuyển động (motion preferences).

### 7. Trường hợp Biên và Câu hỏi cho Lập trình viên
- [ ] [Câu hỏi chưa giải quyết cần gắn cờ cho lập trình viên]

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Mọi phần tử tương tác đều đã được định nghĩa đầy đủ các trạng thái
- [ ] Danh mục trạng thái gắn cờ rõ các thiết kế còn thiếu
- [ ] Khả năng tiếp cận bao gồm vùng chạm và nhãn trình đọc màn hình
- [ ] Đã đặc tả rõ các trạng thái trống (empty states)
- [ ] Các trường hợp biên được liệt kê dưới dạng câu hỏi có thể hành động

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không chỉ chú thích luồng thuận lợi (happy path) — trạng thái lỗi, đang tải và trống đều phải được tài liệu hóa đầy đủ
- [ ] Không dùng mô tả khoảng cách mơ hồ như "thêm chút padding" — phải chỉ rõ giá trị pixel chính xác hoặc tên token
- [ ] Không bỏ qua chú thích khả năng tiếp cận — thứ tự focus, ARIA labels và tỷ lệ tương phản màu bắt buộc phải có
- [ ] Không để trống mô tả hành vi tương tác — mọi phần tử có tương tác đều cần tài liệu hóa phản hồi cụ thể
- [ ] Không xuất chú thích thiếu trường hợp biên — lập trình viên cần biết điều gì xảy ra ở các ngưỡng giới hạn

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Write dev annotations for this Figma screen"
- "Create developer handoff notes for [screen/component]"
- "Document this design for the engineering team"
- "Write the Figma spec for [feature]"
- "What should I annotate before handing off this design?"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-annotation-guide.html
