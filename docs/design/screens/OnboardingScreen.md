# Màn hình `OnboardingScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Trạng thái:** Đang làm – chờ cặp UI/UX duyệt · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 21/11/2026

- **User Story:** Chưa có User Story riêng – đề xuất PO gắn vào US03 (hiểu con số "Hôm nay còn được tiêu")
- **Sprint:** 1 (Cần bổ sung – SM chốt)
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=116-1383) – `OnboardingScreen / FastEntry`, `/ DailyNumber`, `/ PrivacyOnDevice` ở hàng `Onboarding – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** Chưa có – nối ở trang [Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) khi mở rộng lên 18 luồng (`screen-inventory.md` mục 4)
- **Mở từ:** `SplashScreen` khi `onboardingDoneAt` rỗng (BR-120)

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Nút chữ "Bỏ qua" góc trên phải, màu `--color-text-secondary`, vùng bấm ≥ 48 × 48.
2. Hình minh hoạ: vòng tròn 180px nền `--color-primary-light`, `Icon` 80px màu `--color-primary` (mỗi trang một icon).
3. Tiêu đề kiểu Title, `--color-text-primary`, căn giữa.
4. Mô tả kiểu Body, `--color-text-secondary`, căn giữa.
5. `ProgressDots` 3 chấm, chấm của trang hiện tại màu `--color-primary`.
6. `Button` primary rộng 100% ở đáy.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| `FastEntry` | Trang 1 | Icon tia chớp; chấm 1; nút "Tiếp tục" |
| `DailyNumber` | Trang 2 | Icon mục tiêu; chấm 2; nút "Tiếp tục" |
| `PrivacyOnDevice` | Trang 3 | Icon ổ khoá; chấm 3; nút "Bắt đầu" |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Bấm "Tiếp tục" hoặc vuốt trái | Sang trang kế |
| Vuốt phải | Về trang trước |
| Bấm "Bắt đầu" (trang 3) | Sang `OnboardingBudgetScreen` |
| Bấm "Bỏ qua" ở bất kỳ trang nào | Ghi `onboardingDoneAt`; sang `HomeScreen` trạng thái `NO_BUDGET` (BR-120, BR-121) |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Trang 1 – tiêu đề | "Ghi một khoản chi trong 5 giây" |
| Trang 1 – mô tả | "Mở app, gõ số tiền, bấm Lưu. Danh mục Ăn uống được chọn sẵn." |
| Trang 2 – tiêu đề | "Luôn biết hôm nay còn được tiêu bao nhiêu" |
| Trang 2 – mô tả | "Ví Khéo chia ngân sách tháng thành hạn mức mỗi ngày và tự tính lại sau mỗi khoản chi." |
| Trang 3 – tiêu đề | "Dữ liệu chỉ nằm trên điện thoại của bạn" |
| Trang 3 – mô tả | "Không đăng nhập, không quảng cáo. Gỡ app sẽ mất dữ liệu." |
| Nút | "Tiếp tục" · "Bắt đầu" · "Bỏ qua" |

## 5. Ngoài phạm vi

- Không xin quyền thông báo ở đây (xin đúng ngữ cảnh ở `SettingsScreen`).
- Không có trang thứ 4, không có video hướng dẫn.
- Câu "Danh mục Ăn uống được chọn sẵn" phụ thuộc danh mục mặc định ở `AddExpenseScreen`; đổi ở đó thì sửa cả ở đây.
