# Màn hình `PrivacyScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** design-system (mục 4.4a) · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 21/11/2026

- **User Story:** Chưa có User Story – đề xuất PO duyệt cùng `SettingsScreen` (US05); nội dung bám EC-10, Q4
- **Sprint:** 3 (Cần bổ sung – SM chốt)
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=111-1476) – `PrivacyScreen / Default` ở hàng `SettingsScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** Chưa có – nối ở trang [Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) khi mở rộng lên 18 luồng (`screen-inventory.md` mục 4)
- **Mở từ:** mục "Quyền riêng tư" trong danh sách "Khác" của `SettingsScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. `TopBar` back-title: "Quyền riêng tư".
2. 4 thẻ nối tiếp, mỗi thẻ: tiêu đề kiểu BodyStrong `--color-text-primary` + nội dung kiểu Body `--color-text-secondary`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Mặc định | Luôn | 4 thẻ nội dung tĩnh |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm nút quay lại | Về `SettingsScreen` |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Quyền riêng tư" |
| Thẻ 1 | "Dữ liệu lưu ở đâu" · "Mọi khoản chi, khoản thu, ngân sách chỉ lưu trên điện thoại này. Ví Khéo không có máy chủ, không gửi dữ liệu đi đâu." |
| Thẻ 2 | "Ví Khéo không thu" · "Họ tên, số điện thoại, email, vị trí, danh bạ. Không có quảng cáo." |
| Thẻ 3 | "Khi bạn tham gia dùng thử" · "Nhóm chỉ hỏi số ngày bạn có ghi chép, xem ở màn Thông tin dùng thử. Không hỏi số tiền hay nội dung khoản chi." |
| Thẻ 4 | "Gỡ app" · "Gỡ app sẽ xoá toàn bộ dữ liệu và không khôi phục được." (EC-10) |

## 5. Ngoài phạm vi

- Đây là lời giải thích cho người dùng thử ở R1, không phải văn bản pháp lý.
- Khi có R3 (đăng nhập, đồng bộ), thẻ 1 và 2 **phải viết lại**: chữ hiện tại chỉ đúng khi không có máy chủ.
