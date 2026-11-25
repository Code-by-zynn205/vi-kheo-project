# US05 Nhắc ghi chép mỗi tối – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – **chỉ thực thi khi ADR-04 `Đã chấp nhận`, PRD US05 `Đã duyệt`, US01 và US19 `Done`** (hàng đợi mục 2a, dòng 6) · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Người dùng bật "Nhắc ghi chép mỗi tối" và nhận 1 thông báo khoảng 21:00 vào ngày chưa ghi khoản nào; bấm thông báo mở màn nhập.

**Architecture:** Hàm thuần `computeReminderSlots` → `src/reminder/scheduler.ts` là nơi duy nhất gọi `expo-notifications` (lịch cuộn 7 ngày, trigger `DATE` – ADR-04); `syncReminders()` được gọi khi mở app, lưu / xoá / hoàn tác khoản, bật / tắt công tắc.

**Tech Stack:** Expo SDK 58 + TypeScript, Expo Router, `expo-sqlite`, `expo-notifications`, Jest 30 + `jest-expo` (`technical-design.md` mục 1, ADR-04).

**Spec:** docs/plans/specs/2026-11-26-US05-evening-reminder-design.md
**PRD:** docs/requirements/US05-evening-reminder.md
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

1. Lưu khoản lúc 20:59 khi đã bật nhắc → thông báo 21:00 hôm nay bị huỷ – test ở Task 2.
2. Người dùng từ chối quyền rồi bật lại trong cài đặt máy → mở app thấy công tắc đúng trạng thái và lịch được hẹn – bước kiểm ở Task 4.
3. Ứng dụng mở lúc 21:30 ngày chưa ghi → không hẹn cho 21:00 đã qua (không bắn ngay) – test ở Task 1 (R3).
4. `syncReminders` gọi hai lần liên tiếp → vẫn đúng 7 thông báo, không nhân đôi – test ở Task 2.
5. Thông báo đến khi app đang mở → bấm vẫn mở màn nhập – bước kiểm ở Task 4.

---

### Task 1: `computeReminderSlots`, `shouldInviteReminder` [budget-logic §6]

**AC trong PRD:** AC2, AC5, AC6 (`docs/requirements/US05-evening-reminder.md`)
**Test case:** R1 – R5 (PRD US05 mục 5.1 – không phải tính tiền)

**Files:**
- Create: `src/logic/reminderSchedule.ts`
- Test: `__tests__/reminderSchedule-test.ts`

**Interfaces:**
- Consumes: `addDays` (US01)
- Produces: `REMINDER_MINUTES = 21 * 60`; `computeReminderSlots(input: { enabled: boolean; today: string; nowMinutes: number; hasEntryToday: boolean }): string[]` (chuỗi `YYYY-MM-DDT21:00`); `shouldInviteReminder(input: { totalCreated: number; reminderEnabled: boolean; inviteShownAt: string | null }): boolean`

- [ ] **Step 1: Test hỏng – R1 – R5 của PRD mục 5.1** (R1: 7 mốc từ `2026-11-26T21:00`; R2: từ `2026-11-27T21:00`; R3 `nowMinutes` 1290 → từ `2026-11-27`; R4: `[]`; R5: `2026-11-30T21:00` rồi `2026-12-01T21:00` … `2026-12-06T21:00`).
- [ ] **Step 2: Test `shouldInviteReminder`:** `totalCreated` 3, chưa bật, chưa mời → true; `totalCreated` 2 → false; đã mời → false; đã bật → false.
- [ ] **Step 3: Chạy** `npm run test -- reminderSchedule` → FAIL; **viết code**; chạy → PASS
- [ ] **Step 4: Commit** – `feat(US05): reminder slots and invite rule (R1-R5)`

### Task 2: `scheduler` – gọi `expo-notifications` [tech-decision §6, ADR-04]

**AC trong PRD:** AC3, AC5 – AC7, AC9, AC10 (`docs/requirements/US05-evening-reminder.md`)
**Test case:** R1, R2 (qua `scheduler`)

**Files:**
- Create: `src/reminder/scheduler.ts`
- Modify: `src/storage/transactions.ts` (thêm `countAllTransactions(): Promise<number>` – kể cả đã xoá), `src/storage/settings.ts` (`reminderInviteShownAt`), `src/storage/migrations.ts` (v2: cột `reminder_invite_shown_at`)
- Test: `__tests__/scheduler-test.ts`, `__tests__/migrations-test.ts`

**Interfaces:**
- Consumes: Task 1; `getSettings`, `listEntryDates` (US19), `toLocalDate`
- Produces: `syncReminders(now?: Date): Promise<void>`; `ensureReminderPermission(): Promise<'granted' | 'denied'>`; `countAllTransactions()`

- [ ] **Step 1: Test hỏng với `jest.mock('expo-notifications')`:**
  - bật nhắc, hôm nay chưa ghi, 20:00 → gọi `cancelAllScheduledNotificationsAsync` 1 lần rồi `scheduleNotificationAsync` 7 lần, lần đầu trigger `{ type: 'date', date: <2026-11-26 21:00> }`, nội dung tiêu đề "Ví Khéo", thân "Hôm nay bạn có khoản chi nào chưa ghi không?"
  - hôm nay đã ghi → lần đầu là ngày mai (Review Focus 1)
  - tắt nhắc → chỉ `cancelAll…`, không hẹn
  - gọi 2 lần → mỗi lần `cancelAll…` trước, tổng mốc còn lại 7 (Review Focus 4)
  - `ensureReminderPermission`: `setNotificationChannelAsync` được gọi **trước** `requestPermissionsAsync`
  - migration v2: `PRAGMA user_version` = 2, dữ liệu v1 còn nguyên
- [ ] **Step 2: Chạy** → FAIL; **viết code**; chạy → PASS
- [ ] **Step 3: Thêm `expo-notifications` vào `package.json`** (`npx expo install expo-notifications`) – đã có trong `technical-design.md` mục 6 (ADR-04)
- [ ] **Step 4: Commit** – `feat(US05): reminder scheduler with rolling 7-day DATE triggers`

### Task 3: Mục "Nhắc nhở", lời mời, mở màn nhập từ thông báo [frontend-ui §4.3, design-system §4.3, §6]

**AC trong PRD:** AC1 – AC4, AC8, AC11 (`docs/requirements/US05-evening-reminder.md`)
**Đặc tả:** `SettingsScreen.md` mục 1.2 – 1.4, 2 – 4
**Hàm logic gọi tới:** `shouldInviteReminder`, `syncReminders`, `ensureReminderPermission`

**Files:**
- Create: `src/components/ToggleRow.tsx`
- Modify: `src/screens/SettingsScreen.tsx` (mục 1.2 – 1.4 của đặc tả), `src/screens/AddExpenseScreen.tsx` (sau lưu: `syncReminders`, kiểm `shouldInviteReminder` → `Snackbar` "Muốn được nhắc ghi chép mỗi tối?" + "Bật"), `src/app/_layout.tsx` (`syncReminders` khi mở app; listener bấm thông báo → `/add`)

- [ ] **Step 1: Mục "Nhắc nhở"** theo `SettingsScreen.md`: `ToggleRow` "Nhắc ghi chép mỗi tối" / "Khoảng 21:00, chỉ nhắc khi hôm nay bạn chưa ghi khoản nào"; bật lần đầu → câu giải thích "Ví Khéo sẽ gửi 1 thông báo vào buổi tối để bạn nhớ ghi các khoản đã tiêu. Không quảng cáo." → `ensureReminderPermission`; từ chối → công tắc tắt + `Snackbar` "Bạn có thể bật lại trong cài đặt điện thoại"; máy chặn → "Điện thoại đang chặn thông báo của Ví Khéo" + "Mở cài đặt điện thoại".
- [ ] **Step 2: Chạy** `npm run typecheck`, `npm run test`, grep màu → sạch
- [ ] **Step 3: Commit** – `feat(US05): reminder settings, invite, open add screen from notification`

### Task 4: Kiểm AC trên 2 máy Android thật, mở PR [product-requirements §6]

- [ ] **Step 1: Build bản thử** theo ADR-03 (`eas build -p android --profile preview`) – thông báo cần đo trên bản cài, không chỉ Expo Go
- [ ] **Step 2: Trên 2 máy khác hãng đi AC1 – AC11** (bảng 5.2), ghi giờ nhận thông báo thật (ADR-04: đo lệch giờ); Review Focus 2, 5. Ghi Đạt / Chưa đạt.
- [ ] **Step 3: Mở PR** nhánh `feature/US05-evening-reminder`; cập nhật Trạng thái dòng 6 hàng đợi.
