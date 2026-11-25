# Bản đồ skill – skill nào làm ra file nào

> **Giai đoạn:** 1 → 5 · **Skill:** demo-present (mục 4) · **Trạng thái:** Đang làm – cập nhật cuối mỗi Sprint · **Phụ trách:** Trần Ninh Nhật Tân (SM) · **Cập nhật:** 23/11/2026

Trang này trả lời câu hỏi "nhóm dùng skill nào để làm việc này". Mỗi dòng kiểm được: file có dòng `**Skill:**` khớp cột Skill; bằng chứng là commit. Phụ trách theo `docs/skill-standard.md` mục 5.

## 1. Cách truy vết

```
Giai đoạn → Skill (.agents/skills/<tên>/SKILL.md, mục) → Mẫu (templates/<mẫu>.md) → File đầu ra (dòng **Skill:**) → Commit / Pull Request
```

| Muốn kiểm | Lệnh / chỗ xem |
| :--- | :--- |
| File do skill nào làm | Dòng trạng thái ngay dưới tiêu đề: `**Skill:** <tên> (mục <x>)` |
| Commit dùng skill nào (từ 23/11/2026) | `git log --grep "Skill:" --pretty="%h %an %ad %s" --date=short` |
| Ai viết, sửa skill | `git log --pretty="%an %ad %s" --date=short -- .agents/skills/<tên>` |
| Mọi file đã có dòng Skill | `bash scripts/sync-skills.sh --check` |

**Ghi chú trung thực:** dòng `**Skill:**` được thêm ngày 23/11/2026 cho các file đã có trước đó (truy vết lại theo nội dung và commit). Mẫu `data-analysis.md`, `po-decision.md`, `screen-inventory.md`, `figma-plan.md`, `figma-gap-report.md`, `master-plan.md` được **rút ra từ file thật** của nhóm cùng ngày, để từ nay các file cùng loại tạo từ mẫu (AGENTS.md mục 2).

## 2. Skill → file đầu ra

| Giai đoạn | Skill (mục) | Mẫu | File đầu ra | Phụ trách | Bằng chứng (commit tạo) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 – Discovery | `user-research` (4) | — | [00-research-log.md](../discovery/00-research-log.md) | Thương, Kiệt | `21f7031` |
| 1 – Discovery | `product-discovery` (4) | `discovery-doc.md`, `backlog-row.md` | [01](../discovery/01-project-intake.md) – [07](../discovery/07-roadmap.md) (Problem, Persona, thị trường, Vision, Journey + Backlog, Roadmap) | Hoan (PO) | `3050364` |
| 2 – Design | `design-system` (4.4) | `screen-inventory.md` | [screen-inventory.md](../design/screen-inventory.md) – 161 khung, 18 luồng | Vy, Hưng | `4d6ce9c` |
| 2 – Design | `design-system` (4.4) | `figma-plan.md` | [figma-plan.md](../design/figma-plan.md) | Vy, Hưng | `d0fd95b` |
| 2 – Design | `design-system` (4.6) | `figma-gap-report.md` | [figma-gap-report.md](../design/figma-gap-report.md) | Vy, Hưng | `c71e3b8` |
| 2 – Design | `design-system` (4.4a) | `screen-spec.md` | [14 đặc tả màn hình](../design/screens/) | Vy, Hưng | `7a1dcfe`, `4029585`, `f4d53a4` |
| 2 – Design | `design-system` (4.4, 4.5) | — | File Figma (161 khung, prototype 18 luồng) – link ở [design/README.md](../design/README.md) · [prototype/home.html](../design/prototype/home.html) | Vy, Hưng | `4d6ce9c`, `5f8a2d9`, `4029585` |
| 2 – Design | `user-research` (4) | — (kết quả test sẽ dùng `prototype-test.md`) | [a3-test-guide.md](../evidence/prototype-tests/a3-test-guide.md) | Thương, Kiệt | `4029585` |
| 3 – Requirements | `product-requirements` (4.1) | `data-analysis.md` | [data-analysis.md](../requirements/data-analysis.md) – nguồn để tách và viết User Story | Bình Minh, Tiến, PA | `6fba12e` |
| 3 – Requirements | `product-requirements` (4.2) | `po-decision.md` | [po-decision-proposals.md](../requirements/po-decision-proposals.md) | PA, Bình Minh, Tiến | `4029585` |
| 3 – Requirements | `product-requirements` (4.3) | `prd.md` | PRD US01 – US08 | PA | Chưa có |
| 4 – Code | `tech-decision` (4.1, 4.3) | `adr.md`, `technical-design.md` | ADR-01, ADR-02, `technical-design.md` | Phát, Nghĩa, Bình Minh, Tiến | Chưa có |
| 4 – Code | `frontend-ui`, `budget-logic` | `screen-task.md`, `logic-task.md`, `pr-description.md` | Plan, code `src/`, Pull Request | Phát, Nghĩa, Bình Minh, Tiến | Chưa có |
| 5 – Present | `demo-present` (4) | `demo-script.md`, `final-report.md`, `skill-usage-map.md` | File này; kịch bản demo, báo cáo tổng kết | Tân (SM) | Chưa có |
| Xuyên suốt | `scrum-sprint` (4.1) | `master-plan.md` | [00-master-plan.md](../plans/00-master-plan.md) – Sprint chia theo User Story | Tân (SM), Hoan (PO) | `3ac15ad` |
| Xuyên suốt | `scrum-sprint` (4.2) | `sprint-review.md` | [sprint-0-review.md](../sprints/sprint-0-review.md) | Tân (SM) | `21f7031` |

## 3. Skill hỗ trợ và superpowers đã dùng

| Skill | Dùng ở đâu | Bằng chứng |
| :--- | :--- | :--- |
| `writing-skills` | Viết lại bộ skill nhóm theo 5 giai đoạn; thêm mẫu và trường `**Skill:**` | `7a1dcfe`, `2f6a664`, commit nhánh `docs/skill-traceability` |
| `brainstorming`, `writing-plans`, `test-driven-development`, … | Bước 4 của từng User Story | Chưa có – bắt đầu Sprint 2 |
| `frontend-design`, `ui-ux-pro-max` | Gợi ý khi dựng Figma và prototype | `Cần bổ sung` – ghi lại khi dùng |

## 4. Agent đã dùng

| Agent | Dùng cho | Bằng chứng |
| :--- | :--- | :--- |
| Claude Code | Dựng tài liệu discovery, đặc tả, phân tích dữ liệu, Figma (đọc và dựng theo yêu cầu), skill | Dòng `Co-Authored-By: Claude` ở 16/17 commit tới 23/11/2026 |
| Codex, Antigravity | `Cần bổ sung` | — |
