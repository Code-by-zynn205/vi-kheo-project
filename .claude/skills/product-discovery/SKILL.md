---
name: product-discovery
description: Quy trình soát, cập nhật và mở rộng bộ tài liệu Product Discovery của Ví Khéo (docs/discovery/01–07) theo nguyên tắc mọi nhận định phải có bằng chứng. Dùng khi tạo hoặc sửa problem statement, persona, điểm đau (PP), phân tích đối thủ, vision board, giả định cần kiểm chứng, customer journey, HMW, MoSCoW, user story, acceptance criteria, roadmap, sprint backlog hoặc DoD; khi nhập kết quả khảo sát, phỏng vấn hay dùng thử mới; hoặc khi cần kiểm tra số liệu, tên gọi, ngày tháng có khớp nhau giữa các file không.
---

# Product Discovery – Ví Khéo

Ví Khéo là app ghi chi tiêu tối giản cho sinh viên 18–22 tuổi. Giá trị cốt lõi: ghi 1 khoản chi trong dưới 5 giây và luôn thấy con số **"Hôm nay còn được tiêu"**. Skill này giữ cho bộ tài liệu discovery đúng sự thật, khớp nhau và truy được nguồn gốc. Việc viết code giao diện thuộc skill `design-system`.

## 1. Chọn chế độ làm việc

| Yêu cầu của người dùng | Chế độ | Xem |
| :--- | :--- | :--- |
| "Kiểm tra / soát / review tài liệu", "có mâu thuẫn không" | A. Soát nhất quán | §7.A |
| "Có số liệu khảo sát / phỏng vấn / dùng thử mới" | B. Cập nhật dữ liệu | §7.B |
| "Thêm tính năng / user story / AC", "lên sprint backlog" | C. Mở rộng backlog | §7.C |

Không rõ chế độ nào thì hỏi lại trước khi sửa file.

## 2. Nguồn dữ liệu và thứ tự tin cậy

1. `docs/research/survey-n50.md`: dữ liệu khảo sát gốc (nguyên văn câu hỏi, số người trả lời).
2. Nguồn thứ cấp đã trích dẫn trong `02-problem.md` §3.
3. Dữ liệu dùng thử MVP (khi có, ghi vào `docs/research/`).
4. Các file `docs/discovery/01–07`.

Hai nguồn mâu thuẫn thì nguồn đứng trên thắng. Sửa file đứng dưới cho khớp, không làm ngược lại.

**Tuyệt đối không tự tạo:** số liệu, tỷ lệ %, trích dẫn người dùng, tên người được phỏng vấn, lượt tải/điểm đánh giá app, link hay DOI của tài liệu tham khảo. Thiếu thì đánh dấu theo §3 và báo cho người dùng.

## 3. Quy tắc bằng chứng

- Mỗi nhận định về người dùng hoặc thị trường phải có ít nhất một trong các nguồn sau:
  - Số liệu khảo sát ghi cả % lẫn phân số có mẫu số, ví dụ `68% (34/50)`.
  - Nguồn thứ cấp ghi tác giả, năm, tên bài, nơi đăng, ví dụ `(Nguyễn Thị Hoài Lê, 2023)`.
  - Tham chiếu tới mục chứa bằng chứng, ví dụ `02 §4`.
- **% phải khớp phân số:** `p × n / 100` phải ra số nguyên (sai số làm tròn ≤ 0,5 người). Không khớp thì đánh dấu `[CẦN ĐỐI CHIẾU: lý do]`.
- Nhận định chưa có bằng chứng thì ghi `[GIẢ ĐỊNH]` và thêm vào bảng giả định `05 §3`, kèm cách kiểm chứng.
- Phân biệt **dữ liệu** và **mục tiêu**. Ví dụ: khảo sát cho thấy 82% muốn ghi trong dưới 10 giây (dữ liệu), còn nhóm đặt mục tiêu dưới 5 giây (mục tiêu thiết kế, chặt hơn). Không được viết mục tiêu như thể đó là kết quả khảo sát.
- Trích dẫn trong persona chỉ dùng câu có thật từ khảo sát hoặc phỏng vấn. Không có nguồn thì không thêm trích dẫn mới.
- Giữ lại cả dữ liệu bất lợi. Giả định không đạt thì ghi "Không đạt", không bỏ dòng đó đi.

## 4. Hệ thống ID và chuỗi truy xuất

```
PP-xx (03 §3) → HMWx (06 §2) → Fxx (06 §3) → USxx (06 §4) → AC (06 §5) → Sprint (07 §1)
Ax (05 §3): giả định, gắn với PP hoặc HMW mà nó kiểm chứng
```

- Mỗi `PP` có bằng chứng theo §3.
- Mỗi `HMW` ghi rõ các `PP` mà nó giải quyết.
- Mỗi tính năng `F` thuộc Must/Should phải có `US`. Could/Won't không cần `US`.
- Mỗi `US` có: điểm đau, HMW, MoSCoW, Story Points và AC dạng *Cho / Khi / Thì*.
- Sprint chỉ chứa `US` đã có trong backlog `06 §4`.
- ID không dùng lại. Thêm mới thì lấy số tiếp theo, bỏ thì gạch ngang và ghi lý do.

## 5. Giá trị chuẩn (phải giống nhau ở mọi file)

| Giá trị | Chuẩn | File chủ |
| :--- | :--- | :--- |
| Mẫu khảo sát | 50 phản hồi hợp lệ | 02 §4 |
| Từng hết tiền trước cuối tháng | 68% (34/50) | 02 §4 |
| Ghi chép chi tiêu hằng ngày | 24% (12/50) | 02 §4 |
| Từng tải rồi bỏ app | 58% (29/50) | 02 §4 |
| Lý do bỏ app #1 / #2 | 64% / 42%: **chưa rõ mẫu số** `[CẦN ĐỐI CHIẾU]` | 02 §4 |
| Kỳ vọng thời gian ghi 1 khoản | 82% (41/50) muốn dưới 10 giây | 02 §4 |
| Mục tiêu thiết kế | Ghi 1 khoản chi dưới 5 giây | 05 §1, design-system §2 |
| 6 danh mục | Ăn uống · Di chuyển · Nhà trọ & Điện nước · Học tập · Mua sắm & Sinh hoạt · Khác | design-system §4 |
| Công thức "Hôm nay còn được tiêu" | Theo design-system §6 | design-system §6 |
| Lịch | Sprint 0: 09/11–15/11 · Sprint 1: 16/11–22/11 · Sprint 2: 23/11–29/11 · Sprint 3: 30/11–06/12 · Tuần chốt MVP: 07/12–13/12/2026 | 07 §1 |
| Hạn MVP | 13/12/2026 | 01 §1 |
| Mục tiêu dùng thử | ≥ 20 SV cài đặt; tối thiểu 5 SV để đo A3/A4 | 05 §1 |
| Giữ chân 7 ngày | ≥ 50% SV dùng thử còn ghi chép | 05 §1 |
| Phạm vi MVP | Chỉ ghi khoản chi (không có khoản thu), offline, không đăng nhập, miễn phí, không quảng cáo | 05 §2 |

Khi một giá trị thay đổi: sửa file chủ trước, sau đó sửa mọi nơi nhắc tới nó, cuối cùng cập nhật bảng này.

## 6. Cấu trúc bắt buộc của từng file

| File | Mục bắt buộc |
| :--- | :--- |
| `01-project-intake.md` | Thông tin chung (tên, học phần, GV, nhóm, thời gian, hạn MVP) · Cơ cấu Scrum (PO, SM, Dev theo cặp, mã SV) · Công cụ |
| `02-problem.md` | Problem Statement (1 câu: ai, vấn đề, hậu quả) · Phân tích 3 lớp · Nghiên cứu thứ cấp (nguồn đầy đủ) · Khảo sát n=50 (% + phân số) |
| `03-personas.md` | Mỗi persona: thông tin, hoàn cảnh, trích dẫn, mục tiêu, điểm đau gắn ID · §3 Bảng PP (ID, mô tả, persona, bằng chứng) |
| `04-market.md` | Bảng so sánh (ghi ngày và nơi lấy số liệu) · Khoảng trống thị trường, mỗi khoảng trống gắn với PP |
| `05-vision.md` | Vision Board · Blueprint (MVP / Post-MVP) · Bảng giả định (ID, phương pháp, chỉ số đo được, trạng thái + bằng chứng) |
| `06-journey-features.md` | Journey 4 giai đoạn · HMW kèm PP · MoSCoW có ID F kèm US · Backlog (ID, story, PP, HMW, MoSCoW, SP) · AC |
| `07-roadmap.md` | Mỗi sprint: ngày, mục tiêu, US · Hoạt động kiểm chứng · Tuần chốt MVP · DoD |

## 7. Quy trình

### A. Soát nhất quán
1. Đọc cả 7 file trong `docs/discovery/`, file `docs/research/survey-n50.md` và skill `design-system`.
2. Chạy checklist §8 từng mục một.
3. Báo cáo bằng bảng: `file:dòng` · vấn đề · đề xuất sửa.
4. Tự sửa các lỗi hiển nhiên: định dạng, ID, đồng bộ tên gọi hay ngày tháng theo bảng §5. Lỗi số liệu hoặc quyết định sản phẩm (phạm vi, ưu tiên, chỉ tiêu) thì hỏi PO trước khi sửa.

### B. Cập nhật khi có dữ liệu mới
1. Ghi dữ liệu thô vào `docs/research/` (đã ẩn danh: không ghi họ tên, email, số điện thoại).
2. Cập nhật lần lượt: `02 §4` → trạng thái giả định `05 §3` → bảng PP `03 §3` (nếu điểm đau thay đổi) → HMW và backlog `06` (nếu cần) → bảng §5.
3. Liệt kê cho người dùng những nhận định đã bị dữ liệu mới làm yếu đi hoặc bác bỏ.

### C. Thêm tính năng hoặc user story
1. Kiểm tra danh sách Won't-have `06 §3` và §9 trước. Tính năng thuộc danh sách này thì dừng lại và báo người dùng.
2. Gắn tính năng với ít nhất một `PP` và một `HMW`. Không gắn được thì nó là `[GIẢ ĐỊNH]`, phải thêm vào `05 §3` trước khi đưa vào backlog.
3. Xếp MoSCoW, viết story dạng *"Là sinh viên, tôi muốn … để …"*.
4. Viết AC dạng *Cho / Khi / Thì*, kiểm thử được, không mơ hồ.
5. Story Points ghi `?`. Nhóm tự ước lượng (Planning Poker), AI không tự đặt.
6. Tính năng cần màn hình hoặc component mới thì cập nhật skill `design-system` cùng lúc.

## 8. Checklist kiểm tra

- [ ] Mọi % khớp với phân số, mẫu số được ghi rõ.
- [ ] Không còn số liệu hay trích dẫn không có nguồn. Giả định đã được gắn nhãn `[GIẢ ĐỊNH]`.
- [ ] Các giá trị ở §5 giống nhau ở mọi file (kể cả skill `design-system`).
- [ ] Chuỗi `PP → HMW → F → US → AC → Sprint` không bị đứt ở đâu.
- [ ] Mọi US Must/Should có AC. Mọi US trong sprint đều có trong backlog.
- [ ] Không có tính năng Won't-have hay ngoài phạm vi (§9) trong backlog hoặc design-system.
- [ ] Sprint bắt đầu thứ Hai, kết thúc Chủ nhật, không chồng lên nhau, kết thúc trước hạn MVP.
- [ ] Markdown hiển thị đúng trên GitHub: không dùng LaTeX `$...$`, dùng ký tự Unicode (`→`, `≥`, `≤`).

## 9. Ngoài phạm vi MVP (không đề xuất, không viết story)

Liên kết tài khoản ngân hàng · AI quét hóa đơn (OCR) · đầu tư, chứng khoán, vay nợ · đăng nhập/tài khoản đám mây · quảng cáo, gói trả phí · ghi khoản thu · phân bổ ngân sách theo danh mục.

Muốn đưa một mục ở đây vào MVP thì PO phải quyết định và ghi lý do vào `06 §3`.
