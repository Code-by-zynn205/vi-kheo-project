---
name: verify-change
description: Kiểm chứng một thay đổi trong Ví Khéo trước khi báo "xong", commit hay mở Pull Request – chọn đúng lệnh kiểm tra theo phần đã sửa (skill, tài liệu, code tính tiền, giao diện), thử trên điện thoại thật khi đổi giao diện, và báo cáo rõ phần nào đã chạy thật, phần nào chưa. Dùng sau khi sửa .agents/skills, docs/ hoặc src/. Không dùng cho câu hỏi chỉ đọc.
---

# Kiểm chứng thay đổi

Nguyên tắc chung ở `verification-before-completion`; skill này là bảng lệnh và khuôn báo cáo của Ví Khéo. "Đọc lại thấy đúng" chưa phải kiểm chứng. Chạy thật, rồi báo bằng kết quả lệnh.

## 1. Lệnh theo phần đã sửa

| Đã sửa | Kiểm tra |
| :--- | :--- |
| `.agents/skills/` | `bash scripts/sync-skills.sh` (chép sang `.claude/skills/`) rồi `git status` thấy cả 2 thư mục đổi |
| `docs/` | `bash scripts/sync-skills.sh --check` · mỗi con số mới có trong `00-research-log.md` · mỗi mã `E`/`BR`/`ERR`/`EC`/`Qx` dẫn tới có trong `data-analysis.md` · link tương đối mở được |
| `src/` | Lệnh test, lint, build ở `docs/architecture/technical-design.md`. Chưa có file đó → ghi vào "Chưa kiểm chứng", không tự đặt lệnh |
| Code tính tiền | Unit test đủ các dòng test case `budget-logic` mục 4.4 mà PRD dẫn tới; báo số test qua / tổng |
| Giao diện | Chạy trên **điện thoại thật** (Definition of Done điều 2), chụp ảnh cho PR; đối chiếu từng trạng thái trong đặc tả màn hình |

Lệnh lỗi thì sửa rồi chạy lại cả bảng của phần đó, không chỉ lệnh vừa lỗi.

## 2. Giao diện: thử thật, không thay bằng trình giả lập

- Trình duyệt máy tính, trình giả lập, prototype HTML không thay được điện thoại thật: bàn phím ảo, cỡ chữ hệ thống, vùng an toàn chỉ lộ ra trên máy thật.
- Kiểm từng AC của PRD: ghi `Đạt` / `Chưa đạt` kèm bước bấm.
- Dùng dữ liệu thử có số cụ thể (vd. ngân sách 3.000.000đ, chi 35.000đ), không dùng dữ liệu thật của người được khảo sát (`AGENTS.md` quy tắc 12).

## 3. Báo cáo

Kết thúc bằng:

- **Đã chạy:** từng lệnh + kết quả (vd. `bash scripts/sync-skills.sh --check` – "Kiểm tra xong: 30 skill, không có lỗi").
- **Chạy thật trên điện thoại:** máy nào, AC nào Đạt; ảnh chụp ở đâu.
- **Giả lập:** phần nào thử trên trình giả lập / trình duyệt và vì sao.
- **Chưa kiểm chứng:** việc chưa chạy thật – ghi "không có" nếu đủ.
