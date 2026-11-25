# US02 Ngân sách tháng – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – **chỉ thực thi khi PRD US02 `Đã duyệt` và US01 `Done`** (hàng đợi mục 2a, dòng 2) · **Phụ trách:** Nguyễn Đức Minh Nghĩa · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Sinh viên đặt ngân sách tháng, thấy ngay "mỗi ngày bạn được tiêu khoảng …", và Home hiện `NO_BUDGET` khi tháng chưa có ngân sách.

**Architecture:** Hàm thuần `computeDayLimit` (dùng lại ở US03) + `storage/budgets.ts`; `BudgetScreen` và `OnboardingBudgetScreen` dùng lại `NumericKeypad`, `AmountInput`; thẻ ở Home có trạng thái `NO_BUDGET`.

**Tech Stack:** Expo SDK 58 + TypeScript, Expo Router, `expo-sqlite`, Jest 30 + `jest-expo` (`technical-design.md` mục 1).

**Spec:** docs/plans/specs/2026-11-26-US02-monthly-budget-design.md
**PRD:** docs/requirements/US02-monthly-budget.md
**Skill nhóm áp dụng:** tech-decision (mục 6), frontend-ui (mục 4.3, 6), design-system (mục 4.3, 6), budget-logic (mục 4.1, 4.2, 4.4, 6), product-requirements (mục 6)

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

1. Đặt ngân sách ngày cuối tháng (còn 1 ngày) → xem trước = toàn bộ quỹ còn lại (TC8) – test ở Task 1.
2. Mở `BudgetScreen` lúc 23:59 rồi bấm cập nhật sau 00:00 ngày 1 tháng mới → lưu cho tháng **mới** (tháng lấy lúc bấm) – test ở Task 2.
3. Tháng trước không có ngân sách nhưng tháng trước nữa có → không hiện thẻ gợi ý (BR-22 chỉ nói "tháng trước") – test ở Task 2.
4. Bấm "Dùng lại số này" rồi sửa số → lưu `source = MANUAL` – test ở Task 2.
5. Đặt ngân sách nhỏ hơn số đã chi → vẫn lưu được, Home ra `OUT_OF_BUDGET` sau khi có US03 – bước kiểm ở Task 4.

---

### Task 1: Hạn mức ngày (`computeDayLimit`) [budget-logic §4.2, §4.4]

**AC trong PRD:** AC1 (`docs/requirements/US02-monthly-budget.md`)
**Test case:** TC1, TC3, TC5, TC6, TC7, TC8, TC9, TC11

**Files:**
- Create: `src/logic/dailyAllowance.ts`
- Test: `__tests__/dailyAllowance-dayLimit-test.ts`

**Interfaces:**
- Consumes: `daysInMonth`, `monthOf` (US01 Task 2)
- Produces: `computeDayLimit(input: { budget: number; incomeThisMonth: number; spentBeforeToday: number; today: string }): { fundAtStartOfDay: number; daysLeft: number; dayLimit: number }` – `dayLimit` làm tròn xuống tới 1.000đ, không âm

- [ ] **Step 1: Viết test hỏng – một test mỗi dòng, tên có mã TC**
  - `TC1`: 3.000.000, thu 0, `2026-11-01`, chi trước 0 → `dayLimit` 100.000, `daysLeft` 30
  - `TC3`: 3.000.000, `2026-11-16`, chi trước 1.800.000 → 80.000, `daysLeft` 15
  - `TC6`: 2.500.000, `2026-11-10`, chi trước 700.000 → 85.000
  - `TC7`: 2.500.000, thu 1.200.000, `2026-11-16`, chi trước 2.000.000 → 113.000
  - `TC8`: 3.000.000, `2026-11-30`, chi trước 2.950.000 → 50.000, `daysLeft` 1
  - `TC9`: 2.800.000, `2027-02-01` → 100.000, `daysLeft` 28
  - `TC11`: 3.000.000, `2026-11-02`, chi trước 2.990.000 → 0
  - `TC5`: 3.000.000, `2026-11-25`, chi trước 3.100.000 → `fundAtStartOfDay` −100.000, `dayLimit` 0
- [ ] **Step 2: Chạy** `npm run test -- dailyAllowance-dayLimit` → FAIL
- [ ] **Step 3: Viết `computeDayLimit`** đúng công thức `budget-logic` 4.2 (số nguyên, `Math.floor(… / 1000) * 1000`).
- [ ] **Step 4: Chạy** → PASS
- [ ] **Step 5: Commit** – `feat(US02): day limit formula (TC1, TC3, TC5-TC9, TC11)`

### Task 2: Lưu ngân sách và xem trước [budget-logic §4.1]

**AC trong PRD:** AC1, AC3, AC7, AC8 (`docs/requirements/US02-monthly-budget.md`)
**Test case:** TC1

**Files:**
- Create: `src/storage/budgets.ts`, `src/logic/budgetForm.ts`
- Test: `__tests__/storage-budgets-test.ts`, `__tests__/budgetForm-test.ts`

**Interfaces:**
- Consumes: `initStorage`, `makeTestDb` (US01 Task 3); `computeDayLimit` (Task 1); `sumByType` (US01 Task 7)
- Produces: `getBudget(month: string): Promise<MonthlyBudget | null>`, `setBudget(b: MonthlyBudget): Promise<void>` (ghi đè – BR-20), `getPreviousBudget(month: string): Promise<MonthlyBudget | null>` (chỉ tháng liền trước); `budgetSource(saved: number, suggested: number | null, usedSuggestion: boolean): BudgetSource`; `budgetPreview(input: { amount: number; transactions: Transaction[]; today: string }): { dayLimit: number; spentThisMonth: number; daysLeft: number }`

- [ ] **Step 1: Viết test hỏng**
  - `setBudget` 3.000.000 rồi 2.500.000 cho `2026-11` → `getBudget('2026-11').amount` = 2.500.000, chỉ 1 dòng (AC3)
  - `getPreviousBudget('2026-12')` khi chỉ có `2026-10` → null; có `2026-11` → bản `2026-11`
  - `budgetSource(3000000, 3000000, true)` = `'COPIED_FROM_PREVIOUS'`; `budgetSource(3500000, 3000000, true)` = `'MANUAL'`
  - `budgetPreview` ngày `2026-11-01`, 3.000.000, chưa chi → `{ dayLimit: 100000, spentThisMonth: 0, daysLeft: 30 }` (AC1)
  - `budgetPreview` ngày `2026-11-20`, chi trước 1.530.000, hôm nay 47.000 → `spentThisMonth` 1.577.000 (AC8)
- [ ] **Step 2: Chạy** `npm run test -- storage-budgets budgetForm` → FAIL
- [ ] **Step 3: Viết code**; tháng để lưu tính bằng `monthOf(toLocalDate(new Date()))` **lúc bấm** (Review Focus 2).
- [ ] **Step 4: Chạy** → PASS
- [ ] **Step 5: Commit** – `feat(US02): budget storage and preview`

### Task 3: `BudgetScreen` và `OnboardingBudgetScreen` [frontend-ui §4.3, design-system §6]

**AC trong PRD:** AC2 – AC5, AC7, AC9 – AC12 (`docs/requirements/US02-monthly-budget.md`)
**Đặc tả:** `BudgetScreen.md`, `OnboardingBudgetScreen.md` mục 1 – 4
**Hàm logic gọi tới:** `budgetPreview`, `budgetSource`, `getBudget`, `setBudget`, `getPreviousBudget`

**Files:**
- Create: `src/screens/BudgetScreen.tsx`, `src/screens/OnboardingBudgetScreen.tsx`, `src/app/(tabs)/budget.tsx`, `src/app/onboarding-budget.tsx`
- Modify: `src/app/(tabs)/_layout.tsx` (bỏ `href: null` của tab `budget`)

**Interfaces:**
- Consumes: Task 2; `applyAmountKey` (US01); `updateSettings` (US01)
- Produces: route `/budget` (nhận `from=home`), `/onboarding-budget`

- [ ] **Step 1: Dựng `BudgetScreen`** theo `BudgetScreen.md`: tiêu đề "Ngân sách tháng <mm/yyyy>", thẻ gợi ý "Tháng trước bạn đặt <số tiền>" + "Dùng lại số này" (chỉ điền, chưa lưu), xem trước, lỗi "Ngân sách tối đa 99.999.999đ", cảnh báo "Ngân sách thấp hơn số bạn đã chi tháng này (<số tiền>)", nút "Cập nhật ngân sách", `Snackbar` "Đã cập nhật ngân sách"; `from=home` → `router.back()`.
- [ ] **Step 2: Dựng `OnboardingBudgetScreen`** theo đặc tả: "Bắt đầu dùng" → `setBudget` + `updateSettings({ onboardingDoneAt })` → Home; "Để sau" → chỉ `onboardingDoneAt` → Home.
- [ ] **Step 3: Chạy** `npm run typecheck`, `npm run test`, `grep -rnE "#[0-9A-Fa-f]{6}" src/screens src/components` → sạch
- [ ] **Step 4: Commit** – `feat(US02): BudgetScreen, OnboardingBudgetScreen, budget tab`

### Task 4: Thẻ `NO_BUDGET` ở Home, kiểm AC trên máy thật [frontend-ui §4.3, product-requirements §6]

**AC trong PRD:** AC6 (`docs/requirements/US02-monthly-budget.md`)
**Đặc tả:** `HomeScreen.md` mục 2 (`NO_BUDGET`)
**Hàm logic gọi tới:** `getBudget`

**Files:**
- Create: `src/components/DailyAllowanceCard.tsx` (chỉ trạng thái `NO_BUDGET`)
- Modify: `src/screens/HomeScreen.tsx`, `src/hooks/useTodayTransactions.ts` (đọc thêm ngân sách tháng)

- [ ] **Step 1: Home không có ngân sách tháng này** → thẻ "Đặt ngân sách để biết hôm nay được tiêu bao nhiêu" + nút "Đặt ngân sách tháng" → `/budget?from=home`; ẩn thanh ngân sách (TC10).
- [ ] **Step 2: Chạy toàn bộ kiểm tra** (`npm run test`, `npm run typecheck`, grep màu) → sạch
- [ ] **Step 3: Trên máy thật đi AC1 – AC12 của PRD** (bảng 5.2); thêm Review Focus 5. Ghi Đạt / Chưa đạt.
- [ ] **Step 4: Mở PR** nhánh `feature/US02-monthly-budget` theo mẫu; cập nhật Trạng thái dòng 2 hàng đợi.
