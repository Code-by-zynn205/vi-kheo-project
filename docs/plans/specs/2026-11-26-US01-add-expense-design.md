# Thiết kế kỹ thuật – US01 Ghi khoản chi (kèm nền móng cho mọi story)

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – lựa chọn kỹ thuật do AI (Claude Code) chốt theo uỷ quyền của Nguyễn Diên Tiến 26/11/2026; Developers soát trong Pull Request plan · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa, Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US01-add-expense.md` · **Kiến trúc:** ADR-01, ADR-02, `docs/architecture/technical-design.md`

File này có 2 phần: **phần A – nền móng** dùng chung cho mọi story (spec US02 → US04 dẫn tới đây, không lặp lại), **phần B – riêng US01**.

## Phần A – Nền móng

### A1. Ý định

US01 là story đầu tiên có code: nó dựng khung app, lớp lưu trữ và các hàm dùng chung. Mọi story sau đắp lên đây, nên quyết định ở phần này phải giữ được tới demo 13/12 mà không phải dựng lại.

**Mục tiêu:** app Android chạy trên Expo Go và APK; dữ liệu SQLite trên máy; logic tính tiền là hàm thuần test được trên máy tính; mỗi màn hình mỏng, chỉ gọi `logic` và `storage`.
**Không làm:** máy chủ, đăng nhập, iPhone, thư viện quản lý trạng thái chung, bộ component UI có sẵn.
**Phản mục tiêu:** khung "đẹp" nhưng tới 30/11 chưa ghi được khoản chi trên điện thoại thật.

### A2. Các phương án đã cân nhắc

| Quyết định | Phương án | Chọn | Lý do |
| :--- | :--- | :--- | :--- |
| Điều hướng | **Expo Router** (đi kèm mẫu mặc định) · React Navigation tự dựng | Expo Router | Mẫu mặc định SDK 55+ đã có `src/app` (n1); ẩn tab bằng `href: null` cho phần "dựng theo story" (n2); không thêm thư viện |
| Dữ liệu cho màn hình | **Hook đọc lại khi màn hình được mở** · store chung (Zustand) · thư viện cache truy vấn | Hook đọc lại | Dữ liệu nhỏ, một người dùng, một máy; mọi con số tính lại từ giao dịch (BR-06) nên không có gì để đồng bộ giữa màn hình. Store chung là việc thừa (YAGNI) |
| Test lớp SQLite | **SQL thật qua `sql.js` trong Jest** · giả lập `expo-sqlite` bằng mock · chỉ thử trên máy | `sql.js` qua interface `SqlDb` | Kiểm được câu SQL, chỉ mục, ràng buộc (EC-11, EC-13). **Cần kiểm chứng ở Task 1 của plan US01**; không chạy được → đường lùi: test lớp `storage` bằng mock và kiểm SQL trên máy thật |

**Đã loại:** thư viện ngày tháng (chỉ cần vài hàm, tự viết, có test); `Intl.NumberFormat` cho tiền (định dạng phụ thuộc máy – tự viết `formatMoney`).

### A3. Cấu trúc (bổ sung `technical-design.md` mục 2)

```
src/
├── app/                 route của Expo Router – mỗi file 1 dòng: export màn hình từ src/screens
│   ├── _layout.tsx      gốc: mở DB, chạy migration, hiện SplashScreen tới khi xong
│   ├── (tabs)/_layout.tsx   Tabs: index (Trang chủ), budget (Ngân sách), report (Báo cáo) – tab chưa có story: href: null
│   ├── (tabs)/index.tsx     → HomeScreen
│   └── add.tsx              → AddExpenseScreen (presentation: modal)
├── screens/  components/  theme/  logic/  storage/  utils/   (như technical-design.md mục 2)
├── hooks/               useToday, useTodayTransactions … – nối màn hình với storage
└── types.ts             kiểu dữ liệu theo budget-logic 4.1, giá trị enum theo data-analysis.md mục 7
__tests__/               <tên>-test.ts
```

### A4. Giao diện dùng chung (story sau dùng đúng tên này)

| File | Xuất ra | Ghi chú |
| :--- | :--- | :--- |
| `src/types.ts` | `TransactionType = 'EXPENSE' \| 'INCOME'`, `CategoryId`, `Transaction`, `MonthlyBudget`, `BudgetSource = 'MANUAL' \| 'COPIED_FROM_PREVIOUS'`, `Settings`, `AppMeta` | Giá trị viết hoa theo `data-analysis.md` mục 7 (`technical-design.md` mục 3 – chỗ chưa khớp 1) |
| `src/storage/db.ts` | `type SqlDb` (5 hàm: `execAsync`, `runAsync`, `getAllAsync`, `getFirstAsync`, `withTransactionAsync`) · `initStorage(db: SqlDb): Promise<void>` (chạy migration) · `getDb(): SqlDb` | Một DB cho cả app; test gọi `initStorage` với DB `sql.js` |
| `src/storage/migrations.ts` | `migrate(db: SqlDb): Promise<void>` | `PRAGMA user_version`; v1 tạo 4 bảng + chỉ mục theo `technical-design.md` mục 3 |
| `src/storage/transactions.ts` | đúng chữ ký `budget-logic` 4.1 | US06 thêm `update`, `delete`, `restore` |
| `src/storage/appMeta.ts` | `ensureAppMeta(today: string): Promise<AppMeta>` | Lần đầu tạo `installId` (`Crypto.randomUUID()`, n3), `firstOpenDate`; lần sau trả bản cũ |
| `src/storage/settings.ts` | `getSettings(): Promise<Settings>` · `updateSettings(patch: Partial<Settings>): Promise<void>` | Một dòng `id = 1` |
| `src/utils/formatMoney.ts` | `formatMoney(amount: number, sign?: 'minus' \| 'plus'): string` | `35000 → "35.000đ"`; dấu trừ là ký tự `−` (U+2212) như đặc tả |
| `src/utils/date.ts` | `toLocalDate(d: Date): string` · `addDays(date: string, n: number): string` · `daysInMonth(month: string): number` · `monthOf(date: string): string` · `formatDayHeader(date: string): string` ("Thứ Sáu, 20/11") | Ngày dạng `YYYY-MM-DD` theo giờ máy (BR-03) |
| `src/hooks/useToday.ts` | `useToday(): string` | Đổi giá trị khi app quay lại sau 00:00 (EC-02) |
| `src/logic/sums.ts` | `sumByType(transactions, type, from, to): number` | Bỏ khoản đã xoá; Home US01 dùng cho tổng "Chi tiêu hôm nay" |

### A5. Luồng dữ liệu

```
Màn hình ──gọi──> hook (src/hooks) ──await──> storage (SQLite)
   │                    │
   │                    └── đưa danh sách giao dịch cho ──> logic (hàm thuần, nhận today)
   └── hiển thị kết quả; lưu xong thì hook đọc lại khi màn hình được mở lại (useFocusEffect)
```

Lỗi đọc / ghi: `storage` ném lỗi, màn hình bắt và hiện trạng thái lỗi của đặc tả; không nuốt lỗi.

### A6. Để lại cho người code

Tên biến, chia nhỏ component nội bộ, cách viết style (miễn là dùng token `src/theme`).

## Phần B – Riêng US01

1. **Phím số:** hàm thuần `applyAmountKey(current: number, key: AmountKey): { value: number; error?: 'ERR_AMOUNT_MAX' }` – màn hình không tự ghép chuỗi số.
2. **Lưu:** `createTransaction(input, now: Date): Transaction` (hàm thuần, nhận `type` để US07 dùng lại) → `saveTransaction`; nút Lưu khoá ngay khi bấm (EC-11); `PRIMARY KEY` chặn trùng lần hai.
3. **Splash:** `src/app/_layout.tsx` hiện `SplashScreen` (component theo đặc tả) trong lúc `initStorage` + `ensureAppMeta`; xong thì vào `(tabs)`. Trước US03 luôn sang Home.
4. **Tab:** chỉ tab "Trang chủ"; tab Ngân sách, Báo cáo đặt `href: null` (`HomeScreen.md` "Dựng theo story"). Icon cài đặt chưa hiện (US19).
5. **Ngoài phạm vi US01:** như PRD mục 6.

## Cần kiểm chứng (Task 1 của plan US01)

1. Lệnh tạo dự án SDK 58 vào thư mục đã có `docs/` – tạo ở thư mục tạm rồi chuyển vào gốc repo.
2. `sql.js` chạy trong Jest preset `jest-expo` (môi trường Node).
3. Ghi lại phiên bản TypeScript, Expo Router thật vào `technical-design.md` mục 1.

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn |
| :--- | :--- |
| n1 | [Expo – Top-level src directory](https://docs.expo.dev/router/reference/src-directory/): mẫu mặc định SDK 55+ có `src/app` |
| n2 | [Expo – JavaScript tabs](https://docs.expo.dev/router/advanced/tabs/): ẩn tab bằng `href: null` |
| n3 | [Expo – Crypto](https://docs.expo.dev/versions/latest/sdk/crypto/): `Crypto.randomUUID()` (UUID v4) |
