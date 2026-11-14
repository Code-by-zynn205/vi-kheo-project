---
name: user-research
description: Tổng hợp dữ liệu nghiên cứu người dùng của Ví Khéo (khảo sát Google Form, phỏng vấn sâu, nhật ký chi tiêu 7 ngày, buổi dùng thử MVP) thành số liệu và trích dẫn có nguồn. Dùng khi cần xử lý kết quả khảo sát, viết biên bản phỏng vấn, cập nhật số liệu trong docs/discovery hoặc kiểm tra một con số có thật hay không.
---

# Skill: User Research – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Việc chính |
| :--- | :--- |
| **GĐ1 – Sprint 0** (07/11 – 14/11) | Khảo sát n = 50 ✅ · Phỏng vấn sâu 5–8 SV 🔄 · Nhật ký chi tiêu 7 ngày 🟡 |
| **GĐ2 – Sprint 1** (14/11 – 23/11) | Test con số "Hôm nay còn được tiêu" với 5 SV bằng bản HTML (giả định A3) |
| **GĐ3 – cuối Sprint 3** (→ 12/12) | Cho 5–20 SV dùng MVP 7 ngày, đo giả định A4 và tỷ lệ giữ chân |

- **Phụ trách chính:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt
- **Review:** Dương Văn Hoan (PO)

## 2. Khi nào dùng / không dùng

**Dùng khi:** có file xuất từ Google Sheets cần tính tỷ lệ · vừa phỏng vấn xong cần viết biên bản · cần cập nhật con số trong `docs/discovery/02-problem.md`, `03-personas.md`, `05-vision.md` · cần kiểm tra một con số trong tài liệu có nguồn hay không.

**Không dùng khi:** viết tính năng, Backlog (→ `product-discovery`), thiết kế giao diện (→ `design-system`).

## 3. Đầu vào

| Dữ liệu | Vị trí | Bắt buộc |
| :--- | :--- | :---: |
| Bảng trả lời khảo sát (xuất `.csv` từ Google Sheets) | `docs/evidence/survey/` | ✅ |
| Bộ câu hỏi khảo sát | `docs/evidence/survey/questions.md` | ✅ |
| Biên bản phỏng vấn | `docs/evidence/interviews/PV-xx.md` | Khi có |
| Nhật ký đóng góp nghiên cứu | `docs/discovery/00-research-log.md` | ✅ |

## 4. Quy trình

### Bước 1 – Xử lý khảo sát `[Sprint 0]`
1. Đọc file `.csv`, đếm **số phản hồi hợp lệ** (bỏ trùng, bỏ người không phải sinh viên).
2. Với mỗi câu hỏi cần dùng, ghi **cả tử số và mẫu số**: `34/50 (68%)`. Không ghi tỷ lệ đơn lẻ.
3. Với câu hỏi chỉ hỏi một nhóm con (ví dụ "lý do bỏ app" chỉ hỏi người từng bỏ app), mẫu số là **nhóm con đó**, phải ghi rõ: `18/29 người từng bỏ app (62%)`.
4. Kiểm tra số học: tỷ lệ × mẫu số phải ra số nguyên. Nếu không ra → đánh dấu 🟡 và báo người phụ trách.
5. Câu hỏi chọn nhiều đáp án: ghi rõ *"câu chọn nhiều, tổng có thể > 100%"*.

### Bước 2 – Phỏng vấn sâu `[Sprint 0]`
Mỗi buổi 15–20 phút, tạo một file `docs/evidence/interviews/PV-xx.md` theo mẫu:

```markdown
# PV-01 – <ngày> – Người phỏng vấn: <tên>
- Người được phỏng vấn: SV năm <x>, ngành <y>, ở <trọ/KTX/nhà>   (KHÔNG ghi họ tên, SĐT)
- Thu nhập/tháng: <khoảng> · Đã từng dùng app chi tiêu: <có/không, app nào>

## Câu hỏi → Trả lời (ghi gần nguyên văn)
1. Bạn thường nhận tiền lúc nào và tiêu những khoản gì? → ...
2. Kể lần gần nhất bạn hết tiền trước cuối tháng? → ...
3. Bạn đang theo dõi chi tiêu bằng cách nào? Vì sao dừng (nếu có)? → ...
4. Nếu có app, điều gì khiến bạn mở nó mỗi ngày? → ...

## Trích dẫn đáng chú ý (nguyên văn)
> "..."

## Điểm đau rút ra
- ...
```

### Bước 3 – Nhật ký chi tiêu 7 ngày `[Sprint 0 → Sprint 1]`
3–5 SV tự ghi mọi khoản chi trong 7 ngày (Google Sheets hoặc giấy). Ghi lại: số ngày ghi đủ / 7, số khoản ghi được mỗi ngày, lý do bỏ sót. Kết quả dùng làm mốc so sánh với giả định A4.

### Bước 4 – Test con số "Hôm nay còn được tiêu" (giả định A3) `[Sprint 1]`
Cho 5 SV xem bản HTML `HomeScreen` (sinh từ `design-system`) trong 5 giây, rồi hỏi: *"Con số to nhất trên màn hình nghĩa là gì?"*. Ghi đúng/sai từng người. Đạt khi ≥ 4/5 trả lời đúng.

### Bước 5 – Dùng thử MVP (giả định A4) `[Sprint 3]`
Cài MVP cho 5–20 SV, sau 7 ngày đếm số người còn ghi chép. Đạt khi ≥ 50% còn ghi chép ngày thứ 7.

### Bước 6 – Cập nhật tài liệu `[mọi Sprint]`
Mỗi con số mới → ghi một dòng vào `00-research-log.md` → mới được dùng trong các file `02`, `03`, `05`.

## 5. Đầu ra

| Đầu ra | File |
| :--- | :--- |
| Bảng số liệu khảo sát (tử số/mẫu số) | `docs/discovery/02-problem.md` mục 4 |
| Biên bản phỏng vấn | `docs/evidence/interviews/PV-xx.md` |
| Trích dẫn thật cho Persona | `docs/discovery/03-personas.md` |
| Trạng thái giả định A1–A4 | `docs/discovery/05-vision.md` mục 3 |
| Nhật ký nguồn | `docs/discovery/00-research-log.md` |

## 6. Quy tắc bắt buộc (chống AI Slop)
1. **Không bịa số, không bịa trích dẫn.** Không có trong `.csv` hoặc biên bản → không viết. Chưa có thì ghi `🟡 đang thu thập (hiện có n = ...)`.
2. Không làm tròn đẹp: `34/50 = 68%` giữ nguyên, không viết "gần 70%".
3. Trích dẫn trong Persona phải ghi mã nguồn: `(PV-02)` hoặc `(Khảo sát, câu 9)`.
4. Không ghi thông tin cá nhân (họ tên, SĐT, MSSV) của người được khảo sát/phỏng vấn.
5. Tách rõ `[SƠ CẤP]` (nhóm tự thu) với `[THỨ CẤP]` (bài báo, Google Play) và `[NHẬN ĐỊNH]` (ý kiến nhóm).

## 7. Checklist tự kiểm
- [ ] Mọi tỷ lệ đều có tử số/mẫu số và nhân lại ra số nguyên
- [ ] Mọi trích dẫn có mã `PV-xx` hoặc số câu khảo sát
- [ ] Đã thêm dòng mới vào `00-research-log.md`
- [ ] Không còn dữ liệu cá nhân của người tham gia
- [ ] Đã nhờ PO review trước khi merge
