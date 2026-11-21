# Kế hoạch thiết kế trên Figma

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đề xuất – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Review:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa · **Cập nhật:** 21/11/2026

File Figma: [Ví Khéo](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o). 4 frame hiện có (`01_NganSachThang`, `02_HomNay`, `03_GhiKhoanChi`, `04_BaoCaoDanhMuc`) là **bản demo** – giữ lại làm tham khảo, không dùng làm thiết kế chính thức.

Nguồn chuẩn (AGENTS.md quy tắc 6, `design-system` mục 4.4 – 4.6): **token** ở skill `design-system` mục 4.2 · **bố cục, hình ảnh** ở Figma · **chữ hiển thị, trạng thái, thao tác** ở đặc tả `docs/design/screens/*.md`.

---

## 1. Mục tiêu

1. Mỗi màn hình trong Backlog MVP có **đủ frame cho mọi trạng thái** ghi trong đặc tả – không thiếu trạng thái trống, lỗi.
2. Mọi frame dựng từ **Variables và component** của file – đổi một token là cả file đổi theo.
3. Có **prototype bấm thử** cho các luồng chính để test với sinh viên và demo cuối kỳ.
4. AI agent đọc được: tên frame, tên component, tên layer bằng tiếng Anh, trùng tên trong repo.

---

## 2. Cấu trúc file

| Trang | Nội dung | Ghi chú |
| :--- | :--- | :--- |
| `00 Cover` | Tên dự án, nhóm, link repo, ngày cập nhật, bảng trạng thái các màn hình | Ảnh bìa của file |
| `01 Tokens` | Variables (mục 3) + bảng mẫu màu, bảng kiểu chữ để nhìn | Chỉ cặp UI/UX sửa |
| `02 Components` | Toàn bộ component (mục 4), mỗi component một khung, đủ biến thể | Chỉ cặp UI/UX sửa |
| `03 Screens` | Frame màn hình theo từng nhóm (mục 5) | Mỗi màn hình một Section |
| `04 Prototype` | Bản sao frame đã nối luồng bấm (mục 6) | Dùng để test và demo |
| `_Archive` | 4 frame demo hiện có, trang `Wireframe`, `Highframe` cũ | Không xoá, không sửa |

**Khung chuẩn:** 360 × 800 (Android phổ biến; khớp quy tắc "rộng 360px không vỡ"). Frame cuộn dài thì để chiều cao theo nội dung, đánh dấu vùng màn hình đầu tiên bằng đường 800px.

**Lưới:** 4 cột, lề 16, khoảng cách cột 8. Khoảng cách theo bội số 4 (4 · 8 · 12 · 16 · 24 · 32).

---

## 3. Variables và kiểu chữ – chép đúng `design-system` mục 4.2

### 3.1 Collection `color`

| Variable | Giá trị | | Variable | Giá trị |
| :--- | :--- | :-: | :--- | :--- |
| `primary` | #4F46E5 | | `text/primary` | #111827 |
| `primary-light` | #EEF2FF | | `text/secondary` | #6B7280 |
| `success` | #10B981 | | `bg/page` | #F9FAFB |
| `warning` | #F59E0B | | `bg/card` | #FFFFFF |
| `danger` | #EF4444 | | `border` | #E5E7EB |
| `success-text` | #047857 | | `cat/an-uong` | #F97316 |
| `warning-text` | #B45309 | | `cat/di-chuyen` | #0EA5E9 |
| `danger-text` | #DC2626 | | `cat/nha-tro` | #8B5CF6 |
| | | | `cat/hoc-tap` | #14B8A6 |
| | | | `cat/mua-sam` | #EC4899 |
| | | | `cat/khac` | #94A3B8 |

### 3.2 Collection `size`

| Nhóm | Variables |
| :--- | :--- |
| `space` | `4` · `8` · `12` · `16` · `24` · `32` |
| `radius` | `card` = 16 · `control` = 12 |
| `touch` | `min` = 48 |

### 3.3 Text styles (font Inter)

| Style | Cỡ / độ đậm | Dùng cho |
| :--- | :--- | :--- |
| `Hero` | 36 / Bold | Số "Hôm nay còn được tiêu", ô số tiền |
| `Title` | 20 / SemiBold | Tiêu đề màn hình |
| `Section` | 16 / SemiBold | Tiêu đề mục, nút chính |
| `Body` | 14 / Regular | Nội dung |
| `Caption` | 12 / Regular | Chú thích, ngày giờ, dòng phụ |

**Bóng:** Effect style `card-shadow` = 0 1 3, đen 8%.

---

## 4. Component

Tên component tiếng Anh, trùng `design-system` mục 4.3. Mỗi component dùng **Component properties / Variants** thay vì vẽ nhiều bản rời.

### 4.1 Component nền (mới – đề xuất thêm vào `design-system` mục 4.3)

| Component | Biến thể (property) | Ghi chú |
| :--- | :--- | :--- |
| `Button` | `variant` = primary · secondary · text · danger-text; `state` = default · pressed · disabled | Cao 48, rộng 100% với primary |
| `TopBar` | `type` = title · back-title · sheet (tiêu đề + X) | |
| `TabBar` | `active` = home · budget · report | 3 tab + vùng nút nổi |
| `Fab` | — | Nút nổi "+ Ghi khoản chi" |
| `SegmentedControl` | `options` = Chi/Thu · Tuần này/Tháng này; `selected` | |
| `AmountInput` | `type` = expense · income; `state` = empty · filled · error | Text style `Hero` |
| `NoteInput` | `state` = empty · filled · counter · full | Bộ đếm "x/100" |
| `BottomSheet` | — | Khung nền cho màn nhập, sửa |
| `Icon` | `name` = an-uong · di-chuyen · nha-tro · hoc-tap · mua-sam · khac · settings · back · close · plus · chevron-left · chevron-right · backspace | Nét 2px, 24 × 24; không emoji |

### 4.2 Component nghiệp vụ (đã có trong `design-system` mục 4.3)

| Component | Biến thể (property) |
| :--- | :--- |
| `DailyAllowanceCard` | `state` = SAFE · WARNING · OVER · OUT_OF_BUDGET · NO_BUDGET |
| `ProgressBar` | `tone` = success · warning · danger; `value` 0–100 |
| `QuickCategoryChip` | `category` = 6 danh mục; `selected` = true · false |
| `TransactionItem` | `type` = expense · income |
| `NumericKeypad` | — (phím 1–9, 000, 0, xoá lùi; mỗi phím cao ≥ 48) |
| `EmptyState` | `hasAction` = true · false |
| `Snackbar` | `hasAction` = true · false |
| `ConfirmDialog` | — |
| `DonutChart` | `segments` = 1 · 3 · 5 |
| `DateNavigator` | `prevDisabled`, `nextDisabled` |
| `ToggleRow` | `on` = true · false; `warning` = true · false |

---

## 5. Danh sách frame cần vẽ

Tên frame: `<ScreenName> / <Trạng thái>`. Mỗi dòng dưới là một frame; nội dung lấy từ mục 2 "Trạng thái" của đặc tả tương ứng.

| Màn hình (đặc tả) | Frame (trạng thái) | Số frame | Sprint cần | Ưu tiên |
| :--- | :--- | :-: | :--- | :-: |
| `HomeScreen` | SAFE · WARNING · OVER · OUT_OF_BUDGET · NO_BUDGET · Empty · WithIncome · LoadError | 8 | 1 – 2 | 1 |
| `AddExpenseScreen` | Default · Typing · Income · ErrorMax · NoteFull · Saving · SaveError · DiscardConfirm | 8 | 1 – 2 | 1 |
| `BudgetScreen` | FirstTime · NewMonthSuggestion · Set · Invalid · ErrorMax · BelowSpent | 6 | 2 | 2 |
| `ReportScreen` | Month · Week · Empty · SingleCategory | 4 | 3 | 3 |
| `EditTransactionSheet` | Default · Edited · Deleted (Snackbar Hoàn tác) · DiscardConfirm · DeleteConfirm (phương án nếu PO giữ xác nhận – Q15) | 5 | 3 | 3 |
| `SettingsScreen` | ReminderOff · ReminderOn · BlockedByPhone · PermissionExplain · InviteSnackbar (trên Home) | 5 | 3 | 3 |
| `HistoryScreen` | WithData · Empty · Today · FirstDay | 4 | 3 – nếu kịp | 4 |
| **Tổng** | | **40** | | |

**Quy tắc vẽ frame:**
- Dùng số minh hoạ đúng như đặc tả (ví dụ `86.000đ`, `53% (1.577.000đ / 3.000.000đ)`) – không tự nghĩ số khác.
- Chữ trên frame chép **nguyên văn** mục 4 "Chữ trên màn hình" của đặc tả; muốn đổi chữ → sửa đặc tả trước.
- Mọi phần tử bấm được ≥ 48 × 48.
- Không dùng màu, cỡ chữ ngoài Variables và Text styles.

---

## 6. Prototype

| Luồng | Frame đi qua | Dùng cho |
| :--- | :--- | :--- |
| P1 – Ghi khoản chi | Home/SAFE → AddExpense/Default → Typing → Home/SAFE + Snackbar "Đã lưu" | Bấm giờ US01 AC8 (≤ 3 thao tác), demo |
| P2 – Đặt ngân sách | Home/NO_BUDGET → Budget/FirstTime → Set → Home/SAFE | US02, demo |
| P3 – Sửa và xoá | Home/SAFE → EditTransactionSheet/Default → Deleted → bấm Hoàn tác → Home/SAFE | Kiểm tra phương án Q15 với sinh viên |
| P4 – Báo cáo | Home → Report/Month → Week | US04, demo |
| P5 – Bật nhắc | Home + InviteSnackbar → Settings/PermissionExplain → ReminderOn | Kiểm tra phương án Q5 |

**Test A3:** dùng frame `HomeScreen / SAFE` trên Figma (chế độ Present trên điện thoại) **hoặc** `docs/design/prototype/home.html` – cùng nội dung, chọn cái nào mở được trên máy người tham gia. Kịch bản: `docs/evidence/prototype-tests/a3-test-guide.md`.

---

## 7. Lịch làm

Bám `docs/plans/00-master-plan.md`. Hạn là đề xuất, SM chốt ở Sprint Planning.

| Bước | Việc | Cần có trước | Hạn |
| :-: | :--- | :--- | :--- |
| F1 | Dọn file: tạo 6 trang ở mục 2, chuyển demo sang `_Archive` | — | 21/11 |
| F2 | Variables + Text styles (mục 3) | F1 | 21/11 |
| F3 | Component nền + component dùng ở Home, AddExpense | F2 | 22/11 |
| F4 | Frame `HomeScreen` (8) + `AddExpenseScreen` (8) | F3 | 22/11 |
| F5 | Cặp UI/UX duyệt F4, ghi link frame vào 2 đặc tả, đặt đặc tả `Xong` | F4 | 23/11 – trước Sprint 2 Planning |
| F6 | Prototype P1 | F4 | 23/11 |
| F7 | Frame `BudgetScreen` (6) + prototype P2 | F3, PO trả lời Q2, Q3 | 25/11 |
| F8 | Component còn lại + frame `ReportScreen`, `EditTransactionSheet`, `SettingsScreen` | F3, PO trả lời Q5, Q15 | 01/12 |
| F9 | Frame `HistoryScreen` + prototype P3 – P5 | F8 | 03/12 |

Mục tiêu: **đặc tả + frame của các màn Sprint 3 xong trước 03/12** để PA viết PRD kịp, Sprint 3 vào code ngay 04/12.

---

## 8. Quy trình cho từng màn hình

1. Đọc đặc tả `docs/design/screens/<ScreenName>.md` (mục 1, 2, 4).
2. Vẽ đủ frame trạng thái trong Section `<ScreenName>` ở trang `03 Screens`.
3. Tự kiểm checklist mục 9.
4. Dán link frame vào dòng **Figma** của đặc tả, ghi ngày đối chiếu.
5. Mở Pull Request nhánh `docs/<screen-name>-figma` (chỉ sửa đặc tả nếu có chỗ lệch), kèm ảnh chụp frame.
6. Người review (cặp giao diện) đối chiếu frame ↔ đặc tả theo `.agents/skills/design-system/templates/ui-review.md`.
7. Duyệt → đặc tả đổi trạng thái `Xong`.

**Khi AI có kết nối Figma:** nhờ AI đọc frame và đối chiếu với đặc tả (bước 6), hoặc viết nháp đặc tả từ frame. AI không sửa file Figma.

---

## 9. Checklist mỗi frame

- [ ] Tên frame đúng `<ScreenName> / <Trạng thái>`, tiếng Anh
- [ ] Khung 360 × 800, lưới mục 2
- [ ] Chỉ dùng Variables, Text styles, component của file (không có màu/cỡ chữ "rời")
- [ ] Chữ khớp nguyên văn đặc tả mục 4, tiếng Việt có dấu, không emoji
- [ ] Số minh hoạ khớp đặc tả
- [ ] Vùng bấm ≥ 48 × 48
- [ ] Màu chữ trạng thái dùng biến `*-text`, không dùng `warning` làm màu chữ

---

## 10. Rủi ro

| Rủi ro | Cách xử lý |
| :--- | :--- |
| File thuộc nhóm Education, Figma yêu cầu xác minh sinh viên/giảng viên – **sau 28/11 có thể không sửa được** | Một người xác minh tài khoản trước 25/11; giữ link chỉ xem cho cả nhóm |
| AI chưa có kết nối Figma trong phiên làm việc | Mở phiên mới sau khi bật kết nối; trong lúc chờ, dán ảnh frame vào Pull Request |
| Figma và đặc tả lệch nhau theo thời gian | Mục 4.6 của `design-system`: sửa cùng lúc; ghi ngày đối chiếu ở dòng Figma của đặc tả |
| 40 frame cho 2 người là nhiều | Ưu tiên theo cột "Ưu tiên" mục 5; `HistoryScreen` chỉ vẽ nếu US08 được xếp vào Sprint 3 |
