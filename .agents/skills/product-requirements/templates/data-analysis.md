# Phân tích và thiết kế dữ liệu – Ví Khéo

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.1) · **Trạng thái:** Đang làm – chờ PO chốt mục 13 · **Phụ trách:** <cặp dữ liệu>, <PA> · **Duyệt:** <PO> · **Cập nhật:** <dd/mm/yyyy>

<!-- File này là NGUỒN để tách và viết User Story: mục 11 (ma trận đọc/ghi) và mục 16 (truy vết) cho biết mỗi US đụng dữ liệu nào; mục 8, 12, 14 là nguyên liệu AC của PRD. Chỉ ở mức logic, không chọn công nghệ. -->

## Mục lục

0. Mục đích, phạm vi, cách đọc
1. Nghiên cứu mô hình dữ liệu của sản phẩm tương tự
2. Các lớp phát hành dữ liệu (R1 – R2 – R3)
3. Sơ đồ thực thể tổng thể
4. Từ điển dữ liệu – R1 (MVP)
5. Từ điển dữ liệu – R2
6. Từ điển dữ liệu – R3
7. Danh mục giá trị (enum)
8. Quy tắc nghiệp vụ
9. Vòng đời trạng thái
10. Dữ liệu tính ra và công thức
11. Ma trận đọc/ghi theo tính năng
12. Kiểm tra dữ liệu đầu vào và mã lỗi
13. Câu hỏi mở
14. Trường hợp biên
15. Riêng tư, bảo mật, lưu giữ dữ liệu
16. Truy vết: thực thể → tính năng → nhu cầu
17. Ảnh hưởng tới tài liệu khác

---

## 0. Mục đích, phạm vi, cách đọc

<!-- File trả lời câu hỏi gì; ai dùng (PA viết PRD, kiến trúc sư viết ADR lưu trữ, cặp UI/UX vẽ trạng thái màn hình). Bảng "Thuộc / Không thuộc file này" (logic vs vật lý). Nhắc AGENTS.md quy tắc 3: chỉ R1 nằm trong MVP. Ký hiệu nhãn nguồn. -->

| Thuộc file này (mức logic) | Không thuộc file này (mức vật lý – kiến trúc) |
| :--- | :--- |
| Thực thể, thuộc tính, ràng buộc, enum, quy tắc, vòng đời, công thức, nhu cầu đọc/ghi | Chọn công nghệ lưu trữ, tên bảng, chỉ mục, API |

## 1. Nghiên cứu mô hình dữ liệu của sản phẩm tương tự

<!-- Mỗi nguồn: mã R-xx, link, nhãn [THỨ CẤP], ngày đọc, điều rút ra. Không đọc được thì ghi rõ, không suy đoán. Cuối mục: "Kết luận cho thiết kế" đánh số. -->

| # | Nguồn | Điều rút ra cho Ví Khéo |
| :-: | :--- | :--- |
| R-01 | <tên – link> `[THỨ CẤP]` | <...> |

## 2. Các lớp phát hành dữ liệu

| Lớp | Nội dung | Lưu ở đâu | Điều kiện làm |
| :--- | :--- | :--- | :--- |
| **R1 – MVP** | <...> | <...> | Backlog đã duyệt |
| **R2** | <...> | <...> | User Story mới do PO duyệt |
| **R3** | <...> | <...> | Ngoài MVP |

## 3. Sơ đồ thực thể tổng thể

<!-- Sơ đồ mermaid erDiagram + bảng tổng hợp thực thể có mã E01, E02… (Mã · Thực thể tiếng Anh · Tên tiếng Việt · Lớp · Lưu / tính / cố định). Mã thực thể không bao giờ đánh lại. -->

| Mã | Thực thể | Tên tiếng Việt | Lớp | Lưu / tính / cố định |
| :--- | :--- | :--- | :-: | :--- |
| E01 | `<Entity>` | <...> | R1 | Lưu |

## 4. Từ điển dữ liệu – R1 (MVP)

<!-- Bảng trường chung (id, createdAt, updatedAt, deletedAt) rồi mỗi thực thể một mục ### Exx. Tiền là số nguyên VND (budget-logic 4.1). Điều chưa chốt ghi **Đề xuất** + mã câu hỏi mục 13. -->

### E01 `<Entity>` – <tên tiếng Việt>

| Trường | Kiểu | Bắt buộc | Ràng buộc | Mặc định | Lớp |
| :--- | :--- | :-: | :--- | :--- | :-: |
| `<field>` | <...> | Có | <...> | <...> | R1 |

## 5. Từ điển dữ liệu – R2

<!-- Như mục 4. Mỗi thực thể ghi rõ nhu cầu nguồn (mục 16); chưa có User Story thì không được làm. -->

## 6. Từ điển dữ liệu – R3

<!-- Phía người dùng và phía quản trị. Ngoài MVP. -->

## 7. Danh mục giá trị (enum)

| Enum | Giá trị | Lớp |
| :--- | :--- | :-: |
| `<EnumName>` | `<A>`, `<B>` | R1 |

## 8. Quy tắc nghiệp vụ

<!-- Mã BR-xx theo nhóm (BR-0x tiền và thời gian, BR-1x giao dịch, BR-2x ngân sách…). Mỗi quy tắc một dòng, kiểm được. Cột Trạng thái: Đã có / Đề xuất / Chờ PO (Qx). Mã BR không đánh lại; quy tắc bỏ thì ghi "Bỏ" thay vì xoá dòng. -->

| Mã | Quy tắc | Lớp | Trạng thái |
| :--- | :--- | :-: | :--- |
| BR-01 | <...> | R1 | <Đã có / Đề xuất / Chờ PO (Qx)> |

## 9. Vòng đời trạng thái

<!-- mermaid stateDiagram-v2 cho thực thể có trạng thái. Trạng thái tính ra (không lưu) ghi riêng. -->

## 10. Dữ liệu tính ra và công thức

<!-- Công thức R1 dẫn nguyên văn từ budget-logic 4.2, không viết lại khác đi. Công thức mới ghi **Đề xuất** – cần PO duyệt và thêm test case vào budget-logic 4.4. -->

## 11. Ma trận đọc/ghi theo tính năng

<!-- Mỗi User Story một dòng. C tạo · R đọc · U sửa · D xoá. Cột "Truy vấn chính" là đầu vào cho ADR lưu trữ. Đây là bảng PA đọc để viết mục "Dữ liệu" của PRD. -->

| Tính năng (Story / F) | E01 | E02 | <...> | Truy vấn chính |
| :--- | :-: | :-: | :-: | :--- |
| US<xx> <tên> | <C R> | <—> | <...> | <...> |

## 12. Kiểm tra dữ liệu đầu vào và mã lỗi

| Mã lỗi | Điều kiện | Thông báo hiển thị | Lớp |
| :--- | :--- | :--- | :-: |
| `ERR_<NAME>` | <...> | <đề xuất – cặp UI/UX chốt trong đặc tả> | R1 |

## 13. Câu hỏi mở

<!-- Mã Qx không đánh lại. Cột "Chặn" ghi PRD/ADR nào phải chờ. Đề xuất trả lời chi tiết viết ở po-decision-proposals.md (mẫu po-decision.md). -->

| # | Câu hỏi | Người trả lời | Chặn | Đề xuất |
| :-: | :--- | :--- | :--- | :--- |
| Q1 | <...> | <PO / kiến trúc sư> | <PRD USxx> | <...> |

## 14. Trường hợp biên

<!-- Mã EC-xx. Mỗi dòng thành ít nhất 1 AC hoặc test case trong PRD của story liên quan. Dẫn TC của budget-logic 4.4 khi có. -->

| # | Tình huống | Hành vi mong đợi | Lớp |
| :-: | :--- | :--- | :-: |
| EC-01 | <...> | <...> | R1 |

## 15. Riêng tư, bảo mật, lưu giữ dữ liệu

| Chủ đề | Quy định |
| :--- | :--- |
| Phân loại | <...> |

## 16. Truy vết: thực thể → tính năng → nhu cầu

<!-- Mỗi thực thể/công thức → Story (USxx) hoặc "Mới" → HMW / điểm đau trong 02, 03, 06. Dòng "Mới" là ĐỀ XUẤT User Story: chuyển cho product-discovery để PO xét đưa vào Backlog; không tự viết PRD. -->

| Thực thể | Tính năng / Story | Nhu cầu, điểm đau | Lớp |
| :--- | :--- | :--- | :-: |
| E01 | US<xx> | <HMWx · Px> | R1 |

## 17. Ảnh hưởng tới tài liệu khác

| Tài liệu | Cần làm | Ai | Khi nào |
| :--- | :--- | :--- | :--- |
| `budget-logic` mục 4.1 | <...> | <...> | <...> |
| PRD US<xx> | Mục "Dữ liệu" dẫn mục 4, 11; trường hợp biên từ mục 14; mã lỗi từ mục 12 | PA | Khi viết PRD |
