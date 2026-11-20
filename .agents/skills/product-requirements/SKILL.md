---
name: product-requirements
description: Viết PRD (tài liệu yêu cầu sản phẩm) cho từng User Story của Ví Khéo – mô tả, luồng thao tác, tiêu chí chấp nhận Given/When/Then, test case có số cụ thể, ngoài phạm vi, và danh sách skill áp dụng khi code – để làm đầu vào cho brainstorming và writing-plans. Dùng khi PO vừa duyệt một User Story, khi cần viết hoặc sửa file trong docs/requirements, khi tách User Story lớn, hoặc khi kiểm tra một User Story đã đủ rõ để code chưa.
---

# Skill: Product Requirements (PRD & User Story) – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 3 – Product Requirements | Sprint 1 (15/11 – 23/11) | PRD cho US01 |
| 3 – Product Requirements | Đầu Sprint 2 | PRD cho US02, US03, US07 – xong trước ngày code đầu tiên của Sprint |
| 3 – Product Requirements | Đầu Sprint 3 | PRD cho US04, US05, US06 |

- **Phụ trách chính:** PA (Product Analyst) – `Cần bổ sung` tên
- **Review và duyệt:** Dương Văn Hoan (PO) · 1 người cặp code liên quan đọc để hỏi lại chỗ chưa rõ

## 2. Khi nào dùng / không dùng

**Dùng khi:** một dòng User Story trong Backlog vừa được PO duyệt · cần viết/sửa `docs/requirements/USxx-*.md` · User Story quá lớn (> 5 Story Point) cần tách · dev hỏi "AC này nghĩa là gì?".

**Không dùng khi:** thêm User Story mới vào Backlog hoặc đổi thứ tự ưu tiên (→ `product-discovery`) · chọn màu, bố cục (→ `design-system`) · đổi công thức tính tiền (→ `budget-logic`, PO duyệt).

## 3. Đầu vào

1. `docs/discovery/06-journey-features.md` – dòng User Story trong Backlog và AC gốc (mục 5)
2. `docs/design/screens/*.md` – đặc tả các màn hình User Story dùng (phải ở trạng thái `Xong`)
3. `.agents/skills/budget-logic/SKILL.md` – mô hình dữ liệu, công thức, bảng test case
4. `docs/discovery/03-personas.md`, `05-vision.md` – persona, giả định liên quan

Thiếu đặc tả màn hình → dừng, báo cặp UI/UX. Không tự thiết kế màn hình trong PRD.

## 4. Quy trình

1. **Kiểm tra INVEST.** User Story phải Độc lập · Thương lượng được · Có giá trị · Ước lượng được · Nhỏ (≤ 5 Story Point) · Kiểm thử được. Không đạt "Nhỏ" → đề xuất tách cho PO, mỗi phần một PRD.
2. **Tạo file** `docs/requirements/USxx-<english-slug>.md` từ `templates/prd.md`.
3. **Viết mục 1–3** (bối cảnh, người dùng, luồng) bằng câu ngắn, ngôn ngữ ai cũng hiểu. Mọi con số dẫn từ `00-research-log.md`.
4. **Viết AC dạng Given/When/Then.** Mỗi AC gốc trong `06` thành ít nhất 1 AC; thêm AC cho trạng thái trống, lỗi, giới hạn nhập. Mỗi AC phải kiểm được bằng mắt trên điện thoại hoặc bằng unit test.
5. **Viết test case có số cụ thể.** Phần tính tiền: dẫn số thứ tự test case trong `budget-logic` mục 4.4, không chép lại bảng. Phần giao diện: bước bấm + kết quả nhìn thấy.
6. **Ghi rõ ngoài phạm vi** – những gì người đọc dễ tưởng là có nhưng không làm.
7. **Điền mục "Skill áp dụng khi code"** – skill nào, mục nào. `writing-plans` chép mục này vào phần đầu plan.
8. **Câu hỏi mở:** điều chưa rõ ghi vào mục cuối, gắn tên người cần trả lời. Không tự đoán.
9. **Gửi PO duyệt** qua Pull Request nhánh `docs/USxx-prd`. PO duyệt → đổi trạng thái thành `Đã duyệt`. Từ lúc này mới được tạo nhánh `feature/USxx-*`.
10. Sửa PRD sau khi đã duyệt → ghi vào bảng "Lịch sử thay đổi", báo người đang code.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/requirements/USxx-<english-slug>.md` | `templates/prd.md` | PO |
| `docs/requirements/README.md` (bảng mục lục, thêm 1 dòng mỗi PRD) | `templates/requirements-index.md` | — |

PRD đã duyệt là đầu vào bắt buộc của `brainstorming` → `writing-plans` (xem `AGENTS.md` mục 3).

## 6. Khi viết plan

**Ràng buộc (chép vào Global Constraints):**
- Plan chỉ làm những gì có trong mục "Tiêu chí chấp nhận" của PRD; mục "Ngoài phạm vi" của PRD là cấm.
- Mỗi AC trong PRD phải được ít nhất 1 task kiểm tra (unit test hoặc bước kiểm tay trên điện thoại).
- PRD có câu hỏi mở chưa trả lời → không viết plan cho phần đó.

**Task bắt buộc:**
- Task cuối: đi lần lượt từng AC của PRD trên điện thoại thật, ghi Đạt/Chưa đạt vào mô tả Pull Request.

**Lệnh kiểm tra:**
- Không có lệnh riêng; kiểm bằng bảng AC trong mô tả Pull Request.

## 7. Quy tắc bắt buộc

1. **Không thêm tính năng.** PRD không được rộng hơn dòng User Story PO đã duyệt. Ý tưởng mới → ghi vào "Câu hỏi mở" cho PO.
2. **Không bịa số.** Con số về người dùng phải có trong `00-research-log.md`; số trong test case lấy từ `budget-logic`.
3. **Không viết AC mơ hồ** ("nhanh", "đẹp", "dễ dùng"). Viết số đo được: "≤ 3 thao tác", "< 5 giây", "hiển thị `35.000đ`".
4. **Không tự thiết kế giao diện.** Bố cục, màu dẫn tới `docs/design/screens/`.
5. Chữ trên giao diện trong PRD chép đúng nguyên văn từ đặc tả màn hình.
6. Tiếng Việt có dấu, không emoji, không LaTeX.

## 8. Checklist tự kiểm

- [ ] User Story đạt INVEST, ≤ 5 Story Point
- [ ] Mọi AC gốc trong `06-journey-features.md` đã có trong PRD dạng Given/When/Then
- [ ] Có AC cho trạng thái trống, lỗi, giới hạn nhập
- [ ] Test case tính tiền dẫn đúng số thứ tự trong `budget-logic` mục 4.4
- [ ] Mục "Skill áp dụng khi code" đã điền
- [ ] Mục "Ngoài phạm vi" có ít nhất 1 dòng
- [ ] Đã thêm dòng vào `docs/requirements/README.md`
