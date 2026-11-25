# US03 Hôm nay còn được tiêu – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3), budget-logic (mục 4.2) · **Trạng thái:** Nháp – **chỉ thực thi khi PRD US03 `Đã duyệt`, US01 và US02 `Done`** (hàng đợi mục 2a, dòng 3) · **Phụ trách:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến (logic); Lê Thị Phát (giao diện) · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Home luôn hiện "Hôm nay còn được tiêu" đúng công thức, đổi màu theo trạng thái, kèm thanh "Ngân sách tháng đã dùng x%"; lần đầu mở app có 3 trang hướng dẫn.

**Architecture:** Hàm thuần `computeDailyAllowance` dựa trên `computeDayLimit` (US02) và `computeMonthUsage`; `DailyAllowanceCard` đủ 5 trạng thái; route `onboarding` do `_layout.tsx` gốc dẫn tới khi `onboardingDoneAt` rỗng.

**Tech Stack:** Expo SDK 58 + TypeScript, Expo Router, `expo-sqlite`, Jest 30 + `jest-expo` (`technical-design.md` mục 1).

**Spec:** docs/plans/specs/2026-11-26-US03-daily-allowance-design.md
**PRD:** docs/requirements/US03-daily-allowance.md
**Skill nhóm áp dụng:** tech-decision (mục 6), frontend-ui (mục 4.3, 6), design-system (mục 4.2, 4.3, 6), budget-logic (mục 4.2, 4.4, 6), product-requirements (mục 6)

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

1. Tỷ lệ đúng 0,7 (chi 70.000 / hạn mức 100.000) → `WARNING`, không phải `SAFE` – test ở Task 1.
2. Tỷ lệ đúng 1 (chi bằng hạn mức) → `WARNING`, còn được tiêu 0 – test ở Task 1.
3. Khoản thu hôm nay làm quỹ từ ≤ 0 lên > 0 → rời `OUT_OF_BUDGET` ngay – test ở Task 1.
4. Mẫu số "đã dùng x%" bằng 0 (không xảy ra vì ngân sách ≥ 1, nhưng phòng dữ liệu hỏng) → không chia cho 0 – test ở Task 1.
5. Bỏ qua onboarding rồi tắt app ngay → lần sau không hiện lại – bước kiểm ở Task 4.

---

### Task 1: Con số, trạng thái, phần trăm [budget-logic §4.2, §4.4]

**AC trong PRD:** AC1, AC3 – AC6, AC8, AC9, AC10 (`docs/requirements/US03-daily-allowance.md`)
**Test case:** TC1 – TC11 (TC17 khi PO duyệt Q18)

**Files:**
- Modify: `src/logic/dailyAllowance.ts` (thêm `computeDailyAllowance`, `computeMonthUsage`)
- Test: `__tests__/dailyAllowance-test.ts`

**Interfaces:**
- Consumes: `computeDayLimit` (US02 Task 1), `sumByType` (US01 Task 7)
- Produces: `computeDailyAllowance(input: { budget: MonthlyBudget | null; transactions: Transaction[]; today: string }): DailyAllowance`; `computeMonthUsage(input: { budget: number; incomeThisMonth: number; spentThisMonth: number }): { percent: number; used: number; base: number }`; `type DailyAllowance` như spec

- [ ] **Step 1: Viết test hỏng – mỗi dòng TC1 – TC11 của `budget-logic` 4.4 một test**, kiểm `dayLimit`, `remainingToday`, `status` đúng bảng (TC4: `remainingToday` −15.000, `status` `OVER`, `overBy` 15.000; TC5: `remainingToday` 0, `OUT_OF_BUDGET`; TC10: `NO_BUDGET`, `dayLimit` null). Thêm: Review Focus 1 – 3.
- [ ] **Step 2: Viết test `computeMonthUsage`:** `{ budget: 3000000, incomeThisMonth: 0, spentThisMonth: 1577000 }` → `percent` 53; `{ budget: 2500000, incomeThisMonth: 1200000, spentThisMonth: 3700000 }` → 100; `{ budget: 1000000, incomeThisMonth: 0, spentThisMonth: 1200000 }` → 120; base 0 → `percent` 0 (Review Focus 4).
- [ ] **Step 3: Chạy** `npm run test -- dailyAllowance-test` → FAIL
- [ ] **Step 4: Viết code** – quy tắc trạng thái đúng nguyên văn `budget-logic` 4.2 (Q18 chưa duyệt: hạn mức 0 thì tỷ lệ = 1); phần trăm `Math.round` (Q19 đề xuất).
- [ ] **Step 5: Chạy** → PASS
- [ ] **Step 6: Commit** – `feat(US03): daily allowance status and month usage (TC1-TC11)`

### Task 2: `DailyAllowanceCard` đủ 5 trạng thái trên Home [frontend-ui §4.3, design-system §4.3, §6]

**AC trong PRD:** AC2 – AC6, AC9 (`docs/requirements/US03-daily-allowance.md`)
**Đặc tả:** `HomeScreen.md` mục 1.2, 2
**Hàm logic gọi tới:** `computeDailyAllowance`, `computeMonthUsage`

**Files:**
- Modify: `src/components/DailyAllowanceCard.tsx`, `src/screens/HomeScreen.tsx`, `src/hooks/useTodayTransactions.ts` (đọc giao dịch từ ngày 1 tới hôm nay)
- Create: `src/components/ProgressBar.tsx`

- [ ] **Step 1: Thẻ theo `HomeScreen.md` mục 1.2, 2:** nhãn "Hôm nay còn được tiêu"; `SAFE` màu `successText`, không dòng phụ; `WARNING` `warningText`, "Sắp chạm hạn mức hôm nay"; `OVER` số âm `dangerText`, "Đã vượt <số tiền>"; `OUT_OF_BUDGET` `0đ` `dangerText`, "Đã dùng hết ngân sách tháng"; thanh "Ngân sách tháng đã dùng <x>% (<đã dùng> / <ngân sách>)", trên 100% thanh đầy, chữ `dangerText`.
- [ ] **Step 2: Chạy** `npm run typecheck`, grep màu → sạch
- [ ] **Step 3: Commit** – `feat(US03): DailyAllowanceCard states on Home`

### Task 3: Onboarding 3 trang [frontend-ui §4.3, design-system §4.3]

**AC trong PRD:** AC11, AC12 (`docs/requirements/US03-daily-allowance.md`)
**Đặc tả:** `OnboardingScreen.md` mục 1 – 4
**Hàm logic gọi tới:** `startRoute`

**Files:**
- Create: `src/screens/OnboardingScreen.tsx`, `src/app/onboarding.tsx`, `src/components/ProgressDots.tsx`, `src/logic/startRoute.ts`
- Modify: `src/app/_layout.tsx`
- Test: `__tests__/startRoute-test.ts`

**Interfaces:**
- Consumes: `getSettings`, `updateSettings` (US01)
- Produces: `startRoute(settings: Settings): '/onboarding' | '/(tabs)'`

- [ ] **Step 1: Test hỏng:** `onboardingDoneAt: null` → `'/onboarding'`; có giá trị → `'/(tabs)'` (BR-120)
- [ ] **Step 2: Chạy** → FAIL; **viết `startRoute`**; chạy → PASS
- [ ] **Step 3: Dựng `OnboardingScreen`** theo đặc tả: 3 trang ("Ghi một khoản chi trong 5 giây" · "Luôn biết hôm nay còn được tiêu bao nhiêu" · "Dữ liệu chỉ nằm trên điện thoại của bạn"), vuốt bằng `FlatList` ngang `pagingEnabled`; "Bỏ qua" → `onboardingDoneAt` → Home `NO_BUDGET`; "Bắt đầu" → `/onboarding-budget` (US02).
- [ ] **Step 4: `_layout.tsx` gốc dùng `startRoute` sau khi Splash xong**
- [ ] **Step 5: Commit** – `feat(US03): onboarding and start route`

### Task 4: Kiểm AC trên máy thật, mở PR [product-requirements §6, design-system §6]

- [ ] **Step 1: Chạy toàn bộ kiểm tra** (`npm run test`, `npm run typecheck`, grep màu) → sạch
- [ ] **Step 2: Trên máy thật đi AC1 – AC12 của PRD** (bảng 5.2, đổi giờ máy cho bước 2, 5, 6) và Review Focus 5. Ghi Đạt / Chưa đạt.
- [ ] **Step 3: Mở PR** nhánh `feature/US03-daily-allowance`; cập nhật Trạng thái dòng 3 hàng đợi.
