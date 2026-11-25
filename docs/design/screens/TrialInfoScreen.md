# Màn hình `TrialInfoScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 21/11/2026

- **User Story:** Không có User Story – công cụ đo giả định A4 trong buổi dùng thử (Q4, BR-126)
- **Sprint:** 3 – trước buổi dùng thử 04/12/2026
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=111-1476) – `TrialInfoScreen / Default` ở hàng `SettingsScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** Chưa có – nối ở trang [Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) khi mở rộng lên 18 luồng (`screen-inventory.md` mục 4)
- **Mở từ:** mục "Thông tin dùng thử" trong danh sách "Khác" của `SettingsScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. `TopBar` back-title: "Thông tin dùng thử".
2. Thẻ nền `--color-primary-light`: câu dẫn (Body) + "<x>/<n> ngày" kiểu Hero `--color-primary` + "có ghi ít nhất 1 khoản" (Caption).
3. Hàng 7 chấm tròn 32px cho 7 ngày gần nhất: có ghi `--color-success`, không ghi `--color-border`; nhãn thứ (T2 … CN) bên dưới.
4. Thẻ hàng nhãn – giá trị: Ngày bắt đầu, Ngày thứ 7, Ngày thứ 7 có ghi.
5. Ghi chú kiểu Caption `--color-text-secondary`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Mặc định | Luôn | `firstOpenDate` và số ngày có ghi chép / số ngày đã dùng; **không hiện số tiền** (BR-126) |
| Chưa tới ngày thứ 7 | Dùng < 7 ngày | Dòng "Ngày thứ 7 có ghi": Cần bổ sung – cặp UI/UX chốt chữ |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm nút quay lại | Về `SettingsScreen` |
| Người dùng chụp màn hình | Gửi cho nhóm để đo A4 (Q4); app không tự gửi gì |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Thông tin dùng thử" |
| Câu dẫn | "Bạn đã dùng Ví Khéo <n> ngày" |
| Số chính | "<x>/<n> ngày" |
| Dưới số | "có ghi ít nhất 1 khoản" |
| Nhãn | "Ngày bắt đầu" · "Ngày thứ 7" · "Ngày thứ 7 có ghi" |
| Ghi chú | "Màn này không hiện số tiền. Khi nhóm hỏi, bạn chỉ cần chụp màn hình này gửi lại." |

Ví dụ trên Figma (5/7 ngày, bắt đầu 04/12/2026) là minh hoạ.

## 5. Ngoài phạm vi

- Không hiện số tiền, danh mục, ghi chú (BR-126).
- Không gửi dữ liệu ra ngoài, không có nút "Gửi cho nhóm".
