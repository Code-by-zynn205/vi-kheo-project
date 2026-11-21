---
name: prioritization-frameworks
description: "Tài liệu tham chiếu 9 khung ưu tiên (prioritization frameworks) kèm công thức, hướng dẫn khi nào nên dùng và mẫu biểu — RICE, ICE, Kano, MoSCoW, Opportunity Score và nhiều phương pháp khác. Dùng khi chọn phương pháp xếp hạng ưu tiên, so sánh các khung như RICE vs ICE, hoặc tìm hiểu cách các phương pháp ưu tiên hoạt động."
---

# Skill: Tham chiếu Các Khung Ưu tiên (Prioritization Frameworks)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [phuryn/pm-skills](https://github.com/phuryn/pm-skills/blob/main/pm-execution/skills/prioritization-frameworks/SKILL.md) (phuryn).

## Tham chiếu Các Khung Ưu tiên

Tài liệu tham chiếu giúp bạn lựa chọn và áp dụng đúng khung xếp hạng ưu tiên cho bối cảnh của mình.

### Nguyên tắc cốt lõi

Không bao giờ để khách hàng tự thiết kế giải pháp. Hãy ưu tiên **các vấn đề (cơ hội - opportunities)**, không phải các tính năng.

Khi một nhóm cùng chấm điểm hoặc xếp hạng các mục, hãy thu thập phiếu bầu một cách độc lập trước khi thảo luận, để ý kiến của người có thâm niên cao nhất không tạo hiệu ứng neo tâm lý cho những người còn lại (skill `live-polls` hỗ trợ bỏ phiếu chấm điểm - dot voting và bỏ phiếu mức độ tự tin).

### Opportunity Score (Dan Olsen, *The Lean Product Playbook*)

Khung được khuyến nghị để xếp hạng ưu tiên các vấn đề của khách hàng.

Khảo sát khách hàng về **Mức độ quan trọng (Importance)** và **Mức độ hài lòng (Satisfaction)** cho từng nhu cầu (chuẩn hóa về thang đo 0–1).

Ba công thức liên quan:
- **Giá trị hiện tại (Current value)** = Importance × Satisfaction
- **Opportunity Score** = Importance × (1 − Satisfaction)
- **Giá trị khách hàng tạo thêm (Customer value created)** = Importance × (S2 − S1), trong đó S1 = mức độ hài lòng trước đó, S2 = mức độ hài lòng sau đó

Mức độ quan trọng cao + Mức độ hài lòng thấp = Opportunity Score cao nhất = cơ hội tốt nhất. Biểu diễn trên biểu đồ Importance vs Satisfaction — góc phần tư phía trên bên trái là vùng tối ưu (sweet spot). Phương pháp này ưu tiên vấn đề của khách hàng, không phải giải pháp.

### Khung ICE (ICE Framework)

Hữu ích để ưu tiên các sáng kiến và ý tưởng. Xem xét không chỉ giá trị mà còn cả rủi ro và các yếu tố kinh tế.

- **I** (Impact - Tác động) = Opportunity Score × Số lượng khách hàng bị ảnh hưởng
- **C** (Confidence - Mức độ tự tin) = Chúng ta tự tin đến mức nào? (1–10). Tính đến yếu tố rủi ro.
- **E** (Ease - Độ dễ triển khai) = Triển khai dễ dàng đến mức nào? (1–10). Tính đến yếu tố kinh tế/chi phí.

**Score** = I × C × E. Điểm càng cao = ưu tiên làm trước.

### Khung RICE (RICE Framework)

Tách yếu tố Impact của ICE thành hai thành phần riêng biệt. Hữu ích cho các đội ngũ lớn hơn cần độ chi tiết cao hơn.

- **R** (Reach - Độ phủ) = Số lượng khách hàng bị ảnh hưởng
- **I** (Impact - Tác động) = Opportunity Score (giá trị trên mỗi khách hàng)
- **C** (Confidence - Mức độ tự tin) = Chúng ta tự tin đến mức nào? (0–100%)
- **E** (Effort - Công sức) = Tốn bao nhiêu công sức để triển khai? (person-months / tháng-người)

**Score** = (R × I × C) / E

### Tổng quan 9 Khung Ưu tiên

| Khung ưu tiên | Phù hợp nhất cho | Điểm mấu chốt |
|---------------|------------------|---------------|
| Eisenhower Matrix | Công việc cá nhân | Khẩn cấp vs Quan trọng — dùng cho quản lý công việc cá nhân của PM |
| Impact vs Effort | Tác vụ/sáng kiến | Ma trận 2×2 đơn giản — phân loại nhanh, không đủ chặt chẽ cho các quyết định chiến lược |
| Risk vs Reward | Sáng kiến | Tương tự Impact vs Effort nhưng có tính đến yếu tố bất định |
| **Opportunity Score** | Vấn đề của khách hàng | **Được khuyến nghị.** Importance × (1 − Satisfaction). Chuẩn hóa về thang 0–1. |
| Kano Model | Thấu hiểu kỳ vọng | Must-be, Performance, Attractive, Indifferent, Reverse. Dùng để thấu hiểu, không dùng để xếp hạng ưu tiên. |
| Weighted Decision Matrix | Quyết định đa yếu tố | Gán trọng số cho các tiêu chí, chấm điểm từng lựa chọn. Hữu ích để lấy đồng thuận từ các bên liên quan. |
| **ICE** | Ý tưởng/sáng kiến | Impact × Confidence × Ease. Khuyến nghị để xếp hạng ưu tiên nhanh. |
| **RICE** | Ý tưởng ở quy mô lớn | (Reach × Impact × Confidence) / Effort. Bổ sung Reach vào ICE. |
| MoSCoW | Yêu cầu (Requirements) | Must/Should/Could/Won't. Lưu ý: xuất phát từ quản lý dự án truyền thống. |

### Mẫu biểu (Templates)

- [Opportunity Score intro (PDF)](https://drive.google.com/file/d/1ENbYPmk1i1AKO7UnfyTuULL5GucTVufW/view)
- [Importance vs Satisfaction Template — Dan Olsen (Google Slides)](https://docs.google.com/presentation/d/1jg-LuF_3QHsf6f1nE1f98i4C0aulnRNMOO1jftgti8M/edit#slide=id.g796641d975_0_3)
- [ICE Template (Google Sheets)](https://docs.google.com/spreadsheets/d/1LUfnsPolhZgm7X2oij-7EUe0CJT-Dwr-/edit?usp=share_link&ouid=111307342557889008106&rtpof=true&sd=true)
- [RICE Template (Google Sheets)](https://docs.google.com/spreadsheets/d/1S-6QpyOz5MCrV7B67LUWdZkAzn38Eahv/edit?usp=sharing&ouid=111307342557889008106&rtpof=true&sd=true)

---

### Tài liệu đọc thêm

- [The Product Management Frameworks Compendium + Templates](https://www.productcompass.pm/p/the-product-frameworks-compendium)
- [Kano Model: How to Delight Your Customers Without Becoming a Feature Factory](https://www.productcompass.pm/p/kano-model-how-to-delight-your-customers)
- [Continuous Product Discovery Masterclass (CPDM)](https://www.productcompass.pm/p/cpdm) (khóa học video)
