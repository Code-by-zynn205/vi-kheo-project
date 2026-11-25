# 00. Nhật ký Nghiên cứu & Nguồn Dữ liệu

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0) · **Skill:** user-research (mục 4) · **Trạng thái:** Xong (còn mục Cần bổ sung) · **Phụ trách:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt · **Cập nhật:** 14/11/2026

File này trả lời câu hỏi: **nhóm đã nghiên cứu những gì, và mỗi con số lấy từ đâu.** Mọi con số dùng trong các file `01 → 07` phải có ở đây trước.

| Nhãn | Nghĩa |
| :--- | :--- |
| `[SƠ CẤP]` | Nhóm **tự thu thập** từ sinh viên thật (khảo sát, phỏng vấn, nhật ký) |
| `[THỨ CẤP]` | Nhóm **tìm kiếm** từ nguồn đã công bố (bài báo khoa học, Google Play) |
| `[NHẬN ĐỊNH]` | Ý kiến, giả thuyết của nhóm – **chưa** phải số liệu |

---

## 1. Nghiên cứu thứ cấp – tìm kiếm từ nguồn đã công bố

| # | Nguồn | Nội dung dùng | Kiểm chứng | Trạng thái |
| :-: | :--- | :--- | :--- | :--- |
| T1 | Nguyễn Thị Hoài Lê (2023). *Kiến thức tài chính của sinh viên Việt Nam: Thực trạng và các vấn đề đặt ra.* Tạp chí Khoa học & Đào tạo Ngân hàng, số 254, tháng 7/2023. DOI: [10.59276/TCKHDT.2023.07.2528](https://doi.org/10.59276/TCKHDT.2023.07.2528) | Khảo sát online **4.140 SV** trên cả nước **năm 2021**, 11 câu hỏi. Điểm kiến thức tài chính căn bản trung bình **3,63/8** (độ lệch chuẩn 2,01). Câu 11 (lập kế hoạch tài chính cá nhân) đúng thấp nhất: **26,6%**; chọn "Tôi không biết" cao nhất: **33,2%** (1.376 SV). | Đã đối chiếu với bản PDF gốc (Bảng 2, Bảng 3, trang 6) | Xong |
| T2 | Google Play Việt Nam – trang **Money Lover** (Finsify) | 5 Tr+ lượt tải · 4,7/5 · ~208 N đánh giá · có quảng cáo, có bản trả phí | Nhóm xem trực tiếp ngày 14/11/2026 | Cần bổ sung ảnh chụp vào `docs/evidence/market/` |
| T3 | Google Play Việt Nam – trang **Sổ Thu Chi MISA** | 1 Tr+ lượt tải · 4,6/5 · ~50,5 N đánh giá · có quảng cáo, có mua trong app · câu trong mô tả: *"…rào cản lớn nhất … là ngại ghi chép."* | Nhóm xem trực tiếp ngày 14/11/2026 | Cần bổ sung ảnh chụp câu trích dẫn |

**Giới hạn của T1 (phải nói rõ khi báo cáo):** bài báo đo **kiến thức** tài chính, không đo trực tiếp **thói quen ghi chép chi tiêu**. Vì vậy nhóm vẫn phải tự khảo sát (mục 2).

**Nguồn đã loại:** ước tính chi phí sống 5–8 triệu/tháng của Finhay – số liệu cho TP.HCM, trong khi nhóm khảo sát sinh viên Đà Nẵng, và chưa có link gốc.

---

## 2. Nghiên cứu sơ cấp – nhóm tự thu thập

| # | Phương pháp | Kế hoạch | Thực tế | Bằng chứng | Trạng thái |
| :-: | :--- | :--- | :--- | :--- | :--- |
| S1 | Khảo sát online (Google Form) | ≥ 50 SV, ~10 câu | **50 phản hồi hợp lệ** | `docs/evidence/survey/` (file `.csv` + bộ câu hỏi) | Xong – cần bổ sung file xuất |
| S2 | Phỏng vấn sâu | 5–8 SV, 15–20 phút/người | Đã phỏng vấn **[điền số]** bạn | `docs/evidence/interviews/PV-xx.md` | Đang làm |
| S3 | Nhật ký chi tiêu 7 ngày | 3–5 SV | **[điền trạng thái]** | `docs/evidence/diary/` | Cần bổ sung |
| S4 | Test con số "Hôm nay còn được tiêu" (giả định A3) | 5 SV xem bản HTML màn hình chính | Chuyển sang Sprint 1 (nhóm không dùng Figma) | — | Chưa làm |
| S5 | Cho SV dùng thử MVP 7 ngày (giả định A4) | Mục tiêu 20 SV, tối thiểu 5 | Bắt đầu 04/12 với bản Sprint 2 | — | Chưa làm |

### Kết quả khảo sát S1 (n = 50) `[SƠ CẤP]`

| Chỉ số | Kết quả | Mẫu số | Ghi chú |
| :--- | :--- | :--- | :--- |
| Từng hết tiền trước cuối tháng (thường xuyên + thỉnh thoảng) | **34/50 = 68%** | Toàn bộ | Xong |
| Đang ghi chép chi tiêu hằng ngày | **12/50 = 24%** (không ghi chép: 38/50 = 76%) | Toàn bộ | Xong |
| Từng tải app quản lý chi tiêu rồi xoá/bỏ dở | **29/50 = 58%** | Toàn bộ | Xong |
| Lý do bỏ app #1: ngại nhập liệu / thao tác rườm rà | **64%** | 29 người từng bỏ app | **Cần kiểm lại:** 64% × 29 = 18,6 – không ra số nguyên. Có thể là 18/29 (62%), 19/29 (66%), hoặc mẫu số khác |
| Lý do bỏ app #2: giao diện rối, nhiều tính năng, quảng cáo | **42%** | 29 người từng bỏ app | **Cần kiểm lại:** 42% × 29 = 12,2 – có thể là 12/29 (41%) |
| Muốn ghi một khoản chi trong dưới 10 giây | **41/50 = 82%** | Toàn bộ | Xong |

Đặc điểm mẫu: chủ yếu SV năm 1 – năm 3, mức chi phổ biến 2–5 triệu/tháng.

**Chưa được khảo sát đo trực tiếp** (đang dùng như giả thuyết, chờ biên bản phỏng vấn): vay mượn bạn bè, căng thẳng ảnh hưởng việc học, trả tiền bằng cả tiền mặt và QR, thời điểm hết tiền (tuần 3–4). Nếu Google Form có câu hỏi về các ý này, ghi số câu vào đây và đổi nhãn sang `[SƠ CẤP]`.

> Slide Canva trang 10 đang ghi "n = 30" với số làm tròn (> 60%, < 20%, > 50%) – cần sửa thành n = 50 cho khớp bảng trên.

---

## 3. Nhận định của nhóm `[NHẬN ĐỊNH]` – chưa phải số liệu

| # | Nhận định | Dựa trên |
| :-: | :--- | :--- |
| N1 | Money Lover nhiều tính năng, dễ "ngợp" với người mới | Nhóm tự dùng thử |
| N2 | Sinh viên thiếu một con số đơn giản để quyết định "có nên mua không" | Suy ra từ T1 + S1 |
| N3 | Hoá đơn giấy hiếm ở quán bình dân, gửi xe → OCR không hữu ích | Quan sát thực tế |
| N4 | Màn nhập của Money Lover, MISA có nhiều trường (ví, danh mục, ngày, ghi chú…) | Nhóm tự dùng thử – cần bổ sung ảnh chụp |
| N5 | Hết tiền thường rơi vào tuần 3–4; dẫn tới vay mượn, căng thẳng | Giả thuyết ban đầu – chờ phỏng vấn |

---

## 4. Ai đã làm phần nghiên cứu

**Cần xác nhận:** bảng dưới đang điền theo phân công, chưa phải xác nhận của từng người. Mỗi người tự sửa dòng của mình và ghi bằng chứng.

| Việc | Người thực hiện | Bằng chứng |
| :--- | :--- | :--- |
| Thiết kế & phát Google Form, tổng hợp kết quả S1 | **[xác nhận]** (phân công: Thương, Kiệt) | Google Form, file Sheets |
| Phỏng vấn sâu S2 | **[xác nhận]** (phân công: Thương, Kiệt) | Biên bản `PV-xx` |
| Tìm và đọc bài báo T1 | **[điền tên]** | File PDF, ghi chú |
| Thu thập số liệu Google Play T2, T3 | **[điền tên]** | Ảnh chụp màn hình |
