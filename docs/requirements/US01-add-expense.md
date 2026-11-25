# PRD – US01: Ghi khoản chi

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Chờ duyệt · **Phụ trách:** PA (Cần bổ sung tên) – bản đầu do AI (Claude Code) soạn · **Duyệt:** Dương Văn Hoan (PO) – chưa duyệt · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn ghi một khoản chi chỉ bằng số tiền và danh mục, để ghi xong trong vài giây. |
| Nguồn | HMW1 · P1, P2 · F1, F2 – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | Must · 3 · Sprint 2 (chuyển từ Sprint 1 – `00-master-plan.md`) |
| Màn hình | `docs/design/screens/AddExpenseScreen.md` (chế độ Chi) · `HomeScreen.md` (thanh trên, mục "Chi tiêu hôm nay", nút nổi) · `SplashScreen.md` |
| Phụ thuộc | ADR-01, ADR-02, `docs/architecture/technical-design.md` – story này có **task dựng khung dự án** (`tech-decision` mục 6) |
| Dữ liệu | `data-analysis.md` mục 11 dòng US01; BR-01, BR-02, BR-03, BR-04, BR-10, BR-40; ERR_AMOUNT_ZERO, ERR_AMOUNT_MAX, ERR_NOTE_TOO_LONG; EC-01, EC-02, EC-07, EC-09, EC-11, EC-13 |

## 1. Bối cảnh

58% sinh viên được khảo sát từng tải app quản lý chi tiêu rồi bỏ dở (29/50) và 82% muốn ghi một khoản chi trong dưới 10 giây (41/50) `[SƠ CẤP]` (`00-research-log.md`). Persona Minh không ghi chép vì nhập liệu rườm rà (P1, P2). US01 là lõi của HMW1: mở app, gõ số tiền, bấm Lưu – danh mục `Ăn uống` chọn sẵn.

## 2. Luồng thao tác chính

1. Sinh viên mở app → `SplashScreen` ("Ví Khéo", "Biết hôm nay còn được tiêu bao nhiêu") chỉ trong lúc đọc dữ liệu → `HomeScreen`.
2. Bấm nút nổi "+ Ghi khoản chi" → `AddExpenseScreen` mở dạng bottom sheet, ô số tiền đã focus, `NumericKeypad` hiện sẵn, chip `Ăn uống` đã chọn.
3. Gõ số trên `NumericKeypad` (có phím `000`) → ô hiện `35.000đ`; nút "Lưu khoản chi" bật.
4. (Tuỳ chọn) chọn chip danh mục khác, gõ ghi chú.
5. Bấm "Lưu khoản chi" → sheet đóng, về `HomeScreen`, khoản mới ở đầu danh sách "Chi tiêu hôm nay", `Snackbar` "Đã lưu".

## 3. Dữ liệu

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E01 `Transaction` | C R | `id`, `type = EXPENSE`, `amount`, `categoryId`, `note`, `date`, `createdAt`, `updatedAt`, `deletedAt = null` | `data-analysis.md` mục 4 · `budget-logic` mục 4.1 |
| E03 `Category` | R | 6 danh mục chi cố định, mặc định `an_uong` | `data-analysis.md` E03 (hằng số trong code, `technical-design.md` mục 3) |
| E05 `AppMeta` | C (lần mở đầu) | `installId`, `firstOpenDate`, `schemaVersion` | `data-analysis.md` E05 – US19 đọc `firstOpenDate` |

Truy vấn chính: giao dịch hôm nay chưa xoá, mới nhất trước (`data-analysis.md` mục 11).

**Quy tắc nghiệp vụ áp dụng:** BR-01, BR-02, BR-03, BR-04, BR-10, BR-40 (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | Đang ở `HomeScreen` | Bấm "+ Ghi khoản chi" | `AddExpenseScreen` mở, tiêu đề "Ghi khoản chi", ô số tiền hiện `0đ` và đã focus, `NumericKeypad` hiện sẵn, chip `Ăn uống` đã chọn; có đủ 6 chip: Ăn uống, Di chuyển, Nhà trọ & Điện nước, Học tập & Tài liệu, Mua sắm & Sinh hoạt, Khác | Điện thoại | 06 AC1 · E03 |
| AC2 | Ô số tiền `0đ` | Gõ `3`, `5`, `0`, `0`, `0` – hoặc `3`, `5`, `000` | Ô hiện `35.000đ` | Điện thoại + unit test `formatMoney` | 06 AC2 · BR-02 |
| AC3 | Ô số tiền `0đ` | Chưa gõ gì | Nút "Lưu khoản chi" vô hiệu, không hiện chữ lỗi | Điện thoại | 06 AC3 · TC12 · ERR_AMOUNT_ZERO |
| AC4 | Ô đang `99.999.999đ` | Gõ thêm một chữ số | Không nhận phím; dòng lỗi "Số tiền tối đa 99.999.999đ" hiện 3 giây | Điện thoại + unit test | 06 AC4 · TC13 · ERR_AMOUNT_MAX |
| AC5 | Ô ghi chú | Dán đoạn 150 ký tự | Chỉ giữ 100 ký tự; bộ đếm hiện từ 80 ký tự, đầy thì "100/100" | Điện thoại | 06 AC5 · TC15 · EC-09 · ERR_NOTE_TOO_LONG |
| AC6 | Đã nhập `35.000đ`, chip `Ăn uống` | Bấm "Lưu khoản chi" | Về `HomeScreen`; khoản "−35.000đ" ở đầu "Chi tiêu hôm nay"; `Snackbar` "Đã lưu"; bản ghi có `type = EXPENSE`, `date` = hôm nay theo giờ máy | Điện thoại + unit test lớp `storage` | 06 AC6 · BR-03 |
| AC7 | Đã nhập số tiền | Bấm Lưu hai lần liên tiếp thật nhanh | Chỉ tạo 1 khoản (nút vô hiệu ngay sau lần bấm đầu) | Điện thoại | 06 AC7 · EC-11 |
| AC8 | Đang ở `HomeScreen` | Ghi một khoản chi danh mục mặc định | ≤ 3 thao tác (bấm nút nổi → gõ số → Lưu); thử với 3 người đều < 5 giây | Điện thoại, bấm giờ | 06 AC8 |
| AC9 | Đã lưu 3 khoản | Tắt hẳn app rồi mở lại; bật chế độ máy bay rồi ghi thêm | 3 khoản vẫn còn; ghi được khi không có mạng | Điện thoại | 06 AC9 · ADR-02 |
| AC10 | Mở app lần đầu, chưa có khoản nào hôm nay | Xem `HomeScreen` | `EmptyState` "Chưa có khoản chi nào hôm nay" + nút "+ Ghi khoản chi" | Điện thoại | 06 AC10 · EC-01 |
| AC11 | Không đổi chip | Lưu `20.000đ` | Khoản lưu với danh mục `an_uong` | Unit test | TC14 · BR-10 |
| AC12 | Đã nhập số tiền | Bấm `X` hoặc vuốt xuống | Hỏi "Bỏ khoản đang nhập?" với nút "Bỏ" / "Tiếp tục nhập"; chưa nhập số tiền thì đóng ngay, không hỏi | Điện thoại | `AddExpenseScreen.md` mục 3 |
| AC13 | Ghi dữ liệu thất bại | Bấm Lưu | Giữ nguyên sheet và số đã nhập; `Snackbar` "Chưa lưu được. Thử lại."; không có bản ghi dở | Unit test lớp `storage` (giả lỗi) | `AddExpenseScreen.md` mục 2 · EC-13 |
| AC14 | Hôm nay có 3 khoản chi 12.000đ, 5.000đ, 30.000đ | Xem `HomeScreen` | Thanh trên: "Hôm nay" và dòng ngày dạng "Thứ Sáu, 20/11"; mục "Chi tiêu hôm nay" tổng "−47.000đ", mới nhất trên cùng | Điện thoại + unit test | `HomeScreen.md` mục 1, 4 · BR-02 |
| AC15 | Đã ghi một khoản lúc 23:59 | Mở lại app sau 00:00 | Khoản đó không còn trong "Chi tiêu hôm nay"; dòng ngày là ngày mới | Điện thoại (đổi giờ máy) | EC-02 · BR-03 · EC-07 |
| AC16 | Mở app | Đang đọc dữ liệu | Hiện `SplashScreen` "Ví Khéo" · "Biết hôm nay còn được tiêu bao nhiêu", không nút; đọc xong sang `HomeScreen` | Điện thoại | `SplashScreen.md` |
| AC17 | Không đọc được dữ liệu trên máy | Mở `HomeScreen` | `EmptyState` "Không tải được dữ liệu. Thử mở lại app." + nút "Thử lại" | Unit test (giả lỗi) | `HomeScreen.md` mục 2 |
| AC18 | Mở app lần đầu trên máy | App khởi tạo dữ liệu | Có đúng 1 bản ghi `AppMeta` với `installId` và `firstOpenDate` = hôm nay; mở lại không đổi | Unit test lớp `storage` | E05 · US19 cần |

## 5. Test case

### 5.1 Tính tiền và nhập liệu (dẫn tới `budget-logic` mục 4.4)

| Test case | AC liên quan |
| :--- | :--- |
| TC12 | AC3 |
| TC13 | AC4 |
| TC14 | AC11 |
| TC15 | AC5 |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | Cài app mới, mở | Splash rồi Home trống "Chưa có khoản chi nào hôm nay" | AC16, AC10 |
| 2 | Bấm "+ Ghi khoản chi", gõ `3`, `5`, `000`, bấm "Lưu khoản chi" (đếm giờ) | "−35.000đ" ở đầu danh sách, "Đã lưu"; < 5 giây | AC1, AC2, AC6, AC8 |
| 3 | Gõ `99999999` rồi gõ thêm `1` | Không nhận phím, "Số tiền tối đa 99.999.999đ" | AC4 |
| 4 | Gõ `20000`, đổi chip `Di chuyển`, dán ghi chú 150 ký tự, Lưu | Ghi chú còn 100 ký tự; khoản ở danh mục Di chuyển | AC5 |
| 5 | Gõ số, bấm Lưu hai lần thật nhanh | Chỉ 1 khoản mới | AC7 |
| 6 | Gõ số, bấm `X` | Hộp "Bỏ khoản đang nhập?" | AC12 |
| 7 | Tắt app, bật chế độ máy bay, mở lại, ghi thêm 1 khoản | Khoản cũ còn, ghi được | AC9 |

## 6. Ngoài phạm vi

- Thẻ "Hôm nay còn được tiêu" (`DailyAllowanceCard`) và thanh ngân sách – US03 (trạng thái `NO_BUDGET` – US02).
- Chế độ `Thu` của `AddExpenseScreen` – US07.
- Màn hướng dẫn lần đầu (`OnboardingScreen`) – US03; ở US01, Splash luôn sang Home.
- Tab "Ngân sách" (US02), "Báo cáo" (US04), icon cài đặt (US19), sửa/xoá khoản (US06), "Xem các ngày trước" (US08) – **chưa hiện** cho tới khi story đó xong.
- Chọn ngày (BR-11, Q7), chụp hoá đơn, nhập giọng nói, chọn ví.

## 7. Skill áp dụng khi code

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `tech-decision` | 6 | Task dựng khung dự án theo `technical-design.md`, kết thúc bằng chạy trên điện thoại thật và `npm run test` |
| `frontend-ui` | 4, 6 | `SplashScreen`, `HomeScreen` (khung), `AddExpenseScreen` |
| `design-system` | 4.2, 4.3, 6 | `NumericKeypad`, `QuickCategoryChip`, `TransactionItem`, `EmptyState`, `Snackbar`, `Button` |
| `budget-logic` | 4.1, 4.4, 6 | Lớp `storage` (SQLite, Promise), `formatMoney`, kiểm nhập liệu TC12–TC15 |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | Thanh điều hướng dưới khi tab "Ngân sách", "Báo cáo" chưa làm: **ẩn tab** cho tới khi story xong (đề xuất) hay hiện tab mờ? | Cặp UI/UX | chưa có |
| 2 | Đặc tả `AddExpenseScreen`, `HomeScreen`, `SplashScreen` đang "chờ cặp UI/UX duyệt" – PRD chép theo bản hiện tại | Cặp UI/UX | chưa có |
| 3 | Giá trị `type` lưu là `EXPENSE` (theo `data-analysis.md` mục 7) – sửa `budget-logic` 4.1 đang viết `'expense'` (`technical-design.md` mục 3) | Cặp dữ liệu | chưa có |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Tạo PRD | AI (Claude Code), Nguyễn Diên Tiến | — |
