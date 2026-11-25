# Màn hình `SplashScreen`

> **Giai đoạn:** 2 – Design System & Prototype · **Skill:** design-system (mục 4.4a) · **Trạng thái:** Xong – Nguyễn Diên Tiến chốt thay nhóm 26/11/2026; cặp UI/UX soát lại khi cập nhật Figma (`figma-gap-report.md` A18 – A21) · **Phụ trách:** Lê Thị Nhật Vy, Phạm Viết Hưng · **Cập nhật:** 26/11/2026

- **User Story:** US01 (chốt 26/11/2026, `06-journey-features.md`)
- **Sprint:** 2
- **Figma:** [trang Demo UI](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=116-1383) – `SplashScreen / Default` ở hàng `Onboarding – states` · đối chiếu lần cuối 21/11/2026 (bản AI dựng, chờ cặp UI/UX duyệt)
- **Prototype:** Chưa có – nối ở trang [Prototype](https://www.figma.com/design/r3QiOYkP7orX9dNyDEDmvl/V%C3%AD-Kh%C3%A9o?node-id=112-2259) khi mở rộng lên 18 luồng (`screen-inventory.md` mục 4)
- **Mở từ:** mở app

> Số liệu trong file là dữ liệu minh hoạ để dựng giao diện, không phải số liệu thật.

## 1. Bố cục (từ trên xuống)

1. Nền toàn màn `--color-primary`.
2. Ở giữa: khối logo 96 × 96, bo 28, nền `--color-bg-card`, `Icon` ví 48px màu `--color-primary`.
3. Chữ "Ví Khéo" kiểu Hero, màu `--color-on-primary`.
4. Câu phụ kiểu Body, màu `--color-primary-light`.

## 2. Trạng thái

| Trạng thái | Khi nào | Hiển thị |
| :--- | :--- | :--- |
| Mặc định | Từ lúc mở app tới khi đọc xong dữ liệu trên máy | Logo + tên + câu phụ; không có nút |

## 3. Thao tác

| Thao tác | Kết quả |
| :--- | :--- |
| Đọc dữ liệu xong, `onboardingDoneAt` rỗng | Sang `OnboardingScreen / FastEntry` (BR-120) – **từ US03**; trước khi có US03 luôn sang `HomeScreen` |
| Đọc dữ liệu xong, đã có `onboardingDoneAt` | Sang `HomeScreen` |

## 4. Chữ trên màn hình

| Vị trí | Chữ |
| :--- | :--- |
| Tên app | "Ví Khéo" |
| Câu phụ | "Biết hôm nay còn được tiêu bao nhiêu" |

## 5. Ngoài phạm vi

- Không có hiệu ứng động, quảng cáo, nút bấm.
- Không giữ màn lại cho đẹp: chỉ hiện trong thời gian đọc dữ liệu.
