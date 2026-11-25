# ADR-01: App chạy trên nền tảng nào?

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.1) · **Trạng thái:** Đề xuất · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa, Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| Câu hỏi | App chạy trên nền tảng nào, dựng bằng gì? |
| Ảnh hưởng tới | Mọi User Story (US01 – US08), nhất là US05 (nhắc 21:00); bản dùng thử 03/12; ADR-02, ADR-03, ADR-04 |
| Thay thế | Không |
| Hạn quyết định | 27/11/2026 – đã trễ hạn 25/11 của `00-master-plan.md` (K1 – K4); chặn bước "Spec + plan" của mọi story |

## 1. Bối cảnh

Sprint 2 (24/11 – 03/12) phải ra bản dùng thử có US01, US02, US03, US07 để ≥ 5 sinh viên dùng 7 ngày từ 04/12 (`07-roadmap.md`). Chưa có dòng code nào, chưa có `technical-design.md`, nên mọi plan đang bị chặn (AGENTS.md quy tắc 1). Ràng buộc: 3 Sprint, 8 Developer, chạy trên điện thoại thật của sinh viên (Definition of Done điều 2), dữ liệu trên máy, không đăng nhập (AGENTS.md quy tắc 3). Persona "không muốn đăng ký tài khoản", "thích app mở lên dùng ngay" (`03-personas.md:36`).

## 2. Năng lực của nhóm

Nhóm chưa hỏi nhanh 8 Developer (việc K1 của `00-master-plan.md`). Tỷ lệ sinh viên dùng Android / iPhone cũng chưa có trong `00-research-log.md`.

| Công nghệ | Số Developer đã từng làm | Nguồn |
| :--- | :-: | :--- |
| HTML/CSS/JavaScript | Cần bổ sung | Chưa hỏi nhanh |
| React + TypeScript | Cần bổ sung | Chưa hỏi nhanh |
| React Native / Expo | Cần bổ sung | Chưa hỏi nhanh |
| Flutter / Dart | Cần bổ sung | Chưa hỏi nhanh |

Câu hỏi nhanh đề xuất cho SM (một tin nhắn nhóm): "Bạn đã từng làm dự án (kể cả bài tập) bằng: HTML/JS thuần · React · TypeScript · React Native/Expo · Flutter? Điện thoại bạn là Android hay iPhone?"

## 3. Phương án

| # | Phương án | Mô tả ngắn |
| :-: | :--- | :--- |
| 1 | Web app cài lên màn hình chính (PWA) – React + TypeScript + Vite | Mở bằng link trong Safari/Chrome, "Thêm vào màn hình chính"; component theo `design-system` 4.3 |
| 2 | Web app cài lên màn hình chính (PWA) – HTML/CSS/JavaScript thuần | Mở rộng thẳng từ `docs/design/prototype/home.html` |
| 3 | React Native (Expo) | App thật, chạy thử bằng Expo Go, cài cho người khác bằng bản build |
| 4 | Flutter | App thật viết bằng Dart |

## 4. Lọc tiêu chí bắt buộc (nhóm A)

| Tiêu chí | PA 1 | PA 2 | PA 3 | PA 4 | Nguồn |
| :--- | :-: | :-: | :-: | :-: | :--- |
| A1 – Chạy trên điện thoại thật, Android và iPhone | Đạt | Đạt | Đạt (về kỹ thuật) | Đạt (về kỹ thuật) | Trình duyệt trên cả hai hệ điều hành; iOS 26 mở trang đã thêm vào màn hình chính như web app (n4) |
| A2 – Lưu trên máy, offline, không đăng nhập | Đạt | Đạt | Đạt | Đạt | Chi tiết ở ADR-02 |
| A3 – Bản dùng thử trước 03/12 không qua cửa hàng ứng dụng | Đạt | Đạt | **Không đạt** (iPhone) | **Không đạt** (iPhone) | n1, n2, n3 |
| A4 – Miễn phí | Đạt | Đạt | **Không đạt** nếu muốn qua A3 | **Không đạt** nếu muốn qua A3 | n2: Apple Developer Program 99 USD/năm |

**Loại PA 3 và PA 4.** Muốn cài app lên iPhone của người khác mà không qua App Store (ad hoc hoặc TestFlight) phải có Apple Developer Program trả phí 99 USD/năm: tài khoản Apple miễn phí chỉ ký được bản cho chính máy mình, "you cannot send the build to anyone else" (n2). Expo tự nói Expo Go "is not meant for reviewing your app" (n1). Flutter build iOS còn cần máy macOS và Xcode (n3). Android thì cả hai đều cài được bằng APK (n1), nhưng A1 yêu cầu cả iPhone.

## 5. Chấm điểm (nhóm B)

Chỉ chấm 2 phương án còn lại. B1 chưa có dữ liệu nên **không tính vào tổng**; tổng sẽ tính lại khi có kết quả hỏi nhanh.

| Tiêu chí | Trọng số | PA 1 React + TS + Vite | PA 2 HTML/JS thuần |
| :--- | :-: | :-: | :-: |
| B1 – Developer đã biết | 3 | Cần bổ sung | Cần bổ sung |
| B2 – Thời gian dựng khung | 3 | 4 | 5 |
| B3 – Nhắc 21:00 (US05) | 2 | 1 | 1 |
| B4 – AI agent sinh code tốt | 2 | 5 | 3 |
| B5 – Unit test logic dễ | 2 | 5 | 5 |
| B6 – Cài cho người dùng thử | 1 | 5 | 5 |
| **Tổng (chưa có B1)** | | **39** | **38** |

**Lý do từng điểm:**

| Ô | Lý do | Nhãn / nguồn |
| :--- | :--- | :--- |
| B2 – PA 1 | Dựng khung bằng một lệnh tạo dự án Vite, nhưng phải chuyển `home.html` sang component | [NHẬN ĐỊNH] |
| B2 – PA 2 | Có sẵn `prototype/home.html`, mở được ngay trên điện thoại | [NHẬN ĐỊNH] · `docs/design/prototype/home.html` |
| B3 – cả hai | Web không hẹn giờ thông báo cục bộ được: Notification Triggers API (hẹn giờ trên máy) đã ngừng phát triển (n5). Web Push trên iPhone có từ iOS 16.4 cho web app trên màn hình chính (n4), nhưng phải có máy chủ gửi – ngoài phạm vi MVP (AGENTS.md quy tắc 3) | [THỨ CẤP] n4, n5 |
| B4 – PA 1 | Mô hình dữ liệu trong `budget-logic` 4.1 đã viết bằng TypeScript; agent sinh component React + TS phổ biến | [NHẬN ĐỊNH] · `budget-logic` 4.1 |
| B4 – PA 2 | 14 màn hình, nhiều component dùng chung (`design-system` 4.3): code DOM thuần do agent sinh dễ rải trạng thái khắp nơi | [NHẬN ĐỊNH] |
| B5 – cả hai | Logic tính tiền là hàm thuần trong `src/logic/`, chạy test trên máy tính bằng một lệnh, không phụ thuộc khung giao diện | [NHẬN ĐỊNH] |
| B6 – cả hai | Người dùng thử: mở link → "Thêm vào màn hình chính" (2 bước) | [NHẬN ĐỊNH] · n4 |

## 6. Quyết định

**Đề xuất chọn:** PA 1 – PWA dựng bằng React + TypeScript + Vite.

Hai phương án gần như hoà (39 – 38). Yếu tố quyết định là B1 (trọng số 3) – **chờ hỏi nhanh**. Trong lúc chờ, nghiêng về PA 1 vì kiểu dữ liệu của `budget-logic` đã là TypeScript và 8 người cùng code nhiều component cần một cấu trúc chung. Nếu hỏi nhanh cho thấy ≤ 2/8 người biết React thì chấm lại B1, có thể đổi sang PA 2.

## 7. Hệ quả

| Loại | Nội dung |
| :--- | :--- |
| Được | Cài cho người dùng thử trên cả Android và iPhone bằng một link, không tốn phí, không qua cửa hàng; cập nhật bản dùng thử chỉ cần đưa bản mới lên, người dùng không phải cài lại |
| Mất / chấp nhận đánh đổi | **US05 nhắc 21:00 không làm được như app thật** trên web khi không có máy chủ (B3 = 1). US05 là Should, không phải Must (`06-journey-features.md`). Cách thay thế (vd. nhắc trong app khi mở, file lịch `.ics`) quyết định ở ADR-04, PO duyệt |
| Rủi ro | Người dùng iPhone mở trong tab Safari thay vì thêm vào màn hình chính → dữ liệu dễ bị xoá (xem ADR-02) → Cách giảm: hướng dẫn cài 2 bước có ảnh trong tài liệu tuyển người dùng thử (D5), kiểm lúc phát bản 04/12 |
| Rủi ro | Cần chỗ đưa web app lên mạng (hosting tĩnh) miễn phí → Cách giảm: chọn ở ADR-03 (cách phát hành bản dùng thử, hạn 27/11) |
| Xem lại quyết định khi | Hỏi nhanh cho thấy ≤ 2/8 Developer biết React (đổi PA 2) · hoặc PO xếp US05 thành Must (cần xem lại PA 3, chấp nhận phí Apple hoặc chỉ dùng thử trên Android) · hoặc ≥ 2 người dùng thử iPhone không cài được |

## 8. Việc cần làm sau quyết định

- [ ] SM hỏi nhanh 8 Developer (mục 2), điền bảng mục 2 và ô B1, tính lại tổng
- [ ] PO được báo: US05 trên web bị giới hạn (mục 7) – quyết định ở ADR-04
- [ ] Cập nhật `docs/architecture/technical-design.md` (sau khi ADR-01, ADR-02 được chấp nhận)
- [ ] Cập nhật `frontend-ui` mục 4.1 dòng "Đã chốt"
- [x] Thêm dòng vào `docs/architecture/README.md`

## 9. Người tham gia quyết định

| Ngày | Hình thức | Người tham gia | Kết quả |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Bản đề xuất do AI (Claude Code) soạn | Nguyễn Diên Tiến | Chờ Developers thống nhất trong Pull Request |

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn | Nội dung dùng |
| :--- | :--- | :--- |
| n1 | [Expo – Share a live mobile preview without TestFlight](https://expo.dev/articles/testing-and-previewing/share-live-mobile-preview-without-testflight) (05/10/2026) | Expo Go không dùng để cho người khác xem app; APK cài thẳng từ link; ad hoc tối đa 100 iPhone/năm trên tài khoản trả phí |
| n2 | [Expo – Apple Developer Program explained: free vs paid](https://expo.dev/blog/apple-developer-program-explained-free-vs-paid) (02/11/2026) | 99 USD/năm; tài khoản miễn phí chỉ ký bản phát triển, không gửi được cho người khác; thông báo cục bộ không cần quyền push |
| n3 | [Flutter – Build and release an iOS app](https://docs.flutter.dev/deployment/ios) (cập nhật 31/07/2026) | Cần Xcode và máy macOS |
| n4 | [WebKit – Web Push for Web Apps on iOS and iPadOS](https://webkit.org/blog/13878/web-push-for-web-apps-on-ios-and-ipados/) · [WebKit Features in Safari 26.0](https://webkit.org/blog/17333/webkit-features-in-safari-26-0/) · [News from WWDC25: WebKit in Safari 26 beta](https://webkit.org/blog/16993/news-from-wwdc25-web-technology-coming-this-fall-in-safari-26-beta/) | Web Push cho web app trên màn hình chính từ iOS 16.4; iOS 26 mở trang thêm vào màn hình chính như web app |
| n5 | [Chrome for Developers – Notification Triggers API](https://developer.chrome.com/docs/web-platform/notification-triggers) | Đã ngừng phát triển |
