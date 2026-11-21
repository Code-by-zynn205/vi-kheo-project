# Màn hình `OnboardingBudgetScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 21/11/2026

- **User Story:** US02 (đặt ngân sách tháng) – bước đặt ngân sách lần đầu
- **Sprint:** 1 (Cần bổ sung – SM chốt)
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=116-1383) – `OnboardingBudgetScreen / Default` ở hàng `Onboarding – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** Chưa có – nối ở trang [Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) khi mở rộng lên 18 luồng (`screen-inventory.md` mục 4)
- **Mở từ:** nút "Bắt đầu" ở `OnboardingScreen / PrivacyOnDevice`

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Câu hỏi kiểu Title, `--color-text-primary`.
2. Câu phụ kiểu Body, `--color-text-secondary`.
3. Thẻ ô số tiền: viền 2px `--color-primary`; nhãn "Ngân sách tháng <mm/yyyy>" kiểu Caption; số tiền kiểu Hero (`AmountInput`).
4. Thẻ xem trước nền `--color-primary-light`: câu dẫn kiểu Body + hạn mức ngày kiểu Title màu `--color-primary`.
5. `Button` primary "Bắt đầu dùng".
6. Nút chữ "Để sau", căn giữa, `--color-text-secondary`.
7. `NumericKeypad` ở đáy.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Chưa nhập | Vừa mở | Ô số tiền trống; thẻ xem trước ẩn; "Bắt đầu dùng" vô hiệu |
| Đã nhập | Số tiền > 0 | Thẻ xem trước hiện hạn mức ngày, tính theo `budget-logic`; "Bắt đầu dùng" bật |
| Lỗi | Số tiền vượt giới hạn nhập của `AmountInput` | Như `BudgetScreen` |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Gõ số trên `NumericKeypad` | Cập nhật ô số tiền và thẻ xem trước ngay |
| Bấm "Bắt đầu dùng" | Lưu ngân sách tháng hiện tại; ghi `onboardingDoneAt`; sang `HomeScreen` |
| Bấm "Để sau" | Không lưu ngân sách; ghi `onboardingDoneAt`; sang `HomeScreen` trạng thái `NO_BUDGET` (BR-121) |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Câu hỏi | "Tháng này bạn có bao nhiêu để chi tiêu?" |
| Câu phụ | "Gồm tiền nhà gửi và tiền làm thêm. Sửa được bất cứ lúc nào." |
| Nhãn ô | "Ngân sách tháng <mm/yyyy>" |
| Xem trước | "Từ hôm nay, mỗi ngày bạn được tiêu khoảng" + "<số tiền>đ" |
| Nút | "Bắt đầu dùng" · "Để sau" |

Ví dụ trên Figma (3.000.000đ → khoảng 100.000đ/ngày) là minh hoạ. Code dùng công thức trong `budget-logic`, không chép số này.

## 5. Ngoài phạm vi

- Không nhập khoản thu, không chia ngân sách theo danh mục.
- Không hỏi số dư hiện có.
