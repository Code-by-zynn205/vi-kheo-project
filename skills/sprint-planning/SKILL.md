---
name: sprint-planning
description: Lập kế hoạch sprint — khoanh phạm vi công việc, ước lượng năng lực, đặt mục tiêu và phác thảo kế hoạch sprint. Sử dụng khi khởi động một sprint mới, căn chỉnh backlog theo thời gian khả dụng của đội ngũ (tính cả nghỉ phép PTO và họp hành), quyết định đâu là P0 và đâu là phần mở rộng (stretch), hoặc xử lý phần việc dở dang (carryover) từ sprint trước.
argument-hint: "[tên sprint hoặc khoảng ngày]"
---

# /sprint-planning — Lập kế hoạch Sprint

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/product-management/skills/sprint-planning/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra các công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Lập kế hoạch một sprint bằng cách khoanh phạm vi công việc, ước lượng năng lực đội ngũ và thiết lập mục tiêu rõ ràng.

## Cách sử dụng

```
/sprint-planning $ARGUMENTS
```

## Cách thức hoạt động

```
┌─────────────────────────────────────────────────────────────────┐
│                    SPRINT PLANNING                                 │
├─────────────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                                       │
│  ✓ Define sprint goals and success criteria                     │
│  ✓ Estimate team capacity (accounting for PTO, meetings)        │
│  ✓ Scope and prioritize backlog items                           │
│  ✓ Identify dependencies and risks                              │
│  ✓ Generate sprint plan document                                │
├─────────────────────────────────────────────────────────────────┤
│  SUPERCHARGED (when you connect your tools)                      │
│  + Project tracker: Pull backlog, create sprint, assign items   │
│  + Calendar: Account for PTO and meetings in capacity           │
│  + Chat: Share sprint plan with the team                        │
└─────────────────────────────────────────────────────────────────┘
```

## Thông tin tôi cần từ bạn

- **Đội ngũ (Team)**: Ai tham gia và mức độ sẵn sàng của họ trong sprint này ra sao?
- **Độ dài sprint**: Bao nhiêu ngày/tuần?
- **Backlog**: Những gì đang được ưu tiên? (Kéo từ tracker, dán vào hoặc mô tả)
- **Carryover**: Có đầu việc nào chưa xong từ sprint trước không?
- **Phụ thuộc**: Có việc gì đang bị chặn bởi các đội ngũ khác không?

## Đầu ra

```markdown
## Sprint Plan: [Sprint Name]
**Dates:** [Start] — [End] | **Team:** [X] engineers
**Sprint Goal:** [One clear sentence about what success looks like]

### Capacity
| Person | Available Days | Allocation | Notes |
|--------|---------------|------------|-------|
| [Name] | [X] of [Y] | [X] points/hours | [PTO, on-call, etc.] |
| **Total** | **[X]** | **[X] points** | |

### Sprint Backlog
| Priority | Item | Estimate | Owner | Dependencies |
|----------|------|----------|-------|--------------|
| P0 | [Must ship] | [X] pts | [Person] | [None / Blocked by X] |
| P1 | [Should ship] | [X] pts | [Person] | [None] |
| P2 | [Stretch] | [X] pts | [Person] | [None] |

### Planned Capacity: [X] points | Sprint Load: [X] points ([X]% of capacity)

### Risks
| Risk | Impact | Mitigation |
|------|--------|------------|
| [Risk] | [What happens] | [What to do] |

### Definition of Done
- [ ] Code reviewed and merged
- [ ] Tests passing
- [ ] Documentation updated (if applicable)
- [ ] Product sign-off

### Key Dates
| Date | Event |
|------|-------|
| [Date] | Sprint start |
| [Date] | Mid-sprint check-in |
| [Date] | Sprint end / Demo |
| [Date] | Retro |
```

## Mẹo thực hành

1. **Chừa vùng đệm (buffer)** — Chỉ lên kế hoạch khoảng 70-80% năng lực. Chắc chắn sẽ có việc phát sinh xen ngang.
2. **Một mục tiêu sprint rõ ràng duy nhất** — Nếu bạn không thể phát biểu nó trong một câu, sprint đó đang bị mất trọng tâm.
3. **Xác định sẵn các hạng mục stretch** — Biết trước cần cắt phần nào nếu mọi việc kéo dài hơn dự kiến.
4. **Xử lý carryover một cách trung thực** — Nếu một việc không kịp phát hành ở sprint trước, hãy hiểu rõ lý do tại sao trước khi cam kết lại.
