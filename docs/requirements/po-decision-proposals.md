# Đề xuất trả lời các câu hỏi đang chặn Backlog

> **Giai đoạn:** 3 – Product Requirements · **Trạng thái:** Chờ duyệt – PO điền cột "Quyết định" · **Phụ trách:** PA, cặp dữ liệu · **Duyệt:** Dương Văn Hoan (PO); Q6 do kiến trúc sư · **Cập nhật:** 20/11/2026

File này gom các câu hỏi đang chặn US02, US05, US06, US07 (`docs/discovery/06-journey-features.md` mục 6), mỗi câu có phương án, đề xuất, lý do có nguồn và ảnh hưởng. **Đây là đề xuất, chưa phải quyết định.** PO ghi quyết định vào bảng mục 0; sau đó PA cập nhật AC và PRD.

Mã câu hỏi theo `docs/requirements/data-analysis.md` mục 13; Q15, Q16 là câu mới phát sinh khi nghiên cứu.

## 0. Bảng quyết định

| # | Câu hỏi | Đề xuất | Quyết định (PO) | Ngày |
| :-: | :--- | :--- | :--- | :--- |
| Q1 | Khoản thu cộng vào quỹ tháng nào? | Tháng theo ngày ghi | | |
| Q2 | Tháng mới có gợi ý ngân sách tháng trước? | Có, phải bấm xác nhận | | |
| Q3 | Giới hạn ngân sách tháng? | 1 – 99.999.999đ | | |
| Q5 | Nhắc nhở mặc định bật hay tắt? | Tắt; mời bật sau lần lưu thứ 3 | | |
| Q6 | Xoá là xoá hẳn hay xoá mềm? (kiến trúc sư) | Xoá mềm (`deletedAt`) | | |
| Q7 | Sửa giao dịch có đổi được ngày? | Không | | |
| Q8 | Bỏ nhắc nếu hôm nay đã ghi? | Có | | |
| Q15 | Xoá: hộp xác nhận hay nút Hoàn tác? | Hoàn tác 8 giây, bỏ hộp xác nhận | | |
| Q16 | Nhắc 21:00 chính xác tới đâu? | Khoảng 21:00 – 22:00 | | |

---

## Q1. Khoản thu cộng vào quỹ tháng nào?

| Phương án | Mô tả | Ưu | Nhược |
| :--- | :--- | :--- | :--- |
| **A (đề xuất)** | Cộng vào tháng của ngày ghi | Một quy tắc cho mọi giao dịch (BR-04); công thức hiện tại và TC7 giữ nguyên | Tiền nhà gửi ngày 28 để dùng tháng sau sẽ làm hạn mức 2–3 ngày cuối tháng tăng vọt |
| B | Cho chọn "Dùng cho tháng này / tháng sau" khi ghi khoản thu | Đúng thực tế hơn | Thêm 1 bước nhập (trái HMW1); thêm trường dữ liệu; thêm test |

**Lý do đề xuất A:** MVP ưu tiên ghi nhanh. Trường hợp tiền gửi cuối tháng ghi vào "Câu hỏi phỏng vấn" để kiểm chứng tần suất; nếu phổ biến, làm phương án B ở R2.
**Ảnh hưởng:** US07 AC3 bỏ "(chờ Q1)". Không đổi `budget-logic`.

## Q2. Tháng mới có gợi ý ngân sách tháng trước?

| Phương án | Mô tả | Ưu | Nhược |
| :--- | :--- | :--- | :--- |
| **A (đề xuất)** | Hiện thẻ "Tháng trước bạn đặt 3.000.000đ" + nút "Dùng lại số này"; chỉ lưu khi bấm "Cập nhật ngân sách" | 2 thao tác; người dùng luôn biết số đang dùng | Phải mở màn ngân sách |
| B | Tự chép ngân sách tháng trước sang | 0 thao tác | Người dùng không biết ngân sách đã được đặt; khó giải thích khi số sai |
| C | Không gợi ý | Đơn giản nhất | Phải gõ lại mỗi tháng |

**Lý do đề xuất A:** giữ ít thao tác (S1: 41/50 = 82% muốn ghi một khoản dưới 10 giây `[SƠ CẤP]`) nhưng không tự quyết thay người dùng.
**Ảnh hưởng:** US02 AC5 bỏ "(chờ Q2)"; `BudgetScreen.md` mục 1.2 đã vẽ theo phương án A.

## Q3. Giới hạn ngân sách tháng?

**Đề xuất:** 1đ ≤ ngân sách ≤ 99.999.999đ – cùng giới hạn với số tiền giao dịch.
**Lý do:** một giới hạn cho mọi ô nhập tiền, dễ test; vẫn rất xa mức chi phổ biến 2–5 triệu/tháng của mẫu khảo sát (`00-research-log.md`, S1 `[SƠ CẤP]`). Ngân sách nhỏ (dưới 30.000đ cho tháng 30 ngày) sẽ cho hạn mức ngày 0đ do làm tròn xuống – chấp nhận, đã có TC11.
**Ảnh hưởng:** US02 AC3 bỏ "(chờ Q3)".

## Q5. Nhắc nhở mặc định bật hay tắt?

**Đề xuất:** mặc định **tắt**. Sau khi người dùng lưu **khoản thứ 3**, hiện `Snackbar` "Muốn được nhắc ghi chép mỗi tối?" + nút "Bật" (chỉ hỏi 1 lần). Bấm "Bật" → câu giải thích ngắn → hộp xin quyền của hệ điều hành.

**Lý do** `[THỨ CẤP]`, tài liệu Android đọc ngày 20/11/2026 – `developer.android.com/develop/ui/views/notifications/notification-permission`:
- Từ Android 13 (API 33), gửi thông báo cần quyền do người dùng cấp lúc chạy app; app cài mới mặc định **chưa** có quyền.
- Google khuyên để người dùng làm quen với app trước khi xin quyền, xin **đúng ngữ cảnh** để rõ thông báo dùng vào việc gì; có gợi ý chờ tới lần mở app thứ 3–4.
- Người dùng từ chối trên Android 13+ thì mọi thông báo của app bị chặn.

Xin quyền ngay lần mở đầu dễ bị từ chối khi người dùng chưa thấy giá trị; mời sau lần lưu thứ 3 là lúc họ vừa dùng xong tính năng chính.
**Ảnh hưởng:** US05 AC1 bỏ "(chờ Q5)"; `SettingsScreen.md` đã vẽ theo đề xuất.

## Q6. Xoá giao dịch là xoá hẳn hay xoá mềm? (kiến trúc sư quyết)

**Đề xuất:** xoá mềm – đặt `deletedAt`, mọi truy vấn bỏ qua bản ghi có `deletedAt`; dọn hẳn sau 30 ngày (BR-91).
**Lý do:**
- Cần cho nút Hoàn tác (Q15).
- YNAB dùng cờ `deleted`, Actual Budget dùng `tombstone` trên mọi bảng để đồng bộ (`data-analysis.md` mục 1, R-01, R-02 `[THỨ CẤP]`) → sẵn đường lên R3.
**Chi phí:** mọi truy vấn thêm điều kiện "chưa xoá"; cần một bước dọn định kỳ. Phải có test: khoản đã xoá không tính vào US03, US04.
**Ảnh hưởng:** US06 AC5 bỏ "(chờ Q6)"; ADR-02 ghi rõ.

## Q7. Sửa giao dịch có đổi được ngày?

**Đề xuất:** **không** ở MVP; không đổi Chi ↔ Thu. Ghi nhầm ngày/loại thì xoá rồi ghi lại.
**Lý do:** MVP chỉ ghi được cho hôm nay (`AddExpenseScreen` mục 5), nên sai ngày gần như không xảy ra; cho đổi ngày phải tính lại 2 tháng, thêm trường hợp biên (EC-03) và màn chọn ngày.
**Ảnh hưởng:** US06 AC2 bỏ "(chờ Q7)"; `EditTransactionSheet.md` đã vẽ theo đề xuất.

## Q8. Bỏ nhắc nếu hôm nay đã ghi ≥ 1 khoản?

**Đề xuất:** **có**.
**Lý do:**
- HMW3: "nhắc… mà **không gây khó chịu**" (`06-journey-features.md` mục 2).
- Tài liệu Android khuyên tránh gửi thông báo thừa, lặp lại; người dùng xem được app gửi bao nhiêu thông báo mỗi ngày (`developer.android.com/develop/ui/compose/notifications`, đọc 20/11/2026 `[THỨ CẤP]`).

**Lưu ý kỹ thuật cho kiến trúc sư:** thông báo hẹn giờ do hệ điều hành bắn, app không chạy lúc đó để kiểm tra. Cách làm gợi ý: hẹn từng ngày một (không dùng lặp lại vô hạn); mỗi khi lưu khoản đầu tiên trong ngày thì **huỷ thông báo hôm nay** và hẹn cho ngày mai. Đây là lý do đề xuất US05 lên 3 SP.
**Ảnh hưởng:** US05 AC5 bỏ "(chờ Q8)".

## Q15. Xoá: hộp xác nhận hay nút Hoàn tác? (câu mới)

AC hiện tại của US06 (PO đã duyệt 14/11): "Xoá phải xác nhận một lần". Bản làm rõ Backlog thêm "Hoàn tác 5 giây". Có cả hai là thừa.

| Phương án | Mô tả |
| :--- | :--- |
| **A (đề xuất)** | Bỏ hộp xác nhận; sau khi xoá hiện `Snackbar` "Đã xoá khoản 30.000đ" + "Hoàn tác" trong **8 giây** |
| B | Giữ hộp xác nhận, bỏ Hoàn tác (như AC cũ) |
| C | Giữ cả hai |

**Lý do đề xuất A** `[THỨ CẤP]`, Nielsen Norman Group, đọc 20/11/2026:
- *Confirmation Dialogs Can Prevent User Errors (If Not Overused)* – `nngroup.com/articles/confirmation-dialog/`: chỉ xác nhận trước thao tác **không hoàn tác được**, cố gắng cho hoàn tác; không dùng hộp xác nhận cho thao tác thường ngày vì người dùng quen tay bấm qua.
- *User Control and Freedom* – `nngroup.com/articles/user-control-and-freedom/`: hỗ trợ hoàn tác, nút hoàn tác phải dễ thấy; thông báo chỉ hiện vài giây thì khó kịp bấm → chọn 8 giây thay cho 5 giây.

Sửa/xoá là thao tác thường ngày với người ghi nhiều khoản nhỏ; xoá mềm (Q6) làm hoàn tác rất rẻ.
**Ảnh hưởng:** US06 AC4, AC5 viết lại; `design-system` thêm `Snackbar` (8 giây), `ConfirmDialog` (để dành cho thao tác không hoàn tác được); BR-90 đổi 5 → 8 giây.

## Q16. Nhắc 21:00 chính xác tới đâu? (câu mới)

**Sự thật kỹ thuật** `[THỨ CẤP]`, `developer.android.com/develop/background-work/services/alarms/schedule`, đọc 20/11/2026:
- Báo thức "không chính xác" trên Android 12+ được hệ thống gọi **trong vòng 1 giờ** sau giờ hẹn.
- Báo thức chính xác cần quyền riêng; quyền này **không** được cấp sẵn cho app cài mới nhắm Android 13+; tài liệu nói chỉ dùng khi chức năng chính cần đúng giờ (ví dụ đồng hồ báo thức, lịch).

| Phương án | Mô tả |
| :--- | :--- |
| **A (đề xuất)** | Dùng nhắc không chính xác; AC ghi "khoảng 21:00, có thể muộn tới khoảng 22:00" |
| B | Xin quyền báo thức chính xác – thêm một hộp xin quyền nữa, không phải chức năng chính, dễ bị từ chối |

**Ảnh hưởng:** US05 AC2 đã sửa câu "có thể lệch vài phút" (sai) thành "có thể muộn tới khoảng 1 giờ". Hành vi trên iPhone: `Cần kiểm chứng` (trang hướng dẫn của Apple không đọc được bằng công cụ).

---

## Còn lại không thuộc PO

| Việc chặn | Ai | Đã chuẩn bị |
| :--- | :--- | :--- |
| Đặc tả màn hình `Cần bổ sung` | Cặp UI/UX duyệt | 4 đặc tả đã hoàn thiện, 3 đặc tả mới (`EditTransactionSheet`, `HistoryScreen`, `SettingsScreen`); 5 component mới trong `design-system` |
| Kết quả test A3 | Cặp nghiên cứu chạy với 5 sinh viên | `docs/design/prototype/home.html` + `docs/evidence/prototype-tests/a3-test-guide.md` |
| Ước lượng điểm | Developers ở Sprint Planning | SP đề xuất trong `06-journey-features.md` mục 4.1 |
