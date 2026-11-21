---
name: prd-copilot
description: 'Tạo Tài liệu Yêu cầu Sản phẩm (PRD) chất lượng cao cho các hệ thống phần mềm và tính năng ứng dụng AI. Bao gồm tóm tắt điều hành, user stories, đặc tả kỹ thuật và phân tích rủi ro.'
license: MIT
---

# Tài liệu Yêu cầu Sản phẩm (PRD)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [github/awesome-copilot](https://github.com/github/awesome-copilot/blob/main/skills/prd/SKILL.md) (GitHub Awesome Copilot).

## Tổng quan

Thiết kế các Tài liệu Yêu cầu Sản phẩm (PRD) toàn diện, đạt chuẩn production nhằm nối liền khoảng cách giữa tầm nhìn kinh doanh và thực thi kỹ thuật. Skill này phù hợp cho các hệ thống phần mềm hiện đại, đảm bảo mọi yêu cầu được định nghĩa rõ ràng.

## Khi nào sử dụng

Sử dụng skill này khi:

- Bắt đầu một chu kỳ phát triển sản phẩm hoặc tính năng mới
- Chuyển hóa một ý tưởng mơ hồ thành bản đặc tả kỹ thuật cụ thể
- Định nghĩa yêu cầu cho các tính năng ứng dụng AI
- Các bên liên quan cần một "nguồn chân lý duy nhất" (source of truth) thống nhất cho phạm vi dự án
- Người dùng yêu cầu "viết PRD", "tài liệu hóa yêu cầu" hoặc "lập kế hoạch tính năng"

---

## Quy trình vận hành

### Giai đoạn 1: Khám phá (Phỏng vấn làm rõ)

Trước khi viết bất kỳ dòng nào của PRD, bạn **BẮT BUỘC PHẢI** hỏi kỹ người dùng để lấp đầy các khoảng trống thông tin. Không được tự suy đoán bối cảnh.

**Hỏi về:**

- **Vấn đề cốt lõi**: Tại sao chúng ta xây dựng thứ này ngay lúc này?
- **Chỉ số thành công**: Làm sao chúng ta biết nó hiệu quả?
- **Ràng buộc**: Ngân sách, tech stack hay hạn chót?

### Giai đoạn 2: Phân tích & Khoanh phạm vi

Tổng hợp thông tin đầu vào của người dùng. Xác định các phụ thuộc và độ phức tạp tiềm ẩn.

- Vẽ ra **Luồng người dùng (User Flow)**.
- Định nghĩa **Phi mục tiêu (Non-Goals)** để bảo vệ tiến độ.

### Giai đoạn 3: Soạn thảo kỹ thuật

Tạo tài liệu tuân thủ chặt chẽ **Lược đồ PRD nghiêm ngặt (Strict PRD Schema)** bên dưới.

---

## Tiêu chuẩn chất lượng PRD

### Chất lượng yêu cầu

Sử dụng các tiêu chí cụ thể, đo lường được. Tránh dùng "nhanh", "dễ" hoặc "trực quan".

```diff
# Vague (BAD)
- The search should be fast and return relevant results.
- The UI must look modern and be easy to use.

# Concrete (GOOD)
+ The search must return results within 200ms for a 10k record dataset.
+ The search algorithm must achieve >= 85% Precision@10 in benchmark evals.
+ The UI must follow the 'Vercel/Next.js' design system and achieve 100% Lighthouse Accessibility score.
```

---

## Lược đồ PRD nghiêm ngặt (Strict PRD Schema)

Bạn **BẮT BUỘC PHẢI** tuân theo đúng cấu trúc này cho đầu ra:

### 1. Tóm tắt điều hành (Executive Summary)

- **Phát biểu vấn đề**: 1-2 câu về điểm đau.
- **Giải pháp đề xuất**: 1-2 câu về hướng xử lý.
- **Tiêu chí thành công**: 3-5 chỉ số KPI đo lường được.

### 2. Trải nghiệm người dùng & Chức năng (User Experience & Functionality)

- **User Personas**: Dành cho ai?
- **User Stories**: `Là một [người dùng], tôi muốn [hành động] để [lợi ích].`
- **Tiêu chí nghiệm thu (Acceptance Criteria)**: Danh sách gạch đầu dòng định nghĩa thế nào là "Hoàn thành" (Done) cho từng story.
- **Phi mục tiêu (Non-Goals)**: Những gì chúng ta KHÔNG xây dựng?

### 3. Yêu cầu hệ thống AI (Nếu có)

- **Yêu cầu công cụ**: Cần những công cụ và API nào?
- **Chiến lược đánh giá**: Cách đo lường chất lượng và độ chính xác của đầu ra.

### 4. Đặc tả kỹ thuật (Technical Specifications)

- **Tổng quan kiến trúc**: Luồng dữ liệu và tương tác giữa các thành phần.
- **Điểm tích hợp**: API, cơ sở dữ liệu (DB) và xác thực (Auth).
- **Bảo mật & Quyền riêng tư**: Xử lý dữ liệu và tuân thủ quy định.

### 5. Rủi ro & Lộ trình (Risks & Roadmap)

- **Triển khai theo giai đoạn**: MVP -> v1.1 -> v2.0.
- **Rủi ro kỹ thuật**: Độ trễ, chi phí hoặc lỗi từ các thành phần phụ thuộc.

---

## Hướng dẫn triển khai

### NÊN LÀM (Luôn luôn)

- **Định nghĩa kiểm thử**: Với hệ thống AI, chỉ rõ cách kiểm thử và xác thực chất lượng đầu ra.
- **Lặp lại**: Trình bày bản nháp và xin phản hồi cho từng phần cụ thể.

### KHÔNG NÊN LÀM (Tránh)

- **Bỏ qua bước Khám phá**: Không bao giờ viết PRD khi chưa hỏi ít nhất 2 câu hỏi làm rõ trước.
- **Tự bịa ràng buộc**: Nếu người dùng không chỉ định tech stack, hãy hỏi lại hoặc gắn nhãn là `TBD`.

---

## Ví dụ: Hệ thống tìm kiếm thông minh

### 1. Tóm tắt điều hành

**Vấn đề**: Người dùng gặp khó khăn khi tìm các đoạn tài liệu cụ thể trong các kho mã nguồn (repository) khổng lồ.
**Giải pháp**: Một hệ thống tìm kiếm thông minh cung cấp câu trả lời trực tiếp kèm trích dẫn nguồn.
**Thành công**:

- Giảm 50% thời gian tìm kiếm.
- Độ chính xác trích dẫn >= 95%.

### 2. User Stories

- **Story**: Là một lập trình viên, tôi muốn đặt câu hỏi bằng ngôn ngữ tự nhiên để không phải đoán từ khóa.
- **AC**:
  - Hỗ trợ làm rõ nhiều lượt (multi-turn clarification).
  - Trả về khối code kèm nút "Copy".

### 3. Kiến trúc hệ thống AI

- **Công cụ yêu cầu**: `codesearch`, `grep`, `webfetch`.

### 4. Đánh giá

- **Benchmark**: Kiểm thử với 50 câu hỏi phổ biến của lập trình viên.
- **Tỷ lệ đạt (Pass Rate)**: 90% phải khớp với các trích dẫn kỳ vọng.
