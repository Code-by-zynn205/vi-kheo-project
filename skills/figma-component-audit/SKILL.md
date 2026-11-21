---
name: figma-component-audit
description: "Kiểm toán (audit) thư viện component Figma về tính nhất quán, khoảng trống độ phủ và lỗi đặt tên. Sử dụng khi được yêu cầu kiểm toán component, đánh giá design system, kiểm tra tính nhất quán của component, xác định component còn thiếu hoặc đánh giá sức khỏe thư viện Figma. Tạo ra báo cáo kiểm toán có cấu trúc với các vấn đề được xếp hạng ưu tiên theo mức độ tác động, đề xuất quy chuẩn đặt tên và kế hoạch khắc phục."
---

# Skill: Kiểm toán Component Figma (Figma Component Audit)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-component-audit/SKILL.md) (mohitagw15856).

Tạo báo cáo kiểm toán (audit) có cấu trúc cho thư viện component Figma — chỉ ra các điểm thiếu nhất quán, vấn đề đặt tên, khoảng trống độ phủ và các đề xuất ưu tiên.

## Đầu vào Bắt buộc

- **Danh sách hoặc mô tả component** (dán tên các component hoặc mô tả những gì đang có)
- **Loại sản phẩm** (ứng dụng di động / ứng dụng web / desktop / đa nền tảng)
- **Mức độ trưởng thành của Design system** (mới khởi tạo / đang phát triển / trưởng thành / kế thừa cũ - legacy)
- **Mối quan tâm chính** (tùy chọn)

## Cấu trúc Đầu ra

### 1. Tóm tắt Kiểm toán (Audit Summary)

| Tiêu chí | Trạng thái | Điểm |
|---|---|---|
| Tính nhất quán đặt tên (Naming consistency) | Đỏ/Vàng/Xanh (Red/Amber/Green) | /10 |
| Độ phủ component (Component coverage) | | /10 |
| Độ đầy đủ biến thể (Variant completeness) | | /10 |
| Tài liệu hóa (Documentation) | | /10 |
| Sức khỏe tổng thể (Overall health) | | /10 |

**Kết luận (Verdict):** Tình trạng hiện tại của thư viện này ra sao và một việc quan trọng nhất cần sửa ngay là gì?

### 2. Vấn đề Đặt tên (Naming Issues)

Với mỗi vấn đề:
**Vấn đề: [Loại vấn đề]**
- Thực trạng đang xảy ra: [Ví dụ cụ thể]
- Tại sao điều này quan trọng: [Tác động đến designer và lập trình viên]
- Cách sửa: [Quy ước đặt tên chính xác cần áp dụng]
- Ví dụ: Trước / Sau (Before / After)

Quy ước đặt tên cần áp dụng nhất quán:
- Components: PascalCase (`NavigationBar`)
- Variants: Chữ thường kèm dấu gạch chéo (`size/large`, `state/hover`)
- Pages: Viết hoa toàn bộ (`COMPONENTS`, `FOUNDATIONS`)

### 3. Khoảng trống Độ phủ (Coverage Gaps)

| Component còn thiếu | Mức ưu tiên | Lý do cần thiết |
|---|---|---|
| [Component] | Cao/Trung bình/Thấp (High/Medium/Low) | [Trường hợp sử dụng] |

### 4. Kiểm tra Độ đầy đủ Biến thể (Variant Completeness Check)

| Component | Default | Hover | Active | Disabled | Error | Còn thiếu |
|---|---|---|---|---|---|---|
| [Button] | Có | Có | Không | Có | Không | Active, Error |

### 5. Kế hoạch Khắc phục Theo Mức ưu tiên (Prioritised Fix Plan)

| # | Hạng mục sửa | Công sức (Effort) | Tác động (Impact) | Làm trước tiên? |
|---|---|---|---|---|
| 1 | [Hạng mục sửa] | Thấp/TB/Cao (Low/Med/High) | Cao (High) | Có (Yes) |

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Các đề xuất đặt tên đều có ví dụ trước/sau (before/after)
- [ ] Các khoảng trống độ phủ phù hợp với loại sản phẩm
- [ ] Kế hoạch khắc phục được sắp xếp theo tỷ lệ tác động trên công sức (impact-to-effort ratio)
- [ ] Độ đầy đủ biến thể bao phủ toàn bộ các trạng thái tương tác

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không báo lỗi đặt tên mà thiếu quy ước đặt tên cụ thể, nhất quán để đội ngũ áp dụng
- [ ] Không chỉ kiểm toán tính nhất quán trực quan — cần kiểm tra cả các trạng thái tương tác còn thiếu và mức độ tuân thủ khả năng tiếp cận (accessibility)
- [ ] Không liệt kê mọi vấn đề ở cùng mức ưu tiên — hãy nhóm theo tác động (Critical / Major / Minor) để kế hoạch sửa có thể thực thi
- [ ] Không bỏ qua độ đầy đủ biến thể — mọi component có tương tác phải bao phủ đầy đủ các trạng thái bắt buộc
- [ ] Không nêu khoảng trống độ phủ mà không đề xuất cụ thể các component còn thiếu cần bổ sung

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Audit my Figma component library"
- "Review our design system for consistency issues"
- "What components are we missing in our Figma library?"
- "Our component naming is a mess — help me fix it"
- "Do a health check on our Figma components"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-component-audit.html
