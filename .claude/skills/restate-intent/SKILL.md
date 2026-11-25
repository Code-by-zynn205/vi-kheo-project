---
name: restate-intent
description: Nhắc lại yêu cầu bằng lời của chính mình (mục tiêu, trong và ngoài phạm vi, giả định, câu hỏi mở) rồi chờ người dùng xác nhận TRƯỚC khi phân tích sâu, viết tài liệu hay code. Dùng khi tin nhắn dài nhiều ý chưa sắp xếp hoặc gõ vội khó đọc; khi yêu cầu hiểu được nhiều cách ("giống Money Lover", "gọn hơn", "thêm vào", "tự động"); khi việc đụng nhiều file hoặc nhiều giai đoạn (Backlog, data-analysis, đặc tả màn hình, PRD, code); hoặc khi chính mình định làm khác lời người dùng nói. Không dùng cho việc nhỏ đã rõ (sửa chính tả, đổi một nhãn, câu hỏi chỉ đọc).
---

# Nhắc lại ý định trước khi làm

Hiểu sai ý tốn hơn mọi lỗi code hay lỗi tài liệu. Sửa ở bước này chỉ mất một câu trả lời của người dùng.

## Khi nào dùng

- Một tin nhắn nhiều ý, chưa sắp xếp, hoặc gõ thiếu dấu, sai chính tả đến mức phải đoán nghĩa.
- Tính năng, màn hình hoặc luồng mới; việc đụng nhiều tầng (Backlog → `data-analysis.md` → đặc tả → PRD → code).
- Có từ cần chốt nghĩa: "tích hợp", "tự động", "giống X", "gọn hơn", "thêm vào màn Home".
- Việc khó hoàn tác: đổi mã `E`/`BR`/`ERR`/`EC`, đổi công thức tính tiền, xoá file, đổi quyết định PO đã ghi.

## Cách làm

1. Đọc vừa đủ để nhắc lại có căn cứ: tìm tên màn hình, component, mã quy tắc thật trong `docs/` và `src/` (Glob, Grep), không đoán. **Chưa** bàn giải pháp.
2. Trả lời theo khuôn sau, tổng cộng ≤ 15 dòng:

   - **Mình hiểu là:** 1–2 câu bằng lời của mình, không chép lời người dùng.
   - **Mục tiêu:** kết quả người dùng nhìn thấy khi xong (file nào có gì, màn hình nào bấm được gì).
   - **Trong phạm vi:** những gì sẽ làm.
   - **Ngoài phạm vi:** những gì sẽ KHÔNG làm, gồm cả việc dễ làm lố. Đối chiếu `AGENTS.md` quy tắc 3 (không ngân hàng, OCR/AI, đầu tư, đăng nhập).
   - **Giả định:** mỗi dòng kèm căn cứ (`file:dòng`) hoặc ghi "chưa kiểm". Ghi rõ nếu việc bị chặn bởi cổng giai đoạn (`AGENTS.md` quy tắc 1: PRD chưa `Đã duyệt`, chưa có ADR).
   - **Câu hỏi mở:** tối đa 3, mỗi câu có sẵn phương án đề xuất để người dùng chỉ cần trả lời "ừ".

3. Dừng và chờ xác nhận. Trong lượt này không viết file, không commit.
4. Người dùng sửa thì cập nhật đúng phần bị sửa, rồi mới sang `feature-map`, `assess-idea`, `brainstorming` hoặc skill của nhóm.

## Không được

- Nhắc lại bằng cách chép nguyên văn hoặc liệt kê lại từng câu của người dùng: như vậy không chứng minh đã hiểu.
- Hỏi điều tự tra được trong `docs/`, `AGENTS.md` hoặc code.
- Hỏi quá 3 câu, hoặc hỏi mà không kèm phương án đề xuất.
- Lặng lẽ mở rộng phạm vi ("tiện thể sửa luôn PRD…") mà không đưa vào mục "Trong phạm vi".
