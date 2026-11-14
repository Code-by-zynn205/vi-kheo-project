# 03. Persona – Chân dung Người dùng

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0) · **Trạng thái:** 🔄 (chờ thay trích dẫn thật) · **Phụ trách:** Nguyễn Thị Thương, Nguyễn Tuấn Kiệt · **Cập nhật:** 14/11/2026

Persona là **nhân vật đại diện** do nhóm xây dựng từ khảo sát (n = 50) và các buổi phỏng vấn, **không phải một người cụ thể**. Khi ra quyết định tính năng, cả nhóm hỏi: *"Minh có cần cái này không?"*

| | Persona 1 (chính) | Persona 2 (phụ) |
| :--- | :--- | :--- |
| **Tên** | Nguyễn Hoàng Minh | Trần Thảo Vy |
| **Tuổi / năm học** | 20 – SV năm 2 ngành CNTT | 18 – SV năm 1 |
| **Nơi ở** | Ở trọ cùng bạn tại Đà Nẵng | Ký túc xá |
| **Thu nhập/tháng** | Gia đình 2,5 tr + làm thêm cuối tuần ~1,2 tr (≈ 3,7 tr) | Gia đình 2,5 tr, chưa làm thêm |
| **Đại diện cho** | 58% SV từng bỏ app chi tiêu (S1) | SV năm nhất mới tự quản lý tiền |

---

## Persona 1 (chính): Nguyễn Hoàng Minh – sinh viên ở trọ tự lập

**Trích dẫn** 🟡 *thay bằng câu nói thật, ghi mã biên bản:*
> "Mình từng tải app quản lý chi tiêu về dùng được 3 hôm là xoá, vì mỗi lần mua ly trà sữa hay gửi xe 5 nghìn mà mở app lên bấm mấy bước mới lưu được thì lười lắm, với lại toàn hiện quảng cáo." – (PV-__)

**Mục tiêu**
- G1. Đủ tiền tiêu đến cuối tháng, không âm tiền tuần cuối.
- G2. Để dành 300.000 – 500.000đ/tháng phòng ốm đau, hư xe.

**Điểm đau**

| Mã | Điểm đau | Nguồn |
| :--- | :--- | :--- |
| P1 | Chi lặt vặt bằng cả tiền mặt và QR, cuối tháng không nhớ tiền đi đâu | S1 (76% không ghi chép) · PV |
| P2 | Ngại nhập liệu nhiều bước, bị quảng cáo làm phiền → bỏ app | S1 (lý do bỏ app #1, #2) |
| P3 | Không biết hôm nay tiêu vậy là lố ngân sách hay chưa | PV |

**Thói quen công nghệ:** dùng điện thoại cả ngày, trả tiền mặt + quét QR, thích app mở lên dùng ngay, không muốn đăng ký tài khoản.

---

## Persona 2 (phụ): Trần Thảo Vy – sinh viên năm nhất ở ký túc xá

**Trích dẫn** 🟡 *thay bằng câu nói thật, ghi mã biên bản:*
> "Đầu tháng mới nhận tiền mình hay mua sắm với đi ăn với bạn bè hơi quá tay, đến ngày 20 nhìn lại ví mới giật mình vì chỉ còn vài trăm nghìn." – (PV-__)

**Mục tiêu**
- G3. Biết mỗi ngày nên tiêu tối đa bao nhiêu để đủ sống đến lần nhận tiền sau.

**Điểm đau**

| Mã | Điểm đau | Nguồn |
| :--- | :--- | :--- |
| P4 | Chưa biết chia ngân sách tháng thành hạn mức ngày | T1 (26,6% đúng câu lập kế hoạch) · PV |
| P5 | Biểu đồ tài chính trong app khó hiểu, không giúp quyết định "có nên mua món này không" | PV · `[NHẬN ĐỊNH]` N2 |
| P6 | Tiêu nhiều đầu tháng, hụt tiền từ khoảng ngày 20 | S1 (68% từng hết tiền) · PV |

---

## Việc cần làm để hoàn tất `[cuối Sprint 0 → Sprint 1]`
- [ ] Thay 2 trích dẫn bằng câu nói thật từ biên bản `docs/evidence/interviews/PV-xx.md`, ghi mã PV
- [ ] Cột "Nguồn" ghi `PV` → đổi thành mã cụ thể (`PV-01`, `PV-02`…)
- [ ] Nếu phỏng vấn cho thấy điểm đau mới hoặc điểm đau nào không đúng → sửa bảng và báo PO
