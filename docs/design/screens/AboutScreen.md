# Màn hình `AboutScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** design-system (mục 4.4a) · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 21/11/2026

- **User Story:** Chưa có User Story – màn thông tin, đề xuất PO duyệt cùng `SettingsScreen` (US05)
- **Sprint:** 3 (Cần bổ sung – SM chốt)
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=111-1476) – `AboutScreen / Default` ở hàng `SettingsScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** Chưa có – nối ở trang [Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) khi mở rộng lên 18 luồng (`screen-inventory.md` mục 4)
- **Mở từ:** mục "Giới thiệu" trong danh sách "Khác" của `SettingsScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. `TopBar` back-title: "Giới thiệu".
2. Logo 72 × 72 nền `--color-primary` + "Ví Khéo" kiểu Title + phiên bản kiểu Caption `--color-text-secondary`.
3. Thẻ mô tả app (Body).
4. Thẻ thông tin dạng hàng nhãn – giá trị: Nhóm, Môn học, Giảng viên.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Mặc định | Luôn | Nội dung tĩnh; phiên bản lấy từ bản build |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm nút quay lại | Về `SettingsScreen` |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Giới thiệu" |
| Phiên bản | "Phiên bản <số phiên bản>" (Figma: "Phiên bản 0.1 (demo)") |
| Mô tả | "App quản lý chi tiêu tối giản cho sinh viên: ghi một khoản chi trong dưới 5 giây và luôn biết hôm nay còn được tiêu bao nhiêu." |
| Nhóm | "Messi – 10 thành viên" |
| Môn học | "Quản lý dự án Agile/Scrum" |
| Giảng viên | Tên giảng viên phụ trách môn, như trên Figma |

## 5. Ngoài phạm vi

- Không có liên kết ra web, đánh giá app, chia sẻ app.
- Không ghi tên, thông tin liên hệ của người được khảo sát.
