# ADR-04: Nhắc ghi chép khoảng 21:00 làm bằng cách nào?

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.1) · **Trạng thái:** Đề xuất · **Phụ trách:** Nguyễn Đức Minh Nghĩa, Lê Thị Phát · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| Câu hỏi | Hẹn thông báo nhắc ghi chép mỗi tối thế nào để bỏ được ngày đã ghi (Q8) và vẫn chạy sau khi khởi động lại máy? |
| Ảnh hưởng tới | US05; US01, US06 (lưu / xoá khoản phải tính lại lịch nhắc) |
| Thay thế | Không |
| Hạn quyết định | 01/12/2026 (K6 của `00-master-plan.md`) – trước khi viết plan US05 (dòng 6 hàng đợi) |

## 1. Bối cảnh

ADR-01 chọn React Native (Expo), chỉ Android; ADR-02 không có máy chủ, nên chỉ dùng được **thông báo cục bộ**, không push. US05 cần: nhắc khoảng 21:00 mỗi ngày (Q16), **không nhắc nếu hôm nay đã ghi** (Q8 – đề xuất), bấm thông báo mở màn nhập, tắt nhắc thì không còn thông báo kể cả sau khi khởi động lại máy (06 US05 AC4), tối đa 1 thông báo nhắc mỗi ngày (BR-127).

## 2. Năng lực của nhóm

Cả 8 Developer code tốt (ADR-01 mục 2, lời Nguyễn Diên Tiến 26/11/2026); chưa có số theo từng thư viện – B1 như nhau giữa các phương án.

## 3. Phương án

| # | Phương án | Mô tả ngắn |
| :-: | :--- | :--- |
| 1 | `expo-notifications`, **lịch cuộn 7 ngày** bằng trigger `DATE` | Hẹn 7 thông báo riêng lẻ lúc 21:00 cho 7 ngày tới; mỗi lần mở app, lưu hoặc xoá khoản thì huỷ hết và hẹn lại – bỏ hôm nay nếu đã ghi hoặc đã qua 21:00 |
| 2 | `expo-notifications`, trigger `DAILY` lặp lại | Một thông báo lặp 21:00 mỗi ngày; không biết hôm nay đã ghi hay chưa |

Không xét: tác vụ chạy nền tự kiểm rồi gửi – giờ chạy do hệ điều hành quyết định, không hứa được "khoảng 21:00" (`Cần kiểm chứng`, chưa đọc tài liệu chạy nền).

## 4. Lọc tiêu chí bắt buộc (nhóm A)

| Tiêu chí | PA 1 | PA 2 | Nguồn |
| :--- | :-: | :-: | :--- |
| A1 – Android thật | Đạt | Đạt | n1: `DATE`, `DAILY` hỗ trợ Android |
| A2 – Offline, không đăng nhập | Đạt – thông báo cục bộ | Đạt | n1, n2 |
| A3 – Có trong bản dùng thử | Đạt – có trong Expo Go và bản build | Đạt | n2 |
| A4 – Miễn phí | Đạt | Đạt | — |

## 5. Chấm điểm (nhóm B)

B1 như nhau; B6 không liên quan.

| Tiêu chí | Trọng số | PA 1 lịch cuộn | PA 2 lặp hằng ngày |
| :--- | :-: | :-: | :-: |
| B2 – Thời gian làm | 3 | 3 | 4 |
| B3 – Nhắc 21:00 đúng yêu cầu | 2 | 5 | 3 |
| B4 – AI agent sinh code tốt | 2 | 4 | 4 |
| B5 – Unit test dễ | 2 | 5 | 4 |
| **Tổng** | | **37** | **34** |

| Ô | Lý do | Nhãn / nguồn |
| :--- | :--- | :--- |
| B2 – PA 1 | Thêm hàm tính 7 ngày cần nhắc và gọi lại sau mỗi lần lưu / xoá / mở app | [NHẬN ĐỊNH] |
| B2 – PA 2 | Một lời gọi hẹn; tắt nhắc là huỷ hết | [NHẬN ĐỊNH] · n1 |
| B3 – PA 1 | Bỏ được ngày đã ghi (Q8); mỗi ngày tối đa 1 thông báo (BR-127) | [THỨ CẤP] n1 (`cancelScheduledNotificationAsync`) |
| B3 – PA 2 | Vẫn nhắc cả ngày đã ghi – trái Q8 nếu PO chọn "Có" | [THỨ CẤP] n1 |
| B5 – PA 1 | "Ngày nào cần nhắc" là hàm thuần nhận `today`, `now`, "hôm nay đã ghi chưa" – test trên máy tính | [NHẬN ĐỊNH] · `budget-logic` mục 6 |

## 6. Quyết định

**Đề xuất chọn:** PA 1 – `expo-notifications`, lịch cuộn 7 ngày, trigger `DATE`.

Cách làm:
1. Tạo kênh thông báo Android (`setNotificationChannelAsync`) **trước** khi xin quyền – Android 13 chỉ hiện hộp xin quyền khi đã có ít nhất một kênh (n1).
2. Xin quyền bằng `requestPermissionsAsync()` khi người dùng bật công tắc (sau câu giải thích, `SettingsScreen.md` mục 3).
3. Hàm thuần `src/logic/reminderSchedule.ts`: nhận `today`, giờ hiện tại, "hôm nay đã có khoản chưa xoá" → trả 7 mốc 21:00; bỏ hôm nay nếu đã ghi hoặc đã qua 21:00.
4. `src/storage` không gọi thông báo; một module `src/reminder/` gọi `cancelAllScheduledNotificationsAsync()` rồi `scheduleNotificationAsync()` cho từng mốc. Gọi lại khi: mở app, lưu khoản, xoá / hoàn tác khoản, bật / tắt công tắc.
5. Bấm thông báo → `addNotificationResponseReceivedListener` và `getLastNotificationResponseAsync()` lúc mở app → mở `AddExpenseScreen` (06 US05 AC3).
6. **Không** xin `SCHEDULE_EXACT_ALARM`: nhắc "khoảng 21:00" theo Q16.

## 7. Hệ quả

| Loại | Nội dung |
| :--- | :--- |
| Được | Đúng Q8, Q16, BR-127; không máy chủ; thông báo được đặt lại sau khi khởi động máy (module dùng quyền khởi động máy, n1) |
| Mất / chấp nhận đánh đổi | Không mở app 7 ngày liền thì hết thông báo đã hẹn – chấp nhận: tuần dùng thử đúng 7 ngày và người dùng thử mở app hằng ngày nếu còn dùng |
| Rủi ro | Giờ nhắc lệch nhiều trên Android 12+ khi không có quyền báo thức chính xác (n1: "approximate time" – `Cần kiểm chứng` trên máy thật) → Cách giảm: AC ghi "khoảng 21:00 – 22:00" (Q16); đo trên 2 máy trước 04/12 |
| Rủi ro | Giới hạn số thông báo hẹn trước trên Android – tài liệu không nói (n1) → Cách giảm: chỉ hẹn 7 cái; kiểm `getAllScheduledNotificationsAsync()` sau khi hẹn |
| Rủi ro | Nếu PO chọn Q8 = "Không" thì PA 1 thừa công sức → Cách giảm: chuyển sang PA 2, cùng module `src/reminder/`, màn hình không đổi |
| Xem lại quyết định khi | PO trả lời Q8 = "Không" · đo trên máy thật thấy lệch > 1 giờ · thông báo hẹn trước bị mất sau khởi động máy |

## 8. Việc cần làm sau quyết định

- [ ] Ghi `expo-notifications` vào `technical-design.md` mục 1, 6 (thay "Chờ ADR-04")
- [ ] Thêm thư mục `src/reminder/` vào `technical-design.md` mục 2
- [ ] Đo giờ nhắc thật trên 2 máy Android khác hãng trước 04/12
- [x] Thêm dòng vào `docs/architecture/README.md`

## 9. Người tham gia quyết định

| Ngày | Hình thức | Người tham gia | Kết quả |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Bản đề xuất do AI (Claude Code) soạn | Nguyễn Diên Tiến | Chờ Developers thống nhất |

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn | Nội dung dùng |
| :--- | :--- | :--- |
| n1 | [Expo – Notifications (v58)](https://docs.expo.dev/versions/latest/sdk/notifications/) | Trigger `DATE`, `DAILY` hỗ trợ Android; `scheduleNotificationAsync`, `cancelScheduledNotificationAsync`, `cancelAllScheduledNotificationsAsync`, `getAllScheduledNotificationsAsync`; quyền khởi động máy "used to set up scheduled notifications when the device (re)starts"; Android 13 "This prompt will not appear until at least one notification channel is created"; `addNotificationResponseReceivedListener`; không có `SCHEDULE_EXACT_ALARM` thì giờ gần đúng (đọc qua bản tóm tắt) |
| n2 | [Expo – What you need to know about notifications](https://docs.expo.dev/push-notifications/what-you-need-to-know/) (07/08/2026) | Thông báo cục bộ có trong Expo Go; push cần bản build riêng |
