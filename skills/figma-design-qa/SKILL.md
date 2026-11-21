---
name: figma-design-qa
description: "Chạy danh sách kiểm tra QA trước khi bàn giao (pre-handoff QA checklist) trên một thiết kế Figma trước khi chuyển sang đội ngũ kỹ sư. Sử dụng khi được yêu cầu QA thiết kế Figma, kiểm tra trước bàn giao hoặc xác thực file Figma đã sẵn sàng để lập trình. Tạo ra báo cáo QA có cấu trúc bao gồm vệ sinh file (file hygiene), sử dụng component, khả năng tiếp cận (accessibility) và mức độ sẵn sàng bàn giao với trạng thái đạt/không đạt (pass/fail) rõ ràng cho từng hạng mục."
---

# Skill: Kiểm thử Chất lượng Thiết kế Figma (Figma Design QA)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-design-qa/SKILL.md) (mohitagw15856).

Chạy quy trình kiểm tra QA có hệ thống trước khi bàn giao trên một thiết kế Figma — phát hiện sớm các lỗi gây trao đổi qua lại giữa thiết kế và kỹ sư trước khi chúng trở nên tốn kém.

> **Không hẳn là việc này?** Hãy dùng `figma-design-brief` khi thiết kế chưa tồn tại và cần viết đề bài; dùng `figma-design-review` khi bạn muốn đánh giá thiết kế tổng thể thay vì đối chiếu chặt chẽ với đặc tả; dùng `figma-design-critique-pm` khi bạn đang đánh giá kết quả sản phẩm thay vì độ chuẩn xác khi triển khai.

## Đầu vào Bắt buộc

Làm việc dựa trên thông tin được cung cấp. Nếu thiếu bất kỳ mục nào dưới đây, vẫn phải xuất ra kết quả hoàn chỉnh: điền vào từng khoảng trống bằng một giả định hợp lý có đánh dấu *(giả định, cần xác nhận)* và liệt kê các giả định đó ở cuối báo cáo. Chỉ hỏi lại trước khi làm nếu thiếu chính đối tượng cốt lõi (không có gì để viết).
- **Tính năng hoặc màn hình đang được QA** (mô tả những gì đã thiết kế)
- **Nền tảng** (iOS / Android / Web)
- **Design system** (tùy chỉnh / Material / HIG / Không có)
- **Công cụ bàn giao** (Figma Inspect / Zeplin / Storybook / Liên kết trực tiếp)
- **Độ sâu QA** (nhanh 15 phút / tiêu chuẩn 30 phút / kỹ lưỡng 60 phút)


## Công cụ Hỗ trợ Tự động (Programmatic Helper)

Độ tương phản (contrast ratio) không thể ước lượng bằng mắt thường. Ngưỡng chuẩn AA nằm ở mức 4.5:1, và màu `#777777` trên nền trắng đạt 4.478 (không đạt) trong khi `#767676` đạt 4.54 (đạt) — nhìn ảnh chụp màn hình không thể nào phân biệt được hai mức này. Hãy tính toán chính xác bằng lệnh:

```bash
npx --yes notugly fix "#8ab4f8" "#ffffff"     # ratio, APCA, and the nearest passing colour
npx --yes notugly onepager <url> --out review.html   # every pairing, printable
npx --yes notugly vision                      # which colours merge for colour-blind viewers
```

Lệnh `notugly fix` trả về tỷ lệ tương phản, độ tương phản sáng APCA và màu gần nhất với màu đã chọn mà đạt chuẩn — giữ nguyên sắc độ (hue) và độ bão hòa (chroma). Hãy dán các con số đó vào các bảng bên dưới thay vì tự ước lượng.

Công cụ mang tính tất định, không có dependency ngoài và **không gọi model AI** — do đó không tốn chi phí khi chạy và luôn cho ra cùng một kết quả mỗi lần.

QA là hoạt động xác định đạt/không đạt (pass/fail), nên mỗi dòng kiểm tra tương phản đều cần có con số cụ thể và kết luận. Đối với bản dựng đã deploy, `npx notugly check <url>` sẽ **trả về mã thoát khác 0 (exits non-zero)** khi có lỗi, giúp tích hợp trực tiếp vào CI thay vì chỉ kiểm tra thủ công.

## Cấu trúc Đầu ra

Báo cáo QA: [Tính năng] | [Ngày] | [Nền tảng]
**Trạng thái tổng thể:** Sẵn sàng / Cần sửa nhỏ / Chưa sẵn sàng (Ready / Minor fixes needed / Not ready)

### Phần 1: Vệ sinh File (File Hygiene)
- Mọi layer được đặt tên có ngữ nghĩa (không có "Rectangle 12")
- Không còn các layer thừa/bị ẩn trong các frame cuối cùng
- Component lấy từ thư viện (không phải bản sao bị tách rời - detached copies)
- Toàn bộ văn bản sử dụng text styles (không chỉnh phông chữ thủ công)
- Toàn bộ màu sắc sử dụng styles hoặc variables (không ghi đè mã hex thủ công)
- Tên các frame khớp với bản đồ màn hình (screen map)
- Không còn dây nối prototype thừa trỏ nhầm frame

### Phần 2: Sử dụng Component (Component Usage)
- Mọi nút bấm (buttons) đều sử dụng component từ thư viện
- Mọi ô nhập liệu (inputs) đều sử dụng component từ thư viện
- Mọi biểu tượng (icons) đều lấy từ thư viện icon đã phê duyệt
- Không có component tự chế nào đáng lẽ phải nằm trong thư viện
- Sử dụng đúng biến thể (đúng kích thước, trạng thái, loại)

### Phần 3: Nội dung và Văn bản (Content and Copy)
- Không còn chữ giữ chỗ (Lorem ipsum) trong thiết kế cuối cùng
- Toàn bộ nội dung chữ đã được rà soát và phê duyệt
- Sử dụng dữ liệu thực tế (không dùng kiểu "User Name")
- Đã kiểm thử các trường hợp biên với văn bản dài
- Thông báo lỗi dễ hiểu với người dùng
- Trạng thái trống (empty states) có đầy đủ câu chữ và nút kêu gọi hành động (CTA)

### Phần 4: Trạng thái và Độ phủ (States and Coverage)
- Đủ các trạng thái Default, Loading, Empty, Error, Success
- Các phần tử tương tác có trạng thái hover/active (trên web)
- Đã thiết kế trạng thái disabled ở những nơi áp dụng

### Phần 5: Khả năng Tiếp cận (Accessibility)
- Toàn bộ chữ đạt độ tương phản WCAG AA (4.5:1 cho chữ thường, 3:1 cho chữ lớn)
- Các thành phần giao diện (UI components) đạt độ tương phản 3:1 so với nền
- Vùng chạm tối thiểu 44x44pt trên iOS / 48x48dp trên Android
- Có trạng thái focus cho điều hướng bàn phím/switch (trên web)
- Thông tin không chỉ được truyền tải duy nhất qua màu sắc
- Các icon có nhãn văn bản hoặc đã được chú thích tên tiếp cận (accessible names)

### Phần 6: Mức độ Sẵn sàng Bàn giao (Handoff Readiness)
- Đã có chú thích cho dev ở các tương tác không hiển nhiên
- Khoảng cách sử dụng Auto Layout (không dùng định vị tuyệt đối)
- Hình ảnh/tài nguyên (assets) được xuất đúng độ phân giải
- Thiết kế khớp với các yêu cầu đã được phê duyệt
- Đã đính kèm liên kết tới prototype

### Các Vấn đề Phát hiện (Issues Found)
Với mỗi mục không đạt (fail):
**[Vấn đề] — Chặn bàn giao / Sửa trước khi bàn giao / Sửa ở vòng sau (Blocking / Fix before handoff / Fix in next iteration)**
- Chi tiết: [Layer/màn hình/phần tử cụ thể]
- Cách sửa: [Hành động chính xác cần thực hiện]
- Người phụ trách: [Designer/PM/Cả hai]

### Quyết định Bàn giao (Handoff Decision)
Trạng thái, người ký duyệt, ngày duyệt.

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Đã hoàn tất cả 6 phần
- [ ] Mỗi lỗi không đạt đều có mô tả cụ thể và hành động khắc phục
- [ ] Tách bạch rõ các lỗi chặn bàn giao (blocking) khỏi các lỗi nhỏ
- [ ] Quyết định bàn giao được nêu rõ ràng, dứt khoát

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không tạo báo cáo QA nửa vời — mọi danh mục kiểm tra đều phải được đánh giá, không chỉ đánh giá những chỗ nhìn thấy lỗi rõ rệt
- [ ] Không đưa ra quyết định bàn giao mơ hồ — kết quả phải nêu rõ đạt (pass), đạt có điều kiện (pass with conditions) hoặc không đạt (fail)
- [ ] Không bỏ qua kiểm tra khả năng tiếp cận — độ tương phản màu, kích thước vùng chạm và nhãn trình đọc màn hình là bắt buộc, không phải tùy chọn
- [ ] Không báo cáo lỗi mà không chỉ rõ chúng xuất hiện ở màn hình hoặc component nào
- [ ] Không phê duyệt thiết kế nếu có bất kỳ component nào bị tách khỏi thư viện (detached) mà không có lý do được ghi nhận bằng văn bản

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "QA this Figma design before handoff"
- "Run a pre-handoff check on [feature] design"
- "Is this Figma design ready for engineering?"
- "Do a design QA on [screen/feature]"
- "What needs fixing before we hand this off?"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-design-qa.html
