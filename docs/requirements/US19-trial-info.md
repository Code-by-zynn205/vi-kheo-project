# PRD – US19: Thông tin dùng thử

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt – **story mới, PO duyệt dòng Backlog trước** · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là người dùng thử, tôi muốn xem mình đã dùng app bao nhiêu ngày và bao nhiêu ngày có ghi chép, để gửi kết quả cho nhóm mà không lộ số tiền. |
| Nguồn | A4 (`05-vision.md`) · Q4 · BR-126 · F24 – `docs/discovery/06-journey-features.md` (đề xuất 26/11) |
| Ưu tiên · Story Point · Sprint | Must (đề xuất) · 1 · Sprint 2 – **bắt buộc có trong bản dùng thử 03/12** |
| Màn hình | `docs/design/screens/TrialInfoScreen.md` · `SettingsScreen.md` (chỉ phần khung: tiêu đề, "Về dữ liệu", mục "Khác" với 1 dòng) |
| Phụ thuộc | US01 (E05 `firstOpenDate` ghi lúc mở app lần đầu – US01 AC18) |
| Dữ liệu | `data-analysis.md` E05, E01; BR-91, BR-126; Q4 |

## 1. Bối cảnh

Giả định A4: "≥ 50% người dùng thử còn ghi ít nhất 1 khoản vào ngày thứ 7" (`05-vision.md`). Dữ liệu chỉ nằm trên máy (ADR-02) nên nhóm không tự xem được. Q4 đề xuất: app hiện số ngày có ghi chép, người dùng chụp màn hình gửi nhóm – không lộ số tiền, danh mục, ghi chú (BR-126).

## 2. Luồng thao tác chính

1. Ở `HomeScreen`, bấm icon cài đặt → `SettingsScreen` "Cài đặt".
2. Mục "Khác" → bấm "Thông tin dùng thử" → `TrialInfoScreen`.
3. Màn hiện "Bạn đã dùng Ví Khéo <n> ngày", số chính "<x>/<n> ngày", "có ghi ít nhất 1 khoản", hàng 7 chấm cho 7 ngày gần nhất, "Ngày bắt đầu", "Ngày thứ 7", "Ngày thứ 7 có ghi".
4. Người dùng chụp màn hình gửi nhóm khi được hỏi; app không gửi gì.

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E05 `AppMeta` | R | `firstOpenDate` | `data-analysis.md` E05 |
| E01 `Transaction` | R | `date`, `deletedAt` – chỉ đếm ngày, **không đọc số tiền** | BR-91, BR-126 |

**Cách tính** (hàm thuần trong `src/logic/`, nhận `today` làm tham số):
- `n` = số ngày từ `firstOpenDate` tới hôm nay, tính cả hai đầu.
- `x` = số ngày trong khoảng đó có ≥ 1 giao dịch chưa xoá (chi hoặc thu).
- Ngày thứ 7 = `firstOpenDate` + 6 ngày.

**Quy tắc nghiệp vụ áp dụng:** BR-91, BR-126 (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Ở `HomeScreen` | Bấm icon cài đặt | `SettingsScreen`: tiêu đề "Cài đặt"; mục "Về dữ liệu" với "Dữ liệu chỉ lưu trên điện thoại này. Gỡ app sẽ mất toàn bộ dữ liệu."; mục "Khác" có dòng "Thông tin dùng thử"; dòng phiên bản app | Điện thoại | `SettingsScreen.md` mục 1, 4 |
| AC2 | `firstOpenDate` = 04/12/2026; có giao dịch ngày 04, 05, 06, 08, 10/12; hôm nay 10/12 | Mở "Thông tin dùng thử" | "Bạn đã dùng Ví Khéo 7 ngày"; "5/7 ngày"; "có ghi ít nhất 1 khoản" | Unit test + điện thoại | BR-126 |
| AC3 | Như AC2 | Xem hàng 7 chấm | 7 ngày 04 – 10/12: chấm `--color-success` cho 04, 05, 06, 08, 10; `--color-border` cho 07, 09; nhãn thứ T2 … CN dưới mỗi chấm | Điện thoại | `TrialInfoScreen.md` mục 1 |
| AC4 | Như AC2 | Xem thẻ nhãn – giá trị | "Ngày bắt đầu" 04/12/2026 · "Ngày thứ 7" 10/12/2026 · "Ngày thứ 7 có ghi" Có | Unit test + điện thoại | A4 |
| AC5 | Mới dùng 3 ngày | Xem "Ngày thứ 7 có ghi" | Hiện "Chưa tới" (đề xuất – câu hỏi mở 2) | Điện thoại | `TrialInfoScreen.md` mục 2 |
| AC6 | Ngày 08/12 chỉ có 1 khoản và khoản đó đã xoá | Tính `x` | Ngày 08/12 không được đếm | Unit test | BR-91 |
| AC7 | Bất kỳ | Xem màn | Không hiện số tiền, danh mục, ghi chú; có ghi chú "Màn này không hiện số tiền. Khi nhóm hỏi, bạn chỉ cần chụp màn hình này gửi lại."; không có nút gửi, app không gọi mạng | Điện thoại | BR-126 · `TrialInfoScreen.md` mục 5 |
| AC8 | Ở `TrialInfoScreen` | Bấm quay lại | Về `SettingsScreen` | Điện thoại | `TrialInfoScreen.md` mục 3 |

## 5. Test case

### 5.1 Tính toán (hàm thuần, không phải tính tiền – không có trong `budget-logic` 4.4)

| # | `firstOpenDate` | Hôm nay | Ngày có giao dịch chưa xoá | Kết quả | AC |
| :-: | :--- | :--- | :--- | :--- | :--- |
| T1 | 04/12/2026 | 10/12/2026 | 04, 05, 06, 08, 10 | n = 7, x = 5, ngày thứ 7 = 10/12 có ghi | AC2, AC4 |
| T2 | 04/12/2026 | 04/12/2026 | (không có) | n = 1, x = 0 | AC2 |
| T3 | 04/12/2026 | 06/12/2026 | 04 | n = 3, x = 1, ngày thứ 7 "Chưa tới" | AC5 |
| T4 | 28/11/2026 | 04/12/2026 | 28, 30/11, 02/12 | n = 7 (qua tháng), x = 3 | AC2 |
| T5 | 04/12/2026 | 10/12/2026 | 04, 08 (khoản 08 đã xoá) | x = 1 | AC6 |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Cài mới, ghi 1 khoản, mở Cài đặt → "Thông tin dùng thử" | "1/1 ngày", ngày bắt đầu là hôm nay | AC1, AC2 |
| 2 | Đổi giờ máy sang 2 ngày sau, không ghi, mở lại | "1/3 ngày"; "Ngày thứ 7 có ghi" "Chưa tới" | AC5 |
| 3 | Bật chế độ máy bay, mở màn | Hiện bình thường | AC7 |

## 6. Ngoài phạm vi

- Mục "Nhắc nhở" của `SettingsScreen` – US05.
- Các dòng "Quyền riêng tư", "Giới thiệu", "Xoá toàn bộ dữ liệu" – US20.
- Tự gửi số liệu cho nhóm, `installId` gửi đi, máy chủ (ADR-02 loại đám mây khỏi MVP).

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `frontend-ui` | 4, 6 | `SettingsScreen` (khung), `TrialInfoScreen` |
| `design-system` | 4.2, 4.3, 6 | `TopBar`, `ListRow`, thẻ, chấm ngày |
| `budget-logic` | 4.1, 6 | Đọc giao dịch qua `storage`; hàm thuần nhận `today` |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | PO duyệt US19 vào Backlog và Q4 (đo A4 bằng chụp màn hình) | PO | chưa có |
| 2 | Chữ "Ngày thứ 7 có ghi" khi chưa tới ngày 7: "Chưa tới" (đề xuất) – đặc tả đang `Cần bổ sung` | Cặp UI/UX | chưa có |
| 3 | Chấm của ngày trước `firstOpenDate` (khi dùng < 7 ngày): hiện như "không ghi" (đề xuất) hay ẩn? | Cặp UI/UX | chưa có |
| 4 | `SettingsScreen` dựng khung ở US19 (Sprint 2), US05 thêm mục "Nhắc nhở" (Sprint 3) – cặp UI/UX đồng ý thứ tự này? | Cặp UI/UX | chưa có |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
