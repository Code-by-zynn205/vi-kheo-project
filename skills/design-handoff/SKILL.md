---
name: design-handoff
description: Tạo tài liệu đặc tả bàn giao lập trình viên (developer handoff specs) từ một thiết kế. Sử dụng khi thiết kế đã sẵn sàng chuyển sang đội ngũ kỹ thuật và cần một spec sheet đầy đủ về bố cục (layout), design tokens, component props, trạng thái tương tác, breakpoint responsive, các trường hợp biên (edge cases) và chi tiết animation.
argument-hint: "<URL Figma hoặc mô tả thiết kế>"
---

# /design-handoff

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/design/skills/design-handoff/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Tạo tài liệu bàn giao toàn diện cho lập trình viên từ một thiết kế.

## Cách dùng

```
/design-handoff $ARGUMENTS
```

Tạo tài liệu spec bàn giao cho: @$1

Nếu có URL Figma được cung cấp, hãy lấy thiết kế từ Figma. Nếu không, hãy làm việc dựa trên mô tả hoặc ảnh chụp màn hình được cung cấp.

## Nội dung cần có

### Đặc tả trực quan (Visual Specifications)
- Thông số kích thước chính xác (padding, margin, chiều rộng)
- Tham chiếu design token (màu sắc, typography, khoảng cách)
- Các breakpoint responsive và hành vi tương ứng
- Các biến thể (variants) và trạng thái của component

### Đặc tả tương tác (Interaction Specifications)
- Hành vi khi nhấp/chạm (click/tap)
- Trạng thái hover
- Hiệu ứng chuyển cảnh và animation (thời lượng duration, đường cong easing)
- Hỗ trợ cử chỉ (vuốt swipe, chụm pinch, nhấn giữ long-press)

### Đặc tả nội dung (Content Specifications)
- Giới hạn ký tự
- Hành vi cắt gọn chữ (truncation)
- Trạng thái rỗng (empty states)
- Trạng thái đang tải (loading states)
- Trạng thái lỗi (error states)

### Trường hợp biên (Edge Cases)
- Nội dung tối thiểu/tối đa
- Văn bản đa ngôn ngữ (chuỗi ký tự dài hơn)
- Kết nối mạng chậm
- Thiếu dữ liệu

### Khả năng tiếp cận (Accessibility)
- Thứ tự focus (focus order)
- Nhãn và vai trò ARIA (ARIA labels & roles)
- Tương tác bàn phím
- Thông báo cho trình đọc màn hình (screen reader)

## Nguyên tắc

1. **Không phỏng đoán** — Nếu không được quy định rõ, lập trình viên sẽ tự đoán. Hãy đặc tả mọi thứ.
2. **Dùng token, không dùng giá trị cứng** — Tham chiếu `spacing-md` thay vì `16px`.
3. **Thể hiện đủ mọi trạng thái** — Default, hover, active, disabled, loading, error, empty.
4. **Giải thích lý do (why)** — "Phần này thu gọn trên mobile vì người dùng chủ yếu thao tác một tay" giúp lập trình viên đưa ra quyết định xử lý chính xác.

## Đầu ra (Output)

```markdown
## Spec bàn giao (Handoff Spec): [Tên tính năng/Màn hình]

### Tổng quan
[Màn hình/tính năng này làm gì, ngữ cảnh người dùng]

### Bố cục (Layout)
[Hệ thống lưới grid, breakpoints, hành vi responsive]

### Design Tokens sử dụng
| Token | Giá trị | Mục đích sử dụng |
|-------|---------|------------------|
| `color-primary` | #[hex] | Nút CTA, liên kết |
| `spacing-md` | [X]px | Khoảng cách giữa các phần |
| `font-heading-lg` | [size/weight/family] | Tiêu đề trang |

### Components
| Component | Variant | Props | Ghi chú |
|-----------|---------|-------|---------|
| [Component] | [Variant] | [Props] | [Hành vi đặc biệt] |

### Trạng thái và Tương tác
| Thành phần | Trạng thái | Hành vi |
|------------|------------|---------|
| [Nút CTA] | Hover | [Nền tối hơn 10%] |
| [Nút CTA] | Loading | [Hiển thị spinner, vô hiệu hóa nút] |
| [Form] | Error | [Viền đỏ, hiển thị thông báo lỗi bên dưới] |

### Hành vi Responsive
| Breakpoint | Thay đổi |
|------------|----------|
| Desktop (>1024px) | [Bố cục mặc định] |
| Tablet (768-1024px) | [Những điểm thay đổi] |
| Mobile (<768px) | [Những điểm thay đổi] |

### Trường hợp biên (Edge Cases)
- **Trạng thái rỗng (Empty state)**: [Hiển thị gì khi không có dữ liệu]
- **Văn bản dài**: [Quy tắc cắt gọn / ellipsis]
- **Đang tải (Loading)**: [Dùng skeleton hay spinner]
- **Lỗi (Error)**: [Giao diện trạng thái lỗi]

### Animation / Chuyển động
| Thành phần | Kích hoạt (Trigger) | Animation | Thời lượng | Easing |
|------------|---------------------|-----------|------------|--------|
| [Thành phần] | [Trigger] | [Mô tả] | [ms] | [easing] |

### Ghi chú Accessibility
- [Thứ tự focus]
- [Các nhãn ARIA cần thiết]
- [Tương tác bàn phím]
```

## Khi có Connector khả dụng

Nếu **~~design tool** đã được kết nối:
- Lấy chính xác thông số kích thước, token và spec component từ Figma
- Xuất tài nguyên (assets) và tạo bản spec hoàn chỉnh

Nếu **~~project tracker** đã được kết nối:
- Liên kết tài liệu bàn giao vào ticket triển khai
- Tạo các sub-task tương ứng cho từng phần của bản spec

## Mẹo thực hành

1. **Chia sẻ liên kết Figma** — Tôi có thể trích xuất chính xác thông số đo đạc, token và thông tin component.
2. **Đề cập các trường hợp biên** — "Điều gì xảy ra khi có 100 mục?" giúp tôi đặc tả các điều kiện giới hạn.
3. **Nêu rõ tech stack** — "Chúng tôi dùng React + Tailwind" giúp tôi đưa ra ghi chú triển khai sát thực tế hơn.
