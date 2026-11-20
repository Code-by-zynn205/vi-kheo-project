---
name: product-discovery
description: Quy trình Product Discovery của Ví Khéo – từ bằng chứng nghiên cứu đi tới Problem Statement, Persona, phân tích đối thủ, Product Vision Board, câu hỏi HMW, Generate Features (MoSCoW) và Product Backlog. Dùng khi viết hoặc sửa file trong docs/discovery, khi thêm/đổi một dòng User Story trong Backlog, hoặc khi cần kiểm tra một tính năng có truy ngược được về vấn đề hay không.
---

# Skill: Product Discovery – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 1 – Research & Discovery | Sprint 0 (07/11 – 14/11) | Bộ 8 tài liệu `docs/discovery/00 → 07` |
| Đầu mỗi Sprint | Sprint 1 → 3 | PO cập nhật Backlog, thêm/đổi User Story theo phản hồi |

- **Phụ trách chính:** Dương Văn Hoan (PO) – quyết định thứ tự Backlog
- **Đóng góp:** cả nhóm · **Review:** Trần Ninh Nhật Tân (SM)

## 2. Khi nào dùng / không dùng

**Dùng khi:** viết/sửa file trong `docs/discovery/` · thêm tính năng hoặc dòng User Story vào Backlog · cần trả lời "tính năng này giải quyết vấn đề gì?".

**Không dùng khi:** xử lý số liệu thô (→ `user-research`) · viết chi tiết yêu cầu, AC, test case của một User Story (→ `product-requirements`) · viết code (→ `frontend-ui`, `budget-logic`).

## 3. Đầu vào

1. `docs/discovery/00-research-log.md` – **chỉ dùng số liệu có trong file này**
2. Các file `docs/discovery/01 → 07` hiện có
3. Biên bản phỏng vấn, kết quả khảo sát trong `docs/evidence/`

## 4. Quy trình – chuỗi truy vết

```
Bằng chứng (00) → Vấn đề (02) → Persona & điểm đau (03) → Thị trường (04)
  → Tầm nhìn & giả định (05) → HMW → Generate Features → MoSCoW → Backlog (06)
  → Lộ trình Sprint & DoD (07) → PRD từng User Story (product-requirements)
```

| Bước | Việc | File |
| :-: | :--- | :--- |
| 1 | Phạm vi, nhóm Scrum, thời gian, công cụ | `01-project-intake.md` |
| 2 | Problem Statement: **Ai – Bối cảnh – Nguyên nhân – Hậu quả**, kèm bằng chứng | `02-problem.md` |
| 3 | Persona: 1 chính + 1 phụ; mỗi điểm đau có mã `P1, P2…` và nguồn | `03-personas.md` |
| 4 | So sánh ≥ 3 giải pháp hiện có, ghi ngày lấy số liệu, tìm khoảng trống | `04-market.md` |
| 5 | Product Vision Board (Roman Pichler) + bảng giả định A1–A4 | `05-vision.md` |
| 6 | Customer Journey → điểm đau → **HMW** | `06-journey-features.md` |
| 7 | **Generate Features:** mỗi HMW 3–6 ý tưởng, lọc bằng MoSCoW | `06-journey-features.md` |
| 8 | Backlog: một dòng mỗi User Story (mẫu `templates/backlog-row.md`) | `06-journey-features.md` |
| 9 | Xếp User Story vào Sprint, viết Definition of Done | `07-roadmap.md` |

### Cách lọc MoSCoW ở bước 7
1. Liệt kê ý tưởng **trước khi đánh giá**. Mỗi ý tưởng ghi HMW và điểm đau nó giải quyết.
2. Thiếu nó thì sản phẩm còn giải quyết HMW1/HMW2 không? Không còn → **Must**.
3. Làm được trong 3 Sprint với 8 Developer không? Không → **Won't**.
4. Đối thủ làm tốt hơn hẳn và không phải điểm khác biệt của Ví Khéo? → **Won't**.
5. Ghi lý do cho mọi tính năng Won't.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/discovery/00 → 07` (file mới) | `templates/discovery-doc.md` | SM |
| Dòng User Story mới trong `06-journey-features.md` | `templates/backlog-row.md` | PO |

Khi PO duyệt một dòng User Story → chuyển sang skill `product-requirements` để viết PRD.

## 6. Khi viết plan

Không áp dụng.

## 7. Quy tắc bắt buộc

1. **Evidence-first:** mỗi điểm đau, mỗi con số có nhãn `[SƠ CẤP]` / `[THỨ CẤP]` / `[NHẬN ĐỊNH]`. Số không có trong `00-research-log.md` → không dùng.
2. **Truy vết 2 chiều:** mỗi User Story ghi nguồn là HMW hoặc điểm đau; mỗi HMW có ít nhất 1 Must hoặc Should.
3. **Giữ phạm vi:** không thêm liên kết ngân hàng, AI/OCR, đầu tư, đăng nhập. Muốn thêm → PO quyết, ghi lý do.
4. Giả thuyết chưa kiểm chứng ghi là giả thuyết, không viết như kết luận.
5. Persona là nhân vật đại diện, phải ghi rõ. Viết "Persona Minh", "Persona Vy" để không nhầm với thành viên nhóm.
6. Không dùng LaTeX, không dùng emoji.

## 8. Checklist tự kiểm

- [ ] Mọi con số có trong `00-research-log.md`
- [ ] Mỗi User Story có nguồn (HMW hoặc điểm đau), mức MoSCoW, Story Point
- [ ] Mỗi tính năng Won't có lý do
- [ ] Ngày Sprint khớp `07-roadmap.md`
- [ ] Dòng trạng thái đầu file đã cập nhật ngày
