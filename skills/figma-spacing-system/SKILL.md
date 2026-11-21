---
name: figma-spacing-system
description: "Thiết kế hệ thống token khoảng cách (spacing) và bố cục (layout) cho một design system trên Figma. Sử dụng khi được yêu cầu tạo hệ thống spacing, định nghĩa layout tokens, thiết lập hệ thống lưới (grid system), xây dựng thang đo khoảng cách (spacing scale) hoặc thiết lập nền tảng bố cục cho file Figma. Tạo ra thang spacing hoàn chỉnh, định nghĩa grid, quy ước khoảng cách cho component và hướng dẫn triển khai trong Figma."
---

# Skill: Hệ thống Khoảng cách Figma (Figma Spacing System)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-spacing-system/SKILL.md) (mohitagw15856).

Tạo ra hệ thống token khoảng cách (spacing) và bố cục (layout) hoàn chỉnh — nền tảng giúp design system giữ được tính nhất quán và quá trình bàn giao cho lập trình viên không còn mơ hồ.

## Đầu vào Bắt buộc

- **Nền tảng** (iOS / Android / Web / Đa nền tảng)
- **Đơn vị cơ sở (Base unit)** (4px / 8px — mặc định là 8px)
- **Tên Design system** (để đặt tên token)
- **Mật độ component (Component density)** (chặt - compact / tiêu chuẩn - standard / thoáng - comfortable)
- **Yêu cầu lưới (Grid requirements)** (hoặc "suy xuất theo chuẩn nền tảng")

## Cấu trúc Đầu ra

### 1. Đơn vị Cơ sở (Base Unit)
[4px hoặc 8px] kèm lý giải. Mọi giá trị đều phải là bội số của đơn vị này.

### 2. Thang đo Khoảng cách (Spacing Scale)

| Token | Giá trị | Trường hợp sử dụng |
|---|---|---|
| spacing.none | 0px | Chủ đích loại bỏ khoảng trống |
| spacing.xs | 4/8px | Padding cho icon, nhãn sát nhau |
| spacing.sm | 8/12px | Padding nội bộ component dạng chặt |
| spacing.md | 12/16px | Padding nội bộ component tiêu chuẩn |
| spacing.lg | 16/24px | Padding phân vùng (section), bên trong card |
| spacing.xl | 24/32px | Khoảng cách giữa các component |
| spacing.2xl | 32/48px | Tách biệt các section |
| spacing.3xl | 48/64px | Khoảng ngắt cấp độ trang |
| spacing.4xl | 64/96px | Khu vực Hero (Hero sections) |

### 3. Lưới Bố cục (Layout Grid)

Mobile (375px): 4 cột, lề (margin) [giá trị], rãnh (gutter) [giá trị]
Tablet (768px): 8 cột, lề (margin) [giá trị], rãnh (gutter) [giá trị]
Desktop (1440px): 12 cột, lề (margin) [giá trị], rãnh (gutter) [giá trị], chiều rộng nội dung tối đa (max content width) [giá trị]

### 4. Quy ước Khoảng cách Component (Component Spacing Conventions)

| Ngữ cảnh | Token | Ví dụ |
|---|---|---|
| Padding ngang nút bấm (Button) | spacing.md | Trái/phải |
| Padding dọc nút bấm (Button) | spacing.sm | Trên/dưới |
| Padding bên trong Card | spacing.lg | Cả 4 cạnh |
| Padding ô nhập liệu (Input) | spacing.sm dọc, spacing.md ngang | |
| Khoảng cách giữa icon và nhãn | spacing.xs | |
| Khoảng cách giữa các section | spacing.xl | |

### 5. Triển khai trong Figma (Figma Implementation)
1. Tạo trang `SPACING` để tài liệu hóa trực quan từng token
2. Vào `Resources > Variables` > tạo bộ sưu tập kiểu Number đặt tên là `Spacing`
3. Gắn các biến (variables) vào giá trị padding/gap trong `Auto Layout`
4. Chia sẻ tên token nguyên bản cho kỹ sư hoặc đồng bộ qua Tokens Studio

### 6. Các Lỗi Cần Tránh Trong Thiết kế (Anti-Patterns to Avoid)
- Dùng giá trị nằm ngoài thang đo (như 13px, 22px) — phải làm tròn về token gần nhất
- Dùng giá trị pixel tuyệt đối trong component thay vì token
- Trộn lẫn cả hai đơn vị cơ sở 4px và 8px trong cùng một sản phẩm

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Mọi giá trị token đều là bội số của đơn vị cơ sở
- [ ] Thang đo bao phủ từ `xs` đến `4xl`
- [ ] Đã định nghĩa lưới (grid) cho tất cả các breakpoints liên quan
- [ ] Quy ước component bao phủ các quyết định phổ biến
- [ ] Đã bao gồm các bước triển khai trong Figma

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không tạo thang khoảng cách với các giá trị tùy tiện — thang đo phải tuân theo tỷ lệ toán học nhất quán (ví dụ: hệ cơ sở 4px, hệ 8-4-2)
- [ ] Không định nghĩa spacing tokens mà thiếu hướng dẫn triển khai trong Figma — chỉ có tên token thôi là chưa thể áp dụng ngay
- [ ] Không tạo hệ thống spacing bỏ qua quy ước cấp độ component — cả token toàn cục và cách dùng trong component đều phải được tài liệu hóa
- [ ] Không bỏ qua định nghĩa lưới (grid) — spacing mà không có hệ thống grid là bộ tài liệu nền tảng bố cục chưa hoàn chỉnh
- [ ] Không tạo hệ thống spacing phớt lờ hành vi đáp ứng (responsive behaviour) — cần định nghĩa rõ cách khoảng cách thích ứng qua các breakpoints

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Create a spacing system for our Figma design system"
- "Define our spacing tokens for Figma"
- "Set up a grid and spacing scale for [product]"
- "What spacing values should we use in our design system?"
- "Help me build the layout foundation for our Figma file"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-spacing-system.html
