# PRD – US04: Báo cáo theo danh mục

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn xem chi tiêu theo danh mục, để biết tiền đi đâu nhiều nhất. |
| Nguồn | P1 · N-a – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | Must · 5 · Sprint 3 |
| Màn hình | `docs/design/screens/ReportScreen.md` · `HomeScreen.md` (tab "Báo cáo" hiện từ story này) |
| Phụ thuộc | US01 |
| Dữ liệu | `data-analysis.md` mục 11 dòng US04; `budget-logic` 4.3; BR-04, BR-05, BR-91 |

## 1. Bối cảnh

Persona Minh không biết tiền đi đâu (P1). Báo cáo cho thấy danh mục nào tốn nhất trong tuần / tháng bằng một biểu đồ và danh sách – không đặt trên màn hình chính (`design-system` 4.1 "Một con số").

## 2. Luồng thao tác chính

1. Bấm tab "Báo cáo" → `ReportScreen`, mặc định "Tháng này", dòng khoảng ngày "01/11 – 30/11".
2. `DonutChart`, tâm: "Tổng chi" + số tiền; bên dưới danh sách danh mục nhiều nhất trước: chấm màu · tên · thanh % · phần trăm · số tiền.
3. Chọn "Tuần này" → tính lại cho thứ Hai → Chủ nhật của tuần hiện tại.

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E01 `Transaction` | R | `type = EXPENSE`, `amount`, `categoryId`, `date`, `deletedAt` | `budget-logic` 4.3 |
| E03 `Category` | R | Tên, màu `--color-cat-*` | E03 · `design-system` 4.2 |

Truy vấn chính: tổng chi theo danh mục trong tuần / tháng (`data-analysis.md` mục 11).

**Quy tắc nghiệp vụ áp dụng:** BR-04 (theo `date`), BR-05 (tuần bắt đầu thứ Hai), BR-91 (bỏ khoản đã xoá) (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Dữ liệu TC18 (tháng 11/2026) | Mở "Báo cáo" (mặc định "Tháng này") | Dòng "01/11 – 30/11"; tâm "Tổng chi" 1.577.000đ; danh sách Ăn uống 48% · Nhà trọ & Điện nước 32% · Di chuyển 9% · Học tập & Tài liệu 6% · Mua sắm & Sinh hoạt 5% | Unit test + điện thoại | 06 AC1, AC2, AC3 · TC18 |
| AC2 | Dữ liệu TC19, hôm nay Thứ Năm 19/11/2026 | Chọn "Tuần này" | Dòng "16/11 – 22/11"; tổng 50.000đ; Ăn uống 60% · Di chuyển 40%; khoản ngày 15/11, khoản thu, khoản đã xoá không tính | Unit test + điện thoại | 06 AC1, AC2 · BR-05 · BR-91 · TC19 |
| AC3 | Tháng có khoản thu 1.200.000đ | Xem báo cáo | Khoản thu không có trong tổng, không có trong danh sách | Unit test | 06 AC2 · TC18 |
| AC4 | Danh mục "Khác" không có khoản nào | Xem danh sách | Không có hàng "Khác" | Unit test | 06 AC3 · `budget-logic` 4.3 |
| AC5 | Phần trăm lẻ (78.000 / 1.577.000 = 4,95%) | Hiển thị | Làm tròn tới số nguyên gần nhất: 5%; tổng các phần trăm được lệch 100% ±1 | Unit test | `ReportScreen.md` mục 4 · `budget-logic` 4.3 |
| AC6 | Tuần này chỉ có khoản thu | Chọn "Tuần này" | `EmptyState` "Chưa có khoản chi nào trong tuần này" + nút "+ Ghi khoản chi" | Điện thoại + unit test | 06 AC4 · TC20 |
| AC7 | Mọi khoản chi tháng đều là Ăn uống | Xem | Vòng tròn một màu; danh sách 1 hàng 100% | Điện thoại | `ReportScreen.md` mục 2 |
| AC8 | US04 xong | Xem thanh điều hướng | Tab "Báo cáo" hiện | Điện thoại | `HomeScreen.md` "Dựng theo story" |

## 5. Test case

### 5.1 Tính toán (dẫn tới `budget-logic` mục 4.4)

| Test case | AC liên quan |
| :--- | :--- |
| TC18 | AC1, AC3, AC5 |
| TC19 | AC2 |
| TC20 | AC6 |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Nhập dữ liệu TC18, mở tab "Báo cáo" | Đúng tổng, đúng thứ tự, đúng % | AC1 |
| 2 | Chọn "Tuần này" khi tuần chưa có khoản chi | Trạng thái trống đúng chữ | AC6 |
| 3 | Màn rộng 360px | Không vỡ, không cuộn ngang; mỗi màu đi kèm tên và số | AC1 |

## 6. Ngoài phạm vi

- So sánh giữa các tháng, xuất file, báo cáo khoản thu, bấm vào danh mục xem chi tiết (sau MVP).
- Chọn tuần / tháng khác ngoài hiện tại.

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `budget-logic` | 4.3, 4.4, 6 | Hàm thuần thống kê theo danh mục – TDD với TC18 – TC20 |
| `frontend-ui` | 4, 6 | `ReportScreen`, tab "Báo cáo" |
| `design-system` | 4.2, 4.3, 6 | `DonutChart`, `SegmentedControl`, `ProgressBar`, `EmptyState`, màu `--color-cat-*` |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | `DonutChart` vẽ bằng thư viện nào (vẽ tay bằng SVG hay thư viện biểu đồ) – thư viện lớn cần ghi vào `technical-design.md` mục 6 | Cặp giao diện | chưa có |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
