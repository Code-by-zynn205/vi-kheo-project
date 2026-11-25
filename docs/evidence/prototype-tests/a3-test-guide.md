# Hướng dẫn test giả định A3 – con số "Hôm nay còn được tiêu"

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** user-research (mục 4) · **Trạng thái:** Chưa làm – chờ chạy với 5 sinh viên · **Phụ trách:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt · **Cập nhật:** 20/11/2026

**Giả định A3** (`docs/discovery/05-vision.md`): con số "Hôm nay còn được tiêu" dễ hiểu hơn biểu đồ. **Đạt khi ≥ 4/5 sinh viên hiểu đúng trong 5 giây.**

Kết quả **không được điền trước**. Chỉ ghi sau khi thật sự hỏi 5 bạn, vào file mới từ mẫu `.agents/skills/user-research/templates/prototype-test.md`, đặt tên `A3-<yyyy-mm-dd>.md`.

## 1. Chuẩn bị

| Việc | Chi tiết |
| :--- | :--- |
| Prototype | `docs/design/prototype/home.html` – mở trên điện thoại (gửi file qua Zalo/Drive rồi mở bằng trình duyệt, hoặc mở link GitHub Pages nếu nhóm bật) |
| Trạng thái dùng để test | Mặc định (`#safe`): số `86.000đ` màu xanh |
| Người tham gia | 5 sinh viên **chưa từng xem** Ví Khéo, không phải thành viên nhóm; ưu tiên 2 bạn năm nhất (Persona Vy), 3 bạn ở trọ (Persona Minh) |
| Đồng hồ | Bấm giờ trên điện thoại thứ hai |
| Ghi chép | 1 người hỏi, 1 người ghi; không ghi tên, SĐT, MSSV |

## 2. Kịch bản (khoảng 3 phút mỗi người)

1. **Giới thiệu (đọc nguyên văn):** "Mình đang thử một màn hình app quản lý chi tiêu. Không có câu trả lời đúng hay sai, bọn mình đang kiểm tra màn hình, không kiểm tra bạn."
2. **Cho xem 5 giây:** đưa điện thoại, bấm giờ 5 giây, rồi úp màn hình xuống.
3. **Câu hỏi chính (đọc nguyên văn, không gợi ý):** "Con số to nhất trên màn hình nghĩa là gì?"
4. **Ghi gần nguyên văn câu trả lời.**
5. **Câu hỏi phụ** (sau khi đã ghi câu chính, cho xem lại màn hình):
   - "Nếu bây giờ bạn muốn mua ly trà sữa 30.000đ, bạn sẽ quyết định thế nào khi nhìn màn hình này?"
   - "Chỗ nào trên màn hình khó hiểu?"
6. **(Tuỳ chọn) Thử trạng thái vượt:** mở `home.html#over`, hỏi "Màu đỏ và dòng chữ nhỏ cho bạn biết điều gì?"

## 3. Cách chấm câu hỏi chính

| Chấm | Câu trả lời |
| :--- | :--- |
| **Đúng** | Nêu được ý "số tiền còn được tiêu **trong hôm nay**" hoặc "hôm nay chỉ nên tiêu thêm tối đa chừng này" |
| **Sai** | Hiểu là số dư trong ví/tài khoản, tổng đã tiêu, ngân sách cả tháng, hoặc không biết |
| Ghi chú | Trả lời "số tiền còn lại" mà **không** nói "hôm nay" → chấm **Sai**, ghi rõ nguyên văn để nhóm bàn |

## 4. Sau khi xong

1. Tạo `docs/evidence/prototype-tests/A3-<yyyy-mm-dd>.md` từ mẫu, ghi đúng/sai từng người.
2. Thêm một dòng vào `docs/discovery/00-research-log.md` mục S4.
3. Cập nhật trạng thái A3 trong `docs/discovery/05-vision.md`.
4. **Nếu < 4/5 đúng:** cặp UI/UX sửa nhãn trong `HomeScreen.md` (ví dụ thêm dòng "Tiêu thêm tối đa hôm nay") rồi test lại với 5 bạn khác, **trước** khi PO duyệt PRD US03.
