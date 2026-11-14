# Ví Khéo – Hướng dẫn cho AI Agent

Ví Khéo là app ghi chi tiêu tối giản cho sinh viên, làm trong môn Quản lý dự án Agile/Scrum. Repo hiện mới có tài liệu, chưa có source code. Tài liệu viết bằng tiếng Việt.

## Đọc ở đâu
- `docs/discovery/01–07`: bộ tài liệu Product Discovery (vấn đề, persona, thị trường, vision, backlog, roadmap).
- `docs/research/survey-n50.md`: dữ liệu khảo sát gốc, là nguồn chuẩn cao nhất cho mọi số liệu.
- `.claude/skills/product-discovery/`: dùng khi soát, sửa hoặc mở rộng tài liệu, backlog, Acceptance Criteria.
- `.claude/skills/design-system/`: dùng khi viết hoặc review code giao diện và logic hiển thị.

## Quy tắc bắt buộc
- Không tự tạo số liệu, trích dẫn hay nguồn tham khảo. Thiếu thì ghi `[GIẢ ĐỊNH]` hoặc `[CẦN ĐỐI CHIẾU]` và báo cho người dùng.
- Chỉ làm tính năng có trong Product Backlog (`docs/discovery/06-journey-features.md` §4). Không thêm mục nào thuộc Won't-have hay danh sách ngoài phạm vi.
- Tech stack: React Native (`design-system` §1).
