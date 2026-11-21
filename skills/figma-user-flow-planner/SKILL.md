---
name: figma-user-flow-planner
description: "Lập kế hoạch luồng người dùng (user flows) và các trạng thái màn hình (screen states) cho thiết kế Figma trước khi bắt đầu vẽ bất kỳ thứ gì. Sử dụng khi được yêu cầu lập kế hoạch user flow, lên bản đồ màn hình cho tính năng, định nghĩa các trạng thái màn hình, tổ chức cấu trúc file Figma hoặc xác định những gì cần thiết kế trước khi mở Figma. Tạo ra bản đồ luồng hoàn chỉnh với toàn bộ màn hình, trạng thái, điểm vào/thoát và cấu trúc trang Figma gợi ý."
---

# Skill: Lập kế hoạch Luồng Người dùng Figma (Figma User Flow Planner)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/blob/main/skills/figma-user-flow-planner/SKILL.md) (mohitagw15856).

Lên kế hoạch những gì cần thiết kế trước khi chạm vào một pixel nào — lập bản đồ toàn bộ màn hình, trạng thái, điểm vào và trường hợp biên để designer không bị phát hiện thiếu trạng thái giữa chừng khi đang dựng.

## Đầu vào Bắt buộc

- **Tính năng hoặc tác vụ đang được thiết kế**
- **Loại người dùng** (ai là người thực hiện luồng này?)
- **Nền tảng** (iOS / Android / Web / Đa nền tảng)
- **Điểm bắt đầu** (người dùng xuất phát từ đâu?)
- **Các trường hợp biên đã biết** (tùy chọn)

## Cấu trúc Đầu ra

### 1. Tổng quan Luồng (Flow Overview)
Tính năng, người dùng, mục tiêu, điểm vào, điểm thoát thành công, các điểm thoát thất bại.

### 2. Bản đồ Màn hình (Screen Map)

| # | Tên màn hình | Loại | Kích hoạt bởi (Triggered by) | Ghi chú |
|---|---|---|---|---|
| 1 | [Màn hình] | New/Modal/Drawer/Toast | [Yếu tố kích hoạt] | [Điểm cần cân nhắc] |

Các loại màn hình cần bao phủ: điểm vào (entry), luồng thuận lợi (happy path), đang tải (loading), thành công (success), lỗi (mạng/kiểm tra dữ liệu/phân quyền), trống (empty), lần đầu sử dụng/hướng dẫn (first-time/onboarding), các trường hợp biên (edge cases).

### 3. Ma trận Trạng thái (State Matrix)

**[Tên màn hình]**

| Trạng thái | Tác nhân kích hoạt | Thay đổi trực quan | Hành động khả dụng |
|---|---|---|---|
| Default | Tải trang (Page load) | [Mô tả] | [Người dùng làm được gì] |
| Loading | Người dùng bấm hành động | Skeleton/spinner | Không có |
| Error | Lỗi API | Thông báo lỗi | Thử lại/Quay lại (Retry/Go back) |
| Empty | Không có dữ liệu | Trạng thái trống | [CTA] |

### 4. Các Điểm Rẽ nhánh Quyết định (Decision Points)

**Quyết định: [Tên]**
- Nếu Có (Yes): [Màn hình N]
- Nếu Không (No): [Màn hình X]

### 5. Cấu trúc File Figma Gợi ý (Suggested Figma File Structure)

```
Feature name/
- Cover
- Flow Map
- Happy Path
- Error States
- Empty States
- Edge Cases
- Handoff
```

### 6. Những Gì Chưa Thiết kế Ngay (What Not to Design Yet)
[Các hạng mục rõ ràng nằm ngoài phạm vi — ngăn ngừa phình phạm vi (scope creep)]

## Kiểm tra Chất lượng (Quality Checks)
- [ ] Bao phủ đủ cả 3 loại trạng thái: loading, error, empty
- [ ] Mọi điểm rẽ nhánh quyết định đều đã vẽ đủ cả hai nhánh
- [ ] Các điểm vào bao gồm toàn bộ các đường đi thực tế của người dùng
- [ ] Mục ngoài phạm vi (out-of-scope) được ghi rõ ràng
- [ ] Cấu trúc file Figma khớp với bản đồ màn hình

## Các Lỗi Cần Tránh (Anti-Patterns)

- [ ] Không chỉ lập kế hoạch cho mỗi luồng thuận lợi (happy path) — toàn bộ trạng thái lỗi, trạng thái trống và trường hợp biên đều phải được lập bản đồ trước khi bắt đầu thiết kế
- [ ] Không tạo bản đồ luồng không khớp với cấu trúc file Figma — cấu trúc trang (page structure) phải phản ánh đúng bản đồ luồng
- [ ] Không định nghĩa màn hình mà thiếu chỉ rõ các trạng thái bắt buộc — một màn hình không có các biến thể trạng thái là một phạm vi thiết kế chưa hoàn chỉnh
- [ ] Không bắt đầu thiết kế trước khi các điểm vào và điểm thoát được tài liệu hóa đầy đủ — ranh giới mập mờ sẽ gây phình phạm vi
- [ ] Không lên kế hoạch luồng người dùng mà không gắn từng bước về mục tiêu của người dùng — mọi màn hình đều phải chứng minh được lý do tồn tại của nó

## Ví dụ Câu lệnh Kích hoạt (Trigger Phrases)
- "Plan the user flow for [feature] in Figma"
- "What screens do I need to design for [feature]?"
- "Map out the states for [feature] before we start designing"
- "Help me structure my Figma file for [feature]"
- "What do we need to design before handing this to the developer?"

Chạy skill này trực tiếp trên trình duyệt: https://mohitagw15856.github.io/pm-claude-skills/skill/figma-user-flow-planner.html
