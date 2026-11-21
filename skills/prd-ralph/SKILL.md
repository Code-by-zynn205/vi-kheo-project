---
name: prd-ralph
description: "Tạo Tài liệu Yêu cầu Sản phẩm (PRD) cho một tính năng mới. Sử dụng khi lập kế hoạch tính năng, bắt đầu dự án mới hoặc khi được yêu cầu tạo PRD. Kích hoạt qua: create a prd, write prd for, plan this feature, requirements for, spec out (hoặc các yêu cầu viết PRD tương ứng bằng tiếng Việt)."
user-invocable: true
---

# Trình tạo PRD (PRD Generator)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [snarktank/ralph](https://github.com/snarktank/ralph/blob/main/skills/prd/SKILL.md) (snarktank/ralph).

Tạo các Tài liệu Yêu cầu Sản phẩm (PRD) chi tiết, rõ ràng, khả thi và sẵn sàng cho việc triển khai.

---

## Nhiệm vụ

1. Tiếp nhận mô tả tính năng từ người dùng
2. Đặt 3-5 câu hỏi làm rõ thiết yếu (kèm các lựa chọn đánh chữ cái)
3. Tạo một bản PRD có cấu trúc dựa trên câu trả lời
4. Lưu vào `tasks/prd-[feature-name].md`

**Quan trọng:** KHÔNG bắt đầu lập trình/triển khai. Chỉ tạo tài liệu PRD.

---

## Bước 1: Câu hỏi làm rõ

Chỉ hỏi những câu hỏi then chốt tại các điểm mà đề bài ban đầu còn mơ hồ. Tập trung vào:

- **Vấn đề/Mục tiêu:** Tính năng này giải quyết vấn đề gì?
- **Chức năng cốt lõi:** Các hành động chính là gì?
- **Phạm vi/Ranh giới:** Tính năng này KHÔNG nên làm gì?
- **Tiêu chí thành công:** Làm sao chúng ta biết nó đã hoàn thành?

### Định dạng câu hỏi như sau:

```
1. What is the primary goal of this feature?
   A. Improve user onboarding experience
   B. Increase user retention
   C. Reduce support burden
   D. Other: [please specify]

2. Who is the target user?
   A. New users only
   B. Existing users only
   C. All users
   D. Admin users only

3. What is the scope?
   A. Minimal viable version
   B. Full-featured implementation
   C. Just the backend/API
   D. Just the UI
```

Cách trình bày này giúp người dùng có thể trả lời nhanh kiểu "1A, 2C, 3B" để lặp nhanh. Nhớ thụt lề các lựa chọn.

---

## Bước 2: Cấu trúc PRD

Tạo PRD với các phần sau:

### 1. Giới thiệu / Tổng quan (Introduction/Overview)
Mô tả ngắn gọn về tính năng và vấn đề nó giải quyết.

### 2. Mục tiêu (Goals)
Các mục tiêu cụ thể, đo lường được (danh sách gạch đầu dòng).

### 3. User Stories
Mỗi story cần có:
- **Tiêu đề (Title):** Tên mô tả ngắn gọn
- **Mô tả (Description):** "Là một [người dùng], tôi muốn [tính năng] để [lợi ích]"
- **Tiêu chí nghiệm thu (Acceptance Criteria):** Danh sách kiểm tra có thể xác minh được thế nào là "hoàn thành"

Mỗi story phải đủ nhỏ gọn để có thể triển khai trong một phiên làm việc tập trung.

**Định dạng:**
```markdown
### US-001: [Title]
**Description:** As a [user], I want [feature] so that [benefit].

**Acceptance Criteria:**
- [ ] Specific verifiable criterion
- [ ] Another criterion
- [ ] Typecheck/lint passes
- [ ] **[UI stories only]** Verify in browser using dev-browser skill
```

**Quan trọng:** 
- Tiêu chí nghiệm thu phải xác minh được, không mơ hồ. "Hoạt động đúng" là chưa đạt. "Nút bấm hiển thị hộp thoại xác nhận trước khi xóa" mới là đạt.
- **Đối với bất kỳ story nào có thay đổi giao diện (UI):** Luôn đưa vào tiêu chí nghiệm thu dòng "Verify in browser using dev-browser skill". Điều này đảm bảo việc kiểm chứng trực quan cho phần việc frontend.

### 4. Yêu cầu chức năng (Functional Requirements)
Danh sách đánh số các chức năng cụ thể:
- "FR-1: Hệ thống phải cho phép người dùng..."
- "FR-2: Khi người dùng nhấn X, hệ thống phải..."

Phải diễn đạt tường minh và không gây hiểu nhầm.

### 5. Phi mục tiêu — Ngoài phạm vi (Non-Goals / Out of Scope)
Những gì tính năng này sẽ KHÔNG bao gồm. Cực kỳ quan trọng để kiểm soát phạm vi.

### 6. Cân nhắc thiết kế (Tùy chọn)
- Yêu cầu UI/UX
- Liên kết tới mockup nếu có sẵn
- Các component hiện có phù hợp để tái sử dụng

### 7. Cân nhắc kỹ thuật (Tùy chọn)
- Các ràng buộc hoặc phụ thuộc đã biết
- Các điểm tích hợp với hệ thống hiện tại
- Yêu cầu về hiệu năng

### 8. Chỉ số thành công (Success Metrics)
Thành công sẽ được đo lường như thế nào?
- "Giảm 50% thời gian hoàn thành X"
- "Tăng tỷ lệ chuyển đổi thêm 10%"

### 9. Câu hỏi mở (Open Questions)
Các câu hỏi còn lại hoặc những mảng cần làm rõ thêm.

---

## Cách viết cho Lập trình viên mới (Junior Developers)

Người đọc PRD có thể là một lập trình viên mới hoặc một AI agent. Do đó:

- Diễn đạt tường minh và không mơ hồ
- Tránh thuật ngữ khó hiểu hoặc giải thích rõ nếu dùng
- Cung cấp đủ chi tiết để hiểu mục đích và logic cốt lõi
- Đánh số các yêu cầu để dễ tham chiếu
- Dùng ví dụ cụ thể ở những chỗ hữu ích

---

## Đầu ra

- **Định dạng:** Markdown (`.md`)
- **Vị trí:** `tasks/`
- **Tên file:** `prd-[feature-name].md` (dạng kebab-case)

---

## Ví dụ PRD

```markdown
# PRD: Task Priority System

## Introduction

Add priority levels to tasks so users can focus on what matters most. Tasks can be marked as high, medium, or low priority, with visual indicators and filtering to help users manage their workload effectively.

## Goals

- Allow assigning priority (high/medium/low) to any task
- Provide clear visual differentiation between priority levels
- Enable filtering and sorting by priority
- Default new tasks to medium priority

## User Stories

### US-001: Add priority field to database
**Description:** As a developer, I need to store task priority so it persists across sessions.

**Acceptance Criteria:**
- [ ] Add priority column to tasks table: 'high' | 'medium' | 'low' (default 'medium')
- [ ] Generate and run migration successfully
- [ ] Typecheck passes

### US-002: Display priority indicator on task cards
**Description:** As a user, I want to see task priority at a glance so I know what needs attention first.

**Acceptance Criteria:**
- [ ] Each task card shows colored priority badge (red=high, yellow=medium, gray=low)
- [ ] Priority visible without hovering or clicking
- [ ] Typecheck passes
- [ ] Verify in browser using dev-browser skill

### US-003: Add priority selector to task edit
**Description:** As a user, I want to change a task's priority when editing it.

**Acceptance Criteria:**
- [ ] Priority dropdown in task edit modal
- [ ] Shows current priority as selected
- [ ] Saves immediately on selection change
- [ ] Typecheck passes
- [ ] Verify in browser using dev-browser skill

### US-004: Filter tasks by priority
**Description:** As a user, I want to filter the task list to see only high-priority items when I'm focused.

**Acceptance Criteria:**
- [ ] Filter dropdown with options: All | High | Medium | Low
- [ ] Filter persists in URL params
- [ ] Empty state message when no tasks match filter
- [ ] Typecheck passes
- [ ] Verify in browser using dev-browser skill

## Functional Requirements

- FR-1: Add `priority` field to tasks table ('high' | 'medium' | 'low', default 'medium')
- FR-2: Display colored priority badge on each task card
- FR-3: Include priority selector in task edit modal
- FR-4: Add priority filter dropdown to task list header
- FR-5: Sort by priority within each status column (high to medium to low)

## Non-Goals

- No priority-based notifications or reminders
- No automatic priority assignment based on due date
- No priority inheritance for subtasks

## Technical Considerations

- Reuse existing badge component with color variants
- Filter state managed via URL search params
- Priority stored in database, not computed

## Success Metrics

- Users can change priority in under 2 clicks
- High-priority tasks immediately visible at top of lists
- No regression in task list performance

## Open Questions

- Should priority affect task ordering within a column?
- Should we add keyboard shortcuts for priority changes?
```

---

## Danh sách kiểm tra (Checklist)

Trước khi lưu PRD:

- [ ] Đã hỏi các câu hỏi làm rõ kèm lựa chọn đánh chữ cái
- [ ] Đã đưa câu trả lời của người dùng vào tài liệu
- [ ] Các user story nhỏ gọn và cụ thể
- [ ] Các yêu cầu chức năng được đánh số và không mơ hồ
- [ ] Phần Non-goals xác định ranh giới rõ ràng
- [ ] Đã lưu vào `tasks/prd-[feature-name].md`
