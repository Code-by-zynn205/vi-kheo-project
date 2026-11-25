# Kiến trúc và quyết định công nghệ (giai đoạn 4 – chuẩn bị)

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 5) · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa, Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 20/11/2026

Tạo bằng skill `tech-decision`. Chưa có ADR nền tảng `Đã chấp nhận` và `technical-design.md` thì chưa viết plan code (AGENTS.md, quy tắc 1).

| File | Mẫu |
| :--- | :--- |
| `ADR-xx-<english-slug>.md` – mỗi quyết định một file | `.agents/skills/tech-decision/templates/adr.md` |
| `technical-design.md` – công nghệ, thư mục, dữ liệu, lệnh | `.agents/skills/tech-decision/templates/technical-design.md` |

## Danh sách ADR

| ADR | Câu hỏi | Trạng thái | Ngày |
| :--- | :--- | :--- | :--- |
| [ADR-01](ADR-01-app-platform.md) | App chạy trên nền tảng nào? – React Native (Expo) + TypeScript, Android trước | Đã chấp nhận | 26/11/2026 |
| [ADR-02](ADR-02-local-storage.md) | Lưu dữ liệu trên máy bằng cách nào? – SQLite qua `expo-sqlite`, đám mây để R3 | Đã chấp nhận | 26/11/2026 |
| [ADR-03](ADR-03-trial-distribution.md) | Phát hành bản dùng thử bằng cách nào? – đề xuất EAS Build ra APK, một khoá ký do EAS giữ | Đề xuất – chờ Developers duyệt | 26/11/2026 |

Thiết kế kỹ thuật: [technical-design.md](technical-design.md) – Đang làm.
