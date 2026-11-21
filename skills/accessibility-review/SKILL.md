---
name: accessibility-review
description: Thực hiện kiểm tra khả năng tiếp cận (accessibility audit) theo chuẩn WCAG 2.1 AA cho thiết kế hoặc trang web. Kích hoạt với các yêu cầu như "audit accessibility", "check a11y", "is this accessible?", "kiểm tra a11y", hoặc khi rà soát độ tương phản màu sắc, điều hướng bàn phím, kích thước vùng chạm (touch target) hay hành vi trình đọc màn hình (screen reader) trước khi bàn giao (handoff).
argument-hint: "<URL Figma, URL hoặc mô tả>"
---

# /accessibility-review

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/design/skills/accessibility-review/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Kiểm tra thiết kế hoặc trang web về mức độ tuân thủ khả năng tiếp cận (accessibility) theo chuẩn WCAG 2.1 AA.

## Cách dùng

```
/accessibility-review $ARGUMENTS
```

Kiểm tra khả năng tiếp cận cho: @$1

## Tham chiếu nhanh WCAG 2.1 AA

### Có thể cảm nhận (Perceivable)
- **1.1.1** Nội dung phi văn bản phải có văn bản thay thế (alt text)
- **1.3.1** Thông tin và cấu trúc được truyền đạt theo ngữ nghĩa (semantic)
- **1.4.3** Tỷ lệ tương phản >= 4.5:1 (văn bản thường), >= 3:1 (văn bản lớn)
- **1.4.11** Độ tương phản phi văn bản >= 3:1 (thành phần UI, đồ họa)

### Có thể vận hành (Operable)
- **2.1.1** Mọi chức năng đều có thể thao tác qua bàn phím
- **2.4.3** Thứ tự focus hợp lý
- **2.4.7** Hiển thị rõ chỉ báo focus (focus indicator)
- **2.5.5** Kích thước vùng chạm (touch target) >= 44x44 CSS pixels

### Có thể hiểu (Understandable)
- **3.2.1** Hành vi nhất quán khi focus (không có thay đổi bất ngờ)
- **3.3.1** Nhận diện lỗi rõ ràng (mô tả cụ thể lỗi)
- **3.3.2** Có nhãn (label) hoặc hướng dẫn cho các ô nhập liệu (input)

### Bền vững (Robust)
- **4.1.2** Đầy đủ Name, role, value cho tất cả thành phần UI

## Các vấn đề thường gặp

1. Độ tương phản màu sắc chưa đủ
2. Thiếu nhãn (label) cho biểu mẫu
3. Không thể truy cập các phần tử tương tác bằng bàn phím
4. Thiếu alt text cho các hình ảnh mang ý nghĩa thông tin
5. Bẫy focus (focus trap) trong các modal
6. Thiếu các vùng mốc ARIA (ARIA landmarks)
7. Media tự động phát (auto-play) không có nút điều khiển
8. Giới hạn thời gian mà không có tùy chọn gia hạn

## Phương pháp kiểm thử

1. Quét tự động (phát hiện khoảng ~30% vấn đề)
2. Điều hướng chỉ bằng bàn phím
3. Kiểm thử bằng trình đọc màn hình (VoiceOver, NVDA)
4. Xác minh độ tương phản màu sắc
5. Phóng to lên 200% — bố cục có bị vỡ không?

## Đầu ra (Output)

```markdown
## Báo cáo kiểm tra Accessibility: [Tên thiết kế/Trang]
**Tiêu chuẩn:** WCAG 2.1 AA | **Ngày:** [Ngày]

### Tóm tắt
**Số vấn đề phát hiện:** [X] | **Nghiêm trọng (Critical):** [X] | **Lớn (Major):** [X] | **Nhỏ (Minor):** [X]

### Chi tiết phát hiện

#### Có thể cảm nhận (Perceivable)
| # | Vấn đề | Tiêu chí WCAG | Mức độ | Khuyến nghị |
|---|--------|---------------|--------|-------------|
| 1 | [Vấn đề] | [1.4.3 Contrast] | 🔴 Nghiêm trọng | [Cách khắc phục] |

#### Có thể vận hành (Operable)
| # | Vấn đề | Tiêu chí WCAG | Mức độ | Khuyến nghị |
|---|--------|---------------|--------|-------------|
| 1 | [Vấn đề] | [2.1.1 Keyboard] | 🟡 Lớn | [Cách khắc phục] |

#### Có thể hiểu (Understandable)
| # | Vấn đề | Tiêu chí WCAG | Mức độ | Khuyến nghị |
|---|--------|---------------|--------|-------------|
| 1 | [Vấn đề] | [3.3.2 Labels] | 🟢 Nhỏ | [Cách khắc phục] |

#### Bền vững (Robust)
| # | Vấn đề | Tiêu chí WCAG | Mức độ | Khuyến nghị |
|---|--------|---------------|--------|-------------|
| 1 | [Vấn đề] | [4.1.2 Name, Role, Value] | 🟡 Lớn | [Cách khắc phục] |

### Kiểm tra tương phản màu sắc
| Thành phần | Màu chữ/tiền cảnh | Màu nền | Tỷ lệ | Yêu cầu | Đạt? |
|------------|-------------------|---------|-------|---------|------|
| [Body text] | [màu] | [màu] | [X]:1 | 4.5:1 | ✅/❌ |

### Điều hướng bàn phím
| Thành phần | Thứ tự Tab | Enter/Space | Escape | Phím mũi tên |
|------------|------------|-------------|--------|--------------|
| [Thành phần] | [Thứ tự] | [Hành vi] | [Hành vi] | [Hành vi] |

### Trình đọc màn hình (Screen Reader)
| Thành phần | Nội dung được đọc | Vấn đề |
|------------|-------------------|--------|
| [Thành phần] | [Nội dung SR đọc] | [Vấn đề nếu có] |

### Ưu tiên khắc phục
1. **[Lỗi nghiêm trọng]** — Ảnh hưởng đến [ai] và chặn [chức năng gì]
2. **[Lỗi lớn]** — Cải thiện [điều gì] cho [ai]
3. **[Lỗi nhỏ]** — Nên cải thiện thêm
```

## Khi có Connector khả dụng

Nếu **~~design tool** đã được kết nối:
- Kiểm tra trực tiếp giá trị màu, kích thước phông chữ và vùng chạm (touch target) từ Figma
- Kiểm tra vai trò ARIA (ARIA roles) và hành vi bàn phím của component trong spec thiết kế

Nếu **~~project tracker** đã được kết nối:
- Tạo ticket cho từng phát hiện accessibility kèm mức độ nghiêm trọng và tiêu chí WCAG
- Liên kết các phát hiện với các epic khắc phục accessibility hiện có

## Mẹo thực hành

1. **Bắt đầu với độ tương phản và bàn phím** — Đây là hai hạng mục giúp phát hiện các lỗi phổ biến và có tác động lớn nhất.
2. **Kiểm thử với công nghệ hỗ trợ thực tế** — Bản kiểm tra của tôi là điểm khởi đầu tốt, nhưng kiểm thử thủ công với VoiceOver/NVDA sẽ phát hiện những lỗi mà phân tích tĩnh không thấy được.
3. **Ưu tiên theo mức độ tác động** — Sửa các lỗi chặn người dùng sử dụng trước, tối ưu chi tiết sau.
