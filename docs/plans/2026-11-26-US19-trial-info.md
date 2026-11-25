# US19 Thông tin dùng thử – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – **chỉ thực thi khi PO duyệt US19 vào Backlog, PRD US19 `Đã duyệt`, US01 `Done`** (hàng đợi mục 2a, dòng 4) · **Phụ trách:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Người dùng thử mở Cài đặt → "Thông tin dùng thử", thấy số ngày đã dùng và số ngày có ghi chép, không lộ số tiền, để chụp gửi nhóm đo A4.

**Architecture:** Hàm thuần `computeTrialStats` nhận danh sách ngày có giao dịch; `storage` chỉ trả ngày (`SELECT DISTINCT date`); khung `SettingsScreen` + `TrialInfoScreen`.

**Tech Stack:** Expo SDK 58 + TypeScript, Expo Router, `expo-sqlite`, Jest 30 + `jest-expo` (`technical-design.md` mục 1).

**Spec:** docs/plans/specs/2026-11-26-US19-trial-info-design.md
**PRD:** docs/requirements/US19-trial-info.md
**Skill nhóm áp dụng:** tech-decision (mục 6), frontend-ui (mục 4.3, 6), design-system (mục 4.3, 6), budget-logic (mục 6), product-requirements (mục 6)

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

1. Đổi giờ máy lùi về trước `firstOpenDate` → không ra số âm (`daysUsed` tối thiểu 1) – test ở Task 1.
2. Có giao dịch ngày trước `firstOpenDate` (không xảy ra ở R1, phòng đổi giờ máy) → không đếm – test ở Task 1.
3. Hàng 7 chấm qua tháng (28/11 → 04/12) → đúng thứ, đúng ngày – test ở Task 1 (T4).
4. Màn hình không đọc bảng tiền: `listEntryDates` chỉ trả cột `date` – test ở Task 2.
5. Mở màn khi tắt mạng → hiện bình thường – bước kiểm ở Task 4.

---

### Task 1: `computeTrialStats` [budget-logic §6]

**AC trong PRD:** AC2 – AC5 (`docs/requirements/US19-trial-info.md`)
**Test case:** T1 – T5 (PRD US19 mục 5.1 – không phải tính tiền)

**Files:**
- Create: `src/logic/trialStats.ts`
- Test: `__tests__/trialStats-test.ts`

**Interfaces:**
- Consumes: `addDays` (US01 Task 2)
- Produces: `computeTrialStats(input: { firstOpenDate: string; today: string; entryDates: string[] }): TrialStats` (kiểu như spec); `weekdayShort(date: string): 'T2' | 'T3' | 'T4' | 'T5' | 'T6' | 'T7' | 'CN'`

- [ ] **Step 1: Test hỏng – 5 dòng T1 – T5 của PRD mục 5.1** (T1: `daysUsed` 7, `daysWithEntry` 5, `day7Date` `2026-12-10`, `day7Status` `'YES'`; T3: `'NOT_YET'`; T5: `daysWithEntry` 1 – ngày đã xoá đã bị bỏ ở `storage`, test truyền `entryDates` không có ngày đó). Thêm Review Focus 1 – 3; `weekdayShort('2026-12-04')` = `'T6'`.
- [ ] **Step 2: Chạy** `npm run test -- trialStats` → FAIL
- [ ] **Step 3: Viết code**; `last7` là 7 ngày kết thúc ở hôm nay, ngày trước `firstOpenDate` có `hasEntry: false`.
- [ ] **Step 4: Chạy** → PASS
- [ ] **Step 5: Commit** – `feat(US19): trial stats (T1-T5)`

### Task 2: `listEntryDates` [budget-logic §4.1]

**AC trong PRD:** AC6 (`docs/requirements/US19-trial-info.md`)
**Test case:** T5

**Files:**
- Modify: `src/storage/transactions.ts`
- Test: `__tests__/storage-entryDates-test.ts`

**Interfaces:**
- Produces: `listEntryDates(fromDate: string, toDate: string): Promise<string[]>` – ngày có ≥ 1 giao dịch chưa xoá, tăng dần, không trùng

- [ ] **Step 1: Test hỏng:** 2 khoản ngày `2026-12-04`, 1 khoản thu `2026-12-05`, 1 khoản đã xoá `2026-12-08` → `['2026-12-04', '2026-12-05']`
- [ ] **Step 2: Chạy** → FAIL; **viết** `SELECT DISTINCT date … WHERE deleted_at IS NULL`; chạy → PASS
- [ ] **Step 3: Commit** – `feat(US19): list entry dates`

### Task 3: Khung `SettingsScreen` và `TrialInfoScreen` [frontend-ui §4.3, design-system §4.3, §6]

**AC trong PRD:** AC1 – AC8 (`docs/requirements/US19-trial-info.md`)
**Đặc tả:** `SettingsScreen.md` (phần khung), `TrialInfoScreen.md` mục 1 – 4
**Hàm logic gọi tới:** `computeTrialStats`, `listEntryDates`

**Files:**
- Create: `src/screens/SettingsScreen.tsx`, `src/screens/TrialInfoScreen.tsx`, `src/app/settings.tsx`, `src/app/trial-info.tsx`, `src/components/ListRow.tsx`
- Modify: `src/screens/HomeScreen.tsx` (icon cài đặt trên thanh trên → `/settings`)

- [ ] **Step 1: `SettingsScreen` chỉ phần khung** (`SettingsScreen.md` "Dựng theo story"): "Cài đặt"; "Về dữ liệu" + "Dữ liệu chỉ lưu trên điện thoại này. Gỡ app sẽ mất toàn bộ dữ liệu."; "Khác" có đúng 1 dòng "Thông tin dùng thử"; dòng phiên bản app (`expo-constants` – kiểm có sẵn trong mẫu, không có thì ghi vào `technical-design.md` mục 6 trước).
- [ ] **Step 2: `TrialInfoScreen`** theo đặc tả: "Bạn đã dùng Ví Khéo <n> ngày", "<x>/<n> ngày", "có ghi ít nhất 1 khoản", 7 chấm (`success` / `border`) + nhãn thứ, "Ngày bắt đầu", "Ngày thứ 7", "Ngày thứ 7 có ghi" ("Có" / "Không" / "Chưa tới"), ghi chú cuối; **không** hiện số tiền.
- [ ] **Step 3: Chạy** `npm run typecheck`, `npm run test`, grep màu → sạch
- [ ] **Step 4: Commit** – `feat(US19): settings skeleton and trial info screen`

### Task 4: Kiểm AC trên máy thật, mở PR [product-requirements §6]

- [ ] **Step 1: Trên máy thật đi AC1 – AC8 của PRD** (bảng 5.2) và Review Focus 5. Ghi Đạt / Chưa đạt.
- [ ] **Step 2: Mở PR** nhánh `feature/US19-trial-info`; cập nhật Trạng thái dòng 4 hàng đợi.
