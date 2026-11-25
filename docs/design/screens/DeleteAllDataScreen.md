# Màn hình `DeleteAllDataScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** design-system (mục 4.4a) · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 21/11/2026

- **User Story:** Chưa có User Story – đề xuất PO duyệt cùng `SettingsScreen`; quy tắc BR-129
- **Sprint:** 3 (Cần bổ sung – SM chốt)
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=111-1476) – `DeleteAllDataScreen / TypeToConfirm` ở hàng `SettingsScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** Chưa có – nối ở trang [Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) khi mở rộng lên 18 luồng (`screen-inventory.md` mục 4)
- **Mở từ:** mục "Xoá toàn bộ dữ liệu" (`ListRow` tone danger) trong danh sách "Khác" của `SettingsScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. `TopBar` back-title: "Xoá toàn bộ dữ liệu".
2. Khung cảnh báo: nền `--color-warning-light`, viền 1px `--color-danger`; `Icon` cảnh báo + câu đậm màu `--color-danger-text`; mô tả kiểu Body.
3. `TextField` "Gõ XOÁ để xác nhận".
4. `Button` "Xoá toàn bộ dữ liệu": vô hiệu cho tới khi gõ đúng, khi bật dùng biến thể danger.
5. Bàn phím hệ thống.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Chưa gõ đúng (`TypeToConfirm`) | Ô trống hoặc khác `XOÁ` | Nút vô hiệu |
| Gõ đúng | Ô bằng `XOÁ` (đúng dấu, chữ hoa) | Nút bật (BR-129) |
| Đã xoá | Bấm nút khi đã bật | Xoá mọi khoản chi, khoản thu, ngân sách, cài đặt, `onboardingDoneAt`; mở lại từ `SplashScreen` → `OnboardingScreen` |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Gõ vào ô | So khớp chính xác với `XOÁ` sau mỗi ký tự |
| Bấm "Xoá toàn bộ dữ liệu" | Xoá hẳn, **không hoàn tác**, không có `Snackbar` "Hoàn tác" |
| Bấm nút quay lại | Về `SettingsScreen`, không xoá gì |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Xoá toàn bộ dữ liệu" |
| Cảnh báo | "Thao tác này không hoàn tác được" |
| Mô tả | "Mọi khoản chi, khoản thu, ngân sách và cài đặt sẽ bị xoá khỏi điện thoại này." |
| Nhãn ô | "Gõ XOÁ để xác nhận" |
| Gợi ý ô | "Gõ chính xác, có dấu" |
| Nút | "Xoá toàn bộ dữ liệu" |

## 5. Ngoài phạm vi

- Không xoá một phần (theo tháng, theo danh mục).
- Không sao lưu trước khi xoá (sao lưu là US10, R2).
- Cần bổ sung: cặp UI/UX quyết định có chấp nhận "XOA" không dấu khi bàn phím không gõ được dấu hay không.
