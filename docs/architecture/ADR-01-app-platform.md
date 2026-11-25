# ADR-01: App chạy trên nền tảng nào?

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.1) · **Trạng thái:** Đã chấp nhận · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa, Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| Câu hỏi | App chạy trên nền tảng nào, dựng bằng gì? |
| Ảnh hưởng tới | Mọi User Story (US01 – US08), nhất là US05 (nhắc 21:00); bản dùng thử 03/12; ADR-02, ADR-03, ADR-04 |
| Thay thế | Không (bản đề xuất PWA ngày 26/11/2026 chưa được chấp nhận, xem lịch sử git) |
| Hạn quyết định | 26/11/2026 – đã trễ hạn 25/11 của `00-master-plan.md` (K1 – K4); chặn bước "Spec + plan" của mọi story |

## 1. Bối cảnh

Sprint 2 (24/11 – 03/12) phải ra bản dùng thử có US01, US02, US03, US07 để ≥ 5 sinh viên dùng 7 ngày từ 04/12 (`07-roadmap.md`). Chưa có dòng code nào, nên mọi plan đang bị chặn (AGENTS.md quy tắc 1). Ràng buộc: 3 Sprint, 8 Developer, chạy trên điện thoại thật (Definition of Done điều 2), dữ liệu trên máy, không đăng nhập (AGENTS.md quy tắc 3).

**Đổi tiêu chí A1 (nhóm chốt ngày 26/11/2026):** MVP chỉ làm **Android**, chưa cần iPhone. Lý do: cài app native lên iPhone của người dùng thử mà không qua App Store cần Apple Developer Program 99 USD/năm (n2) – trượt A4. Tiêu chí A1 trong ADR này đọc là "chạy trên điện thoại Android thật"; iPhone xét lại sau MVP (mục 7).

## 2. Năng lực của nhóm

Nhóm chưa hỏi nhanh 8 Developer (việc K1 của `00-master-plan.md`); tỷ lệ sinh viên dùng Android / iPhone chưa có trong `00-research-log.md`.

| Công nghệ | Số Developer đã từng làm | Nguồn |
| :--- | :-: | :--- |
| React / TypeScript | Cần bổ sung | Chưa hỏi nhanh |
| React Native / Expo | Cần bổ sung | Chưa hỏi nhanh |
| Flutter / Dart | Cần bổ sung | Chưa hỏi nhanh |
| Web (HTML/JS) | Cần bổ sung | Chưa hỏi nhanh |

## 3. Phương án

| # | Phương án | Mô tả ngắn |
| :-: | :--- | :--- |
| 1 | React Native (Expo) + TypeScript | App Android thật; khi code chạy thử bằng Expo Go; phát bản dùng thử bằng file APK |
| 2 | Web app cài lên màn hình chính (PWA) – React + TypeScript + Vite | Mở bằng link, "Thêm vào màn hình chính" |
| 3 | Flutter | App Android thật viết bằng Dart, phát bằng APK |

## 4. Lọc tiêu chí bắt buộc (nhóm A)

| Tiêu chí | PA 1 Expo | PA 2 PWA | PA 3 Flutter | Nguồn |
| :--- | :-: | :-: | :-: | :--- |
| A1 – Chạy trên điện thoại Android thật (đổi ở mục 1) | Đạt | Đạt | Đạt | n3, n4 |
| A2 – Lưu trên máy, offline, không đăng nhập | Đạt | Đạt | Đạt | Chi tiết ở ADR-02 |
| A3 – Bản dùng thử trước 03/12 không qua cửa hàng | Đạt – APK cài thẳng | Đạt – link | Đạt – APK | n3 |
| A4 – Miễn phí | Đạt | Đạt | Đạt | Gói miễn phí Expo có build Android (n6); không cần tài khoản Google Play khi phát APK |

## 5. Chấm điểm (nhóm B)

B1 chưa có dữ liệu nên **không tính vào tổng**. B3 của Flutter chưa đọc tài liệu nên cũng chưa tính.

| Tiêu chí | Trọng số | PA 1 Expo | PA 2 PWA | PA 3 Flutter |
| :--- | :-: | :-: | :-: | :-: |
| B1 – Developer đã biết | 3 | Cần bổ sung | Cần bổ sung | Cần bổ sung |
| B2 – Thời gian dựng khung | 3 | 4 | 4 | 3 |
| B3 – Nhắc 21:00 (US05) | 2 | 4 | 1 | Cần kiểm chứng |
| B4 – AI agent sinh code tốt | 2 | 5 | 5 | 3 |
| B5 – Unit test logic dễ | 2 | 5 | 5 | 4 |
| B6 – Cài cho người dùng thử | 1 | 4 | 5 | 4 |
| **Tổng (chưa có B1)** | | **44** | **39** | **27** (chưa có B3) |

| Ô | Lý do | Nhãn / nguồn |
| :--- | :--- | :--- |
| B2 – PA 1 | Tạo dự án bằng một lệnh; khi code chạy thẳng trên Expo Go vì expo-sqlite và thông báo cục bộ đều có sẵn trong Expo Go, chưa cần bản build riêng | [THỨ CẤP] n1, n4 · [NHẬN ĐỊNH] |
| B2 – PA 3 | Cài Flutter SDK và Android Studio; ngôn ngữ Dart mới với nhóm | [NHẬN ĐỊNH] |
| B3 – PA 1 | expo-notifications hẹn được thông báo cục bộ hằng ngày theo giờ, phút. Android 12+ muốn đúng giờ chính xác phải xin `SCHEDULE_EXACT_ALARM` (Android 14+ mặc định từ chối) → nhắc "khoảng 21:00", khớp đề xuất Q16. Không đạt 5 vì chỉ có Android | [THỨ CẤP] n4 |
| B3 – PA 2 | Web không hẹn giờ thông báo cục bộ được; Web Push cần máy chủ | [THỨ CẤP] n5 |
| B4 – PA 1, 2 | Kiểu dữ liệu `budget-logic` 4.1 đã viết bằng TypeScript; agent sinh code React / React Native + TS phổ biến | [NHẬN ĐỊNH] · `budget-logic` 4.1 |
| B4 – PA 3 | Phải chuyển kiểu dữ liệu sang Dart | [NHẬN ĐỊNH] |
| B5 – PA 1 | `jest-expo`: test chạy trên máy tính bằng `npm run test` | [THỨ CẤP] n7 |
| B5 – PA 3 | Flutter có bộ test riêng, chưa đọc tài liệu | [NHẬN ĐỊNH] |
| B6 – PA 1, 3 | Mở link tải APK → cho phép cài từ nguồn ngoài → cài (3 bước) | [THỨ CẤP] n3 |
| B6 – PA 2 | Mở link → thêm vào màn hình chính (2 bước) | [NHẬN ĐỊNH] |

## 6. Quyết định

**Chọn:** PA 1 – **React Native (Expo) + TypeScript**, chỉ Android trong MVP.

PA 1 dẫn điểm (44 so với 39) nhờ làm được nhắc 21:00 trên Android (B3). Kết quả hỏi nhanh B1 chỉ làm đổi quyết định nếu ≤ 2/8 người biết React (mục 7).

## 7. Hệ quả

| Loại | Nội dung |
| :--- | :--- |
| Được | App Android thật, có thông báo cục bộ cho US05; khi code chạy ngay trên Expo Go; phát bản dùng thử bằng APK, không tốn phí, không qua Google Play |
| Mất / chấp nhận đánh đổi | **Không có bản iPhone** trong MVP – người dùng thử chỉ tuyển người dùng Android (D5); slide demo phải nói rõ. Mỗi lần cập nhật bản dùng thử, người dùng phải tải và cài APK mới |
| Rủi ro | Cài APK mới đè lên bản cũ chỉ giữ dữ liệu khi cùng khoá ký → Cách giảm: mọi bản build dùng cùng một khoá ký do EAS quản lý (Cần kiểm chứng ở ADR-03); thử cài đè trên một máy trước 03/12 |
| Rủi ro | Nhắc 21:00 có thể lệch giờ trên Android 12+ → Cách giảm: ghi "khoảng 21:00" trong AC US05 (Q16) |
| Xem lại quyết định khi | Hỏi nhanh cho thấy ≤ 2/8 Developer biết React · hoặc PO cần bản iPhone (cần Apple Developer Program 99 USD/năm, hoặc quay lại PA 2) · hoặc tuyển không đủ 5 người dùng thử Android |

## 8. Việc cần làm sau quyết định

- [ ] SM hỏi nhanh 8 Developer, điền mục 2 và ô B1
- [ ] Sửa `tech-decision` mục 4.2 tiêu chí A1 (Android trong MVP) – Pull Request sửa skill, chạy `bash scripts/sync-skills.sh`
- [ ] Cặp nghiên cứu tuyển người dùng thử **Android** (D5)
- [ ] ADR-03 (phát hành bản dùng thử): EAS Build APK, khoá ký dùng chung
- [ ] Cập nhật `docs/architecture/technical-design.md` (sau khi ADR-02 được chấp nhận)
- [ ] Cập nhật `frontend-ui` mục 4.1 dòng "Đã chốt"
- [x] Cập nhật dòng trong `docs/architecture/README.md`

## 9. Người tham gia quyết định

| Ngày | Hình thức | Người tham gia | Kết quả |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Bản đề xuất PWA do AI (Claude Code) soạn | Nguyễn Diên Tiến | Không chọn – nhóm chọn React Native, làm Android trước |
| 26/11/2026 | Trao đổi trong phiên Claude Code | Nguyễn Diên Tiến (báo lại nhóm) | Chấp nhận PA 1, Android trước. SM ghi nhận tại Daily Scrum kế tiếp |

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn | Nội dung dùng |
| :--- | :--- | :--- |
| n1 | [Expo – SQLite](https://docs.expo.dev/versions/latest/sdk/sqlite/) | "Included in Expo Go" |
| n2 | [Expo – Apple Developer Program explained: free vs paid](https://expo.dev/blog/apple-developer-program-explained-free-vs-paid) (02/11/2026) | 99 USD/năm; tài khoản Apple miễn phí không gửi được bản build cho người khác |
| n3 | [Expo – Build APKs for Android](https://docs.expo.dev/build-reference/apk/) (02/11/2026) | `"buildType": "apk"`; người dùng mở link build trên máy để cài |
| n4 | [Expo – Notifications](https://docs.expo.dev/versions/latest/sdk/notifications/) | Thông báo cục bộ vẫn có trong Expo Go; Android 12+ cần `SCHEDULE_EXACT_ALARM` để đúng giờ chính xác; Android 13 hỏi quyền khi có kênh thông báo |
| n5 | [Chrome for Developers – Notification Triggers API](https://developer.chrome.com/docs/web-platform/notification-triggers) | Hẹn giờ thông báo trên web đã ngừng phát triển |
| n6 | [Expo – Pricing](https://expo.dev/pricing) | Gói miễn phí có tối đa 15 bản build Android |
| n7 | [Expo – Unit testing with Jest](https://docs.expo.dev/develop/unit-testing/) (02/11/2026) | `jest-expo`; Windows: `npx expo install jest-expo jest @types/jest "--" --dev`; chạy `npm run test` |
