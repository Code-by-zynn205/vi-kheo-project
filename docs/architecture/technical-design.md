# Thiết kế kỹ thuật – Ví Khéo

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.3) · **Trạng thái:** Đang làm – chờ 1 người cặp giao diện + 1 người cặp dữ liệu duyệt; các ô `Cần kiểm chứng` chốt khi dựng khung (task đầu của plan US01) · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa, Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

File này là nơi duy nhất ghi công nghệ, cấu trúc thư mục và lệnh của dự án. `writing-plans` lấy mục 1 làm **Tech Stack**, mục 2 làm đường dẫn file, mục 4 làm lệnh kiểm tra.

## 1. Ngăn xếp công nghệ

| Thành phần | Công nghệ | Phiên bản | Quyết định |
| :--- | :--- | :--- | :--- |
| Nền tảng app | React Native qua Expo, TypeScript – chỉ Android trong MVP | Expo SDK 58 (React Native 0.88, n1); phiên bản TypeScript theo mẫu `create-expo-app` của SDK 58 – ghi số cụ thể khi dựng khung | ADR-01 |
| Lưu dữ liệu | SQLite trên máy qua `expo-sqlite` | Theo SDK 58, cài bằng `npx expo install expo-sqlite` | ADR-02 |
| Unit test | Jest với preset `jest-expo` | Jest 30 (SDK 58 trở lên bắt buộc Jest 30, n4) | ADR-01 (B5) |
| Thông báo 21:00 (US05) | `expo-notifications` – thông báo cục bộ, không push | Theo SDK 58 | **Chờ ADR-04** (K6) |
| Phát hành bản dùng thử | EAS Build, profile `preview`, file APK | — | ADR-03 (Đề xuất) |
| Điều hướng giữa màn hình | Chưa chốt – mẫu mặc định của `create-expo-app` có Expo Router: Cần kiểm chứng khi dựng khung | — | Chốt trong Pull Request dựng khung (US01) |

Khi code: chạy thử trên **Expo Go** (Android) – `expo-sqlite` và thông báo cục bộ đều có sẵn trong Expo Go (ADR-01 n1, n4). Bản cho người dùng thử: APK theo ADR-03.

## 2. Cấu trúc thư mục

App nằm ở **gốc repo** (cạnh `docs/`, `scripts/`). Mã nguồn trong `src/` theo `frontend-ui` mục 4.2:

```
src/
├── theme/          token từ design-system mục 4.2 (colors.ts, typography.ts, spacing.ts)
├── components/     component từ design-system mục 4.3 – <ComponentName>.tsx
├── screens/        <ScreenName>.tsx – HomeScreen, AddExpenseScreen, BudgetScreen, ...
├── logic/          hàm thuần của budget-logic (dailyAllowance.ts, reportByCategory.ts, ...)
├── storage/        lớp lưu trữ SQLite: db.ts (mở DB), migrations.ts, transactions.ts, budgets.ts, settings.ts
└── utils/          formatMoney ('35.000đ'), ngày tháng
__tests__/          <tên>-test.ts – unit test (preset jest-expo nhận đuôi -test.ts, n4)
```

Quy tắc phụ thuộc: `screens` → `components`, `logic`, `storage`, `utils` · `logic` không phụ thuộc gì ngoài `utils` · `storage` không gọi `screens`, `logic` · hàm trong `logic` nhận `today` làm tham số, không tự đọc giờ máy (`budget-logic` mục 6).

## 3. Dữ liệu và lưu trữ

Kiểu dữ liệu theo `budget-logic` mục 4.1 và `docs/requirements/data-analysis.md` mục 4 – **không định nghĩa lại**. Bảng dưới chỉ ghi cách hiện thực trong SQLite. Tên cột trong DB viết `snake_case`; lớp `storage` đổi sang `camelCase` khi trả về.

| Dữ liệu | Bảng | Cột và ràng buộc | Ghi chú |
| :--- | :--- | :--- | :--- |
| E01 `Transaction` | `transactions` | `id TEXT PRIMARY KEY` · `type TEXT NOT NULL` · `amount INTEGER NOT NULL CHECK (amount BETWEEN 1 AND 99999999)` · `category_id TEXT` · `note TEXT CHECK (note IS NULL OR length(note) <= 100)` · `date TEXT NOT NULL` · `created_at TEXT NOT NULL` · `updated_at TEXT NOT NULL` · `deleted_at TEXT` | Chỉ mục `idx_transactions_date ON transactions(date)`. Mọi truy vấn đọc có `deleted_at IS NULL` (BR-91). `PRIMARY KEY` chặn tạo trùng (EC-11) |
| E02 `MonthlyBudget` | `monthly_budgets` | `month TEXT PRIMARY KEY` · `amount INTEGER NOT NULL CHECK (amount BETWEEN 1 AND 99999999)` · `source TEXT NOT NULL` · `created_at TEXT NOT NULL` · `updated_at TEXT NOT NULL` | Mỗi tháng tối đa 1 bản ghi (BR-20) – đặt lại là cập nhật dòng cũ |
| E03 `Category` | Không có bảng ở R1 | — | 6 danh mục cố định là hằng số trong `src/logic/categories.ts` (`data-analysis.md` mục 4, E03); bảng khi có R2 |
| E04 `Settings` | `settings` | Một dòng `id = 1`: `reminder_enabled INTEGER` · `reminder_time TEXT` · `week_starts_on TEXT` · `onboarding_done_at TEXT` | Mặc định theo `data-analysis.md` E04 |
| E05 `AppMeta` | `app_meta` + `PRAGMA user_version` | Một dòng `id = 1`: `install_id TEXT` · `first_open_date TEXT`; `schemaVersion` lưu bằng `PRAGMA user_version` | `first_open_date` dùng cho `TrialInfoScreen` (BR-126) |

Ghi nhiều bản ghi (xoá toàn bộ dữ liệu BR-129, khởi tạo DB lần đầu) chạy trong `withTransactionAsync` để không có bản ghi dở (EC-13, ADR-02).

**Hai chỗ chưa khớp, cặp dữ liệu thống nhất trước khi viết `src/storage/`:**
1. Giá trị `type`: `budget-logic` 4.1 viết `'expense' | 'income'`, `data-analysis.md` mục 7 viết `EXPENSE`, `INCOME`. Đề xuất: theo `data-analysis.md` (quy tắc của `product-requirements` mục 6), sửa `budget-logic` 4.1.
2. `MonthlyBudget` trong `budget-logic` 4.1 chưa có `source` (`MANUAL` / `COPIED_FROM_PREVIOUS`, BR-22) – thêm khi PO chốt Q2.

**Cách đổi cấu trúc dữ liệu khi đã có người dùng thử:** mỗi thay đổi tăng `PRAGMA user_version` thêm 1 và thêm một hàm migration trong `src/storage/migrations.ts`; chỉ thêm bảng/cột, không đổi tên hay xoá (`data-analysis.md` E05). Trước khi phát bản mới: cài đè lên máy đang có dữ liệu, kiểm dữ liệu cũ còn đủ (ADR-03 mục 8).

## 4. Lệnh

Chạy từ thư mục gốc repo, trên Windows (PowerShell hoặc Git Bash).

| Việc | Lệnh | Kết quả mong đợi | Nguồn |
| :--- | :--- | :--- | :--- |
| Dựng khung (một lần, task đầu plan US01) | Cần kiểm chứng – lệnh `create-expo-app` cho thư mục đã có `docs/` | Có `package.json`, `app.json` ở gốc repo | — |
| Cài thư viện | `npm install` | Không lỗi | — |
| Cài bộ test (một lần) | `npx expo install jest-expo jest @types/jest "--" --dev` | Có `jest-expo` trong `devDependencies` | n4 |
| Chạy app khi code | `npx expo start` rồi quét mã QR bằng Expo Go trên Android | App mở trên điện thoại | Cần kiểm chứng khi dựng khung |
| Chạy unit test | `npm run test` (script `"test": "jest"`, `"jest": { "preset": "jest-expo" }` trong `package.json`) | Mọi test pass | n4 (tài liệu dùng `jest --watchAll`; bỏ `--watchAll` để chạy một lần rồi dừng) |
| Kiểm kiểu TypeScript | `npx tsc --noEmit` | Không lỗi | [NHẬN ĐỊNH] |
| Build APK | `eas build -p android --profile preview` | Có link tải APK trên trang build của EAS | ADR-03 n2 |
| Phát hành bản dùng thử | Gửi link build EAS cho người dùng thử (nhóm Zalo / mã QR) | Cài được theo mục 5 | ADR-03 |

## 5. Hướng dẫn cài cho người dùng thử (Android)

1. Mở link nhóm gửi trên điện thoại Android, tải file APK.
2. Khi máy hỏi, cho phép cài ứng dụng từ nguồn này.
3. Mở Ví Khéo. **Không gỡ app trong tuần dùng thử** – gỡ app là mất dữ liệu (EC-10); bản cập nhật cài đè lên, dữ liệu vẫn giữ.

## 6. Quy ước code và thư viện

| Mục | Quy ước |
| :--- | :--- |
| Đặt tên file | Màn hình, component: `PascalCase.tsx` · hàm, module: `camelCase.ts` · test: `__tests__/<tên>-test.ts` |
| Format, lint | Cần bổ sung – chốt trong Pull Request dựng khung |
| Ngôn ngữ chữ trên giao diện | Tiếng Việt có dấu, chép từ đặc tả màn hình |
| Tiền | Số nguyên VND, hiển thị `35.000đ` qua `src/utils/formatMoney.ts` (`budget-logic` mục 6) |
| Bí mật | Không commit khoá ký, `credentials.json`, file `.env` (AGENTS.md quy tắc 13) |

**Thư viện được phép:**

| Thư viện | Dùng cho | Quyết định |
| :--- | :--- | :--- |
| `expo`, `react`, `react-native`, `typescript` | Nền tảng | ADR-01 |
| `expo-sqlite` | Lưu dữ liệu | ADR-02 |
| `jest`, `jest-expo`, `@types/jest` | Unit test | ADR-01 (B5) |
| `expo-notifications` | Nhắc 21:00 (US05) | Chờ ADR-04 |
| Thư viện điều hướng, sinh UUID | Chưa chốt | Pull Request dựng khung (US01), ghi lại vào bảng này |

## 7. Lịch sử thay đổi

| Ngày | Thay đổi | ADR | Người sửa |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo bản đầu | ADR-01, ADR-02, ADR-03 | Nguyễn Diên Tiến (AI Claude Code soạn) |

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn | Nội dung dùng |
| :--- | :--- | :--- |
| n1 | [Expo – SDK 58 changelog](https://expo.dev/changelog/sdk-58) | SDK 58 (15/10/2026), React Native 0.88 |
| n2 | [Expo – SQLite](https://docs.expo.dev/versions/latest/sdk/sqlite/) | `openDatabaseAsync`, `withTransactionAsync`, `PRAGMA user_version` |
| n3 | [Expo – Build APKs for Android](https://docs.expo.dev/build-reference/apk/) | Profile `preview` ra APK |
| n4 | [Expo – Unit testing with Jest](https://docs.expo.dev/develop/unit-testing/) (02/11/2026) | Lệnh cài trên Windows, preset `jest-expo`, đuôi `-test.ts`, SDK 58 cần Jest 30 |
