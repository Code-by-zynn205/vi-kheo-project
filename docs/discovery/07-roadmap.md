# 07. Lộ trình & Definition of Done

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0), cập nhật mỗi Sprint · **Trạng thái:** ✅ · **Phụ trách:** Trần Ninh Nhật Tân (SM), Dương Văn Hoan (PO) · **Cập nhật:** 14/11/2026

## 1. Lộ trình

| Giai đoạn | Sprint | Thời gian | Sprint Goal | User Story | Trạng thái |
| :--- | :--- | :--- | :--- | :--- | :---: |
| GĐ1 – Discovery | **Sprint 0** | 07/11 – 14/11 | Chốt vấn đề, persona, Backlog, bộ Skill AI | — | ✅ |
| GĐ2 – Xây dựng MVP | **Sprint 1** | 14/11 – 23/11 | SV ghi được khoản chi trong < 5 giây, dữ liệu lưu trên máy | US01 | 🔄 |
| | **Sprint 2** | 24/11 – 03/12 | SV biết hôm nay còn được tiêu bao nhiêu | US02, US03, US07 | ⬜ |
| | **Sprint 3** | 04/12 – 12/12 | SV xem được tiền đi đâu, được nhắc ghi chép; demo với SV thật | US04, US05, US06 | ⬜ |
| GĐ3 – Kiểm chứng & Demo | cuối Sprint 3 | → 13/12 | 5–20 SV dùng thử 7 ngày, đo A4, báo cáo tổng kết | — | ⬜ |

*Sprint 1–3 dài 9–10 ngày (không đúng 7 ngày) do bám theo lịch báo cáo với giảng viên. Nếu lịch giảng viên thay đổi, SM dời ngày cho khớp.*

### Chi tiết từng Sprint

**Sprint 0 – Discovery (07/11 – 14/11)** ✅
Khảo sát 50 SV · phỏng vấn (đang tiếp tục) · 8 tài liệu `docs/discovery` · 6 Skill AI · slide báo cáo. Báo cáo: [sprint-0-review.md](../sprints/sprint-0-review.md).

**Sprint 1 – Ghi chi tiêu (14/11 – 23/11)**
- Chốt công nghệ ([frontend-ui](../../skills/frontend-ui/SKILL.md) mục 4), dựng dự án, token màu/chữ.
- US01: `HomeScreen` khung + `AddExpenseScreen` + 6 danh mục + lưu trên máy.
- Test giả định A3 với 5 SV bằng bản HTML `HomeScreen`.
- Hoàn tất phỏng vấn, thay trích dẫn thật vào Persona.

**Sprint 2 – Ngân sách (24/11 – 03/12)**
- US02 `BudgetScreen` · US03 `DailyAllowanceCard` có công thức và màu · US07 khoản thu.
- Unit test đủ bảng test case của `budget-logic`.

**Sprint 3 – Báo cáo & demo (04/12 – 12/12)**
- US04 `ReportScreen` · US05 nhắc 21:00 · US06 sửa/xoá.
- Cài cho 5–20 SV dùng thử, đo giả định A4, chuẩn bị báo cáo tổng kết.

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
