# Skill bên thứ ba

Skill lấy từ bên ngoài nằm chung trong `.agents/skills/` với skill của nhóm. File này ghi nguồn, phiên bản, giấy phép và mọi chỗ nhóm đã sửa. Giấy phép gốc ở `third_party/licenses/`.

## 1. Danh sách

| Skill | Nguồn | Phiên bản (commit) | Giấy phép | Ngày đưa vào | Giai đoạn dùng |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 12 skill superpowers (bảng mục 2) + `writing-skills` | https://github.com/obra/superpowers – Jesse Vincent | 7.0.2 – `22f0b463e7a5e579904dd6211a520321035526f7` | MIT | 14/11/2026 (`writing-skills`: 20/11/2026) | 4 – Vibe Code, sửa skill |
| `frontend-design` | https://github.com/anthropics/skills – Anthropic | `e4bb5d960d87126ff3b3a8af1a104b7db67560ba` | Apache-2.0 | 20/11/2026 | 2 – Design System & Prototype |
| `ui-ux-pro-max` | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill – Next Level Builder | `2de1134dc4d1cfe112934611ae5803ae17a1bd7e` | MIT | 20/11/2026 | 2 – Design System & Prototype, review giao diện |
| `restate-intent`, `feature-map`, `show-me`, `assess-idea`, `fix-root-cause`, `verify-change` | Dự án CreatorFlow (repo cá nhân) – Nguyễn Diên Tiến (ttienzy), thư mục `.claude/skills/` | `ed063481cda2e5e4bc41b4e8d3c1b823bf61167e` | MIT | 26/11/2026 | Mọi giai đoạn – cách làm việc với AI (mục 2a) |

## 2. Skill superpowers đã chọn

| Nhóm | Skill | Dùng trong dự án khi |
| :--- | :--- | :--- |
| Khởi động | `using-superpowers` | Đầu mỗi phiên |
| Thiết kế & lập kế hoạch | `brainstorming` | Có PRD đã duyệt, bắt đầu code: chốt thiết kế kỹ thuật |
| | `writing-plans` | Chia User Story thành task nhỏ có test |
| Thực thi | `executing-plans` | Làm theo plan trong phiên hiện tại (mặc định) |
| | `subagent-driven-development` | Làm theo plan bằng subagent (tốn token hơn) |
| | `using-git-worktrees` | Tách thư mục làm việc khi chạy plan |
| Chất lượng | `test-driven-development` | Code tính tiền: viết test trước |
| | `systematic-debugging` | Gặp lỗi: tìm nguyên nhân gốc trước khi sửa |
| | `verification-before-completion` | Trước khi báo "xong" |
| Review & merge | `requesting-code-review`, `receiving-code-review` | Mở / nhận review Pull Request |
| | `finishing-a-development-branch` | Xong nhánh |
| Viết skill | `writing-skills` | Viết hoặc sửa skill của nhóm |

## 2a. Skill cách làm việc (từ CreatorFlow)

Trạng thái **nháp** từ 26/11/2026: lên **chuẩn** sau ít nhất 2 lần dùng thật trong dự án mà không phải sửa lớn; lần nào phải sửa tay kết quả thì sửa skill ngay lần đó. Không ai dùng sau khoảng 1 tháng → gộp hoặc xoá.

| Skill | Dùng khi | Quan hệ với skill khác |
| :--- | :--- | :--- |
| `restate-intent` | Yêu cầu dài, nhiều ý, mơ hồ hoặc gõ vội: nhắc lại và chờ xác nhận trước khi làm | Chạy trước `brainstorming` và skill của nhóm |
| `feature-map` | Cần biết một User Story / màn hình đang ở đâu, đụng dữ liệu nào, đã có đặc tả, PRD, code chưa | Đầu vào cho `assess-idea`, `brainstorming` |
| `show-me` | Giải thích luồng, trạng thái, lựa chọn bằng hình thay vì đoạn văn | Dùng bên trong `feature-map`, `assess-idea` |
| `assess-idea` | Đánh giá một ý tưởng, A hay B, trước thay đổi lớn: đưa một đề xuất có bằng chứng | Việc thuộc quyền PO → câu `Qx` qua `product-requirements` 4.2 |
| `fix-root-cause` | Sửa lỗi, nhất là lỗi lặp lại: chặn bằng test / script thay vì thêm lời nhắc | Sau `systematic-debugging` (tìm nguyên nhân) |
| `verify-change` | Trước khi báo xong, commit, mở PR: bảng lệnh kiểm tra và khuôn báo cáo của Ví Khéo | Cụ thể hoá `verification-before-completion` |

Thứ tự cho việc lớn: `restate-intent` → `feature-map` → `show-me` (khi cần hình) → `assess-idea` → [người dùng / PO chốt] → làm → `verify-change`. Sửa lỗi: `systematic-debugging` → `fix-root-cause` → `verify-change`.

**Không đưa vào:** `dispatching-parallel-agents` (tốn chi phí, không cần cho MVP) · `diagnosing-superpowers` (dùng để báo lỗi cho tác giả superpowers).

## 3. Thay đổi so với bản gốc

| Skill | Thay đổi |
| :--- | :--- |
| `using-superpowers/SKILL.md` | Mục *Platform Adaptation* chỉ giữ Claude Code, Codex, Antigravity; thêm ghi chú `superpowers:<tên>` = skill `<tên>` trong repo |
| `using-superpowers/references/` | Giữ `claude-code-tools.md`, `codex-tools.md`, `antigravity-tools.md`; xoá file của các agent nhóm không dùng |
| `writing-skills/SKILL.md` | Dòng 12: thay link `gemini-tools.md` bằng `antigravity-tools.md`, thêm câu chỉ tới `docs/skill-standard.md` |
| `ui-ux-pro-max/SKILL.md` | Đổi đường dẫn script `${CLAUDE_PLUGIN_ROOT}/.claude/skills/ui-ux-pro-max/scripts/search.py` thành `.agents/skills/ui-ux-pro-max/scripts/search.py` (chạy từ thư mục gốc repo) |
| `ui-ux-pro-max` | Chỉ lấy thư mục `.claude/skills/ui-ux-pro-max` của repo gốc, không lấy các skill khác trong đó (`design-system`, `brand`, `slides`… – trùng tên hoặc ngoài phạm vi) |
| `frontend-design` | Giữ nguyên |
| 6 skill CreatorFlow (mục 2a) | Viết lại cho Ví Khéo: bỏ Electron, Flow/Muse/ChatGPT, ReactFlow, backend, e2e harness; thay bằng tầng tài liệu (Backlog → `data-analysis.md` → đặc tả → PRD → plan), `budget-logic`, `sync-skills.sh`, điện thoại thật (DoD), nhãn số liệu `[SƠ CẤP]`/`[THỨ CẤP]`/`[NHẬN ĐỊNH]`. Ví dụ đổi sang US03, `AddExpenseScreen`. Bỏ `README.md` của thư mục skill gốc, nội dung chuyển vào mục 2a |

Mục vị trí plan/spec của superpowers được ghi đè bằng `AGENTS.md` mục 3 (không sửa file skill).

## 4. Lưu ý

- `ui-ux-pro-max` cần Python 3 (không cần cài thêm thư viện). Script chỉ đọc dữ liệu CSV trong thư mục skill, không gọi mạng.
- `brainstorming` có "visual companion" (tuỳ chọn) tải logo từ máy chủ của tác giả để đếm lượt dùng. Tắt bằng biến môi trường `SUPERPOWERS_DISABLE_TELEMETRY=1`.
- Thư mục làm việc tạm `.superpowers/`, `.worktrees/` đã có trong `.gitignore`.

## 5. Cập nhật phiên bản

1. Chép lại thư mục skill từ repo gốc vào `.agents/skills/` (ghi đè).
2. Làm lại các thay đổi ở mục 3.
3. Cập nhật cột "Phiên bản" ở mục 1.
4. Chạy `bash scripts/sync-skills.sh`, commit trên nhánh `docs/update-<skill-name>`.
