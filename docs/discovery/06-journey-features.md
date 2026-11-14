# 06. Customer Journey, Câu hỏi HMW & Generate Features

## 1. Bản đồ Hành trình Chi tiêu của Sinh viên (Customer Journey Map)

| Giai đoạn | 1. Nhận tiền đầu tháng | 2. Chi tiêu lắt nhắt hằng ngày | 3. Muốn ghi chép lại | 4. Tuần thứ 3–4 cuối tháng |
| :--- | :--- | :--- | :--- | :--- |
| **Hành động** | Nhận tiền gia đình / lương làm thêm; ước lượng nhẩm trong đầu. | Mua đồ ăn, gửi xe, quét QR liên tục các khoản nhỏ 5k–30k. | Mở app tài chính hiện có để nhập khoản vừa tiêu. | Kiểm tra số dư tài khoản ngân hàng / ví tiền mặt. |
| **Cảm xúc** | Hào hứng, thoải mái (😊) | Vô tư, không để ý tổng tiền đã tiêu (😐) | Khó chịu vì app load chậm, nhiều bước, dính quảng cáo (😤) | Hoang mang, hụt hẫng vì sắp hết tiền (😰) |
| **Điểm đau** | Không chia ngân sách tháng thành hạn mức ngày cụ thể (PP-04). | Tổng các khoản nhỏ cộng lại rất lớn nhưng không nhớ (PP-01). | Bỏ cuộc giữa chừng, ngừng ghi chép sau 2–3 ngày (PP-02). | Phải vay bạn bè hoặc cắt giảm ăn uống cuối tháng (PP-03, PP-04). |
| **Cơ hội của Ví Khéo** | Cho phép nhập tổng ngân sách tháng chỉ với 1 bước. | Hiển thị ngay số tiền còn được tiêu trong ngày. | Thiết kế màn hình nhập liệu mở lên là gõ số tiền ngay (< 5s). | Cảnh báo sớm khi mức tiêu vượt ngưỡng an toàn. |

---

## 2. Câu hỏi "Làm thế nào để...?" (How Might We – HMW)
Từ các điểm đau trên, nhóm đặt ra 3 câu hỏi HMW trọng tâm:
1. **HMW1** (PP-02): Làm thế nào để sinh viên ghi lại một khoản chi **nhanh đến mức không thấy phiền** (dưới 5 giây)?
2. **HMW2** (PP-01, PP-03, PP-04, PP-05): Làm thế nào để sinh viên **luôn biết ngay hôm nay mình còn được tiêu bao nhiêu** mà không cần tự cộng trừ?
3. **HMW3** (PP-01): Làm thế nào để nhắc nhở sinh viên duy trì thói quen ghi chép mỗi tối một cách nhẹ nhàng, không gây khó chịu? Căn cứ: lý do bỏ app #1 có nêu *"hay quên ghi"* (`02 §4`).

---

## 3. Generate Features & Phân loại Phạm vi MVP (MoSCoW)
Từ 3 câu hỏi HMW trên, nhóm đề xuất **14 tính năng** và sàng lọc theo nguyên tắc **MoSCoW** để đảm bảo hoàn thành trong 3 Sprint:

### Must-Have (Bắt buộc có trong MVP – Giải quyết trực tiếp HMW1 & HMW2)
1. **F01 – Ghi khoản chi siêu tốc (`US01`, HMW1):** Bấm `+ Ghi khoản chi` là mở ngay ô nhập số tiền và bàn phím số. Nhập số tiền, giữ danh mục mặc định hoặc chọn danh mục khác, rồi bấm Lưu.
2. **F02 – Bộ danh mục chuẩn cho sinh viên (`US01`, HMW1):** 6 danh mục trực quan: Ăn uống, Di chuyển, Nhà trọ & Điện nước, Học tập, Mua sắm & Sinh hoạt, Khác (chi tiết ở `design-system §4`).
3. **F03 – Đặt ngân sách tháng (`US02`, HMW2):** Nhập tổng số tiền dự kiến chi tiêu trong tháng.
4. **F04 – Tính toán "Hôm nay còn được tiêu" (`US03`, HMW2):** Hạn mức hôm nay bằng ngân sách còn lại đầu ngày chia cho số ngày còn lại trong tháng (tính cả hôm nay). Số còn được tiêu bằng hạn mức trừ số đã chi hôm nay. Màu cảnh báo đổi trực quan theo ngưỡng. Công thức đầy đủ ở `design-system §6`.
5. **F05 – Báo cáo chi tiêu theo danh mục (`US04`, HMW2):** Biểu đồ tròn và danh sách xếp hạng nhóm chi tiêu tốn tiền nhất.

### Should-Have (Nên có nếu kịp tiến độ Sprint 3)
6. **F06 – Nhắc nhở ghi chép buổi tối (`US05`, HMW3):** Thông báo nhẹ lúc 21:00 hằng ngày (*"Hôm nay bạn có khoản chi nào chưa ghi không?"*).
7. **F07 – Sửa / Xóa giao dịch (`US06`, HMW1):** Cho phép chỉnh sửa nhanh khi nhập nhầm số tiền.
8. **F08 – Xem lịch sử giao dịch theo ngày (`US07`, HMW2):** Tra cứu lại các khoản đã tiêu của những ngày trước.

### Could-Have (Có thì tốt – Dành cho phiên bản mở rộng)
9. **F09** – Chia tiền phòng trọ / đi chơi nhóm.
10. **F10** – Chuỗi ngày ghi chép liên tục (Streak) tạo động lực.
11. **F11** – Giao diện tối (Dark Mode).

### Won't-Have (Loại bỏ khỏi phạm vi để tránh "AI Slop" & phình to dự án)
12. **F12** – Liên kết trực tiếp tài khoản ngân hàng (phức tạp bảo mật, không kịp 3 Sprint).
13. **F13** – AI quét hóa đơn (OCR): sinh viên chủ yếu ăn quán bình dân/gửi xe, không có hóa đơn giấy.
14. **F14** – Quản lý danh mục đầu tư, chứng khoán, vay nợ phức tạp.

---

## 4. Product Backlog Ban đầu (Initial User Stories)
Thứ tự trong bảng là thứ tự ưu tiên.

| ID | User Story | Điểm đau | HMW | Tính năng | MoSCoW | Story Points |
| :--- | :--- | :--- | :--- | :--- | :--- | :---: |
| **US01** | Là sinh viên, tôi muốn ghi một khoản chi chỉ bằng số tiền và chọn danh mục để hoàn tất trong dưới 5 giây. | PP-02 | HMW1 | F01, F02 | Must | 3 |
| **US02** | Là sinh viên, tôi muốn đặt ngân sách tổng cho cả tháng để xác định giới hạn chi tiêu của bản thân. | PP-04 | HMW2 | F03 | Must | 2 |
| **US03** | Là sinh viên, tôi muốn nhìn thấy ngay số tiền còn được tiêu hôm nay trên màn hình chính để không tiêu quá tay. | PP-03, PP-04, PP-05 | HMW2 | F04 | Must | 3 |
| **US04** | Là sinh viên, tôi muốn xem báo cáo chi tiêu theo từng danh mục để biết tiền của mình đi đâu nhiều nhất. | PP-01 | HMW2 | F05 | Must | 5 |
| **US05** | Là sinh viên, tôi muốn nhận thông báo nhắc ghi chép mỗi tối để không bị quên các khoản chi trong ngày. | PP-01 | HMW3 | F06 | Should | 2 |
| **US06** | Là sinh viên, tôi muốn sửa hoặc xóa một khoản chi đã ghi để số liệu đúng khi lỡ nhập nhầm. | PP-02 | HMW1 | F07 | Should | ? |
| **US07** | Là sinh viên, tôi muốn xem lại các khoản chi của những ngày trước để biết tiền đã đi đâu. | PP-01 | HMW2 | F08 | Should | ? |

*Story Points `?`: nhóm ước lượng bằng Planning Poker trước Sprint 3.*

---

## 5. Tiêu chí Chấp nhận (Acceptance Criteria)
Định dạng *Cho / Khi / Thì*. Giao diện, định dạng tiền và công thức tham chiếu skill `design-system` (`.claude/skills/design-system/SKILL.md`).

### US01 – Ghi khoản chi
1. **Cho** người dùng đang ở `HomeScreen`, **khi** bấm `+ Ghi khoản chi`, **thì** `AddExpenseScreen` mở ra, ô số tiền được focus, bàn phím số hiện sẵn, danh mục `Ăn uống` được chọn sẵn.
2. **Cho** số tiền đang là 0, **thì** nút `Lưu khoản chi` bị vô hiệu hóa.
3. **Cho** đã nhập `35000` và chọn `Di chuyển`, **khi** bấm `Lưu khoản chi`, **thì** giao dịch được lưu cục bộ, màn hình đóng lại, và khoản `-35.000₫` xuất hiện đầu danh sách *Chi tiêu hôm nay*.
4. **Cho** đã lưu ít nhất 1 khoản chi, **khi** tắt hẳn app rồi mở lại (kể cả khi không có mạng), **thì** dữ liệu vẫn còn nguyên.
5. **Cho** ô ghi chú để trống, **khi** bấm Lưu, **thì** vẫn lưu được, và dòng giao dịch hiển thị tên danh mục thay cho ghi chú.
- *Chỉ số theo dõi (không chặn Done):* khi SV dùng thử ở Sprint 3, thời gian từ lúc bấm `+ Ghi khoản chi` đến lúc bấm Lưu dưới 5 giây.

### US02 – Đặt ngân sách tháng
1. **Cho** tháng hiện tại chưa có ngân sách, **thì** `HomeScreen` hiện lời nhắc và nút `Đặt ngân sách` thay cho thẻ hạn mức.
2. **Khi** gõ ngân sách, **thì** khung xem trước hiện hạn mức mỗi ngày và cập nhật ngay khi gõ. Ví dụ: đặt `3.000.000₫` ngày 01/11, chưa chi khoản nào, thì hiện `100.000₫`.
3. **Khi** bấm `Cập nhật ngân sách` với số lớn hơn 0, **thì** ngân sách được lưu cho tháng hiện tại và `HomeScreen` hiện thẻ hạn mức. Số bằng 0 thì nút bị vô hiệu hóa.
4. **Cho** tháng này đã có ngân sách, **khi** đặt lại, **thì** số mới thay số cũ (mỗi tháng chỉ có 1 ngân sách).

### US03 – Hôm nay còn được tiêu
1. **Cho** dữ liệu như ví dụ chuẩn ở `design-system §6` (14/11/2026, ngân sách `3.000.000₫`, đã chi đến hết hôm qua `1.300.000₫`, hôm nay đã chi `47.000₫`), **thì** thẻ hiện `53.000₫`, `Hạn mức hôm nay: 100.000₫` và `Ngân sách tháng đã dùng: 45% (1.347.000₫ / 3.000.000₫)`, số màu xanh (`success`).
2. **Khi** lưu thêm một khoản chi, **thì** số còn được tiêu giảm đúng bằng số tiền đó ngay khi quay về `HomeScreen`.
3. **Cho** tổng chi hôm nay vượt hạn mức hôm nay, **thì** thẻ hiện `Đã vượt X₫` màu đỏ (`danger`).
4. **Thì** màu số và thanh tiến trình đổi theo ngưỡng 70% / 100% ở `design-system §6`.
5. **Khi** sang ngày mới, **thì** hạn mức hôm nay được tính lại.

### US04 – Báo cáo theo danh mục
1. **Khi** chọn `Tuần này`, **thì** chỉ tính các khoản chi từ thứ Hai đến hôm nay. **Khi** chọn `Tháng này`, **thì** tính từ ngày 1 đến hôm nay.
2. **Thì** biểu đồ donut hiện tổng chi ở tâm, mỗi danh mục một màu theo `design-system §4`, danh mục 0₫ không xuất hiện.
3. **Thì** danh sách xếp từ chi nhiều đến chi ít, và tổng tiền các dòng bằng tổng ở tâm biểu đồ.
4. **Cho** khoảng thời gian không có khoản chi nào, **thì** hiện trạng thái rỗng thay cho biểu đồ.

### US05 – Nhắc nhở buổi tối
1. **Khi** đến 21:00 mỗi ngày (giờ máy), **thì** app gửi 1 thông báo cục bộ *"Hôm nay bạn có khoản chi nào chưa ghi không?"*, kể cả khi app đang đóng.
2. **Khi** bấm vào thông báo, **thì** app mở thẳng `AddExpenseScreen`.
3. **Cho** người dùng từ chối hoặc tắt quyền thông báo, **thì** app không gửi thông báo nhưng mọi chức năng khác vẫn dùng bình thường.
4. **Thì** mỗi ngày có tối đa 1 thông báo.

### US06 – Sửa / Xóa khoản chi
1. **Khi** bấm vào một khoản chi trong danh sách, **thì** `AddExpenseScreen` mở ở chế độ sửa, điền sẵn số tiền, danh mục và ghi chú cũ.
2. **Khi** bấm Lưu sau khi sửa, **thì** giao dịch được cập nhật, số còn được tiêu, thanh tiến trình và báo cáo được tính lại ngay.
3. **Khi** bấm `Xóa khoản chi`, **thì** app hỏi xác nhận. Xác nhận thì giao dịch bị xóa, Hủy thì không thay đổi gì.

### US07 – Lịch sử theo ngày
Chưa viết AC. Cần bổ sung đặc tả màn hình lịch sử trong `design-system §8` trước khi đưa US07 vào sprint.
