# Màn hình `BudgetScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt và PO trả lời Q2, Q3 · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 20/11/2026

- **User Story:** US02
- **Sprint:** 2
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=106-187) – `BudgetScreen / NewMonthSuggestion`; trạng thái khác ở hàng `BudgetScreen – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** [trang Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) (Figma)
- **Mở từ:** tab `Ngân sách`; nút "Đặt ngân sách tháng" trên `HomeScreen`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Tiêu đề "Ngân sách tháng 11/2026" (20px/600).
2. **Thẻ gợi ý** (chỉ hiện khi tháng này chưa có ngân sách và tháng trước có – Q2): "Tháng trước bạn đặt 3.000.000đ" + nút phụ "Dùng lại số này".
3. Ô số tiền ngân sách (cỡ Hero), ví dụ `3.000.000đ`.
4. **Khung xem trước** (nền `--color-primary-light`): "Từ hôm nay đến hết tháng, mỗi ngày bạn được tiêu khoảng **100.000đ**." Dòng phụ: "Đã chi tháng này: 0đ · Còn 30 ngày".
5. Dòng cảnh báo (chỉ khi cần, mục 2).
6. Nút chính "Cập nhật ngân sách" rộng 100%, ngay trên `NumericKeypad`.
7. `NumericKeypad`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Chưa đặt, có tháng trước | Tháng mới | Thẻ gợi ý; ô số tiền trống; nút cập nhật vô hiệu |
| Chưa đặt, không có tháng trước | Lần đầu dùng app | Không có thẻ gợi ý; ô trống |
| Đã đặt | Có ngân sách tháng này | Ô hiện số hiện tại; sửa được; nút đổi chữ thành "Cập nhật ngân sách" |
| Không hợp lệ | Số tiền = 0 | Nút vô hiệu |
| Vượt mức | Gõ làm vượt 99.999.999 | Không nhận phím; dòng lỗi "Ngân sách tối đa 99.999.999đ" (Q3) |
| Thấp hơn số đã chi | Ngân sách < đã chi tháng này | Không chặn; dòng cảnh báo `--color-warning-text`: "Ngân sách thấp hơn số bạn đã chi tháng này (1.577.000đ)" |
| Đã lưu | Bấm cập nhật | `Snackbar` "Đã cập nhật ngân sách"; về `HomeScreen` nếu mở từ nút ở Home, ở lại nếu mở từ tab |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm "Dùng lại số này" | Điền số tháng trước vào ô; **chưa lưu** cho tới khi bấm "Cập nhật ngân sách" (BR-22) |
| Gõ số tiền | Khung xem trước tính lại ngay theo `budget-logic` 4.2 |
| Bấm "Cập nhật ngân sách" | Lưu (ghi đè nếu đã có – BR-20) |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tiêu đề | "Ngân sách tháng <mm/yyyy>" |
| Thẻ gợi ý | "Tháng trước bạn đặt <số tiền>" · nút "Dùng lại số này" |
| Xem trước | "Từ hôm nay đến hết tháng, mỗi ngày bạn được tiêu khoảng <số tiền>." |
| Dòng phụ xem trước | "Đã chi tháng này: <số tiền> · Còn <n> ngày" |
| Lỗi | "Ngân sách tối đa 99.999.999đ" |
| Cảnh báo | "Ngân sách thấp hơn số bạn đã chi tháng này (<số tiền>)" |
| Nút | "Cập nhật ngân sách" |
| Đã lưu | "Đã cập nhật ngân sách" |

## 5. Ngoài phạm vi

- Không phân bổ ngân sách theo danh mục (US14 – sau MVP).
- Không đặt ngân sách cho tháng tương lai hay quá khứ.
