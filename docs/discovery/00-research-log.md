# 00. Nhật ký Nghiên cứu & Nguồn Dữ liệu

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0) · **Trạng thái:** ✅ (còn mục 🟡) · **Phụ trách:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt · **Cập nhật:** 14/11/2026

File này trả lời câu hỏi: **nhóm đã nghiên cứu những gì, và mỗi con số lấy từ đâu.** Mọi con số dùng trong các file `01 → 07` phải có ở đây trước.

| Nhãn | Nghĩa |
| :--- | :--- |
| `[SƠ CẤP]` | Nhóm **tự thu thập** từ sinh viên thật (khảo sát, phỏng vấn, nhật ký) |
| `[THỨ CẤP]` | Nhóm **tìm kiếm** từ nguồn đã công bố (bài báo khoa học, Google Play) |
| `[NHẬN ĐỊNH]` | Ý kiến, giả thuyết của nhóm – **chưa** phải số liệu |

---

## 1. Nghiên cứu thứ cấp – tìm kiếm từ nguồn đã công bố

| # | Nguồn | Nội dung dùng | Kiểm chứng | Trạng thái |
| :-: | :--- | :--- | :--- | :---: |
| T1 | Nguyễn Thị Hoài Lê (2023). *Kiến thức tài chính của sinh viên Việt Nam: Thực trạng và các vấn đề đặt ra.* Tạp chí Khoa học & Đào tạo Ngân hàng, số 254, tháng 7/2023. DOI: [10.59276/TCKHDT.2023.07.2528](https://doi.org/10.59276/TCKHDT.2023.07.2528) | Khảo sát online **4.140 SV** trên cả nước **năm 2021**, 11 câu hỏi. Điểm kiến thức tài chính căn bản trung bình **3,63/8** (độ lệch chuẩn 2,01). Câu 11 (lập kế hoạch tài chính cá nhân) đúng thấp nhất: **26,6%**; chọn "Tôi không biết" cao nhất: **33,2%** (1.376 SV). | Đã đối chiếu với bản PDF gốc (Bảng 2, Bảng 3, trang 6) | ✅ |
| T2 | Google Play Việt Nam – trang **Money Lover** (Finsify) | 5 Tr+ lượt tải · 4,7★ · ~208 N đánh giá · có quảng cáo, có bản trả phí | Nhóm xem trực tiếp ngày 14/11/2026 | 🟡 lưu ảnh chụp vào `docs/evidence/market/` |
| T3 | Google Play Việt Nam – trang **Sổ Thu Chi MISA** | 1 Tr+ lượt tải · 4,6★ · ~50,5 N đánh giá · có quảng cáo, có mua trong app · câu trong mô tả: *"…rào cản lớn nhất … là ngại ghi chép."* | Nhóm xem trực tiếp ngày 14/11/2026 | 🟡 lưu ảnh chụp câu trích dẫn |
| T4 | Finhay – ước tính chi phí sống SV tại TP.HCM 5–8 triệu/tháng (2026) | Chỉ dùng để minh hoạ quy mô khoản tiền | Chưa có link | 🟡 bổ sung link hoặc bỏ |

**Giới hạn của T1 (phải nói rõ khi báo cáo):** bài báo đo **kiến thức** tài chính, không đo trực tiếp **thói quen ghi chép chi tiêu**. Vì vậy nhóm vẫn phải tự khảo sát (mục 2).

---

## 2. Nghiên cứu sơ cấp – nhóm tự thu thập

| # | Phương pháp | Kế hoạch | Thực tế | Bằng chứng | Trạng thái |
| :-: | :--- | :--- | :--- | :--- | :---: |
| S1 | Khảo sát online (Google Form) | ≥ 50 SV, ~10 câu | **50 phản hồi hợp lệ** | `docs/evidence/survey/` (file `.csv` + bộ câu hỏi) | ✅ 🟡 *thiếu file xuất* |
| S2 | Phỏng vấn sâu | 5–8 SV, 15–20 phút/người | Đã phỏng vấn **[điền số]** bạn | `docs/evidence/interviews/PV-xx.md` | 🔄 |
| S3 | Nhật ký chi tiêu 7 ngày | 3–5 SV | **[điền trạng thái]** | `docs/evidence/diary/` | 🟡 |
| S4 | Test con số "Hôm nay còn được tiêu" (giả định A3) | 5 SV xem bản HTML | Chuyển sang Sprint 1 (không dùng Figma) | — | ⬜ |

### Kết quả khảo sát S1 (n = 50) `[SƠ CẤP]`

| Chỉ số | Kết quả | Mẫu số | Ghi chú |
| :--- | :--- | :--- | :--- |
| Từng hết tiền trước cuối tháng (thường xuyên + thỉnh thoảng) | **34/50 = 68%** | Toàn bộ | ✅ |
| Đang ghi chép chi tiêu hằng ngày | **12/50 = 24%** | Toàn bộ | ✅ |
| Từng tải app quản lý chi tiêu rồi xoá/bỏ dở | **29/50 = 58%** | Toàn bộ | ✅ |
| Lý do bỏ app #1: ngại nhập liệu / thao tác rườm rà | **64%** | 29 người từng bỏ app | 🟡 **64% × 29 = 18,6 – không ra số nguyên.** Kiểm lại trong Sheets: có thể là 18/29 (62%), 19/29 (66%), hoặc mẫu số khác |
| Lý do bỏ app #2: giao diện rối, nhiều tính năng, quảng cáo | **42%** | 29 người từng bỏ app | 🟡 42% × 29 = 12,2 – kiểm lại như trên (có thể 12/29 = 41%) |
| Muốn ghi một khoản chi trong dưới 10 giây | **41/50 = 82%** | Toàn bộ | ✅ |

Đặc điểm mẫu: chủ yếu SV năm 1 – năm 3, mức chi phổ biến 2–5 triệu/tháng.

> **Lưu ý về slide:** slide Canva bản cũ ghi "Kết quả khảo sát nhanh (n = 30)" – đó là số khi khảo sát chưa đóng. Cần sửa slide thành n = 50 cho khớp tài liệu.

---

## 3. Nhận định của nhóm `[NHẬN ĐỊNH]` – chưa phải số liệu

| # | Nhận định | Dựa trên |
| :-: | :--- | :--- |
| N1 | Money Lover nhiều tính năng, dễ "ngợp" với người mới | Nhóm tự dùng thử |
| N2 | Sinh viên thiếu một con số đơn giản để quyết định "có nên mua không" | Suy ra từ T1 + S1 |
| N3 | Hoá đơn giấy hiếm ở quán bình dân, gửi xe → OCR không hữu ích | Quan sát thực tế |

---

## 4. Ai đã làm phần nghiên cứu

| Việc | Người thực hiện | Bằng chứng |
| :--- | :--- | :--- |
| Thiết kế & phát Google Form, tổng hợp kết quả S1 | Nguyễn Thị Thương, Nguyễn Tuấn Kiệt | Google Form, file Sheets |
| Phỏng vấn sâu S2 | Nguyễn Thị Thương, Nguyễn Tuấn Kiệt **[bổ sung người khác nếu có]** | Biên bản `PV-xx` |
| Tìm và đọc bài báo T1 | **[điền tên]** | File PDF, ghi chú |
| Thu thập số liệu Google Play T2, T3 | **[điền tên]** | Ảnh chụp màn hình |
