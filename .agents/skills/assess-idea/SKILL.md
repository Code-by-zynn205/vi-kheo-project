---
name: assess-idea
description: Đánh giá một ý tưởng hoặc đề xuất thiết kế của Ví Khéo bằng bằng chứng – giá trị cho sinh viên đo được, rủi ro gắn với tài liệu và code thật, chi phí so với thời hạn 13/12, phương án rẻ hơn, điều kiện "xong" kiểm được – rồi đưa MỘT đề xuất để người dùng / PO chốt trước khi làm. Dùng khi hỏi "ý tưởng này thế nào", "có nên thêm X", "nên làm A hay B", "có rủi ro gì", hoặc trước một thay đổi lớn, khó hoàn tác (đổi công thức, đổi mô hình dữ liệu, thêm màn hình, đổi thứ tự User Story). Không dùng để review diff (dùng requesting-code-review) hay kiểm chứng việc đã làm (dùng verify-change).
---

# Đánh giá ý tưởng bằng bằng chứng

Mỗi nhận định mang một nhãn: `[tài liệu]` hoặc `[code]` (kèm `file:dòng`), `[SƠ CẤP]` / `[THỨ CẤP]` (số liệu có trong `00-research-log.md`), hoặc `[NHẬN ĐỊNH]`. Nhận định không có nhãn thì bỏ.

## Cách làm

0. **Điều kiện vào:** đã có bản nhắc lại ý định (`restate-intent`) được người dùng xác nhận, và bản đồ (`feature-map`) cho khu bị đụng. Thiếu thì làm trước.
1. **Giá trị:** sinh viên được gì, đo bằng gì (số thao tác bớt đi, số giây ghi một khoản chi so với mục tiêu < 5 giây, giả định A1–A4 nào trong `05-vision.md` được kiểm). Không viết "tăng trải nghiệm".
2. **Rủi ro:** lập bảng `Rủi ro | Bằng chứng | Khả năng / Ảnh hưởng | Cách kiểm hoặc chặn`. Chỉ giữ rủi ro gắn với khu này. Rủi ro hay gặp trong dự án:

   | Nhóm | Câu hỏi phải trả lời |
   | :--- | :--- |
   | Phạm vi MVP | Có nằm trong Backlog đã duyệt không? Có đụng điều cấm ở `AGENTS.md` quy tắc 3 không? Chưa có → chuyển `product-discovery`, PO xét |
   | Thời hạn | Còn bao nhiêu ngày tới 03/12 (bản dùng thử) và 13/12 (demo)? Story nào trong `00-master-plan.md` bị đẩy lùi? |
   | Tiền | Đụng công thức không? Số nguyên VND, làm tròn, bảng test case `budget-logic` mục 4.4 có phải thêm dòng không? |
   | Dữ liệu trên máy | Cập nhật bản build, xoá app, đổi mô hình dữ liệu thì dữ liệu cũ của người dùng thử ra sao? Mã `E`/`BR` nào phải sửa? |
   | Giao diện | Có token, component sẵn trong `design-system` không? Đặc tả và Figma có phải sửa, ai duyệt? |
   | Cổng giai đoạn | Có làm PRD đã duyệt, ADR đã chấp nhận phải mở lại không? Câu Qx nào phải hỏi PO? |

3. **Phương án thay thế:** ít nhất một cách rẻ hơn, kể cả "dời sang R2" và "không làm". So sánh bằng bảng đánh đổi (`show-me`).
4. **Điều kiện xong:** mỗi dòng là một kiểm tra chạy được: AC Given/When/Then, test case có số cụ thể, lệnh trong `technical-design.md`, bước thử trên điện thoại thật (theo `verify-change`).
5. **Đề xuất:** một câu chốt, kèm **bước đầu nhỏ nhất** kiểm chứng giả định rủi ro nhất (thử trên prototype, hỏi 5 sinh viên, spike một buổi). Dừng, chờ chốt. Việc thuộc quyền PO (phạm vi, thứ tự, công thức) → ghi thành câu `Qx` qua `product-requirements` mục 4.2, không tự chốt.

## Khuôn trả lời

```
Đề xuất: <một câu>
Giá trị: … [SƠ CẤP]/[NHẬN ĐỊNH]
Rủi ro:  bảng ≤ 6 dòng
Thay thế: bảng đánh đổi ≤ 3 phương án
Xong khi: danh sách kiểm tra chạy được
Bước đầu: <thử nhỏ nhất> – chờ bạn / PO chốt
```

## Không được

- Liệt kê rủi ro chung chung ("bảo mật", "hiệu năng") không gắn vào file, mã quy tắc hay luồng cụ thể.
- Đưa nhiều phương án mà không chọn.
- Bịa số liệu người dùng để làm đẹp phần "Giá trị" (`AGENTS.md` quy tắc 2): chưa có thì ghi `Cần bổ sung`.
- Bắt tay viết tài liệu, code trước khi người dùng / PO chốt.
