# 07. Lộ trình & Definition of Done

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0), cập nhật mỗi Sprint · **Trạng thái:** Xong · **Phụ trách:** Trần Ninh Nhật Tân (SM), Dương Văn Hoan (PO) · **Cập nhật:** 14/11/2026

## 1. Lộ trình

| Giai đoạn | Sprint | Thời gian | Sprint Goal | User Story | Trạng thái |
| :--- | :--- | :--- | :--- | :--- | :--- |
| GĐ1 – Discovery | **Sprint 0** | 07/11 – 14/11 | Chốt vấn đề, persona, Backlog, bộ Skill AI | — | Xong |
| GĐ2 – Xây dựng MVP | **Sprint 1** | 15/11 – 23/11 | SV ghi được khoản chi trong < 5 giây, dữ liệu lưu trên máy | US01 | Đang làm |
| | **Sprint 2** | 24/11 – 03/12 | SV biết hôm nay còn được tiêu bao nhiêu; có bản build cho SV dùng thử | US02, US03, US07 | Chưa làm |
| | **Sprint 3** | 04/12 – 12/12 | SV xem được tiền đi đâu, được nhắc ghi chép; chạy buổi dùng thử 7 ngày | US04, US05, US06 | Chưa làm |
| GĐ3 – Kiểm chứng & Demo | trong Sprint 3 | 04/12 – 13/12 | Dùng thử 7 ngày (04/12 – 10/12), đo A4, demo MVP, báo cáo tổng kết | — | Chưa làm |

*Sprint 1 dài 9 ngày, Sprint 2 dài 10 ngày, Sprint 3 dài 9 ngày (không đúng 7 ngày) do bám theo lịch báo cáo với giảng viên. Nếu lịch giảng viên thay đổi, SM dời ngày cho khớp.*

### Chi tiết từng Sprint

**Sprint 0 – Discovery (07/11 – 14/11)** – Xong
Khảo sát 50 SV · phỏng vấn (đang tiếp tục) · 8 tài liệu `docs/discovery` · 6 Skill AI · slide báo cáo. Báo cáo: [sprint-0-review.md](../sprints/sprint-0-review.md).

**Sprint 1 – Ghi chi tiêu (15/11 – 23/11)**
- Chốt công nghệ ([frontend-ui](../../skills/frontend-ui/SKILL.md) mục 4), dựng dự án, token màu/chữ.
- US01: `HomeScreen` khung + `AddExpenseScreen` + 6 danh mục + lưu trên máy.
- Test giả định A3 với 5 SV bằng bản HTML `HomeScreen`.
- Hoàn tất phỏng vấn, thay trích dẫn thật vào Persona.

**Sprint 2 – Ngân sách (24/11 – 03/12)**
- US02 `BudgetScreen` · US03 `DailyAllowanceCard` có công thức và màu · US07 khoản thu.
- Unit test đủ bảng test case của `budget-logic`.
- **Trước 03/12:** đóng gói bản build dùng thử (US01, US02, US03, US07), tuyển 20 SV (tối thiểu 5), hướng dẫn cài đặt.

**Sprint 3 – Báo cáo & demo (04/12 – 12/12)**
- **04/12:** phát bản build Sprint 2 cho SV, bắt đầu 7 ngày dùng thử (đến 10/12).
- US04 `ReportScreen` · US05 nhắc 21:00 · US06 sửa/xoá. Xong tính năng nào thì cập nhật cho người dùng thử, ghi lại ngày cập nhật.
- 11/12 – 12/12: tổng hợp kết quả A4, chuẩn bị demo và báo cáo tổng kết.

## 2. Lịch sự kiện Scrum mỗi Sprint

| Sự kiện | Khi nào | Thời lượng |
| :--- | :--- | :--- |
| Sprint Planning | Ngày đầu Sprint | ~1 giờ |
| Daily Scrum | Mỗi ngày | 15 phút |
| Sprint Review (demo cho PO) | Ngày cuối Sprint | ~45 phút |
| Sprint Retrospective | Sau Review | ~30 phút |

## 3. Definition of Done

Một User Story chỉ được coi là **Done** khi đủ cả 5 điều:

1. **Đạt tiêu chí chấp nhận** – mọi AC trong [06-journey-features.md](06-journey-features.md) mục 5 đều qua.
2. **Chạy trên điện thoại thật** – không chỉ trên trình giả lập.
3. **Đúng design system** – màu, chữ, component theo [skills/design-system](../../skills/design-system/SKILL.md).
4. **Code đã review** – qua Pull Request, ít nhất 1 người ở cặp khác duyệt; phần tính tiền có unit test.
5. **Trello cập nhật** – thẻ đã sang cột Done.

*Slide Canva trang 17 đang ghi 4 điều (thiếu "đúng design system" và unit test) – cần sửa cho khớp.*
