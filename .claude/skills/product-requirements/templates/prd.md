# PRD – US<xx>: <tên ngắn>

> **Giai đoạn:** 3 – Product Requirements · **Skill:** product-requirements (mục 4.3) · **Trạng thái:** Nháp | Chờ duyệt | Đã duyệt · **Phụ trách:** <PA> · **Duyệt:** <PO, ngày> · **Cập nhật:** <dd/mm/yyyy>

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn <...>, để <...>. |
| Nguồn | <HMWx / Px> – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | <Must> · <3> · <Sprint x> |
| Màn hình | `docs/design/screens/<ScreenName>.md` |
| Phụ thuộc | <US khác phải xong trước, hoặc "Không"> |
| Dữ liệu | `docs/requirements/data-analysis.md` – mục 11 dòng US<xx>; BR <...>; EC <...> |

## 1. Bối cảnh

<!-- 2–3 câu: vấn đề của Persona Minh/Vy mà story này giải quyết. Con số phải có nhãn và nằm trong 00-research-log.md. -->

## 2. Luồng thao tác chính

<!-- Đánh số từng bước người dùng làm và app phản hồi. -->

1. <Người dùng ...> → <App ...>
2. <...>

## 3. Dữ liệu

<!-- Chép dòng của story từ data-analysis.md mục 11 (C tạo · R đọc · U sửa · D xoá). Dẫn mã thực thể, không định nghĩa trường mới ở đây. -->

| Thực thể | Đọc / Ghi | Trường dùng | Theo |
| :--- | :--- | :--- | :--- |
| E01 `Transaction` | C R | <...> | `data-analysis.md` mục 4 · `budget-logic` mục 4.1 |

**Quy tắc nghiệp vụ áp dụng:** BR-<xx>, BR-<yy> (`data-analysis.md` mục 8)

## 4. Tiêu chí chấp nhận (AC)

<!-- Given/When/Then. Mỗi AC đo được. Có AC cho trạng thái trống, lỗi, giới hạn. Cột Nguồn: AC gốc trong 06, hoặc BR-xx / ERR_… / EC-xx trong data-analysis.md. -->

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng | Nguồn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| AC1 | <...> | <...> | <...> | <Unit test / Điện thoại> | <06 AC1 / BR-xx / EC-xx> |
| AC2 | <...> | <...> | <...> | | |

## 5. Test case

### 5.1 Tính tiền (dẫn tới `budget-logic` mục 4.4)

| Test case | AC liên quan |
| :--- | :--- |
| TC<số> | AC<x> |

### 5.2 Giao diện (kiểm trên điện thoại thật)

| # | Bước | Kết quả mong đợi | AC |
| :-: | :--- | :--- | :--- |
| 1 | <...> | <...> | AC<x> |

## 6. Ngoài phạm vi

- <điều KHÔNG làm trong story này, và story nào sẽ làm (nếu có)>

## 7. Skill áp dụng khi code

<!-- writing-plans chép bảng này vào phần đầu plan ("Skill nhóm áp dụng"). -->

| Skill | Mục | Dùng cho |
| :--- | :--- | :--- |
| `frontend-ui` | 4, 6 | <màn hình ...> |
| `design-system` | 4.2, 4.3, 6 | <component ...> |
| `budget-logic` | <4.1, 4.2, 4.4, 6> | <hàm ...> |

## 8. Câu hỏi mở

| # | Câu hỏi | Người trả lời | Trả lời |
| :-: | :--- | :--- | :--- |
| 1 | <...> | <PO / cặp ...> | <chưa có> |

## 9. Lịch sử thay đổi

| Ngày | Thay đổi | Người sửa | Đã báo người code |
| :--- | :--- | :--- | :--- |
| <dd/mm/yyyy> | Tạo PRD | <PA> | — |
