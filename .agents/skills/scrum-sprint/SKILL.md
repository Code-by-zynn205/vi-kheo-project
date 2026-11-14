---
name: scrum-sprint
description: Quy trình vận hành Scrum của nhóm Messi cho dự án Ví Khéo – lập Sprint Planning, ghi Daily Scrum, viết báo cáo tuần "nhóm đã làm được gì, ai làm", Sprint Review và Retrospective, dựa trên Trello và lịch sử GitHub. Dùng khi bắt đầu hoặc kết thúc một Sprint, khi chuẩn bị báo cáo với giảng viên, hoặc khi cần kiểm tra phân công có đều giữa các thành viên.
---

# Skill: Scrum & Báo cáo Sprint – Ví Khéo

## 1. Giai đoạn & phụ trách
Áp dụng **mọi Sprint** (Sprint 0 → Sprint 3).

| Sprint | Thời gian | Báo cáo |
| :--- | :--- | :--- |
| Sprint 0 – Discovery | 07/11 – 14/11/2026 | `docs/sprints/sprint-0-review.md` (Xong) |
| Sprint 1 – Ghi chi tiêu | 15/11 – 23/11/2026 | `docs/sprints/sprint-1-review.md` (Chưa làm) |
| Sprint 2 – Ngân sách | 24/11 – 03/12/2026 | `docs/sprints/sprint-2-review.md` (Chưa làm) |
| Sprint 3 – Báo cáo & demo | 04/12 – 12/12/2026 | `docs/sprints/sprint-3-review.md` (Chưa làm) |

- **Phụ trách chính:** Trần Ninh Nhật Tân (SM)
- **Review:** Dương Văn Hoan (PO)

## 2. Khi nào dùng / không dùng
**Dùng khi:** họp Sprint Planning · cuối Sprint viết báo cáo · trước buổi gặp giảng viên · kiểm tra ai đang quá tải hoặc chưa có việc.
**Không dùng khi:** viết nội dung sản phẩm (→ `product-discovery`).

## 3. Đầu vào
- Bảng Trello của Sprint (xuất danh sách thẻ hoặc chụp màn hình)
- `git log --since=<ngày bắt đầu> --until=<ngày kết thúc> --pretty="%an | %ad | %s" --date=short`
- `docs/discovery/06-journey-features.md` (Backlog) và `07-roadmap.md` (DoD)

## 4. Quy trình trong một Sprint

| Sự kiện | Khi nào | Thời lượng | Đầu ra |
| :--- | :--- | :--- | :--- |
| **Sprint Planning** | Ngày đầu Sprint | ~1 giờ | Sprint Goal, danh sách User Story, thẻ Trello có người nhận |
| **Daily Scrum** | Mỗi ngày (online được) | 15 phút | Mỗi người: hôm qua làm gì · hôm nay làm gì · đang vướng gì |
| **Sprint Review** | Ngày cuối Sprint | ~45 phút | Demo cho PO trên điện thoại thật, PO nhận/không nhận từng Story |
| **Sprint Retrospective** | Sau Review | ~30 phút | 1 điều giữ · 1 điều bỏ · 1 hành động cải tiến có người phụ trách |

### Quy tắc phân công đều
- Mỗi thành viên nhận **ít nhất 1 thẻ** mỗi Sprint và **review ít nhất 1 Pull Request** của cặp khác.
- 4 cặp chỉ là "phụ trách chính"; Developer được nhận thẻ của cặp khác khi cần (Scrum Guide 2020: Developers không chia chức danh con).
- Cuối Sprint, đối chiếu thẻ Trello với `git log`: ai có thẻ Done mà không có commit/PR nào → SM hỏi lại và ghi chú.

## 5. Mẫu báo cáo Sprint (`docs/sprints/sprint-N-review.md`)

```markdown
# Sprint N – <tên> (<dd/mm> – <dd/mm>)
> Sprint Goal: <một câu>

## 1. Kết quả theo User Story
| Story | Kết quả | Bằng chứng (PR / file / ảnh) |

## 2. Ai làm gì
| Thành viên | Vai trò | Việc đã làm | Bằng chứng | Trạng thái |

## 3. Chưa xong / chuyển Sprint sau
## 4. Số liệu: Story Point cam kết / hoàn thành
## 5. Retrospective: Giữ · Bỏ · Hành động
## 6. Câu hỏi xin ý kiến giảng viên
```

## 6. Quy tắc bắt buộc (chống AI Slop)
1. Cột "Việc đã làm" chỉ ghi việc có bằng chứng (thẻ Trello Done, commit, file, biên bản). Không có bằng chứng → ghi "Cần bổ sung".
2. Không viết chung chung kiểu "cả nhóm cùng làm" – ghi tên từng người.
3. Story chưa đạt DoD thì ghi "Chưa xong", không ghi "Gần xong".
4. Ngày tháng phải khớp `07-roadmap.md`.

## 7. Checklist cuối Sprint
- [ ] Đủ 10 thành viên trong bảng "Ai làm gì"
- [ ] Mỗi dòng có bằng chứng hoặc ghi "Cần bổ sung"
- [ ] Story Point cam kết/hoàn thành đã ghi
- [ ] Retro có ít nhất 1 hành động cải tiến có người phụ trách
- [ ] Slide báo cáo (Canva) khớp số liệu trong báo cáo
