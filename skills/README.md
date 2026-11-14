# Bộ Skill AI – Ví Khéo

Skill là một file hướng dẫn (`SKILL.md`) để AI Agent (Claude Code, Copilot…) làm đúng một việc theo đúng quy trình và dữ liệu của nhóm, thay vì tự bịa. Mỗi Skill nằm trong một thư mục riêng: `skills/<tên-skill>/SKILL.md`.

## 1. Danh sách Skill theo giai đoạn

| # | Skill | Giai đoạn | AI dùng Skill này để… | Phụ trách chính | Review chéo |
| :-: | :--- | :--- | :--- | :--- | :--- |
| 1 | [user-research](user-research/SKILL.md) | GĐ1 – Sprint 0 (và Sprint 1–3 khi test A3, dùng thử A4) | Tổng hợp khảo sát, phỏng vấn, nhật ký chi tiêu thành bằng chứng có nguồn | Nguyễn Thị Thương, Nguyễn Tuấn Kiệt | Dương Văn Hoan (PO) |
| 2 | [product-discovery](product-discovery/SKILL.md) | GĐ1 – Sprint 0 | Viết Problem, Persona, Market, Vision, HMW, **Generate Features**, Backlog | Dương Văn Hoan (PO) | Trần Ninh Nhật Tân (SM) |
| 3 | [design-system](design-system/SKILL.md) | GĐ2 – Sprint 1 → 3 | Sinh giao diện đúng màu, chữ, component, 4 màn hình (không qua Figma) | Lê Thị Nhật Vy, Phạm Viết Hưng | Lê Thị Phát, Nguyễn Đức Minh Nghĩa |
| 4 | [frontend-ui](frontend-ui/SKILL.md) | GĐ2 – Sprint 1 → 3 | Lập trình màn hình theo User Story và tiêu chí chấp nhận | Lê Thị Phát, Nguyễn Đức Minh Nghĩa | Lê Thị Nhật Vy, Phạm Viết Hưng |
| 5 | [budget-logic](budget-logic/SKILL.md) | GĐ2 – Sprint 1 → 3 | Lưu dữ liệu, tính "Hôm nay còn được tiêu", thống kê theo danh mục | Nguyễn Thị Bình Minh, Nguyễn Diên Tiến | Nguyễn Đức Minh Nghĩa |
| 6 | [scrum-sprint](scrum-sprint/SKILL.md) | Xuyên suốt (mỗi Sprint) | Lập Sprint Planning, báo cáo tuần, Review, Retro từ Trello | Trần Ninh Nhật Tân (SM) | Dương Văn Hoan (PO) |

**Cả 10 thành viên đều phụ trách hoặc review ít nhất 1 Skill.** Bằng chứng đóng góp là lịch sử commit trên GitHub (`git log -- skills/<tên-skill>`), không phải danh sách tên trong file này. Xem [CONTRIBUTING.md](../CONTRIBUTING.md).

## 2. Thành phần chuẩn của một Skill

Mọi `SKILL.md` trong dự án đều có đủ 8 thành phần theo cùng thứ tự:

| # | Thành phần | Nội dung | Vì sao cần |
| :-: | :--- | :--- | :--- |
| 1 | **Frontmatter** (`name`, `description`) | Tên skill + mô tả khi nào AI nên dùng | AI đọc phần này để quyết định có gọi skill hay không |
| 2 | **Giai đoạn & phụ trách** | Sprint áp dụng, người phụ trách, người review | Biết skill dùng lúc nào và ai chịu trách nhiệm |
| 3 | **Khi nào dùng / không dùng** | Tình huống kích hoạt và giới hạn | Tránh AI dùng sai chỗ |
| 4 | **Đầu vào** | File, dữ liệu AI phải đọc trước khi làm | AI làm dựa trên dữ liệu thật của nhóm |
| 5 | **Quy trình từng bước** | Các bước đánh số, gắn Sprint | Kết quả lặp lại được, ai chạy cũng ra cùng chuẩn |
| 6 | **Đầu ra** | File/định dạng phải tạo ra | Kiểm tra được AI đã làm xong chưa |
| 7 | **Quy tắc bắt buộc (chống AI Slop)** | Những điều AI không được làm | Chặn số liệu bịa, tính năng ngoài phạm vi |
| 8 | **Checklist tự kiểm** | Danh sách tick trước khi commit | Người dùng skill tự kiểm trước khi nhờ review |

## 3. Cách dùng với AI Agent

```
Đọc skills/product-discovery/SKILL.md rồi cập nhật docs/discovery/03-personas.md
theo biên bản phỏng vấn mới trong docs/evidence/interviews/PV-03.md
```

Với Claude Code, có thể chép (hoặc tạo symlink) thư mục `skills/<tên>` vào `.claude/skills/<tên>` để AI tự nhận skill.
