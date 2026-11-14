# 05. Product Vision Board & Giả định cần Kiểm chứng

> **Giai đoạn:** GĐ1 – Discovery (Sprint 0) · **Trạng thái:** ✅ · **Phụ trách:** Dương Văn Hoan (PO) · **Cập nhật:** 14/11/2026

## 1. Product Vision Board (khung Roman Pichler)

> **Tầm nhìn:** Giúp sinh viên tự tin làm chủ đồng tiền ngay từ những năm đầu đại học.

| Nhóm mục tiêu | Nhu cầu | Sản phẩm | Mục tiêu dự án |
| :--- | :--- | :--- | :--- |
| Sinh viên 18–22 tuổi, sống xa nhà, nhận tiền gia đình hoặc làm thêm theo tháng | Biết tiền đi đâu · Không hết tiền trước cuối tháng · Ghi chép nhanh, không phiền | App di động tối giản: ghi nhanh · ngân sách tháng · "Hôm nay còn được tiêu" · báo cáo theo danh mục | MVP chạy được sau 3 Sprint (trước 13/12/2026) · **20** SV dùng thử · **≥ 50%** vẫn ghi chép sau 7 ngày |

*Con số 20 SV và 50% là mục tiêu nhóm tự đặt, có thể điều chỉnh theo góp ý của giảng viên.*

## 2. Mô hình vận hành

| Giai đoạn | Mô hình |
| :--- | :--- |
| **MVP (Sprint 1–3)** | App chạy độc lập trên máy, lưu dữ liệu cục bộ, không đăng nhập, miễn phí, không quảng cáo |
| **Sau MVP (ngoài phạm vi môn học)** | Chia tiền phòng trọ, chuỗi ngày ghi chép, xuất báo cáo, gợi ý ưu đãi quanh trường |

## 3. Giả định cần kiểm chứng

Mọi điều trên vẫn là **giả định**. Nhóm kiểm chứng bằng dữ liệu thật trước khi đầu tư nhiều công sức lập trình; giả định nào sai → điều chỉnh hướng sản phẩm sớm.

| # | Giả định | Cách kiểm chứng | Coi là đúng khi | Khi nào | Trạng thái |
| :-: | :--- | :--- | :--- | :--- | :--- |
| A1 | Nhiều SV thật sự hết tiền trước cuối tháng | Khảo sát online ≥ 50 SV | ≥ 60% xác nhận | Sprint 0 | ✅ **Đạt** – 34/50 (68%) |
| A2 | SV thích app đơn giản, không quảng cáo hơn app nhiều tính năng | Khảo sát (lý do bỏ app) + phỏng vấn sâu 5–8 SV | Đa số nêu rườm rà/quảng cáo là lý do bỏ app | Sprint 0 | 🔄 **Khảo sát ủng hộ** (lý do #1, #2 đều là rườm rà/quảng cáo); chờ đủ phỏng vấn |
| A3 | Con số "Hôm nay còn được tiêu" dễ hiểu hơn biểu đồ | Cho 5 SV xem bản HTML `HomeScreen` trong 5 giây | ≥ 4/5 hiểu đúng ngay | **Sprint 1** | ⬜ Chuyển từ Sprint 0 (nhóm không dùng Figma, test bằng bản HTML do AI sinh) |
| A4 | SV chịu ghi chép hằng ngày nếu thao tác đủ nhanh | Nhật ký 7 ngày (Sprint 0) + cho SV dùng MVP 7 ngày (Sprint 3) | ≥ 3/5 ghi đủ 7 ngày | Sprint 3 | ⬜ |

**Nếu A3 sai** (ít hơn 4/5 hiểu) → đổi nhãn/cách hiển thị con số trước khi làm US03 ở Sprint 2.
**Nếu A4 sai** → ưu tiên nhắc nhở (US05) và rút ngắn thao tác ghi hơn nữa trước khi thêm tính năng mới.
