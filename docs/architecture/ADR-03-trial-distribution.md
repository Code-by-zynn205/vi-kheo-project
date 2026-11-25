# ADR-03: Phát hành bản dùng thử cho sinh viên bằng cách nào?

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.1) · **Trạng thái:** Đề xuất · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| Câu hỏi | Đóng gói và đưa app Android (ADR-01) tới ≥ 5 sinh viên dùng thử bằng cách nào, để cập nhật được mà không mất dữ liệu? |
| Ảnh hưởng tới | B1 (đóng gói 03/12), D5 (tuyển người dùng thử), D6 (dùng thử 04/12 – 10/12), mọi bản cập nhật trong Sprint 3 |
| Thay thế | Không |
| Hạn quyết định | 27/11/2026 (K5 của `00-master-plan.md`) – phải thử cài một bản trước 01/12 |

## 1. Bối cảnh

ADR-01 chọn React Native (Expo), chỉ Android, không qua Google Play. Trong tuần dùng thử, nhóm sẽ phát thêm bản cập nhật (US05, US06 của Sprint 3). Android chỉ cho cài bản cập nhật đè lên bản cũ khi **cùng chứng chỉ ký**; khác chứng chỉ thì người dùng phải gỡ bản cũ, và gỡ là **xoá toàn bộ dữ liệu** của app (n1). Dữ liệu chỉ nằm trên máy (ADR-02), nên mất khoá ký là mất dữ liệu dùng thử.

## 2. Năng lực của nhóm

| Công nghệ | Số Developer đã từng làm | Nguồn |
| :--- | :-: | :--- |
| EAS Build | Cần bổ sung | Chưa hỏi nhanh |
| Build Android trên máy (Android Studio, Gradle) | Cần bổ sung | Chưa hỏi nhanh |

## 3. Phương án

| # | Phương án | Mô tả ngắn |
| :-: | :--- | :--- |
| 1 | EAS Build trên đám mây, ra file APK | Profile `preview` với `"buildType": "apk"`; khoá ký do EAS tạo và giữ, mọi bản sau dùng lại |
| 2 | Build APK trên máy của nhóm | Cài Android SDK, tự tạo và tự giữ khoá ký |
| 3 | Người dùng thử mở app qua Expo Go | Không có file cài; mở dự án bằng ứng dụng Expo Go |

## 4. Lọc tiêu chí bắt buộc (nhóm A)

| Tiêu chí | PA 1 EAS APK | PA 2 APK trên máy | PA 3 Expo Go | Nguồn |
| :--- | :-: | :-: | :-: | :--- |
| A1 – Android thật | Đạt | Đạt | Đạt | n2 |
| A2 – Lưu trên máy, offline | Đạt | Đạt | Đạt | ADR-02 |
| A3 – Bản dùng thử trước 03/12, không qua cửa hàng | Đạt | Đạt | **Không đạt** – Expo nói Expo Go "is not meant for reviewing your app" | n2, n5 |
| A4 – Miễn phí | Đạt – gói miễn phí có tối đa 15 bản build Android (chu kỳ tính: Cần kiểm chứng) | Đạt | Đạt | n4 |

## 5. Chấm điểm (nhóm B)

Chỉ B2 và B6 khác nhau giữa hai phương án còn lại; B3, B4, B5 ghi `—`. B1 chưa có dữ liệu.

| Tiêu chí | Trọng số | PA 1 EAS APK | PA 2 APK trên máy |
| :--- | :-: | :-: | :-: |
| B1 – Developer đã biết | 3 | Cần bổ sung | Cần bổ sung |
| B2 – Thời gian dựng | 3 | 4 | 2 |
| B3, B4, B5 | — | — | — |
| B6 – Cài cho người dùng thử | 1 | 4 | 4 |
| **Tổng (chưa có B1)** | | **16** | **10** |

| Ô | Lý do | Nhãn / nguồn |
| :--- | :--- | :--- |
| B2 – PA 1 | Chỉ cần tài khoản Expo và một lệnh build; không cài Android SDK; EAS tự tạo khoá ký, lưu trên máy chủ Expo và dùng lại cho mọi bản sau | [THỨ CẤP] n2, n3 |
| B2 – PA 2 | Cài Android SDK/JDK trên máy Windows, tự giữ khoá ký – mất file khoá là mất đường cập nhật | [NHẬN ĐỊNH] · n1 |
| B6 – cả hai | Mở link tải APK → cho phép cài từ nguồn ngoài → cài | [THỨ CẤP] n2 |

## 6. Quyết định

**Đề xuất chọn:** PA 1 – **EAS Build, profile `preview`, ra APK**, khoá ký do EAS giữ (`credentialsSource` mặc định là `remote`).

```json
{
  "build": {
    "preview": {
      "android": { "buildType": "apk" }
    }
  }
}
```

Lệnh build: `eas build -p android --profile preview` (n2).

## 7. Hệ quả

| Loại | Nội dung |
| :--- | :--- |
| Được | Không cần Android SDK trên máy nhóm; một khoá ký duy nhất do EAS giữ nên mọi bản cập nhật cài đè được, giữ dữ liệu |
| Mất / chấp nhận đánh đổi | Phụ thuộc tài khoản Expo và hàng đợi build miễn phí (có thể chờ lâu); giới hạn số bản build miễn phí → **tối đa 1 bản build dùng thử mỗi ngày**, khi code chạy thử bằng Expo Go thay vì build |
| Rủi ro | Build bằng tài khoản Expo khác hoặc tạo khoá mới → chứng chỉ khác → người dùng thử phải gỡ app, mất dữ liệu (n1) → Cách giảm: **một tài khoản Expo của nhóm**, chỉ dùng khoá đã tạo lần đầu; không bao giờ chọn "Generate new keystore" lần thứ hai |
| Rủi ro | Bản mới có `versionCode` thấp hơn bản đã cài thì không cài đè được `[NHẬN ĐỊNH]` → Cách giảm: tăng `versionCode` mỗi bản (cách tự tăng trong EAS: Cần kiểm chứng khi dựng khung) |
| Rủi ro | Khoá ký lọt lên repo (AGENTS.md quy tắc 13) → Cách giảm: chỉ để trên máy chủ EAS; nếu tải về `credentials.json` thì thêm vào `.gitignore`, không commit (n3) |
| Xem lại quyết định khi | Hết lượt build miễn phí trước 13/12 · hàng đợi build làm trễ bản sửa lỗi > 1 ngày (khi đó chuyển PA 2 **dùng lại khoá tải từ EAS**) |

## 8. Việc cần làm sau quyết định

- [ ] SM tạo một tài khoản Expo cho nhóm, ghi ai giữ quyền (không ghi mật khẩu vào repo)
- [ ] Bản build đầu tiên trước 01/12; **thử cài đè**: cài bản 1 → ghi 3 khoản chi → cài bản 2 → 3 khoản vẫn còn
- [ ] Ghi lệnh và hướng dẫn cài vào `technical-design.md` mục 4, 5
- [ ] Cặp nghiên cứu đưa hướng dẫn cài 3 bước vào tài liệu tuyển người dùng thử (D5)
- [x] Thêm dòng vào `docs/architecture/README.md`

## 9. Người tham gia quyết định

| Ngày | Hình thức | Người tham gia | Kết quả |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Bản đề xuất do AI (Claude Code) soạn | Nguyễn Diên Tiến | Chờ Developers thống nhất |

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn | Nội dung dùng |
| :--- | :--- | :--- |
| n1 | [Android Developers – Sign your app](https://developer.android.com/studio/publish/app-signing) · [Android Developers – How app updates work](https://developer.android.com/google/play/app-updates) | Bản cập nhật phải cùng chứng chỉ ký với bản đã cài; không thì phải gỡ bản cũ, xoá hết dữ liệu app |
| n2 | [Expo – Build APKs for Android](https://docs.expo.dev/build-reference/apk/) (02/11/2026) | `"buildType": "apk"`; `eas build -p android --profile preview`; người dùng mở link build trên máy để cài |
| n3 | [Expo – App credentials](https://docs.expo.dev/app-signing/app-credentials/) · [Expo – Configuration with eas.json](https://docs.expo.dev/eas/json/) · [Expo – Using existing credentials](https://docs.expo.dev/app-signing/existing-credentials/) | EAS tạo khoá ký, lưu trên máy chủ Expo, build ký bằng khoá đang gắn với app; `credentialsSource` mặc định `remote`; tải khoá về bằng `eas credentials -p android`; không đưa khoá vào repo |
| n4 | [Expo – Pricing](https://expo.dev/pricing) | Gói miễn phí: tối đa 15 bản build Android, hàng đợi ưu tiên thấp |
| n5 | [Expo – Share a live mobile preview without TestFlight](https://expo.dev/articles/testing-and-previewing/share-live-mobile-preview-without-testflight) (05/10/2026) | Expo Go không dùng để người khác xem app |
