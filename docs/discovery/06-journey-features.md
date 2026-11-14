# 06. Customer Journey, HMW, Generate Features & Product Backlog

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0), PO cập nhật Backlog đầu mỗi Sprint · **Trạng thái:** ✅ · **Phụ trách:** Dương Văn Hoan (PO) + cả nhóm · **Cập nhật:** 14/11/2026

Chuỗi trong file này: **Hành trình → Điểm đau → HMW → Generate Features → MoSCoW → User Story + tiêu chí chấp nhận.**

## 1. Hành trình chi tiêu một tháng của sinh viên

| Giai đoạn | 1. Nhận tiền đầu tháng | 2. Chi lặt vặt hằng ngày | 3. Thử ghi chép | 4. Tuần 3–4 |
| :--- | :--- | :--- | :--- | :--- |
| **Hành động** | Nhận tiền gia đình/làm thêm, nhẩm trong đầu | Ăn uống, gửi xe, quét QR nhiều khoản 5–30 nghìn | Mở app để nhập khoản vừa tiêu | Kiểm tra số dư ngân hàng/ví |
| **Cảm xúc** | 😊 Thoải mái | 😐 Không để ý tổng | 😤 Khó chịu: nhiều bước, quảng cáo | 😰 Hoang mang vì sắp hết tiền |
| **Điểm đau** | P4 – không chia thành hạn mức ngày | P1 – không nhớ tiền đi đâu | P2 – bỏ cuộc sau 2–3 ngày | P3, P6 – không biết đã lố, hụt tiền |
| **Cơ hội** | Đặt ngân sách tháng 1 bước | Hiện ngay số còn được tiêu hôm nay | Mở lên là gõ số tiền | Cảnh báo màu khi sắp vượt |

*(Mã P1–P6 xem [03-personas.md](03-personas.md).)*

## 2. Câu hỏi "Làm thế nào để…?" (HMW)

| Mã | HMW | Từ điểm đau |
| :-: | :--- | :--- |
| **HMW1** | Làm thế nào để sinh viên ghi một khoản chi **nhanh đến mức không thấy phiền** (dưới 5 giây)? | P1, P2 |
| **HMW2** | Làm thế nào để sinh viên **luôn biết hôm nay còn được tiêu bao nhiêu** mà không phải tự cộng trừ? | P3, P4, P5, P6 |
| **HMW3** | Làm thế nào để **nhắc sinh viên ghi chép** mỗi ngày mà không gây khó chịu? | P2 |

## 3. Generate Features – sinh tính năng từ HMW

Từ 3 HMW, nhóm liệt kê **14 ý tưởng tính năng** (liệt kê hết trước, đánh giá sau), rồi lọc bằng **MoSCoW** theo 3 câu hỏi:
1. Thiếu nó, sản phẩm còn giải quyết HMW1/HMW2 không? Không → **Must**.
2. Làm được trong 3 Sprint với 8 Developer không? Không → **Won't**.
3. Đối thủ đã làm tốt hơn và không phải điểm khác biệt của Ví Khéo? → **Won't**.

| # | Ý tưởng tính năng | HMW | Điểm đau | MoSCoW | Lý do | Story |
| :-: | :--- | :-: | :--- | :-: | :--- | :-: |
| F1 | Ghi khoản chi/thu siêu tốc: mở ra là có ô số tiền + bàn phím số | 1 | P1, P2 | **Must** | Cốt lõi của HMW1 | US01, US07 |
| F2 | 6 danh mục sẵn cho SV, mặc định "Ăn uống" | 1 | P2 | **Must** | Bớt 1 bước chọn | US01 |
| F3 | Đặt ngân sách tháng | 2 | P4 | **Must** | Không có thì không tính được hạn mức ngày | US02 |
| F4 | "Hôm nay còn được tiêu" + đổi màu cảnh báo | 2 | P3, P5, P6 | **Must** | Điểm khác biệt chính so với đối thủ | US03 |
| F5 | Báo cáo theo danh mục (biểu đồ tròn + xếp hạng) | 2 | P1 | **Must** | Trả lời "tiền đi đâu" | US04 |
| F6 | Nhắc ghi chép lúc 21:00 | 3 | P2 | Should | Hỗ trợ thói quen, nhưng app vẫn dùng được nếu thiếu | US05 |
| F7 | Sửa/xoá giao dịch | 1 | P2 | Should | Nhập nhầm là chuyện thường; thiếu thì dữ liệu sai | US06 |
| F8 | Xem lịch sử theo ngày | 2 | P1 | Should | Hữu ích nhưng báo cáo đã trả lời phần lớn | US08 |
| F9 | Chia tiền phòng trọ/đi chơi nhóm | — | — | Could | Nhu cầu có thật nhưng ngoài 3 HMW | — |
| F10 | Chuỗi ngày ghi chép liên tục (streak) | 3 | P2 | Could | Tạo động lực, làm sau khi lõi ổn định | — |
| F11 | Giao diện tối | — | — | Could | Không giải quyết điểm đau nào | — |
| F12 | Liên kết tài khoản ngân hàng | 1 | P1 | Won't | Phức tạp bảo mật, không kịp 3 Sprint; thế mạnh của Money Lover | — |
| F13 | AI quét hoá đơn (OCR) | 1 | P2 | Won't | SV ăn quán bình dân, gửi xe – hầu như không có hoá đơn giấy; MISA đã có | — |
| F14 | Đầu tư, chứng khoán, vay nợ | — | — | Won't | Ngoài nhu cầu của nhóm mục tiêu | — |

**Kiểm tra truy vết:** HMW1 → F1, F2 (Must) · HMW2 → F3, F4, F5 (Must) · HMW3 → F6 (Should). Mỗi HMW đều có ít nhất 1 tính năng Must/Should. ✅

## 4. Product Backlog

Ước lượng Story Point theo dãy Fibonacci (1, 2, 3, 5, 8) – ước lượng sơ bộ, chỉnh lại ở Sprint Planning. Thứ tự do PO quyết định.

| ID | User Story | HMW | MoSCoW | SP | Sprint |
| :-: | :--- | :-: | :-: | :-: | :-: |
| **US01** | Là sinh viên, tôi muốn ghi một khoản chi chỉ bằng số tiền và danh mục, để ghi xong trong vài giây. | 1 | Must | 3 | 1 |
| **US02** | Là sinh viên, tôi muốn đặt ngân sách cho cả tháng, để biết giới hạn chi tiêu của mình. | 2 | Must | 2 | 2 |
| **US03** | Là sinh viên, tôi muốn thấy số tiền còn được tiêu hôm nay, để không tiêu quá tay. | 2 | Must | 3 | 2 |
| **US07** | Là sinh viên, tôi muốn ghi khoản thu (lương làm thêm, tiền nhà gửi thêm), để số tiền được tiêu tính đúng. 🟡 *bổ sung 14/11 – PO duyệt* | 2 | Must | 1 | 2 |
| **US04** | Là sinh viên, tôi muốn xem chi tiêu theo danh mục, để biết tiền đi đâu nhiều nhất. | 2 | Must | 5 | 3 |
| **US05** | Là sinh viên, tôi muốn được nhắc ghi chép mỗi tối, để không quên khoản nào. | 3 | Should | 2 | 3 |
| **US06** | Là sinh viên, tôi muốn sửa hoặc xoá khoản đã ghi, để sửa khi nhập nhầm. | 1 | Should | 2 | 3 |
| **US08** | Là sinh viên, tôi muốn xem lại các khoản chi của những ngày trước, để đối chiếu khi cần. | 2 | Should | 2 | Nếu kịp |

**Tổng theo Sprint:** Sprint 1 = 3 SP (kèm dựng dự án) · Sprint 2 = 6 SP · Sprint 3 = 9 SP.

## 5. Tiêu chí chấp nhận (Acceptance Criteria)

**US01 – Ghi khoản chi** `[Sprint 1]`
- Cho trước đang ở màn hình chính, khi bấm `+ Ghi khoản chi` → màn hình nhập mở, ô số tiền đã focus, bàn phím số hiện sẵn.
- Khi gõ `35000` → hiển thị `35.000đ`.
- Danh mục mặc định là `Ăn uống`; có đủ 6 danh mục.
- Khi bấm `Lưu` → quay về màn hình chính, khoản vừa ghi nằm đầu danh sách "Chi tiêu hôm nay".
- Từ màn hình chính đến lúc lưu: **≤ 3 thao tác**, thử với 3 người đều **< 5 giây**.
- Số tiền = 0 → không lưu được. Tắt app mở lại → dữ liệu vẫn còn.

**US02 – Ngân sách tháng** `[Sprint 2]`
- Nhập `3.000.000` cho tháng 11 (30 ngày) vào ngày 01/11 → khung xem trước hiện "khoảng 100.000đ mỗi ngày".
- Bấm `Cập nhật ngân sách` → màn hình chính dùng ngân sách mới ngay.
- Sang tháng mới chưa đặt ngân sách → màn hình chính hiện nút "Đặt ngân sách tháng".

**US03 – Hôm nay còn được tiêu** `[Sprint 2]`
- Con số tính đúng theo công thức và **qua đủ test case** trong `skills/budget-logic/SKILL.md` mục 7.
- Ghi thêm một khoản chi 30.000đ → con số giảm đúng 30.000đ.
- Màu đổi đúng 4 trạng thái: an toàn / sắp chạm / vượt / hết ngân sách tháng.

**US07 – Ghi khoản thu** `[Sprint 2]`
- Trên màn hình nhập, chuyển `Chi | Thu` sang `Thu`, nhập 1.200.000 → lưu → hiển thị `+1.200.000đ`.
- Hạn mức hôm nay tăng tương ứng (test case 7 của `budget-logic`).

**US04 – Báo cáo theo danh mục** `[Sprint 3]`
- Lọc `Tuần này` / `Tháng này`; tổng ở tâm biểu đồ bằng tổng các khoản chi trong khoảng đó.
- Danh mục xếp từ nhiều đến ít; danh mục bằng 0 không hiện. Chưa có dữ liệu → hiện trạng thái trống.

**US05 – Nhắc ghi chép** `[Sprint 3]`
- Bật nhắc → 21:00 mỗi ngày nhận thông báo "Hôm nay bạn có khoản chi nào chưa ghi không?". Bấm vào → mở màn hình nhập.
- Tắt được nhắc trong cài đặt.

**US06 – Sửa/xoá giao dịch** `[Sprint 3]`
- Bấm vào một khoản → sửa số tiền/danh mục/ghi chú → lưu → danh sách và con số "còn được tiêu" cập nhật.
- Xoá phải xác nhận một lần; xoá xong con số cập nhật (test case 16 của `budget-logic`).
