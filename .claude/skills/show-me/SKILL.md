---
name: show-me
description: Trình bày cấu trúc, luồng dữ liệu, trạng thái hoặc lựa chọn bằng hình nhỏ gọn nhất (cây, sơ đồ tuần tự, state chart, bảng đánh đổi, phác thảo giao diện ASCII) thay vì đoạn văn dài. Dùng khi giải thích một luồng nhiều bước (ghi khoản chi → lưu → tính lại hạn mức ngày), đề xuất thiết kế, so sánh phương án công nghệ, giải thích cho thành viên mới, hoặc khi người dùng nói "vẽ", "cho xem", "sơ đồ", "luồng chạy thế nào". Không dùng cho câu trả lời chỉ có một ý.
---

# Cho xem thay vì kể

## Chọn hình theo câu hỏi

| Câu hỏi | Hình |
| :--- | :--- |
| Có những gì, nằm ở đâu | Cây (thư mục, màn hình, component, thực thể) |
| Dữ liệu đi qua đâu (màn hình → logic → lưu trữ) | Sơ đồ tuần tự; mỗi mũi tên ghi tên hàm / sự kiện |
| Một thứ có những trạng thái nào, chuyển khi nào | State chart: trạng thái + sự kiện, có cả trạng thái lỗi / huỷ / trống |
| Chọn A hay B | Bảng đánh đổi: hàng = phương án, cột = tiêu chí, có dòng đề xuất |
| Giao diện sẽ trông ra sao | Phác thảo ASCII (bố cục lấy theo đặc tả màn hình, không tự nghĩ) |

## Quy tắc

- Mỗi hộp / mũi tên mang tên thật: màn hình, component trong `docs/design/screens/`, mã `E`/`BR`/`ERR` trong `data-analysis.md`, hàm trong `src/`. Dưới hình ghi `file:dòng` cho những mục quan trọng.
- Tách **hiện có** và **đề xuất**: phần mới đánh dấu `[MỚI]`. Phần chưa chốt (ADR chưa có, Qx chưa trả lời) ghi `[chưa chốt]`.
- Luồng nào cũng phải có đường lỗi: nhập sai (mã `ERR_…`), danh sách trống, người dùng huỷ, tắt app giữa chừng.
- Cỡ hình: ≤ 25 dòng và ≤ 9 hộp. Lớn hơn thì tách thành một hình tổng quan và một hình phóng to.
- Định dạng: trong chat (VSCode / terminal) dùng ASCII trong khối ``` vì Mermaid có thể không hiển thị; trong `docs/*.md` dùng Mermaid. Hình lớn hoặc cần gửi cả nhóm thì làm trang riêng nếu agent có công cụ (Claude Code: skill `artifact-diagramming`).
- Sau hình chỉ thêm tối đa 3 dòng chữ, cho những điều hình không nói được.

## Ví dụ: sơ đồ tuần tự, hiện có + chưa chốt

```
Sinh viên   AddExpenseScreen        Lớp lưu trữ [chưa chốt – ADR-02]   HomeScreen
   │ gõ 35000  │                            │                             │
   │──────────>│ hiện 35.000đ, nút Lưu bật  │                             │
   │ bấm Lưu   │                            │                             │
   │──────────>│ ghi E01 Transaction ──────>│                             │
   │           │<──────────── đã lưu ───────│                             │
   │           │ đóng sheet ───────────────────────────────────────────> │ tính lại DailyAllowanceCard
   │                                                                     │ (công thức 10.1, budget-logic 4.2)
Lỗi: gõ vượt 99.999.999 → không nhận phím, hiện "Số tiền tối đa 99.999.999đ" (ERR_AMOUNT_MAX)
```

`AddExpenseScreen.md` mục 2 · `data-analysis.md` mục 10, 12

## Không được

- Vẽ hộp mang tên chung chung ("Service", "Database", "AI") không có trong tài liệu hay code.
- Vẽ chỉ đường thành công.
- Viết lại bằng chữ dài những gì hình đã thể hiện.
