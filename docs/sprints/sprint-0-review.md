# Sprint 0 – Research & Discovery (07/11 – 14/11/2026)

> **Sprint Goal:** Hiểu rõ vấn đề và người dùng bằng dữ liệu thật, chốt Product Backlog và bộ Skill AI để bắt đầu Sprint 1.
> **Skill:** scrum-sprint (mục 4.2) · **Trạng thái:** Xong (còn mục Cần bổ sung, chuyển sang Sprint 1) · **Người viết báo cáo:** Trần Ninh Nhật Tân (SM) · **Cập nhật:** 14/11/2026

## 1. Tuần này nhóm làm được gì

| # | Kết quả | Bằng chứng | Trạng thái |
| :-: | :--- | :--- | :--- |
| 1 | Khảo sát Google Form **50 SV** hợp lệ | [00-research-log.md](../discovery/00-research-log.md) mục 2 · file Sheets | Xong |
| 2 | Đọc và đối chiếu nghiên cứu thứ cấp (4.140 SV, Tạp chí KH & ĐT Ngân hàng số 254) | [00-research-log.md](../discovery/00-research-log.md) mục 1 | Xong |
| 3 | So sánh đối thủ trên Google Play (Money Lover, Sổ Thu Chi MISA, ghi tay) | [04-market.md](../discovery/04-market.md) | Xong – cần bổ sung ảnh chụp |
| 4 | Phỏng vấn sâu sinh viên | `docs/evidence/interviews/` | Đang làm – đã phỏng vấn **[điền số]**/5–8 bạn |
| 5 | Problem Statement, Persona, Vision Board, giả định A1–A4 | [02](../discovery/02-problem.md) · [03](../discovery/03-personas.md) · [05](../discovery/05-vision.md) | Xong |
| 6 | Customer Journey → 3 HMW → **Generate Features (15 ý tưởng, MoSCoW)** → 8 User Story có AC | [06-journey-features.md](../discovery/06-journey-features.md) | Xong |
| 7 | Lộ trình 3 Sprint + Definition of Done | [07-roadmap.md](../discovery/07-roadmap.md) | Xong |
| 8 | **6 Skill AI**, mỗi skill có người phụ trách và người review | `skills/` (đã gộp vào `.agents/skills/` ngày 20/11/2026, xem [skill-standard.md](../skill-standard.md)) | Xong |
| 9 | Slide báo cáo Research & Discovery (17 trang) | Canva | Xong – cần sửa theo mục 4 |

**Giả định đã kiểm chứng:** A1 đạt (34/50 = 68% ≥ 60%). A2 đang kiểm chứng – khảo sát ủng hộ, chờ kiểm lại mẫu số và đủ phỏng vấn.

## 2. Ai làm gì

*Cột "Phần phụ trách" lấy theo phân công. **Mỗi thành viên tự sửa dòng của mình thành việc đã làm thật**, điền bằng chứng và commit bằng tài khoản GitHub của mình. Dòng nào chưa có bằng chứng thì ghi "Cần bổ sung".*

| Thành viên | Vai trò | Phần phụ trách trong Sprint 0 | Skill phụ trách / review | Bằng chứng |
| :--- | :--- | :--- | :--- | :--- |
| Dương Văn Hoan | PO | Chốt Problem, Vision, MoSCoW, thứ tự Backlog | `product-discovery` · review `user-research`, `scrum-sprint` | Cần bổ sung |
| Trần Ninh Nhật Tân | SM | Lập board Trello, lịch Sprint, điều phối họp | `scrum-sprint` · review `product-discovery` | Cần bổ sung |
| Nguyễn Thị Thương | Dev – Nghiên cứu | Google Form, tổng hợp 50 phản hồi, phỏng vấn | `user-research` | Cần bổ sung |
| Nguyễn Tuấn Kiệt | Dev – Nghiên cứu | Google Form, tổng hợp 50 phản hồi, phỏng vấn | `user-research` | Cần bổ sung |
| Lê Thị Nhật Vy | Dev – UI/UX | Nguyên tắc thiết kế, token, đặc tả 4 màn hình | `design-system` · review `frontend-ui` | Cần bổ sung |
| Phạm Viết Hưng | Dev – UI/UX | Nguyên tắc thiết kế, token, đặc tả 4 màn hình | `design-system` · review `frontend-ui` | Cần bổ sung |
| Lê Thị Phát | Dev – Giao diện | Quy trình code theo User Story, phương án công nghệ | `frontend-ui` · review `design-system` | Cần bổ sung |
| Nguyễn Đức Minh Nghĩa | Dev – Giao diện | Quy trình code theo User Story, phương án công nghệ | `frontend-ui` · review `design-system`, `budget-logic` | Cần bổ sung |
| Nguyễn Thị Bình Minh | Dev – Dữ liệu | Mô hình dữ liệu, công thức hạn mức ngày, test case | `budget-logic` | Cần bổ sung |
| Nguyễn Diên Tiến | Dev – Dữ liệu | Mô hình dữ liệu, công thức hạn mức ngày, test case; viết lại bộ Skill (nhánh `feature/rewrite-skills`) | `budget-logic` | Commit trên GitHub |

> "Cần bổ sung" = điền link thẻ Trello / commit / file làm bằng chứng. SM đối chiếu với `git log` trước buổi báo cáo.

## 3. Chưa xong – chuyển sang Sprint 1

| Việc | Người phụ trách | Hạn |
| :--- | :--- | :--- |
| Hoàn tất phỏng vấn 5–8 SV, thay trích dẫn thật vào Persona | Thương, Kiệt | 18/11 |
| Kiểm lại mẫu số tỷ lệ "lý do bỏ app" (64%, 42% của 29 người không ra số nguyên) | Thương, Kiệt | 16/11 |
| Kiểm tra Google Form có câu hỏi về vay mượn, căng thẳng, cách trả tiền không – có thì ghi số câu vào `00-research-log.md` | Thương, Kiệt | 16/11 |
| Xuất file `.csv` khảo sát + ảnh chụp Google Play vào `docs/evidence/` | Thương, Kiệt + **[người thu số liệu thị trường]** | 16/11 |
| Test giả định A3 bằng bản HTML `HomeScreen` | Vy, Hưng (dựng) · Thương, Kiệt (test) | 21/11 |
| Chốt công nghệ lập trình | Phát, Nghĩa · PO duyệt | Sprint Planning 1 (15/11) |
| PO chốt: US07 (khoản thu), 2 quy tắc trong `budget-logic`, cách đo A4, có thêm HMW4 không | Hoan | Sprint Planning 1 (15/11) |

## 4. Slide Canva cần sửa cho khớp tài liệu

| Trang | Hiện tại | Sửa thành |
| :-: | :--- | :--- |
| 3 | Công cụ: Trello · **Figma** · GitHub · Google Form | Bỏ Figma (nhóm không dùng) |
| 4 | Thiết kế UI/UX: "prototype Figma" | "Design system + bản HTML do AI sinh" |
| 5 | Chi phí sống SV TP.HCM 5–8 triệu (Finhay) | Bỏ – khác địa bàn khảo sát, chưa có link nguồn |
| 10 | Kết quả khảo sát nhanh **(n = 30)**: > 60%, < 20%, > 50% | **n = 50**: 34/50 (68%), 12/50 (24%), 29/50 (58%) |
| 16 | A3: "Cho 5 SV xem prototype Figma" | "Cho 5 SV xem bản HTML màn hình chính" (Sprint 1) |
| 16 | A4: "Từ 3/5 bạn ghi đủ 7 ngày" | "≥ 50% người dùng thử còn ghi chép vào ngày thứ 7" (sau khi PO chốt) |
| 17 | Sprint 0: "…prototype Figma" · Sprint 1: 14/11–23/11 | Bỏ "prototype Figma" · Sprint 1: **15/11**–23/11 |
| 17 | Definition of Done có 4 điều | Thêm "đúng design system" và "phần tính tiền có unit test" |

## 5. Retrospective

| Giữ | Bỏ | Hành động cải tiến |
| :--- | :--- | :--- |
| **[nhóm điền sau buổi Retro]** | **[nhóm điền]** | **[hành động – người phụ trách – hạn]** |

## 6. Câu hỏi xin ý kiến giảng viên
1. Mục tiêu 20 SV dùng thử và 50% còn ghi chép vào ngày thứ 7 có phù hợp với thời lượng môn học không?
2. Nhóm dùng AI sinh giao diện trực tiếp từ design system thay cho Figma – thầy có yêu cầu thêm bản thiết kế riêng không?
3. Sprint 1–3 dài 9–10 ngày theo lịch báo cáo – có cần điều chỉnh đúng 7 ngày không?
