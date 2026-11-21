# ADR-<xx>: <câu hỏi cần quyết định, ngắn>

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Trạng thái:** Đề xuất | Đã chấp nhận | Đã thay thế bởi ADR-<yy> · **Phụ trách:** <tên> · **Cập nhật:** <dd/mm/yyyy>

| Mục | Giá trị |
| :--- | :--- |
| Câu hỏi | <một câu, ví dụ "App chạy trên nền tảng nào?"> |
| Ảnh hưởng tới | <US01, US05, bản dùng thử ...> |
| Thay thế | <ADR-xx hoặc "Không"> |
| Hạn quyết định | <dd/mm – lý do, ví dụ "trước khi viết plan US01"> |

## 1. Bối cảnh

<!-- 3–5 câu: vì sao phải quyết định bây giờ, ràng buộc của dự án (3 Sprint, 8 Developer, chạy trên điện thoại thật, offline). -->

## 2. Năng lực của nhóm

<!-- Lấy từ hỏi nhanh thật trong nhóm. Chưa hỏi thì ghi "Cần bổ sung". Không ghi tên ai không biết gì. -->

| Công nghệ | Số Developer đã từng làm | Nguồn |
| :--- | :-: | :--- |
| <...> | <x>/8 | Hỏi nhanh ngày <dd/mm> [SƠ CẤP] |

## 3. Phương án

| # | Phương án | Mô tả ngắn |
| :-: | :--- | :--- |
| 1 | <...> | <...> |
| 2 | <...> | <...> |

## 4. Lọc tiêu chí bắt buộc (nhóm A)

<!-- Đạt / Không đạt / Cần kiểm chứng. "Không đạt" thì phương án bị loại. -->

| Tiêu chí | Phương án 1 | Phương án 2 | Nguồn |
| :--- | :-: | :-: | :--- |
| A1 – Chạy trên điện thoại thật, Android và iPhone | <...> | <...> | <link, ngày đọc> |
| A2 – Lưu trên máy, offline, không đăng nhập | | | |
| A3 – Bản dùng thử trước 03/12 không qua cửa hàng ứng dụng | | | |
| A4 – Miễn phí | | | |

## 5. Chấm điểm (nhóm B)

<!-- Điểm 1–5. Mỗi ô có lý do ngắn trong bảng lý do bên dưới. Trọng số theo tech-decision mục 4.2. -->

| Tiêu chí | Trọng số | Phương án 1 | Phương án 2 |
| :--- | :-: | :-: | :-: |
| B1 – Developer đã biết | 3 | <điểm> | <điểm> |
| B2 – Thời gian dựng khung | 3 | | |
| B3 – Nhắc 21:00 (US05) | 2 | | |
| B4 – AI agent sinh code tốt | 2 | | |
| B5 – Unit test logic dễ | 2 | | |
| B6 – Cài cho người dùng thử | 1 | | |
| **Tổng (điểm × trọng số)** | | **<x>** | **<y>** |

**Lý do từng điểm:**

| Ô | Lý do | Nhãn / nguồn |
| :--- | :--- | :--- |
| B3 – Phương án 1 | <...> | [THỨ CẤP] <link tài liệu chính thức, ngày đọc> |

## 6. Quyết định

<!-- Một câu: chọn gì. Nếu điểm sát nhau, nêu yếu tố quyết định cuối cùng. -->

**Chọn:** <phương án>

## 7. Hệ quả

| Loại | Nội dung |
| :--- | :--- |
| Được | <...> |
| Mất / chấp nhận đánh đổi | <...> |
| Rủi ro | <...> → Cách giảm: <...> |
| Xem lại quyết định khi | <điều kiện cụ thể, ví dụ "không cài được trên iPhone của ≥ 2 người dùng thử"> |

## 8. Việc cần làm sau quyết định

- [ ] Cập nhật `docs/architecture/technical-design.md`
- [ ] Cập nhật `frontend-ui` mục 4.1 dòng "Đã chốt" (nếu là ADR nền tảng)
- [ ] Thêm dòng vào `docs/architecture/README.md`

## 9. Người tham gia quyết định

| Ngày | Hình thức | Người tham gia | Kết quả |
| :--- | :--- | :--- | :--- |
| <dd/mm/yyyy> | <Sprint Planning / Pull Request #...> | <tên> | <Chấp nhận / Cần sửa> |
