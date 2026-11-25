# US01 Ghi khoản chi – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – **chỉ thực thi khi PRD US01 `Đã duyệt`** (hàng đợi `00-master-plan.md` mục 2a, dòng 1) · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa (giao diện); Nguyễn Thị Bình Minh, Nguyễn Diên Tiến (lưu trữ) · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Sinh viên mở app trên Android, ghi một khoản chi trong ≤ 3 thao tác, thấy nó ở đầu "Chi tiêu hôm nay"; dữ liệu còn sau khi tắt app – kèm khung dự án cho mọi story sau.

**Architecture:** Expo Router (`src/app`) với route mỏng trỏ tới `src/screens`; màn hình gọi hook `src/hooks` → lớp `src/storage` (SQLite, Promise) và hàm thuần `src/logic`. Thiết kế nền móng: spec phần A.

**Tech Stack:** Expo SDK 58 (React Native 0.88) + TypeScript, Expo Router, `expo-sqlite`, `expo-crypto`, Jest 30 + `jest-expo`, `sql.js` (chỉ test); Android (`technical-design.md` mục 1, ADR-01, ADR-02).

**Spec:** docs/plans/specs/2026-11-26-US01-add-expense-design.md
**PRD:** docs/requirements/US01-add-expense.md
**Skill nhóm áp dụng:** tech-decision (mục 6), frontend-ui (mục 4.2, 4.3, 6), design-system (mục 4.2, 4.3, 6), budget-logic (mục 4.1, 4.4, 6), product-requirements (mục 6)

## Global Constraints

**Ràng buộc chung của dự án** (`AGENTS.md` mục 4, `CONTRIBUTING.md`):
- Tên file, thư mục, nhánh bằng tiếng Anh; chữ trên giao diện tiếng Việt có dấu, không emoji (quy tắc 4).
- Tiền là số nguyên VND, hiển thị `35.000đ` (quy tắc 5).
- Không commit thẳng vào `main`; nhánh theo cột "Nhánh" của hàng đợi `00-master-plan.md` mục 2a; commit `<loại>(<phạm vi>): <mô tả>`, thân commit có dòng `Skill: …` và `Agent: …` (quy tắc 9, `CONTRIBUTING.md` mục 2).
- Không commit khoá API, khoá ký, `credentials.json`, file build, `node_modules` (quy tắc 13).
- Lệnh: `npm run test` (unit test), `npm run typecheck`, `npx expo start` + Expo Go trên Android (`technical-design.md` mục 4).

#### `tech-decision` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Chỉ dùng công nghệ, phiên bản và thư viện có trong `docs/architecture/technical-design.md` mục 1 và mục 6; thư viện lớn mới phải có ADR được chấp nhận trước.
- Đường dẫn file theo `technical-design.md` mục 2; lệnh chạy/test/build theo mục 4.
- Không thêm máy chủ, đăng nhập, dịch vụ trả phí (ADR tiêu chí A2, A4).

**Task bắt buộc:**
- Plan đầu tiên của dự án (US01) có task dựng khung dự án theo `technical-design.md`, kết thúc bằng: chạy app trên điện thoại thật và chạy lệnh unit test thành công (dù chưa có test nào).

**Lệnh kiểm tra:**
- Lệnh unit test trong `technical-design.md` mục 4 → chạy được.
- Lệnh build trong `technical-design.md` mục 4 → không lỗi.

#### `frontend-ui` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Chỉ làm AC trong PRD; mục "Ngoài phạm vi" của PRD là cấm.
- Màn hình nằm trong `src/screens/`, chỉ gọi `src/logic/` và `src/storage/`, không tự tính tiền.
- Không thêm thư viện UI lớn (bộ component, framework CSS) khi chưa thống nhất ở Sprint Planning.
- Không commit khoá API, file build, `node_modules`.

**Task bắt buộc:**
- Mỗi màn hình là một task theo `templates/screen-task.md`.
- Task cuối: chạy trên điện thoại thật, đi từng AC của PRD, ghi kết quả vào mô tả Pull Request.

**Lệnh kiểm tra:**
- Lệnh chạy unit test (`technical-design.md` mục 4) → pass.
- Lệnh build (`technical-design.md` mục 4) → không lỗi.

#### `design-system` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Chỉ dùng token trong `src/theme/` (chép từ `design-system` mục 4.2); không viết cứng mã màu, `px` cỡ chữ, font trong `src/screens/` và `src/components/`.
- Chỉ dùng component ở `design-system` mục 4.3; component mới phải được thêm vào skill trước.
- Mọi vùng bấm ≥ 48 × 48 px; màn hình rộng 360px không vỡ, không cuộn ngang.
- Tiền hiển thị qua hàm `formatMoney` dạng `35.000đ`; chi `−`, thu `+`.
- Mọi chữ trên giao diện bằng tiếng Việt có dấu, không emoji.
- Mỗi màn hình có trạng thái trống (`EmptyState`) và trạng thái lỗi.
- Bố cục theo frame Figma ghi trong đặc tả; chữ hiển thị theo đặc tả `.md` mục 4. Hai bên lệch → dừng, hỏi cặp UI/UX.

**Task bắt buộc:**
- Task cuối của plan giao diện: soát theo `templates/ui-review.md`, chụp ảnh trên điện thoại thật gắn vào Pull Request.

**Lệnh kiểm tra:**
- `grep -rnE "#[0-9A-Fa-f]{6}" src/screens src/components` → không có kết quả

#### `budget-logic` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Tiền là số nguyên VND (`number` nguyên); không dùng số thực, không làm tròn lên. Hạn mức ngày làm tròn xuống tới 1.000đ.
- Công thức và mã trạng thái đúng nguyên văn `budget-logic` mục 4.2; không lưu số dư, luôn tính lại từ giao dịch.
- Code tính tiền nằm trong `src/logic/`, là hàm thuần (không đọc ngày giờ hệ thống bên trong – nhận `today` làm tham số), không gọi giao diện.
- Lưu trữ chỉ qua lớp `src/storage/` (SQLite, `expo-sqlite`, ADR-02), mọi hàm trả `Promise`; chạy offline, không gọi mạng.
- Test case lấy đúng số liệu từ `budget-logic` mục 4.4, ghi mã `TC<số>` trong tên test.

**Task bắt buộc:**
- Mỗi hàm tính tiền là một task theo mẫu `templates/logic-task.md`: test fail trước → code → test pass → commit.
- Task có sửa/xoá giao dịch phải có TC16.

**Lệnh kiểm tra:**
- Lệnh chạy unit test của dự án (`docs/architecture/technical-design.md` mục 4) → mọi `TC` liên quan đều pass.

#### `product-requirements` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Plan chỉ làm những gì có trong mục "Tiêu chí chấp nhận" của PRD; mục "Ngoài phạm vi" của PRD là cấm.
- Mỗi AC trong PRD phải được ít nhất 1 task kiểm tra (unit test hoặc bước kiểm tay trên điện thoại).
- PRD có câu hỏi mở chưa trả lời → không viết plan cho phần đó.
- Tên trường, enum, mã lỗi trong code lấy đúng `docs/requirements/data-analysis.md` (mục 4, 7, 12); không đặt tên khác.

**Task bắt buộc:**
- Task cuối: đi lần lượt từng AC của PRD trên điện thoại thật, ghi Đạt/Chưa đạt vào mô tả Pull Request.

**Lệnh kiểm tra:**
- Không có lệnh riêng; kiểm bằng bảng AC trong mô tả Pull Request.

## Review Focus

1. Bấm Lưu đúng lúc vừa qua 00:00 → khoản thuộc ngày mới (ngày lấy lúc bấm Lưu, không lúc mở màn) – test ở Task 4.
2. Mở DB lỗi khi khởi động → không treo ở Splash, hiện "Không tải được dữ liệu. Thử mở lại app." – test ở Task 7.
3. Ghi lỗi giữa chừng (EC-13) → không có bản ghi dở, số đã nhập còn nguyên – test ở Task 3.
4. Ghi chú chỉ toàn khoảng trắng hoặc có khoảng trắng hai đầu → lưu đã bỏ khoảng trắng, rỗng thì không có ghi chú – test ở Task 4.
5. Cỡ chữ hệ thống lớn trên máy rộng 360px → nút Lưu và bàn phím số không bị đẩy khỏi màn hình – bước kiểm ở Task 8.

---

### Task 1: Dựng khung dự án [tech-decision §6, frontend-ui §4.2]

**Files:**
- Create: `package.json`, `app.json`, `tsconfig.json`, `src/app/_layout.tsx`, `src/app/(tabs)/_layout.tsx`, `src/app/(tabs)/index.tsx` (từ mẫu `create-expo-app`), `__tests__/smoke-test.ts`, `__tests__/sqljs-spike-test.ts`
- Modify: `.gitignore`, `docs/architecture/technical-design.md` (mục 1, 4, 6)

**Interfaces:**
- Produces: lệnh `npm run test` (`"test": "jest"`), `npm run typecheck` (`"typecheck": "tsc --noEmit"`), alias `@/*` → `./src/*`

- [ ] **Step 1: Tạo dự án mẫu ở thư mục tạm cạnh repo**

Run: `npx create-expo-app@latest ../vi-kheo-scaffold`
Expected: `../vi-kheo-scaffold/src/app` tồn tại; `package.json` có `"expo"` phiên bản 58.x

- [ ] **Step 2: Chép vào gốc repo, trừ `.git` và `README.md`; xoá route, component, hình mẫu không dùng; giữ `src/app/_layout.tsx`, `src/app/(tabs)/_layout.tsx`, `src/app/(tabs)/index.tsx`**

- [ ] **Step 3: Thêm vào `.gitignore`:** `node_modules/`, `.expo/`, `android/`, `ios/`, `dist/`, `credentials.json`, `*.jks`, `*.keystore`, `.env`

- [ ] **Step 4: Cài bộ test và script**

Run: `npx expo install jest-expo jest @types/jest "--" --dev` rồi `npm install --save-dev sql.js @types/sql.js`
Sửa `package.json`: `"scripts": { "test": "jest", "typecheck": "tsc --noEmit", ... }`, `"jest": { "preset": "jest-expo" }`

- [ ] **Step 5: Viết `__tests__/smoke-test.ts` (`expect(1 + 1).toBe(2)`) và `__tests__/sqljs-spike-test.ts`**

```ts
test('sql.js chạy được trong jest-expo', async () => {
  const SQL = await initSqlJs();
  const db = new SQL.Database();
  db.run('CREATE TABLE t (id TEXT PRIMARY KEY); INSERT INTO t VALUES ("a");');
  expect(db.exec('SELECT count(*) FROM t')[0].values[0][0]).toBe(1);
});
```

- [ ] **Step 6: Chạy test**

Run: `npm run test`
Expected: 2 passed. Spike `sql.js` fail → làm theo đường lùi trong spec A2 (mock `expo-sqlite`), ghi vào mô tả PR.

- [ ] **Step 7: Chạy trên điện thoại thật**

Run: `npx expo start`, quét QR bằng Expo Go trên Android
Expected: app mở, không lỗi đỏ

- [ ] **Step 8: Ghi phiên bản thật (TypeScript, `expo-router`, `sql.js`), lệnh dựng khung đã chạy vào `technical-design.md` mục 1, 4, 6; điều hướng = Expo Router**

- [ ] **Step 9: Commit** – `chore(US01): scaffold Expo SDK 58 app with jest-expo`

### Task 2: Token, kiểu dữ liệu, định dạng tiền và ngày [design-system §4.2, budget-logic §4.1, §6]

**AC trong PRD:** AC2, AC14 (`docs/requirements/US01-add-expense.md`)
**Test case:** — (định dạng tiền, ngày – không có TC trong `budget-logic` 4.4)

**Files:**
- Create: `src/theme/colors.ts`, `src/theme/typography.ts`, `src/theme/spacing.ts`, `src/types.ts`, `src/utils/formatMoney.ts`, `src/utils/date.ts`
- Test: `__tests__/formatMoney-test.ts`, `__tests__/date-test.ts`

**Interfaces:**
- Produces: `colors` (đúng tên, giá trị `design-system` 4.2, bỏ tiền tố `--color-`, viết camelCase: `primary`, `primaryLight`, `successText`…), `typography.{hero,screenTitle,sectionTitle,body,caption}`, `spacing`, `radius`; `TransactionType = 'EXPENSE' | 'INCOME'`, `CategoryId`, `Transaction`, `MonthlyBudget`, `BudgetSource`, `Settings`, `AppMeta`; `formatMoney(amount: number, sign?: 'minus' | 'plus'): string`; `toLocalDate(d: Date): string`, `addDays(date: string, n: number): string`, `daysInMonth(month: string): number`, `monthOf(date: string): string`, `formatDayHeader(date: string): string`, `nextMidnight(now: Date): Date`

- [ ] **Step 1: Viết test hỏng**

```ts
expect(formatMoney(35000)).toBe('35.000đ');
expect(formatMoney(35000, 'minus')).toBe('−35.000đ'); // U+2212
expect(formatMoney(1200000, 'plus')).toBe('+1.200.000đ');
expect(formatMoney(0)).toBe('0đ');
expect(formatMoney(99999999)).toBe('99.999.999đ');
expect(toLocalDate(new Date(2026, 10, 20, 23, 59))).toBe('2026-11-20');
expect(addDays('2026-11-30', 1)).toBe('2026-12-01');
expect(daysInMonth('2026-11')).toBe(30);
expect(daysInMonth('2027-02')).toBe(28);
expect(monthOf('2026-11-20')).toBe('2026-11');
expect(formatDayHeader('2026-11-20')).toBe('Thứ Sáu, 20/11');
expect(formatDayHeader('2026-11-22')).toBe('Chủ Nhật, 22/11');
expect(nextMidnight(new Date(2026, 10, 20, 23, 59))).toEqual(new Date(2026, 10, 21, 0, 0));
```

- [ ] **Step 2: Chạy** `npm run test -- formatMoney date` → FAIL (chưa có hàm)
- [ ] **Step 3: Viết các file ở mục Files.** Kiểu dữ liệu theo `budget-logic` 4.1 + `data-analysis.md` mục 4, 7 (giá trị enum viết hoa). Tiền: tự nhóm 3 chữ số bằng dấu `.`, không dùng `Intl`.
- [ ] **Step 4: Chạy** `npm run test -- formatMoney date` → PASS
- [ ] **Step 5: Commit** – `feat(US01): theme tokens, types, money and date utils`

### Task 3: Lớp lưu trữ nền [budget-logic §4.1, ADR-02]

**AC trong PRD:** AC6, AC7, AC9, AC13, AC18 (`docs/requirements/US01-add-expense.md`)
**Test case:** — (lưu trữ – EC-11, EC-13)

**Files:**
- Create: `src/storage/db.ts`, `src/storage/migrations.ts`, `src/storage/transactions.ts`, `src/storage/appMeta.ts`, `src/storage/settings.ts`, `src/storage/openAppDb.ts`, `__tests__/helpers/sqljsDb.ts`
- Test: `__tests__/storage-transactions-test.ts`, `__tests__/storage-appMeta-test.ts`, `__tests__/migrations-test.ts`

**Interfaces:**
- Consumes: `Transaction`, `Settings`, `AppMeta` (Task 2)
- Produces: `type SqlDb` (5 hàm như spec A4), `initStorage(db: SqlDb): Promise<void>`, `getDb(): SqlDb`, `openAppDb(): Promise<SqlDb>` (`SQLite.openDatabaseAsync('vi-kheo.db')`), `saveTransaction(t: Transaction): Promise<void>`, `listTransactions(fromDate: string, toDate: string): Promise<Transaction[]>` (chưa xoá, `createdAt` giảm dần), `ensureAppMeta(today: string): Promise<AppMeta>`, `getSettings(): Promise<Settings>`, `updateSettings(patch: Partial<Settings>): Promise<void>`; `makeTestDb(): Promise<SqlDb>` (test)

- [ ] **Step 1: Viết test hỏng** (mỗi test: `await initStorage(await makeTestDb())`)
  - `migrate` đặt `PRAGMA user_version` = 1; chạy lần hai không lỗi; có bảng `transactions`, `monthly_budgets`, `settings`, `app_meta` và chỉ mục `idx_transactions_date`
  - lưu 3 khoản ngày `2026-11-20` (`createdAt` 08:00, 12:05, 18:30) → `listTransactions('2026-11-20','2026-11-20')` trả đúng 3, khoản 18:30 đầu tiên
  - bản ghi có `deleted_at` khác rỗng không có trong kết quả
  - lưu cùng `id` hai lần → lần hai bị từ chối, vẫn chỉ 1 bản ghi (EC-11)
  - lưu `amount = 0` bị từ chối, bảng vẫn rỗng (EC-13, ràng buộc `CHECK`)
  - `ensureAppMeta('2026-11-26')` gọi 2 lần → cùng `installId`, `firstOpenDate = '2026-11-26'` (AC18)
  - `getSettings()` lần đầu → `{ reminderEnabled: false, reminderTime: '21:00', weekStartsOn: 'MONDAY', onboardingDoneAt: null }`
- [ ] **Step 2: Chạy** `npm run test -- storage migrations` → FAIL
- [ ] **Step 3: Viết code.** Bảng, cột theo `technical-design.md` mục 3; migration chạy trong `withTransactionAsync`; đổi `snake_case` ↔ `camelCase` trong `storage`; `installId` bằng `Crypto.randomUUID()`.
- [ ] **Step 4: Chạy** `npm run test -- storage migrations` → PASS
- [ ] **Step 5: Commit** – `feat(US01): SQLite storage with migrations, transactions, app meta, settings`

### Task 4: Nhập số tiền và tạo khoản chi [budget-logic §4.4, product-requirements §6]

**AC trong PRD:** AC2, AC3, AC4, AC5, AC11 (`docs/requirements/US01-add-expense.md`)
**Test case:** TC12, TC13, TC14, TC15

**Files:**
- Create: `src/logic/amountInput.ts`, `src/logic/createTransaction.ts`, `src/logic/categories.ts`
- Test: `__tests__/amountInput-test.ts`, `__tests__/createTransaction-test.ts`

**Interfaces:**
- Consumes: `toLocalDate` (Task 2)
- Produces: `type AmountKey = '0'…'9' | '000' | 'back'`; `MAX_AMOUNT = 99_999_999`; `applyAmountKey(current: number, key: AmountKey): { value: number; error?: 'ERR_AMOUNT_MAX' }`; `canSaveAmount(amount: number): boolean`; `clampNote(text: string): string` (≤ 100 ký tự); `CATEGORIES` (6 mã, tên, thứ tự theo `data-analysis.md` E03), `DEFAULT_EXPENSE_CATEGORY = 'an_uong'`; `createTransaction(input: { type: TransactionType; amount: number; categoryId?: CategoryId | null; note?: string }, now: Date, newId?: () => string): Transaction`

- [ ] **Step 1: Viết test hỏng**
  - `applyAmountKey(3, '5').value` = 35 · `applyAmountKey(35, '000').value` = 35000 · `applyAmountKey(350, 'back').value` = 35 · `applyAmountKey(0, '0').value` = 0
  - `TC13`: `applyAmountKey(99999999, '1')` = `{ value: 99999999, error: 'ERR_AMOUNT_MAX' }`; `applyAmountKey(9999999, '000')` giữ 9999999, có lỗi
  - `TC12`: `canSaveAmount(0)` = false; `canSaveAmount(1)` = true
  - `TC15`: `clampNote('a'.repeat(150)).length` = 100
  - `TC14`: `createTransaction({ type: 'EXPENSE', amount: 20000 }, now).categoryId` = `'an_uong'`
  - ghi chú `'  cơm  '` → `note` = `'cơm'`; ghi chú `'   '` → `note` undefined
  - `now = new Date(2026, 10, 21, 0, 0, 1)` → `date` = `'2026-11-21'`; `createdAt` = `updatedAt` = `now.toISOString()`; `deletedAt` = null; `id` = giá trị của `newId()`
- [ ] **Step 2: Chạy** `npm run test -- amountInput createTransaction` → FAIL
- [ ] **Step 3: Viết code** theo chữ ký ở Interfaces.
- [ ] **Step 4: Chạy** → PASS
- [ ] **Step 5: Commit** – `feat(US01): amount keypad logic and transaction factory (TC12-TC15)`

### Task 5: Component cho US01 [design-system §4.3, §6]

**AC trong PRD:** AC1 (`docs/requirements/US01-add-expense.md`)
**Đặc tả:** `AddExpenseScreen.md` mục 1, `HomeScreen.md` mục 1
**Hàm logic gọi tới:** `formatMoney`

**Files:**
- Create: `src/components/Button.tsx`, `NumericKeypad.tsx`, `QuickCategoryChip.tsx`, `AmountInput.tsx`, `NoteInput.tsx`, `TransactionItem.tsx`, `EmptyState.tsx`, `Snackbar.tsx`, `ConfirmDialog.tsx`, `TopBar.tsx`, `Fab.tsx`, `Icon.tsx` (trong `src/components/`)

**Interfaces:**
- Consumes: `colors`, `typography`, `spacing` (Task 2); `formatMoney`; `CATEGORIES`
- Produces: props tối thiểu – `NumericKeypad { onKey(key: AmountKey) }`; `QuickCategoryChip` lưới `{ value: CategoryId; onChange }`; `AmountInput { amount: number; tone: 'expense' | 'income'; error?: string }`; `NoteInput { value; onChange }` (bộ đếm "x/100" từ 80 ký tự); `TransactionItem { transaction; onPress? }`; `EmptyState { message; actionLabel; onAction }`; `Snackbar { message; actionLabel?; onAction?; visible }` (ẩn sau 8 giây); `ConfirmDialog { title; confirmLabel; cancelLabel; onConfirm; onCancel }`; `TopBar { variant: 'title' | 'back-title' | 'sheet'; title; onBack?; onClose? }`; `Fab { label; onPress }`

- [ ] **Step 1: Viết component theo `design-system` 4.3**, chỉ dùng token; mỗi vùng bấm ≥ 48 × 48.
- [ ] **Step 2: Kiểm màu viết cứng**

Run: `grep -rnE "#[0-9A-Fa-f]{6}" src/screens src/components`
Expected: không có kết quả

- [ ] **Step 3: Chạy** `npm run typecheck` → không lỗi
- [ ] **Step 4: Commit** – `feat(US01): design-system components for add expense and home`

### Task 6: `AddExpenseScreen` chế độ Chi [frontend-ui §4.3, design-system §6]

**AC trong PRD:** AC1 – AC8, AC12, AC13 (`docs/requirements/US01-add-expense.md`)
**Đặc tả:** `AddExpenseScreen.md` mục 1 – 4
**Hàm logic gọi tới:** `applyAmountKey`, `canSaveAmount`, `clampNote`, `createTransaction`, `saveTransaction`

**Files:**
- Create: `src/screens/AddExpenseScreen.tsx`, `src/app/add.tsx` (`presentation: 'modal'`)

**Interfaces:**
- Consumes: `applyAmountKey`, `canSaveAmount`, `clampNote`, `createTransaction` (Task 4); `saveTransaction` (Task 3); component Task 5
- Produces: route `/add`; khi lưu xong quay lại kèm tham số `saved=1`

- [ ] **Step 1: Dựng màn theo `AddExpenseScreen.md` mục 1, 2, 4**, chữ chép nguyên văn; công tắc `Chi | Thu` **ẩn** (US07).
- [ ] **Step 2: Hành vi:** lỗi vượt mức hiện "Số tiền tối đa 99.999.999đ" 3 giây; bấm Lưu → khoá nút ngay → `createTransaction(…, new Date())` → `saveTransaction` → thành công: `router.back()` với `saved=1`; thất bại: giữ màn + `Snackbar` "Chưa lưu được. Thử lại."; bấm `X` khi số tiền > 0 → `ConfirmDialog` "Bỏ khoản đang nhập?" · "Bỏ" · "Tiếp tục nhập".
- [ ] **Step 3: Chạy** `npm run typecheck` và `npm run test` → không lỗi, mọi test pass
- [ ] **Step 4: Commit** – `feat(US01): AddExpenseScreen expense mode`

### Task 7: `HomeScreen` khung, Splash, tab, đổi ngày [frontend-ui §4.3, budget-logic §6]

**AC trong PRD:** AC6, AC10, AC14 – AC17 (`docs/requirements/US01-add-expense.md`)
**Đặc tả:** `HomeScreen.md` mục 1 – 4, `SplashScreen.md`
**Hàm logic gọi tới:** `sumByType`, `loadTodayData`, `listTransactions`

**Files:**
- Create: `src/screens/HomeScreen.tsx`, `src/screens/SplashScreen.tsx`, `src/hooks/useToday.ts`, `src/hooks/useTodayTransactions.ts`, `src/logic/sums.ts`
- Modify: `src/app/_layout.tsx` (mở DB → `initStorage` → `ensureAppMeta` → hiện Splash tới khi xong), `src/app/(tabs)/_layout.tsx` (chỉ tab "Trang chủ"; tab `budget`, `report` đặt `href: null`), `src/app/(tabs)/index.tsx`
- Test: `__tests__/sums-test.ts`, `__tests__/loadTodayData-test.ts`

**Interfaces:**
- Consumes: `listTransactions` (Task 3), `formatDayHeader`, `nextMidnight`, `formatMoney` (Task 2)
- Produces: `sumByType(transactions: Transaction[], type: TransactionType, from: string, to: string): number`; `loadTodayData(list: (from: string, to: string) => Promise<Transaction[]>, today: string): Promise<{ status: 'ok'; items: Transaction[]; totalExpense: number } | { status: 'error' }>`; `useToday(): string`

- [ ] **Step 1: Viết test hỏng**
  - `sumByType` với khoản chi 12.000, 5.000, 30.000, khoản thu 1.200.000, khoản chi đã xoá 40.000 cùng ngày `2026-11-20` → `'EXPENSE'` = 47000
  - `loadTodayData` với `list` trả 3 khoản → `{ status: 'ok', totalExpense: 47000 }`, khoản mới nhất đầu
  - `loadTodayData` với `list` ném lỗi → `{ status: 'error' }`
- [ ] **Step 2: Chạy** `npm run test -- sums loadTodayData` → FAIL
- [ ] **Step 3: Viết code.** `useToday` đặt hẹn giờ tới `nextMidnight` và nghe `AppState` `active` để tính lại; Home đọc lại khi được mở (`useFocusEffect`), có `saved=1` thì hiện `Snackbar` "Đã lưu".
- [ ] **Step 4: Dựng `HomeScreen`** theo `HomeScreen.md` mục 1.1, 1.3, 1.5 (chưa có thẻ – US03), trạng thái "Trống" ("Chưa có khoản chi nào hôm nay" + "+ Ghi khoản chi") và "Lỗi đọc dữ liệu" ("Không tải được dữ liệu. Thử mở lại app." + "Thử lại"); `SplashScreen` theo `SplashScreen.md` ("Ví Khéo", "Biết hôm nay còn được tiêu bao nhiêu").
- [ ] **Step 5: Chạy** `npm run test` và `npm run typecheck` → PASS
- [ ] **Step 6: Commit** – `feat(US01): HomeScreen today list, splash, tabs, midnight refresh`

### Task 8: Kiểm từng AC trên điện thoại thật, mở Pull Request [product-requirements §6, design-system §6, frontend-ui §6]

**Files:**
- Modify: `docs/requirements/README.md` (cột Plan), `docs/plans/00-master-plan.md` mục 2a (Trạng thái dòng 1)

- [ ] **Step 1: Chạy toàn bộ kiểm tra**

Run: `npm run test` · `npm run typecheck` · `grep -rnE "#[0-9A-Fa-f]{6}" src/screens src/components`
Expected: mọi test pass · không lỗi kiểu · không có màu viết cứng

- [ ] **Step 2: Trên điện thoại Android thật, đi lần lượt AC1 – AC18 của PRD** (bảng 5.2 của PRD); thêm: cài đặt cỡ chữ lớn nhất của máy → nút Lưu, bàn phím vẫn trong màn hình (Review Focus 5). Ghi Đạt / Chưa đạt từng AC.
- [ ] **Step 3: Soát giao diện theo `design-system/templates/ui-review.md`**, chụp ảnh trên máy thật.
- [ ] **Step 4: Mở Pull Request** nhánh `feature/US01-add-expense` theo `frontend-ui/templates/pr-description.md`: link PRD, spec, plan; bảng AC; ảnh; agent và skill đã dùng.
- [ ] **Step 5: Cập nhật** Trạng thái dòng 1 hàng đợi thành `Chờ review`.
