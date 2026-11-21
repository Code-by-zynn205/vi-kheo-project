---
name: figma-variant-matrix
description: "Định nghĩa các biến thể (variants) và trạng thái (states) của component một cách có hệ thống cho Figma. Sử dụng khi được yêu cầu lập kế hoạch biến thể component, định nghĩa các trạng thái cho một component, thiết lập ma trận biến thể Figma hoặc xác định các thuộc tính (properties) mà component cần có trước khi dựng. Tạo ra ma trận biến thể hoàn chỉnh với đầy đủ thuộc tính, giá trị và các tổ hợp cần thiết."
---

# Skill: Ma trận Biến thể Figma (Figma Variant Matrix)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-variant-matrix/SKILL.md) (mohitagw15856).

Định nghĩa toàn bộ biến thể, thuộc tính và trạng thái mà một component cần trước khi dựng trong Figma — ngăn chặn tình trạng phát hiện thiếu biến thể khi component đó đã được dùng rải rác trên 40 màn hình.

## Đầu vào Bắt buộc

- **Tên component** (Button, Card, Input, Badge, Navigation item, v.v.)
- **Mục đích component** (nó làm gì, được sử dụng ở đâu?)
- **Nền tảng** (iOS / Android / Web / Đa nền tảng)
- **Bối cảnh design system** (độc lập / một phần của hệ thống sẵn có)

## Cấu trúc Đầu ra

### 1. Tổng quan Component (Component Overview)
Tên, danh mục (Interactive/Display/Layout/Form/Navigation/Feedback), các ngữ cảnh sử dụng.

### 2. Thuộc tính Biến thể (Variant Properties)

| Thuộc tính (Property) | Các giá trị (Values) | Ghi chú |
|---|---|---|
| Type | Primary, Secondary, Tertiary, Destructive | |
| Size | Large, Medium, Small | |
| State | Default, Hover, Active, Disabled, Loading | |
| Icon | None, Leading, Trailing, Only | |

Tổng số tổ hợp: [N]. Gắn cờ cảnh báo nếu vượt quá 50 — cân nhắc tách thành nhiều component riêng.

### 3. Định nghĩa Trạng thái (State Definitions)

Với mỗi trạng thái, chỉ liệt kê những điểm thay đổi so với Default:
- Default: [Đặc tả trực quan đầy đủ]
- Hover (web): [Phần thay đổi (delta) so với default]
- Active/Pressed: [Phần thay đổi]
- Disabled: [Phần thay đổi — dùng thuộc tính cấp layer (layer-level properties), không dùng opacity lên toàn bộ component]
- Loading: [Thành phần nào thay thế nhãn chữ, có cho phép tương tác khi đang tải không?]
- Error (forms): [Màu viền, chữ hướng dẫn (helper text), các thay đổi của icon]

### 4. Phân rã Cấu trúc (Anatomy Breakdown)

| Tên layer | Mục đích | Bắt buộc? | Ghi chú |
|---|---|---|---|
| container | Nền và khung bao | Có | |
| label | Văn bản | Có điều kiện | Ẩn khi ở dạng chỉ có icon (icon-only) |
| icon-leading | Vị trí icon đầu | Không | |

### 5. Ánh xạ Token (Token Mapping)

| Thuộc tính (Property) | Token | Giá trị dự phòng (Fallback) |
|---|---|---|
| Background default | color.brand.primary | #hex |
| Border radius | radius.medium | 8px |

### 6. Thứ tự Xây dựng (Build Order)
1. Trạng thái Default, biến thể phổ biến nhất
2. Chuyển đổi thành component, thêm các properties
3. Các biến thể kích thước (Size variants)
4. Các biến thể trạng thái (State variants)
5. Các biến thể loại (Type variants)
6. Các biến thể vị trí icon (Icon slot variants) làm sau cùng

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Đã định nghĩa đủ các trạng thái tương tác
- [ ] Đã tính tổng số biến thể, gắn cờ cảnh báo nếu vượt quá 50
- [ ] Mọi layer đều được đặt tên có ngữ nghĩa
- [ ] Bảng ánh xạ token bao phủ toàn bộ thuộc tính trực quan
- [ ] Trạng thái disabled sử dụng thuộc tính cấp layer, không dùng opacity

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không tạo ma trận biến thể với các thuộc tính chồng chéo hoặc xung đột nhau — mỗi thuộc tính phải biến thiên độc lập
- [ ] Không dùng opacity cho trạng thái disabled — trạng thái disabled phải dùng thuộc tính cấp layer (layer-level properties), không dùng opacity
- [ ] Không liệt kê mọi tổ hợp toán học nếu có nhiều tổ hợp vô nghĩa — chỉ tài liệu hóa các tổ hợp hợp lệ và có thể dựng được
- [ ] Không định nghĩa biến thể mà bỏ qua hành vi đáp ứng (responsive behaviour) — hãy chỉ rõ thuộc tính nào thay đổi theo kích thước màn hình
- [ ] Không xuất ma trận mà thiếu hướng dẫn triển khai trong Figma — quy ước đặt tên biến thể phải tuân theo hệ thống property của Figma

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Define the variants for a [component] in Figma"
- "What states does my [component] need?"
- "Help me plan the variant matrix for [component]"
- "Set up the Figma properties for a [button/card/input]"
- "What are all the combinations I need for my [component]?"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-variant-matrix.html
