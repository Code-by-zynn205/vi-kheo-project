---
name: design-system
description: Hệ thống thiết kế của Ví Khéo – nguyên tắc, design token (màu, chữ, khoảng cách), component, quy trình thiết kế màn hình trên Figma, viết đặc tả màn hình và làm prototype. Dùng khi tạo hoặc sửa màn hình, component, màu sắc; khi thiết kế hoặc đọc file Figma; khi viết đặc tả màn hình trong docs/design/screens; khi làm prototype HTML để test với sinh viên; khi review giao diện trước khi merge.
---

# Skill: Design System & Prototype – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 2 – Design System & Prototype | Sprint 0 → 1 | Chốt nguyên tắc, token, component · đặc tả 4 màn hình · prototype `home.html` để test A3 |
| 2 – Design System & Prototype | Đầu Sprint 2, Sprint 3 | Cập nhật đặc tả màn hình của các User Story trong Sprint, **trước** khi PA viết PRD |
| 4 – Vibe Code | Mỗi Pull Request giao diện | Soát giao diện thật trên điện thoại theo checklist mục 8 |

- **Phụ trách chính:** Lê Thị Nhật Vy, Phạm Viết Hưng
- **Review:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa (người code giao diện)

> **Thiết kế gồm 3 phần, mỗi phần là nguồn chuẩn của một thứ** (cập nhật 21/11/2026 – nhóm dùng Figma):
>
> | Nguồn | Là nguồn chuẩn của | Ở đâu |
> | :--- | :--- | :--- |
> | Skill này mục 4.2, 4.3 | Giá trị token (màu, cỡ chữ, khoảng cách), danh sách component | Repo |
> | File Figma | Bố cục, hình ảnh từng màn hình và từng trạng thái, prototype bấm thử | Figma (link ghi ở `docs/design/README.md`) |
> | Đặc tả `docs/design/screens/<ScreenName>.md` | Chữ hiển thị nguyên văn, trạng thái, thao tác, ngoài phạm vi – thứ AI đọc khi viết PRD và code | Repo |
>
> Hai bên lệch nhau → không tự chọn bên nào, báo cặp UI/UX sửa cho khớp (mục 4.6).

## 2. Khi nào dùng / không dùng

**Dùng khi:** tạo/sửa màn hình, component · chọn màu, cỡ chữ · viết đặc tả màn hình · làm prototype HTML · review giao diện trong Pull Request.

**Không dùng khi:** viết công thức tính tiền, lưu dữ liệu (→ `budget-logic`) · viết yêu cầu, AC (→ `product-requirements`).

**Skill hỗ trợ (chỉ để gợi ý, không ghi đè token ở mục 4.2):**

| Skill | Dùng để |
| :--- | :--- |
| `ui-ux-pro-max` | Tra quy tắc UX/accessibility cho app tài chính mobile, ví dụ: `python .agents/skills/ui-ux-pro-max/scripts/search.py "fintech mobile budget" --domain ux` |
| `frontend-design` | Gợi ý 2–3 hướng thể hiện khác nhau cho một màn hình khi làm prototype, tránh giao diện rập khuôn |

Gợi ý nào muốn dùng → sửa skill này qua Pull Request (cặp UI/UX duyệt), rồi mới dùng trong code.

## 3. Đầu vào

- `docs/discovery/03-personas.md` – Persona Minh, Persona Vy (dùng một tay, ngại thao tác nhiều)
- `docs/discovery/06-journey-features.md` – User Story trong Sprint
- `docs/requirements/data-analysis.md` – thực thể, enum, mã lỗi (`ERR_…`), trường hợp biên (`EC-xx`), quy tắc (`BR-xx`): mỗi cái cần một trạng thái màn hình thể hiện (mẫu do `product-requirements` mục 4.1 sinh ra)
- `docs/design/screens/` – đặc tả màn hình hiện có
- File Figma của nhóm (link ở `docs/design/README.md`) – frame các màn hình, Variables, component

## 4. Quy trình và nội dung

### 4.1 Nguyên tắc thiết kế

| Nguyên tắc | Quy định đo được | Truy về |
| :--- | :--- | :--- |
| **Ghi nhanh** | Từ màn hình chính đến lúc lưu tối đa **3 thao tác** (`+ Ghi khoản chi` → gõ số tiền → `Lưu`; danh mục mặc định `Ăn uống`). Mục tiêu < 5 giây. | HMW1, P2 |
| **Một con số** | Màn hình chính chỉ có 1 số to: *Hôm nay còn được tiêu*. Không biểu đồ trên màn hình chính. | HMW2, P3 |
| **Một tay** | Nút chính, bàn phím số ở nửa dưới màn hình. Vùng chạm tối thiểu **48 × 48 px**. | Persona Minh |
| **Không emoji** | Trạng thái thể hiện bằng màu token và chữ. | Quy tắc chung |
| **Không quảng cáo, không đăng nhập** | Mở app là dùng được ngay. | P2 |

### 4.2 Design token

```css
:root {
  --color-primary:        #4F46E5; /* Nút chính, tab đang chọn */
  --color-primary-light:  #EEF2FF; /* Nền thẻ ngân sách */
  --color-success:        #10B981; /* Nền/thanh: an toàn */
  --color-warning:        #F59E0B; /* Nền/thanh: sắp chạm hạn mức */
  --color-danger:         #EF4444; /* Nền/thanh: vượt hạn mức */
  /* Màu CHỮ trạng thái – tương phản ≥ 4.5:1 trên nền trắng */
  --color-success-text:   #047857;
  --color-warning-text:   #B45309;
  --color-danger-text:    #DC2626;
  --color-warning-light:  #FFFBEB; /* Nền khung cảnh báo (thêm 21/11) */
  --color-scrim:          #111827; /* Lớp phủ sau hộp thoại, độ mờ 45% (thêm 21/11) */
  --color-bg-page:        #F9FAFB;
  --color-bg-card:        #FFFFFF;
  --color-text-primary:   #111827;
  --color-text-secondary: #6B7280;
  --color-border:         #E5E7EB;
  /* Màu danh mục – chỉ dùng trong DonutChart và chấm màu cạnh tên danh mục,
     luôn đi kèm tên + số, không dùng màu làm cách duy nhất để phân biệt */
  --color-cat-an-uong:    #F97316;
  --color-cat-di-chuyen:  #0EA5E9;
  --color-cat-nha-tro:    #8B5CF6;
  --color-cat-hoc-tap:    #14B8A6;
  --color-cat-mua-sam:    #EC4899;
  --color-cat-khac:       #94A3B8;
}
```

Không dùng `--color-warning` làm màu chữ trên nền trắng (tương phản khoảng 2:1). Chữ trạng thái luôn dùng biến `*-text`.

| Vai trò chữ | Cỡ | Độ đậm |
| :--- | :--- | :--- |
| Số tiền lớn (Hero) | 36px | 700 |
| Tiêu đề màn hình | 20px | 600 |
| Tiêu đề mục | 16px | 600 |
| Nội dung | 14px | 400 |
| Chú thích | 12px | 400 |

Font: `'Inter', 'Roboto', sans-serif` (đủ dấu tiếng Việt). Lề trang 16px · padding thẻ 16px · bo góc thẻ 16px · bo góc nút/ô nhập 12px · bóng `0 1px 3px rgba(0,0,0,0.08)`.

**Định dạng tiền:** `35.000đ`. Khoản chi `−35.000đ` màu `--color-danger-text`; khoản thu `+35.000đ` màu `--color-success-text`.

### 4.3 Component

| Component | Mô tả | Dùng ở |
| :--- | :--- | :--- |
| `DailyAllowanceCard` | Nhãn "Hôm nay còn được tiêu" + số Hero + thanh % ngân sách tháng. Màu theo trạng thái (bảng dưới). | Home |
| `QuickCategoryChip` | Lưới 3 × 2: Ăn uống · Di chuyển · Nhà trọ & Điện nước · Học tập & Tài liệu · Mua sắm & Sinh hoạt · Khác. | AddExpense |
| `TransactionItem` | Icon danh mục · ghi chú + giờ · số tiền. **Bấm** để mở `EditTransactionSheet` (US06) – khớp `HomeScreen.md` mục 3 (đổi từ "bấm giữ" ngày 26/11/2026). | Home, lịch sử |
| `NumericKeypad` | Phím 0–9, `000`, xoá lùi; mỗi phím cao ≥ 48px. | AddExpense, Budget |
| `ProgressBar` | Thanh % ngân sách tháng đã dùng. | Home, Budget |
| `EmptyState` | 1 câu hướng dẫn + 1 nút hành động. | Mọi màn hình |
| `Snackbar` | Thông báo ngắn ở đáy màn hình, tự ẩn sau **8 giây**; tối đa 1 nút hành động (ví dụ "Hoàn tác"). Không che nút chính. *(Thêm 20/11 – chờ cặp UI/UX duyệt)* | Sau khi lưu, xoá |
| `ConfirmDialog` | Hộp xác nhận **chỉ** cho thao tác không hoàn tác được. Nút ghi đúng hành động ("Xoá khoản này" / "Giữ lại"), không dùng "Có/Không"; không chọn sẵn nút xoá. *(Thêm 20/11)* | Hiện chưa có màn nào cần |
| `DonutChart` | Biểu đồ tròn rỗng giữa; mỗi danh mục một màu `--color-cat-*`; tổng chi ở tâm (cỡ tiêu đề mục); luôn đi kèm danh sách tên + % + số tiền bên dưới. *(Thêm 20/11)* | Report |
| `DateNavigator` | Hàng `‹  Thứ Năm, 19/11  ›`: mũi tên lùi/tiến 1 ngày, bấm vào chữ để mở lịch chọn ngày; không tiến quá hôm nay. *(Thêm 20/11)* | History |
| `ToggleRow` | Một hàng cài đặt: nhãn + dòng mô tả + công tắc; bấm cả hàng là bật/tắt; cao ≥ 56px. *(Thêm 20/11)* | Settings |
| `Button` | Biến thể: primary (nền `--color-primary`, chữ trắng, cao 48, rộng 100%) · secondary · text · danger-text; trạng thái default / pressed / disabled. *(Thêm 21/11 – chờ cặp UI/UX duyệt)* | Mọi màn hình |
| `TopBar` | title · back-title · sheet (tiêu đề + nút X); vùng bấm nút 48 × 48. *(Thêm 21/11)* | Mọi màn hình |
| `TabBar` + `Fab` | 3 tab Trang chủ · Ngân sách · Báo cáo; nút nổi "+ Ghi khoản chi". *(Thêm 21/11)* | Home, Budget, Report |
| `SegmentedControl` | 2 lựa chọn: Chi/Thu, Tuần này/Tháng này. *(Thêm 21/11)* | AddExpense, Report |
| `AmountInput` | Ô số tiền cỡ Hero; expense / income; empty / filled / error. *(Thêm 21/11)* | AddExpense, Budget, Edit |
| `NoteInput` | Ô ghi chú một dòng; bộ đếm "x/100" hiện từ 80 ký tự. *(Thêm 21/11)* | AddExpense, Edit |
| `BottomSheet` | Khung nền màn nhập, sửa; vuốt xuống để đóng. *(Thêm 21/11)* | AddExpense, Edit |
| `Icon` | Bộ icon nét 2px, 24 × 24: 6 danh mục + settings, back, close, plus, chevron trái/phải, backspace. Không emoji. *(Thêm 21/11)* | Mọi màn hình |

Component thêm khi dựng 161 khung (21/11/2026, bản AI dựng trên Figma, **chờ cặp UI/UX duyệt**). Danh sách khung dùng chúng: `docs/design/screen-inventory.md`.

| Component | Mô tả | Dùng ở | Lớp |
| :--- | :--- | :--- | :-: |
| `TextField` | Nhãn + ô nhập + dòng gợi ý; trạng thái default / focus (viền `--color-primary`) / error (viền và chữ gợi ý `--color-danger-text`). Ô cao ≥ 48px | Mọi form | R1 |
| `ListRow` | Một hàng danh sách: nhãn + chevron phải; cả hàng là vùng bấm, cao ≥ 48px | Settings, danh sách chọn | R1 |
| `ProgressDots` | Chấm chỉ bước onboarding; chấm hiện tại màu `--color-primary` | Onboarding | R1 |
| `CalendarSheet` | Sheet lịch tháng để chọn ngày; ngày tương lai bị mờ, không chọn được | History, ghi chi ngày khác | R1 |
| `NotificationCard` | Mô phỏng thông báo hệ điều hành: tên app + tiêu đề + nội dung | Nhắc ghi chép 21:00 | R1 |
| `Badge` | Nhãn nhỏ góc trên phải khung: "Sau MVP", "R3 · Sau MVP" – chỉ dùng trên Figma để phân lớp, **không** đưa vào app | Khung R2, R3 | — |
| `WalletIcon`, `WalletCard`, `WalletTypeChip` | Icon, thẻ số dư và chip chọn loại ví (tiền mặt, ngân hàng, ví điện tử); chip cao theo nội dung, chữ xuống dòng | Ví & chuyển tiền | R2 |
| `RecurringItem` | Khoản định kỳ: tên + chu kỳ + ngày tới hạn + số tiền; tên và dòng phụ cắt "…" sau 1 dòng | Định kỳ | R2 |
| `CategoryBudgetRow` | Danh mục + thanh % hạn mức danh mục + số còn lại; màu theo trạng thái như `DailyAllowanceCard` | Hạn mức danh mục | R2 |
| `AmountSplitRow` | Một phần khi chia một khoản ra nhiều danh mục hoặc nhiều người: tên + ô số tiền | Ghi chi nâng cao, chia tiền | R2 |
| `FrequencyPicker` | Chọn chu kỳ: hằng ngày / hằng tuần / hằng tháng | Định kỳ | R2 |
| `StatusChip` | Chip trạng thái chữ + nền nhạt (đang chạy, đạt, quá hạn…); không dùng màu làm tín hiệu duy nhất | Mục tiêu, vay nợ | R2 |
| `MemberAvatar` | Vòng tròn chữ cái đầu tên; xếp chồng tối đa 2, lệch −12px | Chia tiền nhóm, sổ chung | R2, R3 |
| `GoalCard` | Tên mục tiêu + thanh tiến độ + số đã góp / mục tiêu + hạn | Mục tiêu tiết kiệm | R2 |
| `DebtCard` | Người + "Mình nợ" / "Nợ mình" + số còn lại + hạn; không làm đổi hạn mức ngày (BR-72, BR-73) | Vay mượn | R2 |
| `BalanceRow` | Số dư giữa 2 người trong nhóm, kèm nút "Thanh toán" cao 48px | Chia tiền nhóm | R2 |
| `TagChip` | Nhãn tự đặt dạng `#tên`, bấm để lọc | Nhãn | R2 |
| `StreakCard` | Số ngày ghi chép liên tiếp, tính tới hôm qua nếu hôm nay chưa ghi (BR-125) | Chuỗi ngày | R2 |
| `AdminNavItem` | Mục điều hướng trang quản trị: icon 20px + nhãn, cao 44px; `state=default` / `active` (nền `--color-primary-light`, chữ và nét icon `--color-primary`); icon đổi bằng `AdminIcon/*` | Trang quản trị web | R3 |
| `AdminSidebar` | Thanh bên rộng 256px: logo, 9 `AdminNavItem` (Tổng quan, Người dùng, Góp ý, Thông báo, Danh mục hệ thống, Cấu hình app, Yêu cầu dữ liệu, Nhật ký kiểm toán, Phân quyền), ô quản trị viên đang đăng nhập ở đáy | Trang quản trị web | R3 |
| `AdminTopBar` | Thanh trên cao 72px: tiêu đề + đường dẫn; nhãn "R3 · Sau MVP", nút tìm kiếm và thông báo 48 × 48 | Trang quản trị web | R3 |
| `MetricCard` | Thẻ chỉ số gộp: nhãn + số + dòng ghi chú. Chỉ hiện chỉ số của nhóm ≥ 10 thiết bị (BR-115, BR-130); số trên Figma là minh hoạ | Bảng điều khiển quản trị | R3 |

Bảng dữ liệu trang quản trị (`DataTable`) hiện dựng bằng auto layout trong từng khung, chưa tách component: hàng cao 52px, cột cố định, chữ cắt "…" sau 1 dòng, cột trạng thái dùng chip chữ + nền nhạt. Tách thành component khi PO nâng US18.

Trạng thái màu của `DailyAllowanceCard` (điều kiện tính ở `budget-logic` mục 4.2):

| Trạng thái | Mã | Màu số Hero | Dòng phụ |
| :--- | :--- | :--- | :--- |
| An toàn | `SAFE` | `--color-success-text` | — |
| Sắp chạm | `WARNING` | `--color-warning-text` | "Sắp chạm hạn mức hôm nay" |
| Vượt | `OVER` | `--color-danger-text` | "Đã vượt 15.000đ" |
| Hết ngân sách tháng | `OUT_OF_BUDGET` | `--color-danger-text` | "Đã dùng hết ngân sách tháng" |
| Chưa đặt ngân sách | `NO_BUDGET` | — | Nút "Đặt ngân sách tháng" |

### 4.4 Thiết kế trên Figma (làm trước khi viết đặc tả)

0. **Lập danh mục màn hình** `docs/design/screen-inventory.md` từ `templates/screen-inventory.md`: đi qua `data-analysis.md` (thực thể, BR, EC, mã lỗi) và Backlog, mỗi thứ cần ít nhất một khung; ghi User Story của từng nhóm màn. Kế hoạch dựng file Figma ghi ở `docs/design/figma-plan.md` (mẫu `templates/figma-plan.md`).
1. **Cấu trúc file Figma** (một file cho cả nhóm):

   | Trang Figma | Nội dung |
   | :--- | :--- |
   | `00 Cover` | Tên dự án, link repo, bảng trạng thái các màn hình |
   | `01 Tokens` | Figma Variables, Text styles – **giá trị chép đúng mục 4.2** |
   | `02 Components` | Component ở mục 4.3, đặt đúng tên, đủ biến thể |
   | `03 Screens` | Mỗi màn hình một Section, mỗi trạng thái một frame, khung 360 × 800 |
   | `04 Prototype` | Luồng bấm thử để test với sinh viên và demo |
   | `_Archive` | Bản demo, bản cũ – không sửa, không xoá |

   Chi tiết (Variables, danh sách frame, lịch): `docs/design/figma-plan.md`.

2. **Đặt tên frame tiếng Anh**, trùng tên đặc tả: `HomeScreen / SAFE`, `HomeScreen / NO_BUDGET`, `AddExpenseScreen / Error`.
3. **Chỉ dùng Variables và component của file**, không tô màu tay, không gõ cỡ chữ tay.
4. **Thứ tự làm một màn hình:** màn đã có đặc tả → vẽ frame theo đặc tả; màn mới → vẽ frame rồi viết đặc tả. Sau đó ghi link frame ở dòng "Figma" của đặc tả → cặp UI/UX duyệt cả hai → đặt trạng thái `Xong` → PA viết PRD.
5. **Khi AI có kết nối Figma:** AI được đọc frame để viết nháp đặc tả, đối chiếu đặc tả với Figma, hoặc so code với Figma. **AI không sửa file Figma** nếu người dùng không yêu cầu rõ.
6. **Không có kết nối Figma:** chụp frame (PNG) dán vào Pull Request để review.

### 4.4a Viết đặc tả màn hình

1. Mỗi màn hình một file `docs/design/screens/<ScreenName>.md` từ mẫu `templates/screen-spec.md`.
2. Liệt kê bố cục từ trên xuống, chỉ dùng component ở mục 4.3. Cần component mới → thêm vào mục 4.3 trước.
3. Ghi đủ các trạng thái: có dữ liệu · trống · lỗi · (nếu có) theo `SAFE/WARNING/...`.
4. Số liệu trong đặc tả là dữ liệu minh hoạ, ghi rõ điều này.
5. Đặt trạng thái `Xong` khi cặp UI/UX đồng ý → PA dùng file này để viết PRD.

### 4.5 Làm prototype

Chọn một trong hai, ghi link vào đặc tả màn hình:

- **Prototype Figma** (trang `04 Prototype`) – mặc định khi test bố cục, luồng bấm.
- **Prototype HTML** – khi cần chạy được không cần tài khoản Figma hoặc cần tính số thật. Yêu cầu:

1. Một file HTML tĩnh `docs/design/prototype/<english-name>.html`, nhúng sẵn token ở mục 4.2, chạy được khi mở trực tiếp trên điện thoại.
2. Rộng 360px không vỡ, không cần mạng (không tải font/thư viện ngoài; thiếu Inter thì dùng Roboto/sans-serif của máy).
3. Ghi đường dẫn prototype vào đặc tả màn hình. Kết quả test với SV ghi bằng skill `user-research`.

### 4.6 Giữ Figma, token và đặc tả khớp nhau

| Thay đổi | Phải sửa cùng lúc |
| :--- | :--- |
| Giá trị token | Skill này mục 4.2 (Pull Request) **và** Variables trên Figma – cùng ngày |
| Component mới | Skill này mục 4.3 **và** trang `01 Components` |
| Bố cục, trạng thái một màn hình | Frame trên Figma **và** đặc tả `.md` (mục 1, 2) |
| Chữ hiển thị | Đặc tả `.md` mục 4 **và** chữ trên frame |

Khi đối chiếu cả file Figma với đặc tả (AI đọc Figma hoặc người review), ghi kết quả vào `docs/design/figma-gap-report.md` theo `templates/figma-gap-report.md`: mỗi chỗ lệch có đề xuất và người chốt, không tự chọn bên.

Đặc tả ghi ngày đối chiếu Figma gần nhất ở dòng "Figma". Code luôn lấy chữ từ đặc tả, lấy token từ `src/theme/` (chép từ mục 4.2), lấy bố cục từ frame Figma.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/design/screen-inventory.md` (danh mục màn hình, phân công) | `templates/screen-inventory.md` | PO + cặp UI/UX |
| `docs/design/figma-plan.md` (kế hoạch dựng Figma) | `templates/figma-plan.md` | Cặp UI/UX |
| `docs/design/screens/<ScreenName>.md` | `templates/screen-spec.md` | Cặp UI/UX + 1 người cặp giao diện |
| Frame Figma `<ScreenName> / <Trạng thái>` (link trong đặc tả) | — | Cặp UI/UX |
| Prototype Figma hoặc `docs/design/prototype/<english-name>.html` | — | Cặp UI/UX |
| `docs/design/figma-gap-report.md` (đối chiếu Figma ↔ đặc tả) | `templates/figma-gap-report.md` | Cặp UI/UX, PO cho câu cần chốt |
| Nhận xét review giao diện trong Pull Request | `templates/ui-review.md` | — |

## 6. Khi viết plan

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

## 7. Quy tắc bắt buộc

1. Chỉ dùng token ở mục 4.2; không tự thêm màu, font, gradient, hiệu ứng.
2. Không thêm màn hình, tab, tính năng nếu không có User Story.
3. Không đặt biểu đồ trên `HomeScreen`.
4. Gợi ý từ `frontend-design`, `ui-ux-pro-max` không được dùng thẳng vào code khi chưa sửa skill này.
5. Mọi chữ trên giao diện bằng tiếng Việt có dấu; mọi vùng bấm ≥ 48 × 48 px.
6. Trên Figma chỉ dùng Variables và component của file; không tô màu, gõ cỡ chữ tay.
7. AI chỉ đọc file Figma; không sửa Figma khi người dùng chưa yêu cầu rõ.

## 8. Checklist tự kiểm

- [ ] Đặc tả màn hình đủ các trạng thái (có dữ liệu, trống, lỗi), mỗi trạng thái có frame Figma
- [ ] Mỗi mã lỗi `ERR_…` và trường hợp biên `EC-xx` R1 của `data-analysis.md` có trạng thái màn hình trong `screen-inventory.md`
- [ ] Dòng đầu file có `**Skill:** design-system (mục …)`
- [ ] Đặc tả và frame Figma khớp nhau; Variables Figma khớp mục 4.2
- [ ] Màu, cỡ chữ, bo góc đúng token
- [ ] Ghi một khoản chi ≤ 3 thao tác, < 5 giây
- [ ] Chạy trên điện thoại thật, rộng 360px không vỡ
- [ ] Số tiền đúng định dạng `35.000đ`
