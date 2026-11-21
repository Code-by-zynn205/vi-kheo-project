---
name: figma-design-review
description: "Thực hiện rà soát thiết kế từ góc độ PM (PM design review) có cấu trúc đối chiếu với yêu cầu sản phẩm. Sử dụng khi được yêu cầu đánh giá thiết kế Figma, kiểm tra thiết kế theo yêu cầu, hoặc đánh giá xem thiết kế có đáp ứng đặc tả sản phẩm hay không. Tạo ra báo cáo kiểm tra độ phủ yêu cầu, các vấn đề UX cần lưu ý, câu hỏi mở và trạng thái phê duyệt rõ ràng — đã phê duyệt (approved), phê duyệt có điều kiện (approved with conditions) hoặc chưa phê duyệt (not approved)."
---

# Skill: Đánh giá Thiết kế Figma dưới góc độ PM (Figma Design Review)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-design-review/SKILL.md) (mohitagw15856).

Thực hiện quy trình đánh giá thiết kế có cấu trúc cho PM — kiểm tra xem thiết kế có đáp ứng yêu cầu sản phẩm, bao phủ hết mọi luồng người dùng và sẵn sàng chuyển giao cho kỹ sư hay chưa. Đây là buổi đánh giá về yêu cầu và kết quả đầu ra (requirements-and-outcomes review), không phải buổi bình phẩm thẩm mỹ.

> **Không hẳn là việc này?** Hãy dùng `figma-design-qa` khi bạn cần một lượt kiểm tra nghiêm ngặt đối chiếu với đặc tả kỹ thuật.

## Đầu vào Bắt buộc

- **Mô tả thiết kế hoặc tóm tắt màn hình**
- **Yêu cầu gốc** (đoạn PRD, ticket hoặc tiêu chí nghiệm thu - acceptance criteria)
- **Luồng người dùng đang được thiết kế**
- **Giai đoạn rà soát** (ý tưởng - concept / độ chi tiết trung bình - mid-fidelity / bản chốt trước bàn giao - pre-handoff final)

## Cấu trúc Đầu ra

### 1. Thông tin Buổi Rà soát (Review Header)
Tính năng, giai đoạn rà soát, người rà soát, ngày rà soát.
**Trạng thái tổng thể:** Đã phê duyệt / Phê duyệt kèm chỉnh sửa / Cần làm lại (Approved / Approved with changes / Needs revision)

### 2. Kiểm tra Độ phủ Yêu cầu (Requirements Coverage Check)

| Yêu cầu | Đã đáp ứng? | Ghi chú |
|---|---|---|
| [Yêu cầu từ PRD] | Có/Không/Một phần (Yes/No/Partial) | [Nhận xét cụ thể] |

Tóm tắt phần còn thiếu: [Các yêu cầu chưa được giải quyết — bắt buộc xử lý trước khi phê duyệt]

### 3. Độ đầy đủ Luồng Người dùng (User Flow Completeness)

| Bước trong luồng | Đã thiết kế? | Vấn đề |
|---|---|---|
| [Bước] | Có/Không/Một phần (Yes/No/Partial) | [Vấn đề] |
| Trạng thái lỗi (Error state) | Có/Không (Yes/No) | |
| Trạng thái trống (Empty state) | Có/Không (Yes/No) | |
| Trạng thái đang tải (Loading state) | Có/Không (Yes/No) | |

### 4. Mối quan ngại của PM (PM Concerns)

**[Mối quan ngại] — Chặn (Blocking) / Nên sửa (Should fix) / Nên có (Nice to fix)**
- Chi tiết: [Nhận xét cụ thể]
- Tại sao điều này quan trọng: [Tác động đến kinh doanh hoặc người dùng — không phải sở thích thẩm mỹ cá nhân]
- Hướng giải quyết đề xuất: [Điều PM kỳ vọng nhìn thấy]

### 5. Câu hỏi Mở (Open Questions)

| Câu hỏi | Người phụ trách (Owner) | Hạn cần có câu trả lời |
|---|---|---|
| [Câu hỏi] | Designer/Eng/PM | [Ngày] |

### 6. Quyết định Phê duyệt (Approval Decision)
Đã phê duyệt / Phê duyệt kèm chỉnh sửa (liệt kê danh sách) / Cần làm lại (nêu khu vực trọng tâm + ngày rà soát lại)

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Mọi yêu cầu đều đã được đánh giá
- [ ] Đã kiểm tra đủ mọi trạng thái luồng (lỗi, trống, đang tải)
- [ ] Các mối quan ngại tập trung vào kết quả sản phẩm thay vì cảm tính thẩm mỹ
- [ ] Các câu hỏi mở đều có người chịu trách nhiệm
- [ ] Trạng thái phê duyệt được nêu rõ ràng

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không đánh giá thiết kế khi chưa có danh sách yêu cầu để đối chiếu — luôn yêu cầu PRD, design brief hoặc tiêu chí nghiệm thu trước
- [ ] Không đưa ra trạng thái phê duyệt mập mờ — quyết định phải nêu rõ là "đã phê duyệt" ("approved"), "phê duyệt có điều kiện" ("approved with conditions") hoặc "chưa phê duyệt" ("not approved")
- [ ] Không đánh đồng khoảng trống yêu cầu (requirements gaps) với các vấn đề UX — theo dõi tách biệt để kỹ sư và designer có thể hành động độc lập
- [ ] Không nêu ra quan ngại mà không gợi ý thông tin nào cần có để giải quyết vấn đề đó
- [ ] Không bỏ qua câu hỏi mở — các giả định chưa được giải quyết lúc rà soát sẽ biến thành bug sau khi bàn giao cho kỹ sư

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Review this Figma design against the requirements"
- "Do a PM design review for [feature]"
- "Check if this design meets the product spec"
- "Is this design ready to hand off to engineering?"
- "What is missing from this design before we can build it?"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-design-review.html
