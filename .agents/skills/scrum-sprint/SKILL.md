---
name: scrum-sprint
description: Quy trình vận hành Scrum của nhóm Messi cho dự án Ví Khéo – kế hoạch tổng thể chia Sprint theo User Story, lập Sprint Planning, ghi Daily Scrum, viết báo cáo Sprint "nhóm đã làm được gì, ai làm", Sprint Review và Retrospective, dựa trên Trello và lịch sử GitHub. Dùng khi lập hoặc sửa kế hoạch tổng thể docs/plans/00-master-plan.md, khi bắt đầu hoặc kết thúc một Sprint, khi chuẩn bị báo cáo với giảng viên, hoặc khi cần kiểm tra phân công có đều giữa các thành viên.
---

# Skill: Scrum & Báo cáo Sprint – Ví Khéo

## 1. Giai đoạn & phụ trách

Áp dụng **mọi Sprint**, xuyên suốt 5 giai đoạn.

| Sprint | Thời gian | Giai đoạn chính | Báo cáo |
| :--- | :--- | :--- | :--- |
| Sprint 0 – Discovery | 07/11 – 14/11/2026 | 1 | `docs/sprints/sprint-0-review.md` |
| Sprint 1 – Ghi chi tiêu | 15/11 – 23/11/2026 | 2, 3, 4 | `docs/sprints/sprint-1-planning.md`, `sprint-1-review.md` |
| Sprint 2 – Ngân sách | 24/11 – 03/12/2026 | 3, 4 | `docs/sprints/sprint-2-planning.md`, `sprint-2-review.md` |
| Sprint 3 – Báo cáo & demo | 04/12 – 12/12/2026 | 3, 4, 5 | `docs/sprints/sprint-3-planning.md`, `sprint-3-review.md` |

- **Phụ trách chính:** Trần Ninh Nhật Tân (SM)
- **Review:** Dương Văn Hoan (PO)

## 2. Khi nào dùng / không dùng

**Dùng khi:** lập/sửa kế hoạch tổng thể · họp Sprint Planning · cuối Sprint viết báo cáo · trước buổi gặp giảng viên · kiểm tra ai đang quá tải hoặc chưa có việc.

**Không dùng khi:** viết nội dung sản phẩm (→ `product-discovery`, `product-requirements`) · chuẩn bị demo cuối kỳ (→ `demo-present`).

## 3. Đầu vào

- Bảng Trello của Sprint (xuất danh sách thẻ hoặc chụp màn hình)
- `git log --since=<ngày bắt đầu> --until=<ngày kết thúc> --pretty="%an | %ad | %s" --date=short`
- `docs/discovery/06-journey-features.md` (Backlog), `07-roadmap.md` (DoD)
- `docs/requirements/README.md` (PRD nào đã duyệt) · `docs/requirements/data-analysis.md` mục 11 (story nào đụng dữ liệu nào, để xếp thứ tự)
- `docs/plans/00-master-plan.md` (Sprint nào làm User Story nào)

## 4. Quy trình

### 4.1 Kế hoạch tổng thể – chia Sprint theo User Story

`docs/plans/00-master-plan.md` tạo từ `templates/master-plan.md`. **Đơn vị chia Sprint là User Story**, không phải loại tài liệu:

1. Mỗi Sprint có bảng User Story là việc chính; mỗi dòng story đi hết chuỗi *Dữ liệu → Đặc tả màn hình → PRD → Spec + plan → Code + PR → Done*, mỗi ô ghi hạn hoặc trạng thái.
2. Việc không thuộc story nào (khảo sát, ADR, báo cáo) vào bảng "Việc hỗ trợ", bắt buộc ghi cột "Mở khoá" – story nào, bước nào. Việc không mở khoá story nào → hỏi PO có cần làm trong Sprint không.
3. Thứ tự story theo phụ thuộc dữ liệu (`data-analysis.md` mục 11) và Backlog; story sau dùng dữ liệu story trước tạo ra thì xếp sau.
4. Tài liệu (đặc tả, PRD) của Sprint sau viết trong Sprint trước, để ngày đầu Sprint đã code được.
5. Cập nhật sau mỗi Sprint Planning và Sprint Review; `sprint-N-planning.md` chép bảng User Story của Sprint đó.

### 4.2 Sự kiện Scrum

| Sự kiện | Khi nào | Thời lượng | Đầu ra |
| :--- | :--- | :--- | :--- |
| **Sprint Planning** | Ngày đầu Sprint | ~1 giờ | `sprint-N-planning.md`: Sprint Goal, User Story, người nhận, hạn PRD và đặc tả màn hình |
| **Daily Scrum** | Mỗi ngày | 15 phút | Mỗi người: hôm qua · hôm nay · đang vướng |
| **Sprint Review** | Ngày cuối Sprint | ~45 phút | Demo cho PO trên điện thoại thật, PO nhận/không nhận từng Story |
| **Sprint Retrospective** | Sau Review | ~30 phút | 1 điều giữ · 1 điều bỏ · 1 hành động có người phụ trách |

### Thứ tự trong một Sprint (theo 5 giai đoạn)

```
Planning → dữ liệu của story (product-requirements 4.1) → đặc tả màn hình (design-system)
        → PRD (product-requirements 4.3, PO duyệt) → plan + code (frontend-ui, budget-logic) → Review → Retro
```

Ở Sprint Planning, SM ghi hạn cho từng bước: đặc tả màn hình xong trước ngày <x>, PRD duyệt trước ngày <y>, để cặp code không phải chờ.

### Phân công đều
- Mỗi thành viên nhận **ít nhất 1 thẻ** mỗi Sprint và **review ít nhất 1 Pull Request** của cặp khác.
- 4 cặp chỉ là "phụ trách chính"; Developer được nhận thẻ của cặp khác khi cần.
- Cuối Sprint, đối chiếu thẻ Trello với `git log`: ai có thẻ Done mà không có commit/PR → SM hỏi lại, ghi chú.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/plans/00-master-plan.md` | `templates/master-plan.md` | PO |
| `docs/sprints/sprint-N-planning.md` | `templates/sprint-planning.md` | PO |
| `docs/sprints/sprint-N-review.md` | `templates/sprint-review.md` | PO |

## 6. Khi viết plan

Không áp dụng.

## 7. Quy tắc bắt buộc

1. Cột "Việc đã làm" chỉ ghi việc có bằng chứng (thẻ Done, commit, PR, file). Không có → `Cần bổ sung`.
2. Ghi tên từng người, không viết "cả nhóm cùng làm".
3. Story chưa đạt DoD ghi `Chưa xong`, không ghi "Gần xong".
4. Ngày tháng khớp `07-roadmap.md`.

## 8. Checklist cuối Sprint

- [ ] Đủ 10 thành viên trong bảng "Ai làm gì"
- [ ] Mỗi dòng có bằng chứng hoặc ghi `Cần bổ sung`
- [ ] Story Point cam kết/hoàn thành đã ghi
- [ ] Retro có ít nhất 1 hành động cải tiến có người phụ trách
- [ ] Slide báo cáo (Canva) khớp số liệu trong báo cáo
- [ ] Bảng "Skill đã dùng" của báo cáo khớp dòng `**Skill:**` của các file đã làm trong Sprint
- [ ] `00-master-plan.md` đã cập nhật trạng thái từng User Story
