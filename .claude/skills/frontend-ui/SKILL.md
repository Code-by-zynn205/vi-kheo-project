---
name: frontend-ui
description: Quy trình lập trình giao diện Ví Khéo theo từng User Story – chốt công nghệ, cấu trúc thư mục src, đi từ PRD đã duyệt qua brainstorming và writing-plans tới code, ghép giao diện từ design-system với hàm từ budget-logic, kiểm AC trên điện thoại thật, mở Pull Request. Dùng khi bắt đầu code một User Story, viết plan có màn hình, tạo màn hình mới, sửa lỗi giao diện, hoặc đóng gói bản build dùng thử.
---

# Skill: Frontend UI – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính | User Story |
| :--- | :--- | :--- | :--- |
| 4 – Vibe Code | Sprint 1 (15/11 – 23/11) | Chốt công nghệ, dựng dự án, `HomeScreen` khung, `AddExpenseScreen` | US01 |
| 4 – Vibe Code | Sprint 2 (24/11 – 03/12) | `BudgetScreen`, `DailyAllowanceCard` có màu, ghi khoản thu · **bản build dùng thử trước 03/12** | US02, US03, US07 |
| 4 – Vibe Code | Sprint 3 (04/12 – 12/12) | `ReportScreen`, nhắc nhở 21:00, sửa/xoá giao dịch | US04, US05, US06 |

- **Phụ trách chính:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa
- **Review:** Lê Thị Nhật Vy, Phạm Viết Hưng (soát giao diện theo `design-system`)

## 2. Khi nào dùng / không dùng

**Dùng khi:** bắt đầu code một User Story · viết plan có màn hình · tạo màn hình · sửa lỗi giao diện · đóng gói bản build.

**Không dùng khi:** chọn màu, kích thước, bố cục (→ `design-system`) · viết công thức tính tiền (→ `budget-logic`) · User Story chưa có PRD `Đã duyệt` (→ `product-requirements`).

## 3. Đầu vào (đọc đủ trước khi code)

1. `docs/requirements/USxx-*.md` – PRD **đã duyệt**: AC, test case, ngoài phạm vi, skill áp dụng
2. `docs/design/screens/*.md` – đặc tả màn hình trong PRD
3. `.agents/skills/design-system/SKILL.md` mục 4.2, 4.3 – token, component
4. `.agents/skills/budget-logic/SKILL.md` mục 4 – kiểu dữ liệu và hàm cần gọi

## 4. Quy trình

### 4.1 Quyết định công nghệ `[Sprint 1 – chốt tại Sprint Planning]`

**Trạng thái: Cần bổ sung.** Nhóm chọn 1 phương án, điền dòng "Đã chốt" và commit.

| Phương án | Ưu | Nhược |
| :--- | :--- | :--- |
| Web app chạy trên điện thoại (PWA: React + Vite) | Dễ nhất, AI sinh code tốt, prototype HTML dùng lại được, lưu `localStorage` | Nhắc 21:00 (US05) trên iPhone bị hạn chế |
| React Native (Expo) | App thật, thông báo cục bộ dễ, cài qua Expo Go | Cần cài môi trường |
| Flutter | App thật, giao diện mượt | Dart, ít thành viên quen |

**Đã chốt:** `<công nghệ>` – ngày `<dd/mm>` – lý do: `<...>`
**Lệnh chạy app:** `<...>` · **Lệnh chạy unit test:** `<...>` · **Lệnh build:** `<...>`

### 4.2 Cấu trúc thư mục

```
src/
├── theme/          token (màu, chữ, khoảng cách) – chép đúng từ design-system mục 4.2
├── components/     component trong design-system mục 4.3
├── screens/        HomeScreen, AddExpenseScreen, BudgetScreen, ReportScreen
├── logic/          code của budget-logic – KHÔNG gọi giao diện
├── storage/        lớp lưu trữ cục bộ
└── utils/          formatMoney ('35.000đ'), ngày tháng
```

Màn hình chỉ gọi `logic/` và `storage/`, không tự tính tiền.

### 4.3 Làm một User Story – từ PRD tới Pull Request

| Bước | Việc | Skill | File sinh ra |
| :-: | :--- | :--- | :--- |
| 1 | Kiểm tra PRD có trạng thái `Đã duyệt`, không còn câu hỏi mở | — | — |
| 2 | Tạo nhánh `feature/USxx-<mô-tả>` | `using-git-worktrees` (tuỳ chọn) | — |
| 3 | Làm rõ cách làm với AI, chốt thiết kế kỹ thuật | `brainstorming` | `docs/plans/specs/YYYY-MM-DD-USxx-<mô-tả>-design.md` |
| 4 | Viết plan: phần đầu có PRD và skill áp dụng; Global Constraints chép mục 6 của từng skill nhóm liên quan; task giao diện theo `templates/screen-task.md`, task tính tiền theo `budget-logic/templates/logic-task.md` | `writing-plans` | `docs/plans/YYYY-MM-DD-USxx-<mô-tả>.md` |
| 5 | Làm theo plan, mỗi task một commit | `executing-plans` | code trong `src/` |
| 6 | Chạy trên **điện thoại thật**, đi lần lượt từng AC | `verification-before-completion` | — |
| 7 | Mở Pull Request theo `templates/pr-description.md` | `requesting-code-review` | — |
| 8 | Cặp UI/UX soát giao diện; 1 người cặp dữ liệu soát chỗ gọi hàm | `receiving-code-review` | — |
| 9 | Merge, chuyển thẻ Trello sang Done, cập nhật cột "Plan" trong `docs/requirements/README.md` | `finishing-a-development-branch` | — |

Mẫu yêu cầu cho AI ở bước 3–4:

```
Dùng skill frontend-ui. Làm US01 theo PRD docs/requirements/US01-ghi-khoan-chi.md.
Brainstorming trước, rồi writing-plans. Plan phải có phần đầu và Global Constraints
theo AGENTS.md mục 3.
```

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/plans/specs/YYYY-MM-DD-USxx-<mô-tả>-design.md` | theo `brainstorming` | Người làm + 1 người cùng cặp |
| `docs/plans/YYYY-MM-DD-USxx-<mô-tả>.md` | theo `writing-plans` + `templates/screen-task.md` | Người làm + 1 người cùng cặp |
| Code trong `src/` | — | Review chéo (mục 4.3 bước 8) |
| Mô tả Pull Request | `templates/pr-description.md` | — |

## 6. Khi viết plan

**Ràng buộc (chép vào Global Constraints):**
- Chỉ làm AC trong PRD; mục "Ngoài phạm vi" của PRD là cấm.
- Màn hình nằm trong `src/screens/`, chỉ gọi `src/logic/` và `src/storage/`, không tự tính tiền.
- Không thêm thư viện UI lớn (bộ component, framework CSS) khi chưa thống nhất ở Sprint Planning.
- Không commit khoá API, file build, `node_modules`.

**Task bắt buộc:**
- Mỗi màn hình là một task theo `templates/screen-task.md`.
- Task cuối: chạy trên điện thoại thật, đi từng AC của PRD, ghi kết quả vào mô tả Pull Request.

**Lệnh kiểm tra:**
- Lệnh chạy unit test (mục 4.1) → pass.
- Lệnh build (mục 4.1) → không lỗi.

## 7. Quy tắc bắt buộc

1. Không code User Story chưa có PRD `Đã duyệt`.
2. Không thêm màn hình, nút, thư viện UI lớn ngoài phạm vi User Story.
3. Không viết cứng màu/cỡ chữ trong màn hình – dùng token.
4. Không dán code AI sinh ra mà chưa chạy thử.
5. Không commit khoá API, file build, `node_modules`.

## 8. Checklist trước khi mở Pull Request

- [ ] Mọi AC trong PRD đều đạt trên điện thoại thật
- [ ] Ghi một khoản chi ≤ 3 thao tác, < 5 giây (nếu liên quan)
- [ ] Không có màu/cỡ chữ viết cứng
- [ ] Không lỗi khi chưa có dữ liệu (lần đầu mở app)
- [ ] Mô tả Pull Request theo mẫu, có ảnh chụp, có link PRD và plan
