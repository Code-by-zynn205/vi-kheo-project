# Ví Khéo – Ứng dụng quản lý chi tiêu tối giản cho sinh viên

Dự án môn **Chuyên đề 3 (IT): Quản lý dự án với Agile/Scrum** · Giảng viên: **Nguyễn Thanh Yên Tùng**
Nhóm **Messi** – 10 thành viên: PO Dương Văn Hoan · SM Trần Ninh Nhật Tân · 8 Developers

> **Sản phẩm trong một câu:** Ghi một khoản chi trong dưới 5 giây và luôn biết *"Hôm nay còn được tiêu bao nhiêu"*.

## 1. Năm giai đoạn

| # | Giai đoạn                            | Đầu ra                                                           | Skill AI                                                     | Trạng thái                   |
| :-: | :------------------------------------- | :----------------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------- |
| 1 | Research & Discovery                   | [docs/discovery/](docs/discovery/), [docs/evidence/](docs/evidence/) | `user-research`, `product-discovery`                     | Xong (còn mục Cần bổ sung) |
| 2 | Design System & Prototype              | [docs/design/](docs/design/)                                        | `design-system` (+ `frontend-design`, `ui-ux-pro-max`) | Đang làm                     |
| 3 | Product Requirements (PRD, User Story) | [docs/requirements/](docs/requirements/)                            | `product-requirements`                                     | Chưa làm                     |
| 4 | Vibe Code                              | [docs/architecture/](docs/architecture/), [docs/plans/](docs/plans/), `src/` | `tech-decision`, `frontend-ui`, `budget-logic` + superpowers | Chưa làm                     |
| 5 | Present full product                   | [docs/present/](docs/present/)                                      | `demo-present`                                             | Chưa làm                     |
| — | Mỗi Sprint                            | [docs/sprints/](docs/sprints/)                                      | `scrum-sprint`                                             | Đang làm                     |

Trước User Story đầu tiên: **chọn công nghệ (ADR) → thiết kế kỹ thuật**. Mỗi User Story đi qua: **đặc tả màn hình → PRD (PO duyệt) → spec + plan → code → Pull Request**. Lịch Sprint: [docs/discovery/07-roadmap.md](docs/discovery/07-roadmap.md).

## 2. Cấu trúc thư mục

```
vi-kheo-project/
├── AGENTS.md              hướng dẫn và QUY TẮC BẮT BUỘC cho AI (Codex, Antigravity đọc trực tiếp)
├── CLAUDE.md              trỏ về AGENTS.md cho Claude Code
├── CONTRIBUTING.md        nhánh, commit, Pull Request
├── .agents/skills/        NGUỒN GỐC của mọi skill (Codex, Antigravity) – sửa ở đây
├── .claude/skills/        bản sao cho Claude Code – sinh bằng script, không sửa tay
├── scripts/sync-skills.sh kiểm tra skill + chép sang .claude/skills
├── third_party/           nguồn, phiên bản, giấy phép của skill bên ngoài
└── docs/
    ├── skill-standard.md  chuẩn viết skill của nhóm + ai phụ trách skill nào
    ├── discovery/         1 – vấn đề, persona, thị trường, tầm nhìn, Backlog, lộ trình
    ├── evidence/          1 – khảo sát, phỏng vấn, test prototype (không có dữ liệu cá nhân)
    ├── design/            2 – đặc tả màn hình, prototype HTML
    ├── requirements/      3 – PRD từng User Story
    ├── architecture/      4 – ADR chọn công nghệ, thiết kế kỹ thuật
    ├── plans/             4 – spec và plan khi code
    ├── present/           5 – kịch bản demo, báo cáo tổng kết
    └── sprints/           planning và review từng Sprint
```

## 3. Skill AI

| Loại                               | Skill                                                                                                                                                                                                                                                                                                                                                                        |
| :---------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Của nhóm (9)                      | `user-research` · `product-discovery` · `design-system` · `product-requirements` · `tech-decision` · `frontend-ui` · `budget-logic` · `scrum-sprint` · `demo-present` – chuẩn và người phụ trách: [docs/skill-standard.md](docs/skill-standard.md)                                                                                                                |
| Thiết kế (2)                      | `frontend-design` (Anthropic) · `ui-ux-pro-max` (Next Level Builder)                                                                                                                                                                                                                                                                                                    |
| Quy trình code – superpowers (13) | `using-superpowers` · `brainstorming` · `writing-plans` · `executing-plans` · `subagent-driven-development` · `using-git-worktrees` · `test-driven-development` · `systematic-debugging` · `verification-before-completion` · `requesting-code-review` · `receiving-code-review` · `finishing-a-development-branch` · `writing-skills` |

Nguồn và giấy phép skill bên ngoài: [third_party/README.md](third_party/README.md).

Ví dụ yêu cầu cho AI:

```
Dùng skill product-requirements, viết PRD cho US01 từ docs/discovery/06-journey-features.md
và docs/design/screens/AddExpenseScreen.md.
```

```
Dùng skill frontend-ui. Làm US01 theo PRD docs/requirements/US01-ghi-khoan-chi.md:
brainstorming trước, rồi writing-plans.
```

## 4. Công cụ

| Việc                              | Công cụ                                                                            |
| :--------------------------------- | :----------------------------------------------------------------------------------- |
| Quản lý Sprint, thẻ công việc | Trello                                                                               |
| Tài liệu, skill AI, mã nguồn   | GitHub (repo này)                                                                   |
| AI agent                           | Codex · Antigravity · Claude Code                                                  |
| Khảo sát                         | Google Form + Google Sheets                                                          |
| Thiết kế giao diện              | Không dùng Figma – đặc tả `.md` + prototype HTML từ skill `design-system` |
| Slide báo cáo                    | Canva                                                                                |

## 5. Quy ước

| Trạng thái                                      |  | Nguồn dữ liệu   | Ý nghĩa                                             |
| :------------------------------------------------ | :-: | :----------------- | :---------------------------------------------------- |
| Xong · Đang làm · Chưa làm · Cần bổ sung |  | `[SƠ CẤP]`     | Nhóm tự thu thập                                   |
| (PRD) Nháp · Chờ duyệt · Đã duyệt         |  | `[THỨ CẤP]`    | Tài liệu đã công bố, có trích dẫn            |
|                                                   |  | `[NHẬN ĐỊNH]` | Ý kiến/giả thuyết của nhóm, chưa là số liệu |
