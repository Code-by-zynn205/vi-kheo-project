# Ví Khéo – Ứng dụng quản lý chi tiêu tối giản cho sinh viên

Dự án môn **Chuyên đề 3 (IT): Quản lý dự án với Agile/Scrum** · Giảng viên: **Nguyễn Thanh Yên Tùng**
Nhóm **Messi** – 10 thành viên: PO Dương Văn Hoan · SM Trần Ninh Nhật Tân · 8 Developers

> **Sản phẩm trong một câu:** Ghi một khoản chi trong dưới 5 giây và luôn biết *"Hôm nay còn được tiêu bao nhiêu"*.

---

## 1. Các giai đoạn dự án

| Giai đoạn | Sprint | Thời gian | Mục tiêu | Trạng thái |
| :--- | :--- | :--- | :--- | :---: |
| **GĐ1 – Discovery** | Sprint 0 | 07/11 – 14/11/2026 | Vấn đề, người dùng, thị trường, tầm nhìn, Backlog, bộ Skill AI | Xong (còn mục Cần bổ sung) |
| **GĐ2 – Xây dựng MVP** | Sprint 1 | 15/11 – 23/11/2026 | US01: ghi khoản chi + 6 danh mục + lưu trên máy | Đang làm |
| | Sprint 2 | 24/11 – 03/12/2026 | US02, US03, US07: ngân sách tháng, khoản thu, "Hôm nay còn được tiêu"; bản build dùng thử | Chưa làm |
| | Sprint 3 | 04/12 – 12/12/2026 | US04, US05, US06: báo cáo, nhắc nhở, sửa/xoá | Chưa làm |
| **GĐ3 – Kiểm chứng & Demo** | Trong Sprint 3 | 04/12 – 13/12/2026 | SV dùng thử 7 ngày (04/12 – 10/12), đo giả định A4, demo, báo cáo tổng kết | Chưa làm |

**Quy ước dùng trong toàn bộ tài liệu**

| Trạng thái | Ý nghĩa | | Nguồn dữ liệu | Ý nghĩa |
| :--- | :--- | :-: | :--- | :--- |
| Xong | Đã xong, có bằng chứng | | `[SƠ CẤP]` | Nhóm tự thu thập (Google Form, phỏng vấn, nhật ký) |
| Đang làm | Đang thực hiện | | `[THỨ CẤP]` | Tài liệu đã công bố, có trích dẫn và link |
| Chưa làm | Chưa bắt đầu | | `[NHẬN ĐỊNH]` | Ý kiến/giả thuyết của nhóm, **chưa** là số liệu |
| Cần bổ sung | Cần đối chiếu hoặc bổ sung bằng chứng | | | |

---

## 2. Cấu trúc thư mục

```
vi-kheo-project/
├── README.md                    ← bạn đang đọc
├── CONTRIBUTING.md              ← quy trình nhánh, commit, review
├── skills/                      ← 6 Skill cho AI Agent (xem skills/README.md)
│   ├── user-research/           GĐ1 · Cặp Nghiên cứu người dùng
│   ├── product-discovery/       GĐ1 · PO + cả nhóm
│   ├── design-system/           GĐ2 · Cặp UI/UX
│   ├── frontend-ui/             GĐ2 · Cặp Lập trình giao diện
│   ├── budget-logic/            GĐ2 · Cặp Lập trình dữ liệu
│   └── scrum-sprint/            Xuyên suốt · Scrum Master
└── docs/
    ├── discovery/               ← 8 tài liệu Discovery (00 → 07)
    ├── sprints/                 ← báo cáo từng Sprint (làm được gì, ai làm)
    └── evidence/                ← ảnh chụp/link bằng chứng gốc
```

---

## 3. Tra cứu nhanh

| Cần xem | Mở file |
| :--- | :--- |
| Nhóm đã nghiên cứu gì, dữ liệu lấy từ đâu (tự thu thập hay tài liệu công bố) | [docs/discovery/00-research-log.md](docs/discovery/00-research-log.md) |
| Tuần này nhóm đã làm được gì | [docs/sprints/sprint-0-review.md](docs/sprints/sprint-0-review.md) |
| Có những Skill nào, mỗi Skill gồm thành phần gì, ai phụ trách | [skills/README.md](skills/README.md) |
| Problem Statement (vấn đề) | [docs/discovery/02-problem.md](docs/discovery/02-problem.md) |
| Persona (chân dung người dùng) | [docs/discovery/03-personas.md](docs/discovery/03-personas.md) |
| Generate Features (sinh tính năng từ vấn đề) và Product Backlog | [docs/discovery/06-journey-features.md](docs/discovery/06-journey-features.md) |
| Lộ trình và Definition of Done | [docs/discovery/07-roadmap.md](docs/discovery/07-roadmap.md) |

---

## 4. Công cụ

| Việc | Công cụ |
| :--- | :--- |
| Quản lý Sprint, thẻ công việc | Trello |
| Tài liệu, Skill AI, mã nguồn | GitHub (repo này) |
| Khảo sát | Google Form + Google Sheets |
| Thiết kế giao diện | **Không dùng Figma** – AI sinh giao diện trực tiếp từ `skills/design-system` |
| Slide báo cáo | Canva |
