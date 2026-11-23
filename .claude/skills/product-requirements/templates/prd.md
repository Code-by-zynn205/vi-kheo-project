# PRD – US<xx>: <tên ngắn>

> **Giai đoạn:** 3 – Product Requirements · **Trạng thái:** Nháp | Chờ duyệt | Đã duyệt · **Phụ trách:** <PA> · **Duyệt:** <PO, ngày> · **Cập nhật:** <dd/mm/yyyy>

| Mục | Giá trị |
| :--- | :--- |
| User Story | Là sinh viên, tôi muốn <...>, để <...>. |
| Nguồn | <HMWx / Px> – `docs/discovery/06-journey-features.md` |
| Ưu tiên · Story Point · Sprint | <Must> · <3> · <Sprint x> |
| Màn hình | `docs/design/screens/<ScreenName>.md` |
| Phụ thuộc | <US khác phải xong trước, hoặc "Không"> |

## 1. Bối cảnh

<!-- 2–3 câu: vấn đề của Persona Minh/Vy mà story này giải quyết. Con số phải có nhãn và nằm trong 00-research-log.md. -->

## 2. Luồng thao tác chính

<!-- Đánh số từng bước người dùng làm và app phản hồi. -->

1. <Người dùng ...> → <App ...>
2. <...>

## 3. Dữ liệu

<!-- Trường dữ liệu được đọc/ghi, dẫn tới budget-logic mục 4.1. Không định nghĩa kiểu dữ liệu mới ở đây. -->

| Dữ liệu | Đọc / Ghi | Theo |
| :--- | :--- | :--- |
| `Transaction` | Ghi | `budget-logic` mục 4.1 |

## 4. Tiêu chí chấp nhận (AC)

<!-- Given/When/Then. Mỗi AC đo được. Có AC cho trạng thái trống, lỗi, giới hạn. -->

| Mã | Cho trước (Given) | Khi (When) | Thì (Then) | Kiểm bằng |
| :--- | :--- | :--- | :--- | :--- |
| AC1 | <...> | <...> | <...> | <Unit test / Điện thoại> |
| AC2 | <...> | <...> | <...> | |

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
