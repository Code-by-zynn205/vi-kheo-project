---
name: demo-present
description: Chuẩn bị trình bày sản phẩm hoàn chỉnh của Ví Khéo cuối kỳ – kịch bản demo trên điện thoại thật, đối chiếu kết quả với giả định và mục tiêu, dàn ý slide Canva, báo cáo tổng kết. Dùng khi chuẩn bị buổi demo MVP, viết báo cáo tổng kết, làm dàn ý slide báo cáo với giảng viên, hoặc tổng hợp kết quả dùng thử 7 ngày.
---

# Skill: Present Full Product – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 5 – Present full product | Sprint 3 (04/12 – 12/12) | Tổng hợp kết quả dùng thử 7 ngày (04/12 – 10/12) · kịch bản demo · dàn ý slide · báo cáo tổng kết · demo trước 13/12/2026 |

- **Phụ trách chính:** Trần Ninh Nhật Tân (SM)
- **Đóng góp:** mỗi cặp viết phần của mình · **Review:** Dương Văn Hoan (PO)

## 2. Khi nào dùng / không dùng

**Dùng khi:** chuẩn bị buổi demo cuối kỳ · viết báo cáo tổng kết · làm dàn ý slide · tổng hợp kết quả dùng thử.

**Không dùng khi:** báo cáo hằng Sprint (→ `scrum-sprint`) · xử lý số liệu dùng thử thô (→ `user-research`, rồi quay lại đây).

## 3. Đầu vào

- `docs/requirements/README.md` – User Story nào đã xong
- `docs/sprints/sprint-*-review.md` – kết quả từng Sprint, ai làm gì
- `docs/discovery/05-vision.md` – giả định A1–A4 và mục tiêu dự án
- `docs/discovery/00-research-log.md` – số liệu dùng thử (do `user-research` ghi)
- Bản build cuối cùng trên điện thoại thật

## 4. Quy trình

1. **Chốt bản demo.** Ghi rõ commit/bản build dùng để demo. Không demo tính năng chưa merge.
2. **Viết kịch bản demo** từ `templates/demo-script.md`: theo đúng hành trình của Persona Minh, mỗi bước gắn User Story và AC. Tập chạy ≥ 2 lần trên điện thoại thật, bấm giờ.
3. **Chuẩn bị dữ liệu demo:** một bộ giao dịch mẫu cố định (ghi trong kịch bản), không dùng dữ liệu cá nhân của ai.
4. **Đối chiếu kết quả** từ `templates/final-report.md`: giả định A1–A4 đạt/chưa đạt, mục tiêu dự án, số liệu có nhãn nguồn.
5. **Dàn ý slide Canva:** mỗi slide 1 ý, theo thứ tự 5 giai đoạn (Discovery → Design → Requirements → Code → Kết quả). Số trên slide phải khớp báo cáo tổng kết.
6. **Phương án dự phòng:** quay video màn hình demo trước 1 ngày phòng khi điện thoại hoặc mạng lỗi.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/present/demo-script.md` | `templates/demo-script.md` | PO |
| `docs/present/final-report.md` | `templates/final-report.md` | PO |
| Slide Canva (link ghi trong `final-report.md`) | dàn ý trong `final-report.md` mục 6 | PO |

## 6. Khi viết plan

Không áp dụng.

## 7. Quy tắc bắt buộc

1. Chỉ demo tính năng đã merge và đạt Definition of Done.
2. Không bịa số liệu dùng thử. Chưa đủ dữ liệu → ghi `Đang thu thập (hiện có n = ...)`.
3. Giả định không đạt thì ghi `Chưa đạt` và nêu nhóm học được gì – không giấu.
4. Mỗi thành viên có tên trong phần "Ai làm gì" kèm bằng chứng.
5. Tiếng Việt có dấu, không emoji.

## 8. Checklist tự kiểm

- [ ] Kịch bản demo đã chạy thử ≥ 2 lần trên điện thoại thật
- [ ] Có video dự phòng
- [ ] Mọi số trên slide khớp `final-report.md` và `00-research-log.md`
- [ ] Đủ 10 thành viên trong phần "Ai làm gì"
