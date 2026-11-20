---
name: user-research
description: Tổng hợp dữ liệu nghiên cứu người dùng của Ví Khéo (khảo sát Google Form, phỏng vấn sâu, nhật ký chi tiêu 7 ngày, test prototype, buổi dùng thử MVP) thành số liệu và trích dẫn có nguồn. Dùng khi cần xử lý kết quả khảo sát, viết biên bản phỏng vấn, ghi kết quả test prototype, cập nhật số liệu trong docs/discovery hoặc kiểm tra một con số có thật hay không.
---

# Skill: User Research – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 1 – Research & Discovery | Sprint 0 (07/11 – 14/11) | Khảo sát n = 50 · phỏng vấn sâu 5–8 SV · nhật ký chi tiêu 7 ngày |
| 2 – Design System & Prototype | Sprint 1 (15/11 – 23/11) | Test con số "Hôm nay còn được tiêu" với 5 SV bằng prototype HTML (giả định A3) |
| 5 – Present full product | Sprint 2 → 3 | Tuyển 20 SV (tối thiểu 5), dùng thử 7 ngày (04/12 – 10/12), đo giả định A4 |

- **Phụ trách chính:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt
- **Review:** Dương Văn Hoan (PO)

## 2. Khi nào dùng / không dùng

**Dùng khi:** có file `.csv` khảo sát cần tính tỷ lệ · vừa phỏng vấn xong · vừa test prototype · cần cập nhật con số trong `docs/discovery/` · cần kiểm tra một con số có nguồn hay không.

**Không dùng khi:** viết Backlog, Vision (→ `product-discovery`) · viết PRD (→ `product-requirements`) · thiết kế giao diện (→ `design-system`).

## 3. Đầu vào

| Dữ liệu | Vị trí | Bắt buộc |
| :--- | :--- | :-: |
| Bảng trả lời khảo sát (xuất `.csv` từ Google Sheets, đã xoá cột thông tin cá nhân) | `docs/evidence/survey/` | Có |
| Bộ câu hỏi khảo sát | `docs/evidence/survey/questions.md` | Có |
| Biên bản phỏng vấn | `docs/evidence/interviews/PV-xx.md` | Khi có |
| Nhật ký nguồn | `docs/discovery/00-research-log.md` | Có |

## 4. Quy trình

### Bước 1 – Xử lý khảo sát
1. Đọc `.csv`, đếm **số phản hồi hợp lệ** (bỏ trùng, bỏ người không phải sinh viên).
2. Mỗi câu cần dùng: ghi **cả tử số và mẫu số**, ví dụ `34/50 (68%)`.
3. Câu chỉ hỏi một nhóm con: mẫu số là nhóm con đó, ghi rõ `18/29 người từng bỏ app (62%)`.
4. Kiểm tra số học: tỷ lệ × mẫu số phải ra số nguyên. Không ra → ghi `Cần kiểm lại`, báo người phụ trách.
5. Câu chọn nhiều đáp án: ghi *"câu chọn nhiều, tổng có thể > 100%"*.
6. Viết kết quả vào file từ mẫu `templates/survey-summary.md`.

### Bước 2 – Phỏng vấn sâu
Mỗi buổi 15–20 phút → một file `docs/evidence/interviews/PV-xx.md` từ mẫu `templates/interview.md`.

### Bước 3 – Nhật ký chi tiêu 7 ngày
3–5 SV tự ghi mọi khoản chi trong 7 ngày. Ghi: số ngày ghi đủ / 7, số khoản mỗi ngày, lý do bỏ sót. Dùng làm mốc so sánh với giả định A4.

### Bước 4 – Test prototype (giả định A3)
Cho 5 SV xem `docs/design/prototype/home.html` trong 5 giây, hỏi *"Con số to nhất trên màn hình nghĩa là gì?"*. Ghi đúng/sai từng người vào file từ mẫu `templates/prototype-test.md`. Đạt khi ≥ 4/5 trả lời đúng.

### Bước 5 – Dùng thử MVP (giả định A4)
Cuối Sprint 2 tuyển SV. Ngày 04/12 cài bản build. Đến 10/12 đếm số người **còn ghi ít nhất 1 khoản vào ngày thứ 7**. Đạt khi ≥ 50%. Ghi lại ngày cập nhật bản build nếu có.

### Bước 6 – Cập nhật tài liệu
Mỗi con số mới → thêm một dòng vào `00-research-log.md` → mới được dùng trong `02`, `03`, `05`.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/evidence/survey/summary.md` | `templates/survey-summary.md` | PO |
| `docs/evidence/interviews/PV-xx.md` | `templates/interview.md` | PO |
| `docs/evidence/prototype-tests/A3-<yyyy-mm-dd>.md` | `templates/prototype-test.md` | PO |
| Dòng mới trong `docs/discovery/00-research-log.md` | — | PO |

## 6. Khi viết plan

Không áp dụng.

## 7. Quy tắc bắt buộc

1. **Không bịa số, không bịa trích dẫn.** Không có trong `.csv` hoặc biên bản → không viết. Chưa có thì ghi `Đang thu thập (hiện có n = ...)`.
2. Không làm tròn đẹp: `34/50 = 68%` giữ nguyên, không viết "gần 70%".
3. Trích dẫn phải có mã nguồn: `(PV-02)` hoặc `(Khảo sát, câu 9)`. Ý khảo sát không hỏi trực tiếp → `[NHẬN ĐỊNH]`.
4. Không ghi họ tên, SĐT, MSSV của người được khảo sát/phỏng vấn.
5. Tách rõ `[SƠ CẤP]` (nhóm tự thu), `[THỨ CẤP]` (bài báo, Google Play), `[NHẬN ĐỊNH]` (ý kiến nhóm).

## 8. Checklist tự kiểm

- [ ] Mọi tỷ lệ có tử số/mẫu số và nhân lại ra số nguyên
- [ ] Mọi trích dẫn có mã `PV-xx` hoặc số câu khảo sát
- [ ] Đã thêm dòng mới vào `00-research-log.md`
- [ ] Không còn dữ liệu cá nhân của người tham gia
- [ ] Đã nhờ PO review trước khi merge
