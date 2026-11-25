# Thiết kế kỹ thuật – US05 Nhắc ghi chép mỗi tối

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – AI (Claude Code) chốt theo uỷ quyền 26/11/2026; phụ thuộc ADR-04 (Đề xuất) · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US05-evening-reminder.md` · **Nền móng:** `2026-11-26-US01-add-expense-design.md` phần A · **Cách hẹn nhắc:** ADR-04

## Quyết định

| Việc | Cách làm | Lý do |
| :--- | :--- | :--- |
| Ngày nào cần nhắc | Hàm thuần `computeReminderSlots` ở `src/logic/reminderSchedule.ts` | ADR-04 mục 6.3; test R1 – R5 |
| Gọi thư viện | `src/reminder/scheduler.ts`: `syncReminders(): Promise<void>` = đọc cài đặt + "hôm nay đã ghi chưa" → `cancelAllScheduledNotificationsAsync()` → `scheduleNotificationAsync()` từng mốc (trigger `DATE`) | ADR-04; module duy nhất gọi `expo-notifications` |
| Khi nào gọi `syncReminders` | Mở app (`_layout.tsx` gốc), sau `saveTransaction`, `deleteTransaction`, `restoreTransaction`, bật / tắt công tắc | ADR-04 mục 6.4 |
| Xin quyền | `ensureReminderPermission(): Promise<'granted' \| 'denied'>`: tạo kênh `reminder` → `requestPermissionsAsync()` | Android 13 cần kênh trước (ADR-04 n1) |
| Lời mời sau khoản thứ 3 | `shouldInviteReminder({ totalCreated, reminderEnabled, inviteShownAt }): boolean` (hàm thuần); hiện thì ghi `reminderInviteShownAt` | Q5 đề xuất, E04 |
| Bấm thông báo | Listener `addNotificationResponseReceivedListener` + `getLastNotificationResponseAsync()` trong `_layout.tsx` gốc → `router.push('/add')` | ADR-04 mục 6.5 |
| Test `scheduler` | `jest.mock('expo-notifications')`, kiểm thứ tự lời gọi và số mốc | Thư viện native không chạy trong Jest |

## Giao diện tạo ra

- `computeReminderSlots(input: { enabled: boolean; today: string; nowMinutes: number; hasEntryToday: boolean }): string[]` – trả 0 hoặc 7 chuỗi `YYYY-MM-DDT21:00`
- `syncReminders(): Promise<void>` · `ensureReminderPermission()` · `shouldInviteReminder(…)`

## Để lại cho người code

Chữ trong kênh thông báo Android (tên kênh tiếng Việt, ví dụ "Nhắc ghi chép").
