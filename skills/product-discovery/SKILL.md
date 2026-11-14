---
name: product-discovery
description: Quy trình thực hiện Product Discovery cho dự án Ví Khéo dựa trên bằng chứng thực tế (khảo sát n=50, nghiên cứu thứ cấp, phân tích đối thủ) để xuất ra bộ tài liệu chuẩn hóa.
---

# Skill: Product Discovery – Ví Khéo

## 1. Mục tiêu
Chuẩn hóa toàn bộ dữ liệu nghiên cứu người dùng và thị trường thành các tài liệu Markdown (`.md`) có cấu trúc chặt chẽ, giúp AI Agent kiểm chứng tính nhất quán và sinh tiếp tài liệu kỹ thuật/mã nguồn cho các Sprint tiếp theo.

## 2. Nguyên tắc vận hành (Chống AI Slop)
- **Evidence-First (Ưu tiên bằng chứng):** Mọi nhận định về nỗi đau người dùng (Pain points) hoặc tính năng đề xuất BẮT BUỘC phải gắn liền với số liệu khảo sát thực tế (`n=50` sinh viên) hoặc nguồn nghiên cứu khoa học có trích dẫn.
- **Không suy diễn ngoài phạm vi:** Loại bỏ các tính năng phức tạp (liên kết ngân hàng, AI scan, đầu tư) để giữ vững giá trị cốt lõi "ghi chi tiêu dưới 5 giây".
- **Truy xuất nguồn gốc (Traceability):** Mọi User Story trong Product Backlog phải truy ngược được về câu hỏi *How Might We (HMW)* và điểm đau trong Persona.

## 3. Các mô-đun đầu ra bắt buộc (`docs/discovery/`)
1. `01-project-intake.md` – Ranh giới dự án, cơ cấu nhóm Scrum và ràng buộc thời gian (4 tuần).
2. `02-problem.md` – Tuyên bố vấn đề (Problem Statement), bối cảnh thực tế và số liệu nghiên cứu thứ cấp.
3. `03-personas.md` – Chân dung người dùng mục tiêu (User Personas) kèm trích dẫn thực tế.
4. `04-market.md` – Phân tích đối thủ cạnh tranh (Money Lover, Sổ Thu Chi MISA, ghi tay) và khoảng trống thị trường.
5. `05-vision.md` – Product Vision Board, mô hình vận hành (Blueprint) và các giả định cần kiểm chứng.
6. `06-journey-features.md` – Hành trình chi tiêu (Customer Journey), câu hỏi HMW, Generate Features (MoSCoW) và Product Backlog.
7. `07-roadmap.md` – Lộ trình triển khai 4 tuần (Sprint 0 – Sprint 3) và Definition of Done (DoD).
