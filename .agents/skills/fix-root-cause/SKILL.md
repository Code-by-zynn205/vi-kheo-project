---
name: fix-root-cause
description: Sửa lỗi trong Ví Khéo (code, tài liệu, skill) bằng cách tìm nguyên nhân gốc rồi chặn tái diễn bằng thứ máy kiểm được (thiết kế, unit test, script kiểm tra) thay vì thêm một dòng nhắc vào AGENTS.md / memory. Dùng khi sửa bug, khi một lỗi lặp lại lần thứ hai (tính sai tiền, sai định dạng file, thiếu dòng Skill, viết cứng màu), hoặc khi định ghi thêm một "lưu ý" mới vào AGENTS.md. Không dùng cho thay đổi tính năng thuần không có lỗi.
---

# Sửa tận gốc, chặn bằng máy

Tìm nguyên nhân bằng `systematic-debugging`; skill này quyết định **chặn ở đâu** để lỗi không quay lại.

## Thứ tự ưu tiên (cao → thấp)

1. **Thiết kế:** làm cho cách sai không viết ra được (vd. một hàm định dạng tiền dùng chung thay vì tự ghép `"đ"` ở từng màn hình; token màu thay vì mã hex).
2. **Test / script kiểm tra:** máy kiểm mỗi lần chạy, thông báo lỗi phải nói **cách sửa đúng**.
3. **Kiểm thử chạy thật:** bước thử trên điện thoại thật ghi vào checklist PR.
4. **Chữ** (`AGENTS.md`, skill, memory): chỉ khi việc cần phán đoán, không kiểm bằng máy được. Sửa / gộp dòng có sẵn trước khi thêm dòng mới.

## Quy trình

1. Tìm nguyên nhân gốc trước khi sửa, tái hiện bằng dữ liệu cụ thể (số tiền, ngày, file, lệnh).
2. Viết test **đỏ với hành vi cũ** (tạm đảo bản sửa để chứng minh), rồi sửa cho xanh.
3. Thêm guardrail ở tầng cao nhất có thể (bảng dưới).
4. **Nhổ cỏ:** grep cùng mẫu lỗi trên cả repo và sửa luôn.
5. Báo cáo: **Nguyên nhân** (1–2 câu) · **Guardrail đã thêm** (file test / kiểm tra) · **Chỗ tương tự đã dọn**.

## Nơi đặt guardrail trong dự án

| Loại lỗi | Nơi |
| :--- | :--- |
| Tính tiền, hạn mức ngày, làm tròn | Unit test theo `budget-logic`; thêm dòng mới vào bảng test case mục 4.4 (số cụ thể) |
| Skill thiếu mục, thiếu mẫu, file thiếu dòng `**Skill:**`, tên file không phải tiếng Anh | `scripts/sync-skills.sh` (chạy `--check`) |
| Viết cứng màu, cỡ chữ, font (`AGENTS.md` quy tắc 7) | Lint / test trong `src/` theo `technical-design.md` – chưa có thì đề xuất thêm vào `technical-design.md` |
| Tên trường, enum, mã lỗi lệch `data-analysis.md` | Hằng số dùng chung trong code + test so với `data-analysis.md` mục 4, 7, 12 |
| Lỗi chỉ thấy trên điện thoại thật | Bước thử trong mô tả PR (`frontend-ui/templates/pr-description.md`) |

Ví dụ đã làm: nhiều file quên dòng `**Skill:**` → không thêm lời nhắc, mà thêm bước 3 vào `scripts/sync-skills.sh` báo lỗi kèm cách sửa.

## Không được

- Sửa số mong đợi trong test cho khớp kết quả sai. Số trong test lấy từ `budget-logic`; số sai ở đó thì sửa skill qua PR, PO duyệt.
- `setTimeout` / delay để che lỗi thời điểm; `try/catch` nuốt lỗi; cờ tạm để né.
- Comment biện minh cho cách vá tạm. Comment **được giữ**: bất biến không hiển nhiên, mã quy tắc nguồn (`BR-xx`, `TCxx`).
- Thêm dòng "lưu ý" vào `AGENTS.md` cho lỗi mà script hoặc test bắt được.
