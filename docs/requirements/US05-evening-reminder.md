# PRD – US05: Nhắc ghi chép mỗi tối

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn được nhắc ghi chép mỗi tối, để không quên khoản nào. |
| Nguồn | HMW3 – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | Should · 3 · Sprint 3 – **làm đầu Sprint 3** để nhắc có tác dụng trong tuần dùng thử (A4) |
| Màn hình | `docs/design/screens/SettingsScreen.md` (mục "Nhắc nhở") · `AddExpenseScreen.md` (mở từ thông báo) |
| Phụ thuộc | US01; US19 (khung `SettingsScreen`); ADR-04 |
| Dữ liệu | `data-analysis.md` mục 11 dòng US05; E04, E01; BR-03, BR-127; Q5, Q8, Q16 |

## 1. Bối cảnh

76% sinh viên được khảo sát không ghi chép chi tiêu hằng ngày (38/50) `[SƠ CẤP]` (`00-research-log.md`). Giả định A4 cần sinh viên còn ghi tới ngày thứ 7 (`05-vision.md`); ghi chú A4: nếu A4 sai thì ưu tiên nhắc nhở. US05 nhắc một lần vào buổi tối, chỉ khi hôm đó chưa ghi.

## 2. Luồng thao tác chính

1. Người dùng lưu khoản thứ 3 (tính từ lúc cài app) → `Snackbar` "Muốn được nhắc ghi chép mỗi tối?" + nút "Bật" – chỉ hỏi 1 lần (Q5).
2. Bấm "Bật" (hoặc bật công tắc "Nhắc ghi chép mỗi tối" trong `SettingsScreen`) → câu giải thích "Ví Khéo sẽ gửi 1 thông báo vào buổi tối để bạn nhớ ghi các khoản đã tiêu. Không quảng cáo." → hộp xin quyền của Android.
3. Cho phép → công tắc bật; app hẹn nhắc theo ADR-04.
4. Khoảng 21:00 ngày chưa ghi khoản nào → thông báo "Ví Khéo" · "Hôm nay bạn có khoản chi nào chưa ghi không?".
5. Bấm thông báo → mở app ở `AddExpenseScreen`.

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E04 `Settings` | R U | `reminderEnabled` (mặc định tắt – Q5), `reminderTime` = `21:00`, `reminderInviteShownAt` (đề xuất – Q5) | `data-analysis.md` E04 |
| E01 `Transaction` | R | Có khoản chưa xoá hôm nay không; tổng số khoản đã tạo (mời bật nhắc sau khoản thứ 3) | `data-analysis.md` mục 11 |

**Quy tắc nghiệp vụ áp dụng:** BR-03, BR-127 (`data-analysis.md` mục 8); cách hẹn nhắc: ADR-04

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Cài app mới | Mở `SettingsScreen` | Mục "Nhắc nhở" có `ToggleRow` "Nhắc ghi chép mỗi tối", mô tả "Khoảng 21:00, chỉ nhắc khi hôm nay bạn chưa ghi khoản nào", công tắc **tắt** | Điện thoại | 06 AC1 · Q5 |
| AC2 | Đã lưu 2 khoản, chưa từng được mời | Lưu khoản thứ 3 | `Snackbar` "Muốn được nhắc ghi chép mỗi tối?" + nút "Bật"; lưu khoản thứ 4 không hỏi lại | Điện thoại + unit test | Q5 · `SettingsScreen.md` mục 3 |
| AC3 | Công tắc tắt, chưa cấp quyền | Bật công tắc | Hiện câu giải thích rồi mới hiện hộp xin quyền của Android | Điện thoại (Android 13+) | 06 AC1 · ADR-04 |
| AC4 | Hộp xin quyền đang mở | Bấm từ chối | Công tắc về tắt; `Snackbar` "Bạn có thể bật lại trong cài đặt điện thoại" | Điện thoại | 06 AC1 |
| AC5 | Đã bật nhắc, hôm nay chưa ghi khoản nào | Tới khoảng 21:00 | Nhận 1 thông báo "Ví Khéo" · "Hôm nay bạn có khoản chi nào chưa ghi không?", có thể muộn tới khoảng 22:00 | Điện thoại (đo trên 2 máy) | 06 AC2 · Q16 · BR-127 |
| AC6 | Đã bật nhắc | Hôm nay đã ghi ≥ 1 khoản | Không nhận thông báo hôm nay | Điện thoại + unit test R2 | 06 AC5 · Q8 |
| AC7 | Hôm nay đã ghi đúng 1 khoản, đã bật nhắc | Xoá khoản đó trước 21:00 (US06) | Nhắc hôm nay được hẹn lại | Unit test | ADR-04 mục 6 |
| AC8 | Nhận thông báo | Bấm vào | App mở ở `AddExpenseScreen` | Điện thoại | 06 AC3 |
| AC9 | Đang bật nhắc | Tắt công tắc, khởi động lại máy | Không nhận thông báo nào nữa | Điện thoại | 06 AC4 |
| AC10 | Đang bật nhắc | Khởi động lại máy, hôm đó chưa ghi | Vẫn nhận nhắc khoảng 21:00 | Điện thoại | ADR-04 n1 |
| AC11 | Đã bật trong app, sau đó tắt quyền thông báo trong cài đặt máy | Mở `SettingsScreen` | Công tắc bật + dòng "Điện thoại đang chặn thông báo của Ví Khéo" + nút "Mở cài đặt điện thoại" mở đúng trang thông báo của app | Điện thoại | `SettingsScreen.md` mục 2 |

## 5. Test case

### 5.1 Tính toán – hàm thuần "ngày nào cần nhắc" (ADR-04; không phải tính tiền)

| # | Bật nhắc | Bây giờ | Hôm nay đã ghi | Mốc nhắc trả về | AC |
| :-: | :--- | :--- | :--- | :--- | :--- |
| R1 | Có | 26/11/2026 20:00 | Chưa | 21:00 các ngày 26/11 → 02/12 (7 mốc) | AC5 |
| R2 | Có | 26/11/2026 20:00 | Rồi | 21:00 các ngày 27/11 → 03/12 (7 mốc) | AC6 |
| R3 | Có | 26/11/2026 21:30 | Chưa | 21:00 các ngày 27/11 → 03/12 | AC5 |
| R4 | Không | 26/11/2026 20:00 | Chưa | Không có mốc | AC9 |
| R5 | Có | 30/11/2026 20:00 | Chưa | 30/11, 01/12 → 06/12 (qua tháng) | AC5 |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Cài mới, ghi 3 khoản | Lời mời bật nhắc sau khoản thứ 3 | AC2 |
| 2 | Bấm "Bật", đồng ý quyền | Công tắc bật | AC3 |
| 3 | Đổi giờ máy 20:55, không ghi khoản nào hôm nay, chờ | Thông báo trong khoảng 21:00 – 22:00; bấm mở màn nhập | AC5, AC8 |
| 4 | Hôm sau ghi 1 khoản trước 21:00 | Không có thông báo | AC6 |
| 5 | Tắt công tắc, khởi động lại máy | Không có thông báo | AC9 |

## 6. Ngoài phạm vi

- Đổi giờ nhắc (cố định khoảng 21:00), nhắc trên iPhone (ADR-01), push từ máy chủ.
- Nhắc khoản định kỳ, nhắc nợ (BR-122, BR-123 – R2).

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `frontend-ui` | 4, 6 | Mục "Nhắc nhở" của `SettingsScreen`, lời mời sau khoản thứ 3, mở `AddExpenseScreen` từ thông báo |
| `design-system` | 4.2, 4.3, 6 | `ToggleRow`, `Snackbar` |
| `budget-logic` | 6 | Hàm thuần nhận `today` (mẫu cho `reminderSchedule`) |
| `tech-decision` | 6 | Chỉ dùng `expo-notifications` theo ADR-04 |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | Q5 – mặc định tắt, mời bật sau khoản thứ 3 (PRD theo đề xuất) | PO | chưa có |
| 2 | Q8 – không nhắc ngày đã ghi (PRD theo đề xuất; "Không" thì ADR-04 chuyển PA 2) | PO | chưa có |
| 3 | Q16 – "khoảng 21:00 – 22:00" | PO | chưa có |
| 4 | ADR-04 `Đề xuất` – Developers duyệt | Developers | chưa có |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
