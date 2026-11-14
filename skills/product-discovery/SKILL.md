---
name: product-discovery
description: Quy trình Product Discovery của Ví Khéo – từ bằng chứng nghiên cứu đi tới Problem Statement, Persona, phân tích đối thủ, Product Vision Board, câu hỏi HMW, Generate Features (MoSCoW) và Product Backlog có tiêu chí chấp nhận. Dùng khi viết hoặc sửa bất kỳ file nào trong docs/discovery, khi thêm/đổi User Story, hoặc khi cần kiểm tra một tính năng có truy ngược được về vấn đề hay không.
---

# Skill: Product Discovery – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Việc chính | Trạng thái |
| :--- | :--- | :---: |
| **GĐ1 – Sprint 0** (07/11 – 14/11) | Viết bộ 8 tài liệu `docs/discovery/00 → 07` | ✅ (còn mục 🟡) |
| **GĐ2 – đầu mỗi Sprint** | PO cập nhật Backlog, thêm/chỉnh User Story theo phản hồi | 🔄 |

- **Phụ trách chính:** Dương Văn Hoan (PO) – quyết định thứ tự Backlog
- **Đóng góp:** cả nhóm (mỗi cặp góp dữ liệu phần mình) · **Review:** Trần Ninh Nhật Tân (SM)

## 2. Khi nào dùng / không dùng

**Dùng khi:** viết/sửa file trong `docs/discovery/` · thêm tính năng hoặc User Story · cần trả lời "tính năng này giải quyết vấn đề gì?".

**Không dùng khi:** xử lý số liệu thô (→ `user-research`), viết code (→ `frontend-ui`, `budget-logic`).

## 3. Đầu vào (đọc trước khi viết)
1. `docs/discovery/00-research-log.md` – **chỉ dùng số liệu có trong file này**
2. Các file `docs/discovery/01 → 07` hiện có
3. Biên bản phỏng vấn `docs/evidence/interviews/` (nếu có)

## 4. Quy trình – chuỗi truy vết

```
Bằng chứng (00) → Vấn đề (02) → Persona & điểm đau (03) → Thị trường (04)
     → Tầm nhìn & giả định (05) → HMW → Generate Features → MoSCoW → User Story + AC (06)
     → Lộ trình Sprint & DoD (07)
```

| Bước | Sprint | Việc | File |
| :-: | :--- | :--- | :--- |
| 1 | S0 | Ghi phạm vi, nhóm Scrum, thời gian, công cụ | `01-project-intake.md` |
| 2 | S0 | Problem Statement theo khung **Ai – Bối cảnh – Nguyên nhân – Hậu quả**, kèm bằng chứng thứ cấp + sơ cấp | `02-problem.md` |
| 3 | S0 | Persona: 1 chính + 1 phụ; mỗi điểm đau gắn mã nguồn (`PV-xx`, câu khảo sát) | `03-personas.md` |
| 4 | S0 | So sánh ≥ 3 giải pháp hiện có, ghi ngày lấy số liệu, tìm khoảng trống | `04-market.md` |
| 5 | S0 | Product Vision Board (Roman Pichler) + bảng giả định A1–A4 | `05-vision.md` |
| 6 | S0 | Customer Journey → điểm đau → **HMW** | `06-journey-features.md` |
| 7 | S0 | **Generate Features:** mỗi HMW sinh 3–6 ý tưởng, rồi lọc bằng MoSCoW | `06-journey-features.md` |
| 8 | S0 → mỗi Sprint | Viết User Story `Là… tôi muốn… để…` + **tiêu chí chấp nhận (Given/When/Then)** + Story Point (Fibonacci) | `06-journey-features.md` |
| 9 | S0 | Xếp User Story vào Sprint, viết Definition of Done | `07-roadmap.md` |

### Cách làm bước 7 – Generate Features
1. Với mỗi HMW, liệt kê ý tưởng **trước khi đánh giá** (không loại sớm).
2. Mỗi ý tưởng ghi: giải quyết HMW nào, điểm đau nào (mã P1, P2…).
3. Lọc MoSCoW theo 3 câu hỏi:
   - Thiếu nó thì sản phẩm có còn giải quyết HMW1/HMW2 không? → không còn = **Must**
   - Làm được trong 3 Sprint với 8 Developer không? → không = **Won't**
   - Đối thủ đã làm tốt hơn hẳn và không phải điểm khác biệt của Ví Khéo? → **Won't**
4. Ghi lý do cho mọi tính năng Won't (để trả lời "vì sao không làm").

## 5. Đầu ra
8 file `docs/discovery/00 → 07`, mỗi file mở đầu bằng dòng trạng thái:

```markdown
> **Giai đoạn:** GĐ1 – Discovery (Sprint 0) · **Trạng thái:** ✅ · **Phụ trách:** <tên> · **Cập nhật:** <dd/mm/yyyy>
```

## 6. Quy tắc bắt buộc (chống AI Slop)
1. **Evidence-first:** mỗi điểm đau, mỗi con số phải có nhãn `[SƠ CẤP]` / `[THỨ CẤP]` / `[NHẬN ĐỊNH]`. Số không có trong `00-research-log.md` → không dùng.
2. **Truy vết 2 chiều:** mỗi User Story ghi HMW nguồn; mỗi HMW phải có ít nhất 1 Must hoặc Should.
3. **Giữ phạm vi:** không thêm liên kết ngân hàng, AI/OCR, đầu tư, đăng nhập tài khoản vào MVP. Muốn thêm → PO quyết, ghi lý do vào Backlog.
4. Giả thuyết chưa kiểm chứng phải ghi là giả thuyết, không viết như kết luận.
5. Không dùng ký hiệu LaTeX (`$\ge$`, `$\rightarrow$`) – GitHub và Word hiển thị lỗi. Dùng `≥`, `→`.
6. Persona là nhân vật đại diện, không phải một người thật; phải ghi rõ điều này.

## 7. Checklist tự kiểm
- [ ] Mọi con số có trong `00-research-log.md`
- [ ] Mỗi User Story có HMW nguồn, AC dạng Given/When/Then, Story Point
- [ ] Mỗi tính năng Won't có lý do
- [ ] Ngày Sprint khớp `07-roadmap.md` và slide báo cáo
- [ ] Dòng trạng thái đầu file đã cập nhật ngày
