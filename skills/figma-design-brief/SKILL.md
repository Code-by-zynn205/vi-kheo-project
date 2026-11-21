---
name: figma-design-brief
description: "Viết bản tóm tắt yêu cầu thiết kế (design brief) có cấu trúc cho một tác vụ thiết kế Figma từ yêu cầu sản phẩm hoặc yêu cầu tính năng. Sử dụng khi được yêu cầu viết design brief, tạo đặc tả thiết kế cho Figma, chuyển đổi PRD thành yêu cầu thiết kế, hoặc giao đề bài cho designer về những gì cần dựng trong Figma. Tạo ra bản brief đầy đủ mục tiêu, phạm vi, luồng người dùng, các component cần dùng, ràng buộc và tiêu chí thành công."
---

# Skill: Viết Design Brief cho Figma (Figma Design Brief)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-design-brief/SKILL.md) (mohitagw15856).

Chuyển đổi yêu cầu sản phẩm hoặc yêu cầu tính năng thành một bản tóm tắt yêu cầu thiết kế (design brief) có cấu trúc — mọi thứ một designer cần để mở Figma lên và tự tin bắt tay vào dựng thiết kế.

> **Không hẳn là việc này?** Hãy dùng `figma-design-qa` khi thiết kế đã có sẵn và bạn cần kiểm tra đối chiếu với đặc tả.

## Đầu vào Bắt buộc

- **Tính năng hoặc yêu cầu** (dán đoạn PRD, ticket hoặc mô tả tính năng)
- **Mục tiêu người dùng** (người dùng đang cố hoàn thành việc gì?)
- **Nền tảng** (iOS / Android / Web / Responsive / Tất cả)
- **Các component hiện có sẵn** (tùy chọn)
- **Mốc thời gian** (khi nào thiết kế cần hoàn tất?)


## Công cụ Hỗ trợ Tự động (Programmatic Helper)

Độ tương phản (contrast ratio) không thể ước lượng bằng mắt thường. Ngưỡng chuẩn AA nằm ở mức 4.5:1, và màu `#777777` trên nền trắng đạt 4.478 (không đạt) trong khi `#767676` đạt 4.54 (đạt) — nhìn ảnh chụp màn hình không thể nào phân biệt được hai mức này. Hãy tính toán chính xác bằng lệnh:

```bash
npx --yes notugly fix "#8ab4f8" "#ffffff"     # ratio, APCA, and the nearest passing colour
npx --yes notugly onepager <url> --out review.html   # every pairing, printable
npx --yes notugly vision                      # which colours merge for colour-blind viewers
```

Lệnh `notugly fix` trả về tỷ lệ tương phản, độ tương phản sáng APCA và màu gần nhất với màu đã chọn mà đạt chuẩn — giữ nguyên sắc độ (hue) và độ bão hòa (chroma). Hãy dán các con số đó vào các bảng bên dưới thay vì tự ước lượng.

Công cụ mang tính tất định, không có dependency ngoài và **không gọi model AI** — do đó không tốn chi phí khi chạy và luôn cho ra cùng một kết quả mỗi lần.

Nếu bản brief có chỉ định màu sắc, hãy ghi rõ tỷ lệ đo được cho từng cặp màu chữ/nền dự kiến. Một bản brief chỉ định cặp màu không đạt chuẩn sẽ làm lãng phí cả một chu kỳ thiết kế trước khi có người phát hiện ra.

## Cấu trúc Đầu ra

### 1. Thông tin Chung (Brief Header)
Tính năng, PM, Designer, Nền tảng, Hạn hoàn thành thiết kế, Ngày bàn giao dev (Dev handoff).

### 2. Chúng ta Đang Thiết kế Gì và Tại sao
- **Mục tiêu (The goal):** [Một câu — bài toán của người dùng đang được giải quyết]
- **Bối cảnh (Context):** [2-3 câu. Tại sao là lúc này? Yếu tố nào kích hoạt nhu cầu?]
- **Dấu hiệu thành công (Success looks like):** [Kết quả cụ thể có thể quan sát/đo lường được]

### 3. Các Luồng Người dùng Cần Thiết kế (User Flows to Design)

**Luồng N: [Tên luồng]**
- Điểm vào (Entry point): [Nơi người dùng bắt đầu]
- Các bước: [Các bước chính được đánh số]
- Điểm thoát (Exit point): [Nơi luồng kết thúc]
- Trường hợp biên (Edge cases): [trạng thái trống - empty state, trạng thái lỗi - error state, trạng thái đang tải - loading state]

### 4. Các Màn hình Bắt buộc (Screens Required)

| Màn hình | Mới / Cập nhật | Ghi chú |
|---|---|---|
| [Màn hình] | Mới (New) | [Yêu cầu trọng tâm] |

### 5. Các Component Cần Dùng (Components Needed)

| Component | Có trong thư viện? | Hành động |
|---|---|---|
| [Component] | Có/Không/Cần thêm biến thể (Yes/No/Needs variant) | Dùng sẵn/Tạo mới/Mở rộng (Use/Create/Extend) |

### 6. Ràng buộc và Yêu cầu (Constraints and Requirements)
- Bắt buộc phải có (Must haves): [Các ràng buộc không thể thương lượng]
- Bắt buộc phải tránh (Must avoid): [Các mẫu thiết kế không được sử dụng]
- Khả năng tiếp cận (Accessibility): [Cấp độ WCAG, kích thước vùng chạm (touch target)]

### 7. Câu hỏi Mở (Open Questions)
- [ ] [Câu hỏi — kèm người chịu trách nhiệm (owner)]

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Mục tiêu tập trung vào kết quả đầu ra (outcome-focused), không phải kiểu "thiết kế tính năng X"
- [ ] Mọi luồng đều bao gồm trường hợp biên
- [ ] Bảng component phân biệt rõ tạo mới và tái sử dụng
- [ ] Các ràng buộc bao gồm yêu cầu về khả năng tiếp cận
- [ ] Các câu hỏi mở đều có người chịu trách nhiệm

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không viết design brief mô tả sẵn giải pháp — bản brief phải mô tả bài toán và các ràng buộc, không phải đáp án thiết kế
- [ ] Không bỏ qua tiêu chí thành công — designer cần biết trạng thái "hoàn thành" trông như thế nào trước khi bắt đầu
- [ ] Không bỏ sót các component sẵn có để tái sử dụng — các brief phớt lờ design system dẫn đến triển khai thiếu nhất quán
- [ ] Không để các câu hỏi mở chưa được giải quyết — hãy đưa lên xử lý trước khi bắt đầu thiết kế, đừng để trong lúc làm
- [ ] Không nhầm lẫn giữa yêu cầu sản phẩm và chỉ dẫn thiết kế — bản brief định nghĩa *cái gì* (what), không phải *làm thế nào* (how)

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Write a design brief for [feature]"
- "Turn this PRD into a Figma design brief"
- "Brief the designer on what to build for [requirement]"
- "Create a design spec for [feature] for Figma"
- "What does the designer need to know to design [feature]?"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-design-brief.html
