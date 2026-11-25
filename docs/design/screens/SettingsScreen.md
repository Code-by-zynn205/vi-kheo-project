# Màn hình `SettingsScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt và PO trả lời Q5, Q8 · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US05 (nhắc ghi chép)
- **Sprint:** 3
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=108-322) – `SettingsScreen / ReminderOn`, `SettingsScreen / BlockedByPhone`; trạng thái khác ở hàng `SettingsScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** [trang Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) (Figma)
- **Mở từ:** icon cài đặt trên `HomeScreen`; lời mời bật nhắc sau lần lưu khoản thứ 3 (mục 3)

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Thanh trên: nút quay lại + tiêu đề "Cài đặt".
2. Tiêu đề mục "Nhắc nhở".
3. `ToggleRow`: nhãn "Nhắc ghi chép mỗi tối"; mô tả "Khoảng 21:00, chỉ nhắc khi hôm nay bạn chưa ghi khoản nào" (mô tả theo Q8).
4. Dòng cảnh báo (chỉ khi quyền thông báo bị tắt ở máy), mục 2.
5. Tiêu đề mục "Về dữ liệu" + đoạn chữ: "Dữ liệu chỉ lưu trên điện thoại này. Gỡ app sẽ mất toàn bộ dữ liệu." (EC-10).
6. Tiêu đề mục "Khác" (Caption, `--color-text-secondary`) + danh sách `ListRow` trong một thẻ *(thêm 21/11, đợt 1)*:
   - "Thông tin dùng thử" → `TrialInfoScreen`
   - "Quyền riêng tư" → `PrivacyScreen`
   - "Giới thiệu" → `AboutScreen`
   - "Xoá toàn bộ dữ liệu" (tone danger, chữ `--color-danger-text`) → `DeleteAllDataScreen`
7. Dòng phiên bản app (12px, `--color-text-secondary`).

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Tắt (mặc định – Q5) | Chưa bật | Công tắc tắt |
| Đang bật | Đã bật và máy cho phép thông báo | Công tắc bật |
| Bật nhưng máy chặn | Đã bật trong app, quyền thông báo của máy bị tắt | Công tắc bật + dòng `--color-warning-text`: "Điện thoại đang chặn thông báo của Ví Khéo" + nút "Mở cài đặt điện thoại" |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bật công tắc lần đầu | Hiện câu giải thích ngắn rồi mới gọi hộp xin quyền của hệ điều hành (theo hướng dẫn Android: xin quyền đúng ngữ cảnh) |
| Người dùng từ chối quyền | Công tắc về tắt; `Snackbar` "Bạn có thể bật lại trong cài đặt điện thoại" |
| Tắt công tắc | Huỷ lịch nhắc; không nhận thông báo nữa |
| Bấm "Mở cài đặt điện thoại" | Mở trang thông báo của app trong cài đặt máy |
| **Lời mời bật nhắc** (đề xuất Q5) | Sau khi người dùng lưu khoản thứ 3, `Snackbar` "Muốn được nhắc ghi chép mỗi tối?" + nút "Bật" – chỉ hỏi 1 lần |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Cài đặt" |
| Nhãn | "Nhắc ghi chép mỗi tối" |
| Mô tả | "Khoảng 21:00, chỉ nhắc khi hôm nay bạn chưa ghi khoản nào" |
| Giải thích trước khi xin quyền | "Ví Khéo sẽ gửi 1 thông báo vào buổi tối để bạn nhớ ghi các khoản đã tiêu. Không quảng cáo." |
| Cảnh báo | "Điện thoại đang chặn thông báo của Ví Khéo" · nút "Mở cài đặt điện thoại" |
| Về dữ liệu | "Dữ liệu chỉ lưu trên điện thoại này. Gỡ app sẽ mất toàn bộ dữ liệu." |
| Nội dung thông báo | Tiêu đề "Ví Khéo" · nội dung "Hôm nay bạn có khoản chi nào chưa ghi không?" |
| Mục "Khác" | "Khác" · "Thông tin dùng thử" · "Quyền riêng tư" · "Giới thiệu" · "Xoá toàn bộ dữ liệu" |

Thông báo nhắc trông thế nào trên màn khoá: khung `NotificationMock / Reminder2100` (component `NotificationCard`) ở hàng `SettingsScreen – states` – chỉ để minh hoạ, giao diện thật do hệ điều hành vẽ.

## 5. Ngoài phạm vi

- Không đổi giờ nhắc (cố định khoảng 21:00).
- Không cài đặt ngôn ngữ, giao diện tối, tài khoản.
