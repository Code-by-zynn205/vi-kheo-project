# ADR-02: Lưu dữ liệu trên máy bằng cách nào?

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.1) · **Trạng thái:** Đã chấp nhận · **Phụ trách:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| Câu hỏi | App React Native (ADR-01) lưu giao dịch, ngân sách, cài đặt bằng cơ chế nào? |
| Ảnh hưởng tới | Lớp `storage` của `budget-logic` 4.1; mọi story ghi/đọc E01 – E05; Q6 (xoá mềm) |
| Thay thế | Không (bản đề xuất IndexedDB ngày 26/11/2026 chưa được chấp nhận, xem lịch sử git) |
| Hạn quyết định | 26/11/2026 – cùng ADR-01; US01 là story đầu tiên tạo E01 (`00-master-plan.md` mục 5) |

## 1. Bối cảnh

Mất dữ liệu giữa tuần dùng thử 04/12 – 10/12 là rủi ro lớn nhất, vì A4 đo việc ghi chép liên tục. Tiêu chí dữ liệu lấy từ `data-analysis.md:827`: ràng buộc duy nhất, ghi nhiều bản ghi nguyên tử, truy vấn theo khoảng ngày (mục 11), đường lên R3 (mục 6, 8.11). Lớp `storage` sẽ chuyển sang **bất đồng bộ (Promise)** – nhóm đã chốt ngày 26/11/2026.

Nhóm đã cân nhắc lưu lên đám mây (Firebase, Supabase) ngay trong MVP và **quyết định không đưa vào MVP** (mục 4, 8).

## 2. Năng lực của nhóm

| Công nghệ | Số Developer đã từng làm | Nguồn |
| :--- | :-: | :--- |
| SQL / SQLite | Cần bổ sung | Chưa hỏi nhanh (chung câu hỏi ADR-01 mục 2) |
| AsyncStorage | Cần bổ sung | Chưa hỏi nhanh |

## 3. Phương án

| # | Phương án | Mô tả ngắn |
| :-: | :--- | :--- |
| 1 | SQLite trên máy qua `expo-sqlite` | Mỗi thực thể một bảng, chỉ mục theo `date`, transaction, nâng phiên bản schema bằng `PRAGMA user_version` |
| 2 | AsyncStorage (khoá – giá trị) | Lưu dữ liệu dạng chuỗi JSON theo khoá; lọc bằng code |
| 3 | Đám mây: Firebase (Firestore) hoặc Supabase, đăng nhập ẩn danh | Dữ liệu lên máy chủ; Firestore tự lưu tạm trên máy, Supabase phải ghép thêm thư viện đồng bộ |

## 4. Lọc tiêu chí bắt buộc (nhóm A)

| Tiêu chí | PA 1 SQLite | PA 2 AsyncStorage | PA 3 Đám mây | Nguồn |
| :--- | :-: | :-: | :-: | :--- |
| A1 – Android thật | Đạt | Đạt | Đạt | s1 |
| A2 – Lưu trên máy, offline, không đăng nhập | Đạt | Đạt | **Không đạt** – cần tài khoản (ẩn danh) và máy chủ; trái AGENTS.md quy tắc 3, `budget-logic` quy tắc 2, `tech-decision` quy tắc 4 | s1, s4 |
| A3 – Bản dùng thử trước 03/12 | Đạt | Đạt | Rủi ro – Supabase phải tự dựng phần đồng bộ offline | s3 |
| A4 – Miễn phí | Đạt | Đạt | Đạt ở gói miễn phí (Supabase tạm dừng dự án nếu một tuần ít hoạt động) | s5 |

**Loại PA 3 khỏi MVP.** Ngoài A2, đăng nhập ẩn danh **không** giữ được dữ liệu khi gỡ app hoặc đổi máy (s4), nên đám mây không giải quyết EC-10 nếu không có đăng nhập thật. Lợi ích trong MVP chủ yếu thuộc về nhóm (đo A4), không thuộc về sinh viên.

## 5. Chấm điểm (nhóm B)

B3, B6 như nhau giữa PA 1 và PA 2 nên ghi `—`. B1 chưa có dữ liệu, không tính.

| Tiêu chí | Trọng số | PA 1 SQLite | PA 2 AsyncStorage |
| :--- | :-: | :-: | :-: |
| B1 – Developer đã biết | 3 | Cần bổ sung | Cần bổ sung |
| B2 – Thời gian dựng khung | 3 | 4 | 5 |
| B3 – Nhắc 21:00 | 2 | — | — |
| B4 – AI agent sinh code tốt | 2 | 4 | 4 |
| B5 – Unit test dễ | 2 | 3 | 4 |
| B6 – Cài cho người dùng thử | 1 | — | — |
| **Tổng (chưa có B1)** | | **26** | **31** |

| Ô | Lý do | Nhãn / nguồn |
| :--- | :--- | :--- |
| B2 – PA 1 | Có sẵn trong Expo Go, nhưng phải viết bảng và migration | [THỨ CẤP] s1 · [NHẬN ĐỊNH] |
| B2 – PA 2 | Đọc / ghi chuỗi theo khoá, ít code nhất | [NHẬN ĐỊNH] |
| B4 – cả hai | Phổ biến, nhiều ví dụ | [NHẬN ĐỊNH] |
| B5 – PA 1 | Logic tính tiền là hàm thuần nên test không cần SQLite; riêng test lớp `storage` cần giả lập `expo-sqlite` | [NHẬN ĐỊNH] – Cần kiểm chứng khi dựng khung |
| B5 – PA 2 | Giả lập kho khoá – giá trị đơn giản hơn | [NHẬN ĐỊNH] – Cần kiểm chứng |

## 6. Tiêu chí dữ liệu (`data-analysis.md:827`, mục 11)

| Tiêu chí | PA 1 SQLite | PA 2 AsyncStorage | Nguồn |
| :--- | :--- | :--- | :--- |
| Còn sau khi tắt app, khởi động lại | Có – "persisted across restarts" | Có | s1 · [NHẬN ĐỊNH] cho PA 2 |
| Ràng buộc duy nhất (`id`) | `PRIMARY KEY` / `UNIQUE` | Phải tự kiểm bằng code | [NHẬN ĐỊNH] |
| Ghi nhiều bản ghi nguyên tử (xoá hết dữ liệu – BR-129, EC-13 hết pin khi đang lưu) | `withTransactionAsync` / `withExclusiveTransactionAsync` | Không có transaction – Cần kiểm chứng | s1 |
| Truy vấn theo khoảng ngày (US01, US03, US04, US08) | `WHERE date BETWEEN ? AND ?` có chỉ mục | Đọc hết rồi lọc trong bộ nhớ | [NHẬN ĐỊNH] |
| Nâng phiên bản schema (E05 `AppMeta.schemaVersion`) | `PRAGMA user_version` (ví dụ trong tài liệu) | Tự viết | s1 |
| Đường lên R3 (đồng bộ) | Bảng có `updatedAt`, `deletedAt` – sẵn sàng đồng bộ | Phải chuyển dữ liệu | [NHẬN ĐỊNH] |

## 7. Quyết định

**Chọn:** PA 1 – **SQLite trên máy qua `expo-sqlite`**, lớp `storage` trả `Promise`.

Nhóm B nghiêng về AsyncStorage (31 – 26) chỉ vì ít code hơn. Yếu tố quyết định là mục 6: transaction chống bản ghi dở (EC-13), ràng buộc duy nhất chống tạo trùng (EC-11), truy vấn theo ngày và nâng phiên bản schema có sẵn. `[NHẬN ĐỊNH]`

**Q6 (xoá mềm, kiến trúc sư quyết):** chọn **xoá mềm** – cột `deletedAt`, mọi truy vấn lọc `deletedAt IS NULL` (BR-90, BR-91). Cặp dữ liệu điền cột "Quyết định" Q6 trong `po-decision-proposals.md`.

## 8. Hệ quả

| Loại | Nội dung |
| :--- | :--- |
| Được | Chạy offline hoàn toàn, không tài khoản, không máy chủ; transaction, chỉ mục, migration có sẵn; chạy được trên Expo Go khi code |
| Mất / chấp nhận đánh đổi | Thêm việc viết bảng và migration; **gỡ app là mất dữ liệu** (EC-10) – báo trước cho người dùng thử; nhóm không tự xem được dữ liệu dùng thử, đo A4 bằng `TrialInfoScreen` (BR-126, Q4) |
| Rủi ro | Cài APK mới không cùng khoá ký → phải gỡ app cũ → mất dữ liệu → Cách giảm: cùng một khoá ký (ADR-01 mục 7, ADR-03) |
| Rủi ro | Đổi schema giữa tuần dùng thử làm hỏng dữ liệu cũ → Cách giảm: mỗi thay đổi bảng tăng `user_version` và có migration; thử cài đè trên máy có dữ liệu trước khi phát |
| Đám mây (R3) | Khi có User Story đồng bộ (US17) được PO duyệt, viết ADR mới. Điểm đã biết: Firestore tự lưu trên máy, tự đồng bộ (s2); Supabase hợp mô hình quan hệ và trang quản trị R3, nhưng phải ghép thư viện đồng bộ (s3) |
| Xem lại quyết định khi | Đến 28/11 cặp dữ liệu chưa chạy được `expo-sqlite` trên Expo Go · hoặc PO duyệt US17 (đồng bộ) vào MVP |

## 9. Việc cần làm sau quyết định

- [ ] Sửa `budget-logic` mục 4.1: chữ ký `storage` trả `Promise`; ghi "SQLite qua `expo-sqlite` (ADR-02)" – Pull Request sửa skill, chạy `bash scripts/sync-skills.sh`
- [ ] Điền cột "Quyết định" Q6 trong `po-decision-proposals.md`: xoá mềm
- [ ] Ghi bảng, cột, chỉ mục, cách migration vào `technical-design.md` mục mô hình dữ liệu
- [x] Cập nhật dòng trong `docs/architecture/README.md`

## 10. Người tham gia quyết định

| Ngày | Hình thức | Người tham gia | Kết quả |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Trao đổi trong phiên Claude Code (cân nhắc Firebase, Supabase) | Nguyễn Diên Tiến (báo lại nhóm) | Chấp nhận SQLite trên máy; đám mây để R3. SM ghi nhận tại Daily Scrum kế tiếp |

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn | Nội dung dùng |
| :--- | :--- | :--- |
| s1 | [Expo – SQLite](https://docs.expo.dev/versions/latest/sdk/sqlite/) | "The database is persisted across restarts of your app"; `openDatabaseAsync`; `withTransactionAsync`, `withExclusiveTransactionAsync`; ví dụ migration bằng `PRAGMA user_version`; có trong Expo Go |
| s2 | [Firebase – Access data offline](https://firebase.google.com/docs/firestore/manage-data/enable-offline) · [RNFirebase – Cloud Firestore](https://rnfirebase.io/firestore/usage) | Lưu trên máy bật mặc định trên Android |
| s3 | [Supabase – Offline-first với WatermelonDB](https://supabase.com/blog/react-native-offline-first-watermelon-db) · [Supabase – PowerSync](https://supabase.com/partners/integrations/powersync) | Không có sẵn offline; phải ghép thư viện đồng bộ |
| s4 | [Supabase – Anonymous Sign-Ins](https://supabase.com/docs/guides/auth/auth-anonymous) · [Firebase – Anonymous auth (Android)](https://firebase.google.com/docs/auth/android/anonymous-auth?hl=En) | Người dùng ẩn danh mất tài khoản khi đăng xuất, xoá dữ liệu, đổi máy |
| s5 | [Supabase – Free project pausing](https://supabase.com/kb/faqs/platform/free-project-pausing) · [Firestore – Usage and limits](https://firebase.google.com/docs/firestore/quotas) | Giới hạn gói miễn phí |
