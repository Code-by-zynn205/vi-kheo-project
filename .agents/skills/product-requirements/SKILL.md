---
name: product-requirements
description: Phân tích dữ liệu và viết yêu cầu sản phẩm cho Ví Khéo – file phân tích dữ liệu (thực thể, quy tắc nghiệp vụ, ma trận đọc/ghi theo User Story, mã lỗi, trường hợp biên) làm nguồn để tách User Story, đề xuất trả lời câu hỏi chờ PO, và PRD từng User Story (luồng, tiêu chí chấp nhận Given/When/Then, test case có số cụ thể, ngoài phạm vi, skill áp dụng khi code) làm đầu vào cho brainstorming và writing-plans. Dùng khi phân tích hoặc sửa mô hình dữ liệu, quy tắc nghiệp vụ trong docs/requirements/data-analysis.md; khi gom câu hỏi đang chặn cho PO; khi PO vừa duyệt một User Story; khi viết hoặc sửa PRD trong docs/requirements; khi tách User Story lớn; hoặc khi kiểm tra một User Story đã đủ rõ để code chưa.
---

# Skill: Product Requirements (Phân tích dữ liệu, PRD & User Story) – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 3 – Product Requirements (bước đầu, chạy song song giai đoạn 2) | Sprint 1 | Phân tích dữ liệu `data-analysis.md` cho cả Backlog · đề xuất trả lời câu hỏi chờ PO |
| 3 – Product Requirements | Mỗi Sprint, trước ngày code đầu tiên | PRD cho từng User Story của Sprint (thứ tự ở `docs/plans/00-master-plan.md`) |
| 3 – Product Requirements | Khi PO đổi quyết định hoặc thêm User Story | Cập nhật `data-analysis.md` trước, rồi PRD liên quan |

- **Phụ trách chính:** PA (Product Analyst) – `Cần bổ sung` tên · phân tích dữ liệu: cặp dữ liệu Nguyễn Thị Bình Minh, Nguyễn Diên Tiến cùng PA
- **Review và duyệt:** Dương Văn Hoan (PO) · 1 người cặp code liên quan đọc để hỏi lại chỗ chưa rõ

## 2. Khi nào dùng / không dùng

**Dùng khi:** phân tích hoặc sửa thực thể, quy tắc nghiệp vụ, mã lỗi, trường hợp biên (`docs/requirements/data-analysis.md`) · gom câu hỏi đang chặn PRD cho PO · một dòng User Story vừa được PO duyệt · cần viết/sửa `docs/requirements/USxx-*.md` · User Story quá lớn (> 5 Story Point) cần tách · dev hỏi "AC này nghĩa là gì?".

**Không dùng khi:** thêm User Story mới vào Backlog hoặc đổi thứ tự ưu tiên (→ `product-discovery`; phân tích dữ liệu chỉ *đề xuất*) · chọn màu, bố cục (→ `design-system`) · đổi công thức tính tiền (→ `budget-logic`, PO duyệt) · chọn công nghệ lưu trữ, tên bảng (→ `tech-decision`).

## 3. Đầu vào

| Bước | Phải đọc |
| :--- | :--- |
| 4.1 Phân tích dữ liệu | `docs/discovery/06-journey-features.md` (Backlog, AC gốc) · `02-problem.md`, `03-personas.md` (điểm đau, nhu cầu) · `.agents/skills/budget-logic/SKILL.md` mục 4.1, 4.2, 4.4 · nguồn sản phẩm tương tự (ghi link, ngày đọc) |
| 4.2 Đề xuất cho PO | `docs/requirements/data-analysis.md` mục 13 |
| 4.3 Viết PRD | `docs/requirements/data-analysis.md` (mục 4, 8, 11, 12, 14) · `docs/design/screens/*.md` của màn hình story dùng (phải ở trạng thái `Xong`) · `06-journey-features.md` · `.agents/skills/budget-logic/SKILL.md` · `05-vision.md` (giả định liên quan) |

Thiếu đặc tả màn hình → dừng, báo cặp UI/UX. Không tự thiết kế màn hình trong PRD.

## 4. Quy trình

Thứ tự: **Phân tích dữ liệu → Đề xuất cho PO → PRD từng User Story.** `data-analysis.md` là nguồn chung của mọi PRD và là đầu vào để cặp UI/UX vẽ trạng thái màn hình (`design-system` mục 3).

### 4.1 Phân tích dữ liệu (một file cho cả sản phẩm)

1. Tạo hoặc mở `docs/requirements/data-analysis.md` từ `templates/data-analysis.md`. Giữ đủ 18 mục (0 – 17), đúng thứ tự.
2. Đọc mô hình dữ liệu của sản phẩm tương tự; chỉ ghi điều đọc được trong nguồn, gắn `[THỨ CẤP]` và ngày đọc (mục 1).
3. Chia lớp R1 (MVP – Backlog đã duyệt) · R2 · R3 (mục 2). Chỉ R1 được đưa vào PRD.
4. Liệt kê thực thể có mã `E01…` và từ điển dữ liệu (mục 3 – 7). Kiểu tiền, ngày theo `budget-logic` 4.1.
5. Viết quy tắc nghiệp vụ mã `BR-xx`, vòng đời, công thức (mục 8 – 10). Công thức R1 chép nguyên văn `budget-logic` 4.2.
6. **Ma trận đọc/ghi theo User Story (mục 11):** mỗi USxx một dòng – đây là chỗ thấy story nào đụng dữ liệu nào, để tách story và xếp thứ tự.
7. Mã lỗi `ERR_…` (mục 12), trường hợp biên `EC-xx` (mục 14), riêng tư (mục 15).
8. **Truy vết (mục 16):** mỗi thực thể → USxx → HMW/điểm đau. Thực thể không có story ghi "Mới" → chuyển cho `product-discovery` để PO xét thành User Story; không tự viết PRD cho nó.
9. Điều chưa chốt ghi **Đề xuất** và thêm câu hỏi `Qx` vào mục 13 (gắn "Chặn PRD USxx").
10. Mục 17: liệt kê tài liệu khác phải sửa theo (skill `budget-logic`, Backlog, ADR).

Mã `E`, `BR`, `ERR`, `EC`, `Q` **không bao giờ đánh lại** – PRD, đặc tả màn hình và test dẫn tới các mã này.

### 4.2 Đề xuất trả lời câu hỏi cho PO

1. Tạo `docs/requirements/po-decision-proposals.md` từ `templates/po-decision.md`, mã câu hỏi giữ theo `data-analysis.md` mục 13.
2. Mỗi câu: 2 – 3 phương án, đề xuất một, lý do có nguồn, ảnh hưởng tới AC/BR/PRD nào.
3. PO điền cột "Quyết định" → cập nhật `data-analysis.md` (cột Trạng thái của BR, mục 13) và AC trong `06-journey-features.md` cùng Pull Request.

### 4.3 Viết PRD cho từng User Story

1. **Kiểm tra INVEST.** User Story phải Độc lập · Thương lượng được · Có giá trị · Ước lượng được · Nhỏ (≤ 5 Story Point) · Kiểm thử được. Không đạt "Nhỏ" → đề xuất tách cho PO (dùng dòng của story trong `data-analysis.md` mục 11 để thấy chỗ tách), mỗi phần một PRD.
2. **Kiểm tra cổng:** đặc tả màn hình `Xong`; câu hỏi `Qx` nào ở mục 13 ghi "Chặn PRD USxx" đã có quyết định. Chưa có → ghi vào "Câu hỏi mở", không đoán.
3. **Tạo file** `docs/requirements/USxx-<english-slug>.md` từ `templates/prd.md`.
4. **Viết mục 1–3** (bối cảnh, luồng, dữ liệu). Mục "Dữ liệu" chép dòng của story từ `data-analysis.md` mục 11 và dẫn mã thực thể; không định nghĩa trường mới. Mọi con số người dùng dẫn từ `00-research-log.md`.
5. **Viết AC dạng Given/When/Then.** Mỗi AC gốc trong `06` thành ít nhất 1 AC. Thêm AC từ: quy tắc `BR-xx` (mục 8) story chạm tới · mã lỗi `ERR_…` (mục 12) · trường hợp biên `EC-xx` (mục 14) của story. Ghi mã nguồn ở cột "Nguồn". Mỗi AC kiểm được bằng mắt trên điện thoại hoặc bằng unit test.
6. **Viết test case có số cụ thể.** Phần tính tiền: dẫn số thứ tự test case trong `budget-logic` mục 4.4, không chép lại bảng. Phần giao diện: bước bấm + kết quả nhìn thấy.
7. **Ghi rõ ngoài phạm vi** – những gì người đọc dễ tưởng là có nhưng không làm (thường là dòng R2, R3 của cùng thực thể).
8. **Điền mục "Skill áp dụng khi code"** – skill nào, mục nào. `writing-plans` chép mục này vào phần đầu plan.
9. **Câu hỏi mở:** điều chưa rõ ghi vào mục cuối, gắn tên người cần trả lời. Không tự đoán.
10. **Gửi PO duyệt** qua Pull Request nhánh `docs/USxx-prd`. PO duyệt → đổi trạng thái thành `Đã duyệt`. Từ lúc này mới được tạo nhánh `feature/USxx-*`.
11. Sửa PRD sau khi đã duyệt → ghi vào bảng "Lịch sử thay đổi", báo người đang code. Thay đổi đụng dữ liệu → sửa `data-analysis.md` trước.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/requirements/data-analysis.md` (một file cho cả sản phẩm) | `templates/data-analysis.md` | PO; mục 4, 11 thêm kiến trúc sư đọc |
| `docs/requirements/po-decision-proposals.md` | `templates/po-decision.md` | PO (Q về lưu trữ: kiến trúc sư) |
| `docs/requirements/USxx-<english-slug>.md` | `templates/prd.md` | PO |
| `docs/requirements/README.md` (bảng mục lục, thêm 1 dòng mỗi PRD) | `templates/requirements-index.md` | — |

PRD đã duyệt là đầu vào bắt buộc của `brainstorming` → `writing-plans` (xem `AGENTS.md` mục 3).

## 6. Khi viết plan

**Ràng buộc (chép vào Global Constraints):**
- Plan chỉ làm những gì có trong mục "Tiêu chí chấp nhận" của PRD; mục "Ngoài phạm vi" của PRD là cấm.
- Mỗi AC trong PRD phải được ít nhất 1 task kiểm tra (unit test hoặc bước kiểm tay trên điện thoại).
- PRD có câu hỏi mở chưa trả lời → không viết plan cho phần đó.
- Tên trường, enum, mã lỗi trong code lấy đúng `docs/requirements/data-analysis.md` (mục 4, 7, 12); không đặt tên khác.

**Task bắt buộc:**
- Task cuối: đi lần lượt từng AC của PRD trên điện thoại thật, ghi Đạt/Chưa đạt vào mô tả Pull Request.

**Lệnh kiểm tra:**
- Không có lệnh riêng; kiểm bằng bảng AC trong mô tả Pull Request.

## 7. Quy tắc bắt buộc

1. **Không thêm tính năng.** PRD không được rộng hơn dòng User Story PO đã duyệt. Ý tưởng mới (kể cả thực thể "Mới" ở `data-analysis.md` mục 16) → ghi vào "Câu hỏi mở" cho PO hoặc chuyển `product-discovery`.
2. **Không bịa số.** Con số về người dùng phải có trong `00-research-log.md`; số trong test case lấy từ `budget-logic`; nguồn sản phẩm tương tự phải có link và ngày đọc.
3. **Không viết AC mơ hồ** ("nhanh", "đẹp", "dễ dùng"). Viết số đo được: "≤ 3 thao tác", "< 5 giây", "hiển thị `35.000đ`".
4. **Không tự thiết kế giao diện.** Bố cục, màu dẫn tới `docs/design/screens/`.
5. Chữ trên giao diện trong PRD chép đúng nguyên văn từ đặc tả màn hình.
6. **Không tự chốt thay PO.** Điều chưa có quyết định ghi **Đề xuất** hoặc `Chờ PO (Qx)`.
7. **Không đánh lại mã** `E`, `BR`, `ERR`, `EC`, `Q`; quy tắc bỏ ghi "Bỏ", không xoá dòng.
8. Tiếng Việt có dấu, không emoji, không LaTeX.

## 8. Checklist tự kiểm

**`data-analysis.md`:**
- [ ] Đủ 18 mục theo mẫu; dòng đầu có `**Skill:** product-requirements (mục 4.1)`
- [ ] Mỗi User Story trong Backlog có 1 dòng ở mục 11
- [ ] Mỗi thực thể có dòng truy vết ở mục 16; dòng "Mới" đã báo `product-discovery`
- [ ] Công thức R1 khớp nguyên văn `budget-logic` 4.2
- [ ] Mọi điều chưa chốt có mã `Qx` ở mục 13, ghi rõ chặn PRD nào

**PRD:**
- [ ] User Story đạt INVEST, ≤ 5 Story Point
- [ ] Mọi AC gốc trong `06-journey-features.md` đã có trong PRD dạng Given/When/Then
- [ ] Có AC cho trạng thái trống, lỗi, giới hạn nhập; mỗi `EC-xx`, `ERR_…` của story có AC hoặc test case
- [ ] Mục "Dữ liệu" khớp dòng của story ở `data-analysis.md` mục 11
- [ ] Test case tính tiền dẫn đúng số thứ tự trong `budget-logic` mục 4.4
- [ ] Mục "Skill áp dụng khi code" đã điền
- [ ] Mục "Ngoài phạm vi" có ít nhất 1 dòng
- [ ] Đã thêm dòng vào `docs/requirements/README.md`
