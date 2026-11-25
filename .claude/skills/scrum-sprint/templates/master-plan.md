# Kế hoạch tổng thể – Sprint theo User Story

> **Giai đoạn:** 1 → 5 · **Skill:** scrum-sprint (mục 4.1) · **Trạng thái:** Đề xuất – chờ Sprint Planning thống nhất · **Phụ trách:** <SM>, <PO> · **Cập nhật:** <dd/mm/yyyy>

<!-- Mỗi Sprint được chia theo User Story: một dòng US đi hết chuỗi Dữ liệu → Đặc tả màn hình → PRD → Spec + plan → Code + PR → Done. Việc không thuộc US nào (nghiên cứu, ADR, báo cáo) là "việc hỗ trợ" và phải ghi nó mở khoá US nào. -->

## 1. Hiện trạng ngày <dd/mm/yyyy>

| Giai đoạn | Đã có | Còn thiếu | Chặn User Story nào |
| :--- | :--- | :--- | :--- |
| 1 – Discovery | <...> | <...> | <...> |
| 2 – Design | <...> | <...> | <...> |
| 3 – Requirements | <...> | <...> | <...> |
| 4 – Code | <...> | <...> | <...> |

## 2. Chuỗi việc của một User Story

<!-- Mỗi bước có skill và file đầu ra – đây cũng là câu trả lời khi được hỏi "dùng skill nào". -->

| Bước | Việc | Skill | Đầu ra | Cổng (phải có trước) |
| :-: | :--- | :--- | :--- | :--- |
| 1 | Dữ liệu của story | `product-requirements` (4.1) | Dòng USxx trong `data-analysis.md` mục 11 | Backlog đã duyệt |
| 2 | Đặc tả màn hình | `design-system` (4.4, 4.4a) | `docs/design/screens/<ScreenName>.md` `Xong` | Bước 1 |
| 3 | PRD | `product-requirements` (4.3) | `docs/requirements/USxx-<english-slug>.md` `Đã duyệt` | Bước 2 · câu hỏi PO của story đã chốt |
| 4 | Spec + plan | `frontend-ui`, `budget-logic`, `brainstorming`, `writing-plans` | `docs/plans/specs/…-USxx-…-design.md`, `docs/plans/…-USxx-…md` | Bước 3 · ADR nền tảng + `technical-design.md` |
| 5 | Code + Pull Request | `frontend-ui`, `budget-logic`, `test-driven-development`, `requesting-code-review` | Code trong `src/`, PR | Bước 4 |
| 6 | Done | `verification-before-completion`, `scrum-sprint` | AC Đạt trên điện thoại thật, thẻ Trello Done | DoD `07-roadmap.md` |

## 3. Sprint <N> (<dd/mm> – <dd/mm/yyyy>) – <Sprint Goal ngắn>

**Sprint Goal:** <một câu, người dùng làm được gì sau Sprint>

### 3.1 User Story (việc chính)

<!-- Mỗi ô ghi hạn hoặc trạng thái (Xong / Đang làm / Chưa làm). Story chưa thể code trong Sprint này vẫn ghi để thấy bước nào chuẩn bị trước. -->

| Story | SP | Dữ liệu | Đặc tả màn hình | PRD | Spec + plan | Code + PR | Người code · review |
| :--- | :-: | :--- | :--- | :--- | :--- | :--- | :--- |
| US<xx> <tên> | <x> | <Xong> | `<ScreenName>` (<dd/mm>) | <dd/mm> | <dd/mm> | <dd/mm> | <tên> · <tên> |

**Story Point cam kết:** <x>

### 3.2 Việc hỗ trợ (mở khoá User Story)

| Mã | Việc | Skill | Đầu ra | Mở khoá | Phụ trách | Hạn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| <K1> | <...> | <tech-decision> | <file> | US<xx> bước <4> | <tên> | <dd/mm> |

## 4. Thứ tự User Story và lý do

| Thứ tự | Story | Sprint | Phụ thuộc | Vì sao đứng ở đây |
| :-: | :--- | :--- | :--- | :--- |
| 1 | US<xx> | <x> | <...> | <...> |

## 5. Rủi ro lịch

| Mã | Rủi ro | Dấu hiệu | Cách xử lý (PO/SM quyết) |
| :--- | :--- | :--- | :--- |
| R1 | <...> | <...> | <...> |
