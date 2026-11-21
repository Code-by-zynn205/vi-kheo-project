# 06. Customer Journey, HMW, Generate Features & Product Backlog

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0), PO cập nhật Backlog đầu mỗi Sprint · **Trạng thái:** Đang làm – đã làm rõ Backlog 20/11, chờ PO duyệt mục 3.1, 4.2 và câu hỏi Q1–Q8 · **Phụ trách:** Dương Văn Hoan (PO) + cả nhóm · **Cập nhật:** 20/11/2026

Chuỗi trong file này: **Hành trình → Điểm đau → HMW → Generate Features → MoSCoW → User Story + tiêu chí chấp nhận.**

## 1. Hành trình chi tiêu một tháng của sinh viên

| Giai đoạn | 1. Nhận tiền đầu tháng | 2. Chi lặt vặt hằng ngày | 3. Thử ghi chép | 4. Cuối tháng |
| :--- | :--- | :--- | :--- | :--- |
| **Hành động** | Nhận tiền gia đình/làm thêm, nhẩm trong đầu | Ăn uống, gửi xe, quét QR nhiều khoản 5–30 nghìn | Mở app để nhập khoản vừa tiêu | Kiểm tra số dư ngân hàng/ví |
| **Cảm xúc** | Thoải mái | Không để ý tổng đã tiêu | Khó chịu: nhiều bước, quảng cáo | Hoang mang vì sắp hết tiền |
| **Điểm đau** | P4 – không chia thành hạn mức ngày | P1 – không nhớ tiền đi đâu | P2 – bỏ cuộc sau vài ngày | P3, P6 – không biết đã lố, hụt tiền |
| **Cơ hội** | Đặt ngân sách tháng 1 bước | Hiện ngay số còn được tiêu hôm nay | Mở lên là gõ số tiền | Cảnh báo màu khi sắp vượt |

*(Mã P1–P6 xem [03-personas.md](03-personas.md). Hành trình được tổng hợp từ khảo sát và phỏng vấn; cột cảm xúc là `[NHẬN ĐỊNH]` của nhóm.)*

## 2. Câu hỏi "Làm thế nào để…?" (HMW)

| Mã | HMW | Từ điểm đau |
| :-: | :--- | :--- |
| **HMW1** | Làm thế nào để sinh viên ghi một khoản chi **nhanh đến mức không thấy phiền** (dưới 5 giây)? | P1, P2 |
| **HMW2** | Làm thế nào để sinh viên **luôn biết hôm nay còn được tiêu bao nhiêu** mà không phải tự cộng trừ? | P3, P4, P5, P6 |
| **HMW3** | Làm thế nào để **nhắc sinh viên ghi chép** mỗi ngày mà không gây khó chịu? | P2 |

**Lưu ý truy vết:** nhu cầu **"Biết tiền đi đâu"** (nhu cầu N-a trong Vision Board, điểm đau P1) không có HMW riêng. Các tính năng phục vụ nhu cầu này (F6, F9) truy thẳng về P1 và N-a. *PO chốt: giữ 3 HMW như slide, hoặc thêm HMW4 "Làm thế nào để sinh viên biết tiền của mình đi đâu?".*

## 3. Generate Features – sinh tính năng từ HMW

Từ các HMW và điểm đau, nhóm liệt kê **15 ý tưởng tính năng** (liệt kê hết trước, đánh giá sau), rồi lọc bằng **MoSCoW** theo 3 câu hỏi:
1. Thiếu nó, sản phẩm còn giải quyết HMW1/HMW2 không? Không → **Must**.
2. Làm được trong 3 Sprint với 8 Developer không? Không → **Won't**.
3. Đối thủ đã làm tốt hơn và không phải điểm khác biệt của Ví Khéo? → **Won't**.

| # | Ý tưởng tính năng | Nguồn (HMW / điểm đau) | MoSCoW | Lý do | Story |
| :-: | :--- | :--- | :-: | :--- | :-: |
| F1 | Ghi khoản chi siêu tốc: mở ra là có ô số tiền + bàn phím số | HMW1 · P1, P2 | **Must** | Cốt lõi của HMW1 | US01 |
| F2 | 6 danh mục sẵn cho SV, mặc định "Ăn uống" | HMW1 · P2 | **Must** | Bớt 1 bước chọn | US01 |
| F3 | Ghi khoản thu (lương làm thêm, tiền nhà gửi thêm), cộng vào quỹ tháng | HMW2 · P6 | **Must** | Persona Minh có thu nhập làm thêm; thiếu thì hạn mức ngày bị sai | US07 |
| F4 | Đặt ngân sách tháng | HMW2 · P4 | **Must** | Không có thì không tính được hạn mức ngày | US02 |
| F5 | "Hôm nay còn được tiêu" + đổi màu cảnh báo | HMW2 · P3, P5, P6 | **Must** | Điểm khác biệt chính so với đối thủ | US03 |
| F6 | Báo cáo theo danh mục (biểu đồ tròn + xếp hạng) | P1 · nhu cầu N-a | **Must** | Trả lời "tiền đi đâu" – nhu cầu số 1 trong Vision Board | US04 |
| F7 | Nhắc ghi chép lúc 21:00 | HMW3 · P2 | Should | Hỗ trợ thói quen, nhưng app vẫn dùng được nếu thiếu | US05 |
| F8 | Sửa/xoá giao dịch | HMW1 · P2 | Should | Nhập nhầm là chuyện thường; thiếu thì dữ liệu sai | US06 |
| F9 | Xem lịch sử theo ngày | P1 · nhu cầu N-a | Should | Hữu ích nhưng báo cáo đã trả lời phần lớn | US08 |
| F10 | Chia tiền phòng trọ/đi chơi nhóm | — | Could | Nhu cầu có thật nhưng ngoài các HMW | — |
| F11 | Chuỗi ngày ghi chép liên tục (streak) | HMW3 · P2 | Could | Tạo động lực, làm sau khi lõi ổn định | — |
| F12 | Giao diện tối | — | Could | Không giải quyết điểm đau nào | — |
| F13 | Liên kết tài khoản ngân hàng | HMW1 · P1 | Won't | Phức tạp bảo mật, không kịp 3 Sprint; thế mạnh của Money Lover | — |
| F14 | AI quét hoá đơn (OCR) | HMW1 · P2 | Won't | SV ăn quán bình dân, gửi xe – hầu như không có hoá đơn giấy (N3); MISA đã có | — |
| F15 | Đầu tư, chứng khoán, vay nợ | — | Won't | Ngoài nhu cầu của nhóm mục tiêu | — |

### 3.1 Ý tưởng bổ sung từ phân tích dữ liệu (20/11/2026) – **chờ PO duyệt MoSCoW**

Nguồn: [`docs/requirements/data-analysis.md`](../requirements/data-analysis.md) mục 1 (nghiên cứu sản phẩm tương tự) và mục 16 (truy vết). Cột MoSCoW là **đề xuất** của PA và cặp dữ liệu.

| # | Ý tưởng tính năng | Nguồn (HMW / điểm đau) | MoSCoW đề xuất | Lý do | Story |
| :-: | :--- | :--- | :-: | :--- | :-: |
| F16 | Dành sẵn tiền cho khoản cố định hằng tháng (tiền trọ, điện nước) trước khi chia hạn mức ngày | HMW2 · P6 | Could | Sửa đúng nguyên nhân "hụt tiền trọ"; đổi công thức `budget-logic` nên chỉ làm khi lõi đã ổn | US09 |
| F17 | Sao lưu và khôi phục dữ liệu ra file | P2 · trường hợp biên EC-10 | Could | Gỡ app là mất dữ liệu; hữu ích cho người dùng thử nhưng không phải lõi | US10 |
| F18 | Mục tiêu tiết kiệm (số tiền, hạn, tiến độ) | Persona Minh G2 | Won't (MVP) | Có nhu cầu trong persona nhưng không thuộc 3 HMW; làm sau MVP | US11 |
| F19 | Ghi khoản vay mượn với bạn bè, trả dần | N5 – **giả thuyết, chờ phỏng vấn** | Won't (MVP) | Chưa có bằng chứng; khác F15 (vay ngân hàng, tín dụng) | US12 |
| F20 | Nhiều ví (tiền mặt, ngân hàng, ví điện tử) và chuyển tiền giữa ví | Bối cảnh "trả tiền mặt và QR" – **giả thuyết, chờ phỏng vấn** | Won't (MVP) | Thêm 1 bước chọn ví khi ghi – trái HMW1 | US13 |
| F21 | Hạn mức chi theo từng danh mục | P1 · N-a | Won't (MVP) | Làm mất "một con số" của HMW2; đối thủ đã có | US14 |
| F22 | Tài khoản và đồng bộ nhiều thiết bị | — | Won't | Cần đăng nhập, máy chủ – ngoài phạm vi MVP | US17 |
| F23 | Trang quản trị (thống kê gộp, góp ý, thông báo) | Mô hình vận hành sau MVP (`05-vision.md` mục 2) | Won't | Phụ thuộc F22 | US18 |

**PO cần chốt thêm:** đổi tên F15 thành "Đầu tư, chứng khoán, vay ngân hàng/tín dụng" để không trùng với F19 (vay mượn bạn bè).

**Kiểm tra truy vết:**
- HMW1 → F1, F2 (Must) · HMW2 → F3, F4, F5 (Must) · HMW3 → F7 (Should) – mỗi HMW có ít nhất 1 tính năng Must/Should.
- Nhu cầu N-a / điểm đau P1 → F6 (Must), F9 (Should).
- Mọi tính năng Must đều truy được về HMW hoặc điểm đau.
- F16–F23 đều có nguồn; F19, F20 dựa trên giả thuyết → phải kiểm chứng bằng phỏng vấn trước khi nâng mức.

## 4. Product Backlog

> **Làm rõ Backlog ngày 20/11/2026** (PA + cặp dữ liệu, theo [`data-analysis.md`](../requirements/data-analysis.md)). Cột "SP đề xuất" là gợi ý; **Developers chốt điểm ở Sprint Planning**, PO chốt thứ tự.

Ước lượng Story Point theo dãy Fibonacci (1, 2, 3, 5, 8). Thứ tự do PO quyết định.

### 4.1 Backlog MVP

| ID | User Story | Nguồn | MoSCoW | SP | SP đề xuất | Sprint |
| :-: | :--- | :--- | :-: | :-: | :-: | :-: |
| **US01** | Là sinh viên, tôi muốn ghi một khoản chi chỉ bằng số tiền và danh mục, để ghi xong trong vài giây. | HMW1 | Must | 3 | 3 | 1 |
| **US02** | Là sinh viên, tôi muốn đặt ngân sách cho cả tháng, để biết giới hạn chi tiêu của mình. | HMW2 | Must | 2 | 2 | 2 |
| **US03** | Là sinh viên, tôi muốn thấy số tiền còn được tiêu hôm nay, để không tiêu quá tay. | HMW2 | Must | 3 | 3 | 2 |
| **US07** | Là sinh viên, tôi muốn ghi khoản thu (lương làm thêm, tiền nhà gửi thêm), để số tiền được tiêu tính đúng. *(bổ sung 14/11 – PO duyệt)* | HMW2 | Must | 1 | 1 | 2 |
| **US04** | Là sinh viên, tôi muốn xem chi tiêu theo danh mục, để biết tiền đi đâu nhiều nhất. | P1 · N-a | Must | 5 | 5 | 3 |
| **US05** | Là sinh viên, tôi muốn được nhắc ghi chép mỗi tối, để không quên khoản nào. | HMW3 | Should | 2 | **3** | 3 |
| **US06** | Là sinh viên, tôi muốn sửa hoặc xoá khoản đã ghi, để sửa khi nhập nhầm. | HMW1 | Should | 2 | **3** | 3 |
| **US08** | Là sinh viên, tôi muốn xem lại các khoản chi của những ngày trước, để đối chiếu khi cần. | P1 · N-a | Should | 2 | 2 | Nếu kịp |

**Lý do đề xuất đổi điểm:**
- US05: thêm xin quyền thông báo, xử lý khi người dùng từ chối, bỏ nhắc nếu hôm nay đã ghi (Q8), giờ nhắc trên Android có thể lệch vài phút.
- US06: thêm Hoàn tác sau khi xoá (BR-90), khoá đổi ngày và loại (BR-11), mọi con số phải cập nhật lại.

**Tổng theo Sprint (theo SP đề xuất):** Sprint 1 = 3 SP (kèm dựng dự án) · Sprint 2 = 6 SP · Sprint 3 = 11 SP · Nếu kịp = 2 SP. Tổng MVP = 22 SP.

### 4.2 Backlog sau MVP – **đề xuất, chờ PO duyệt**

Chưa ước lượng. Không đưa vào Sprint 1–3 (AGENTS.md quy tắc 3) trừ khi PO nâng mức và nhóm còn dư sức.

| ID | User Story | Nguồn | MoSCoW đề xuất | Lớp dữ liệu |
| :-: | :--- | :--- | :-: | :-: |
| US09 | Là sinh viên ở trọ, tôi muốn khai báo tiền trọ, điện nước hằng tháng, để số tiền được tiêu mỗi ngày đã trừ sẵn các khoản đó. | F16 · HMW2 · P6 | Could | R2 |
| US10 | Là sinh viên, tôi muốn sao lưu dữ liệu ra file và khôi phục lại, để không mất dữ liệu khi đổi hoặc cài lại điện thoại. | F17 · EC-10 | Could | R2 |
| US15 | Là sinh viên ở trọ chung, tôi muốn ghi khoản chi chung và chia cho bạn cùng phòng, để biết ai còn nợ ai. | F10 | Could | R2 |
| US16 | Là sinh viên, tôi muốn thấy số ngày ghi chép liên tục, để có động lực duy trì thói quen. | F11 · HMW3 | Could | R2 |
| US11 | Là sinh viên, tôi muốn đặt mục tiêu tiết kiệm và theo dõi tiến độ, để để dành được một khoản mỗi tháng. | F18 · Persona Minh G2 | Won't (MVP) | R2 |
| US12 | Là sinh viên, tôi muốn ghi khoản vay mượn với bạn bè và trả dần, để không quên ai nợ mình, mình nợ ai. | F19 · N5 (giả thuyết) | Won't (MVP) | R2 |
| US13 | Là sinh viên, tôi muốn tách tiền mặt, tài khoản ngân hàng, ví điện tử, để biết mỗi nơi còn bao nhiêu. | F20 (giả thuyết) | Won't (MVP) | R2 |
| US14 | Là sinh viên, tôi muốn đặt hạn mức cho từng danh mục, để không tiêu quá vào một khoản. | F21 · P1 | Won't (MVP) | R2 |
| US17 | Là sinh viên, tôi muốn đăng nhập để dữ liệu đồng bộ giữa các thiết bị. | F22 | Won't | R3 |
| US18 | Là người vận hành sản phẩm, tôi muốn xem thống kê gộp và phản hồi người dùng, để cải tiến sản phẩm. | F23 | Won't | R3 |

## 5. Tiêu chí chấp nhận (Acceptance Criteria)

Đề xuất trả lời các câu **(chờ Qx)**: [`po-decision-proposals.md`](../requirements/po-decision-proposals.md).

Viết dạng **Cho trước (Given) → Khi (When) → Thì (Then)**. Mã `BR-`, `EC-`, `ERR_` dẫn tới [`data-analysis.md`](../requirements/data-analysis.md); mã `TC` dẫn tới skill `budget-logic` mục 4.4. Dòng có **(chờ Qx)** phụ thuộc câu hỏi PO chưa trả lời (`data-analysis.md` mục 13).

Khi một story có PRD `Đã duyệt` (`docs/requirements/USxx-*.md`), **PRD là nguồn AC chi tiết**; mục này giữ AC cốt lõi để ước lượng và xếp Sprint.

**US01 – Ghi khoản chi** (Sprint 1)
- AC1: Cho trước đang ở màn hình chính → khi bấm `+ Ghi khoản chi` → màn hình nhập mở, ô số tiền đã focus, bàn phím số hiện sẵn, danh mục `Ăn uống` đã chọn; có đủ 6 danh mục.
- AC2: Khi gõ `35000` → hiển thị `35.000đ`.
- AC3: Số tiền = 0 → nút `Lưu` bị vô hiệu (TC12, `ERR_AMOUNT_ZERO`).
- AC4: Số tiền vượt 99.999.999 → không lưu, báo "Số tiền tối đa 99.999.999đ" (TC13, `ERR_AMOUNT_MAX`).
- AC5: Ghi chú không bắt buộc, tối đa 100 ký tự; dán dài hơn bị chặn ở 100 (TC15, EC-09).
- AC6: Khi bấm `Lưu` → quay về màn hình chính, khoản vừa ghi nằm đầu danh sách "Chi tiêu hôm nay", hiện "Đã lưu"; ngày của khoản là hôm nay theo giờ máy (BR-03).
- AC7: Bấm `Lưu` hai lần liên tiếp → chỉ tạo 1 khoản (EC-11).
- AC8: Từ màn hình chính đến lúc lưu: **≤ 3 thao tác**, thử với 3 người đều **< 5 giây**.
- AC9: Tắt app mở lại → dữ liệu vẫn còn; tắt mạng vẫn ghi được.
- AC10: Mở app lần đầu, chưa có khoản nào → hiện trạng thái trống "Chưa có khoản chi nào hôm nay" (EC-01).

**US02 – Ngân sách tháng** (Sprint 2)
- AC1: Cho trước ngày 01/11 (tháng 30 ngày), chưa chi gì → khi nhập `3.000.000` → khung xem trước hiện "khoảng 100.000đ mỗi ngày".
- AC2: Khi bấm `Cập nhật ngân sách` → màn hình chính dùng ngân sách mới ngay; đặt lại trong cùng tháng là ghi đè (BR-20).
- AC3: Số tiền = 0 → nút cập nhật vô hiệu; vượt 99.999.999 → chặn (`ERR_BUDGET_INVALID`) **(chờ Q3)**.
- AC4: Sang tháng mới chưa đặt ngân sách → màn hình chính hiện nút "Đặt ngân sách tháng" (`NO_BUDGET`, TC10).
- AC5: Mở màn hình ngân sách ở tháng mới → gợi ý sẵn số tiền tháng trước, chỉ lưu khi người dùng bấm xác nhận (BR-22) **(chờ Q2)**.
- AC6: Đặt hoặc giảm ngân sách khi đã chi nhiều → không chặn; hạn mức có thể bằng 0 hoặc `OUT_OF_BUDGET` (TC5, TC11, EC-05, EC-06).

**US03 – Hôm nay còn được tiêu** (Sprint 2)
- AC1: Con số tính đúng công thức skill `budget-logic` mục 4.2 và **qua TC1–TC11**.
- AC2: Ghi thêm một khoản chi 30.000đ → con số giảm đúng 30.000đ.
- AC3: Màu và dòng phụ đúng 5 trạng thái `SAFE` / `WARNING` / `OVER` ("Đã vượt …") / `OUT_OF_BUDGET` / `NO_BUDGET` (`design-system` mục 4.3).
- AC4: Qua 00:00 giờ máy → hạn mức tính lại cho ngày mới; khoản ghi lúc 23:59 thuộc ngày hôm trước (EC-02).
- AC5: Tháng 28, 30, 31 ngày đều đúng số ngày còn lại (TC9, EC-08).
- AC6: Thanh "Ngân sách tháng đã dùng x%" đúng bằng tổng chi tháng ÷ ngân sách tháng.
- AC7: Sửa hoặc xoá một khoản cũ → con số tự đúng, vì không lưu số dư (BR-06).

**US07 – Ghi khoản thu** (Sprint 2)
- AC1: Trên màn hình nhập, chuyển `Chi | Thu` sang `Thu` → lưới danh mục ẩn; nhập `1200000` → lưu → hiển thị `+1.200.000đ` màu thu.
- AC2: Giới hạn số tiền, ghi chú như US01 AC3–AC5.
- AC3: Hạn mức hôm nay tăng tương ứng (TC7); khoản thu cộng vào tháng theo ngày ghi (BR-21) **(chờ Q1)**.

**US04 – Báo cáo theo danh mục** (Sprint 3)
- AC1: Lọc `Tuần này` (thứ Hai → Chủ nhật, BR-05) / `Tháng này`.
- AC2: Tổng ở tâm biểu đồ = tổng các khoản **chi** trong khoảng đó; khoản thu và khoản đã xoá không tính.
- AC3: Danh mục xếp từ nhiều đến ít; danh mục bằng 0 không hiện; phần trăm làm tròn số nguyên.
- AC4: Chưa có dữ liệu trong khoảng lọc → hiện trạng thái trống.

**US05 – Nhắc ghi chép** (Sprint 3)
- AC1: Lần đầu bật nhắc → app xin quyền thông báo; người dùng từ chối → giải thích ngắn và có nút mở cài đặt máy. Trạng thái bật/tắt mặc định **(chờ Q5)**.
- AC2: Đang bật → khoảng 21:00 mỗi ngày nhận "Hôm nay bạn có khoản chi nào chưa ghi không?"; trên Android có thể muộn tới khoảng 1 giờ (giới hạn của hệ điều hành) **(chờ Q16)**.
- AC3: Bấm vào thông báo → mở màn hình nhập.
- AC4: Tắt nhắc trong cài đặt → không nhận thông báo nữa, kể cả sau khi khởi động lại máy.
- AC5: Hôm nay đã ghi ≥ 1 khoản → không nhắc **(chờ Q8)**.

**US06 – Sửa/xoá giao dịch** (Sprint 3)
- AC1: Bấm vào một khoản → sửa số tiền / danh mục / ghi chú → lưu → danh sách và con số "còn được tiêu" cập nhật.
- AC2: Không đổi được ngày, không đổi được Chi ↔ Thu (BR-11) **(chờ Q7)**.
- AC3: Giới hạn nhập như US01 AC3–AC5.
- AC4: Xoá xong con số cập nhật (TC16). Có hộp xác nhận hay không: **(chờ Q15)** – đề xuất bỏ hộp xác nhận, dùng Hoàn tác.
- AC5: Sau khi xoá có `Snackbar` "Đã xoá khoản <số tiền>" + nút "Hoàn tác" trong 8 giây (BR-90) **(chờ Q6, Q15)**.
- AC6: Sửa một khoản của tháng trước → chỉ số liệu tháng trước thay đổi (EC-03).

**US08 – Xem lịch sử theo ngày** (nếu kịp)
- AC1: Chọn một ngày ≤ hôm nay → thấy các khoản của ngày đó, mới nhất trước, kèm tổng chi và tổng thu của ngày.
- AC2: Ngày không có khoản nào → trạng thái trống.
- AC3: Từ danh sách lịch sử sửa/xoá được như US06.

## 6. Definition of Ready – khi nào story sẵn sàng vào Sprint

Một story chỉ được kéo vào Sprint khi đủ cả 5 điều:

1. AC viết dạng Cho trước → Khi → Thì, đo được, không còn **(chờ Qx)**.
2. Đặc tả màn hình liên quan ở trạng thái `Xong` (`docs/design/screens/`).
3. Dữ liệu và quy tắc dẫn được tới `data-analysis.md`.
4. Developers đã ước lượng Story Point.
5. Story ≤ 5 SP; lớn hơn thì tách.

**Tình trạng ngày 20/11/2026 (sau khi chuẩn bị đề xuất):**

| Story | AC rõ | Câu hỏi còn chặn (đã có đề xuất) | Đặc tả màn hình | Việc khác | SP chốt | Sẵn sàng |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| US01 | Có | — | `AddExpenseScreen`, `HomeScreen`: chờ UI/UX duyệt | — | Chưa | Chờ duyệt đặc tả + chốt SP |
| US02 | Có | Q2, Q3 | `BudgetScreen`: chờ UI/UX duyệt | — | Chưa | Chờ PO + duyệt đặc tả |
| US03 | Có | — | `HomeScreen`: chờ UI/UX duyệt | **Test A3 với 5 SV** (`a3-test-guide.md`) | Chưa | Chờ A3 |
| US07 | Có | Q1 | `AddExpenseScreen` (chế độ Thu): chờ UI/UX duyệt | — | Chưa | Chờ PO + duyệt đặc tả |
| US04 | Có | — | `ReportScreen`: chờ UI/UX duyệt; `DonutChart` đã thêm | — | Chưa | Chờ duyệt đặc tả |
| US05 | Có | Q5, Q8, Q16 | `SettingsScreen` (mới): chờ UI/UX duyệt | — | Chưa | Chờ PO + duyệt đặc tả |
| US06 | Có | Q6, Q7, Q15 | `EditTransactionSheet` (mới): chờ UI/UX duyệt | — | Chưa | Chờ PO, kiến trúc sư + duyệt đặc tả |
| US08 | Có | — | `HistoryScreen` (mới): chờ UI/UX duyệt | — | Chưa | Chờ duyệt đặc tả |
