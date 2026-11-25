# Thiết kế kỹ thuật – US19 Thông tin dùng thử

> **Giai đoạn:** 4 – Vibe Code · **Skill:** brainstorming, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – AI (Claude Code) chốt theo uỷ quyền 26/11/2026 · **Phụ trách:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt · **Cập nhật:** 26/11/2026

**PRD:** `docs/requirements/US19-trial-info.md` · **Nền móng:** `2026-11-26-US01-add-expense-design.md` phần A

## Quyết định

| Việc | Cách làm | Lý do |
| :--- | :--- | :--- |
| Đếm ngày | Hàm thuần `computeTrialStats` nhận danh sách **ngày** có giao dịch, không nhận số tiền | BR-126: màn này không chạm tới số tiền |
| Đọc ngày có giao dịch | `listEntryDates(from, to): Promise<string[]>` – `SELECT DISTINCT date … WHERE deleted_at IS NULL` | BR-91; nhẹ hơn đọc cả giao dịch |
| `SettingsScreen` | Route `settings` (Stack); chỉ phần khung theo `SettingsScreen.md` "Dựng theo story" | US05, US20 thêm mục sau |
| Lối vào | Icon cài đặt trên thanh trên của Home hiện từ story này | `HomeScreen.md` "Dựng theo story" |
| Phiên bản app | Đọc từ cấu hình Expo (`expo-constants`, có sẵn trong mẫu – Cần kiểm chứng) | Đặc tả mục 1.7 |

## Giao diện tạo ra cho story sau

- `computeTrialStats(input: { firstOpenDate: string; today: string; entryDates: string[] }): TrialStats` với `TrialStats = { daysUsed: number; daysWithEntry: number; day7Date: string; day7Status: 'YES' | 'NO' | 'NOT_YET'; last7: { date: string; hasEntry: boolean; weekdayShort: string }[] }`
- Route `settings`, `trial-info`

## Để lại cho người code

Vẽ hàng 7 chấm; nhãn thứ ngắn "T2 … CN".
