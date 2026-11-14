---
name: design-system
description: Design system và đặc tả giao diện của Ví Khéo, gồm token màu/chữ/khoảng cách, định dạng tiền, 6 danh mục chuẩn, data model, công thức "Hôm nay còn được tiêu", component và 4 màn hình (Home, AddExpense, Budget, Report). Dùng khi viết hoặc review code giao diện Ví Khéo, tạo component hay màn hình mới, chọn màu/font/khoảng cách, định dạng số tiền, cài đặt logic tính hạn mức ngày, hoặc kiểm tra một màn hình có đạt tiêu chí 1 của DoD không.
---

# Design System & UI Spec – Ví Khéo

## 0. Cách dùng

- Đây là nguồn chuẩn cho giao diện và logic hiển thị. Code chỉ dùng giá trị trong token §3, không tự đặt mã màu, cỡ chữ hay khoảng cách mới.
- Chỉ dựng màn hình và tính năng có User Story trong `docs/discovery/06-journey-features.md` §4. Danh sách ngoài phạm vi ở §9.
- Hành vi màn hình phải thỏa mãn Acceptance Criteria ở `06 §5`. Spec này và AC mâu thuẫn thì dừng lại, báo cho người dùng.
- Thay đổi nghiệp vụ (danh mục, công thức, phạm vi) thì sửa tài liệu discovery theo skill `product-discovery` trước, rồi mới sửa file này.

## 1. Tech stack: React Native

## 2. Nguyên tắc thiết kế

- **Tốc độ:** mục tiêu ghi 1 khoản chi dưới 5 giây, đo từ lúc bấm `+ Ghi khoản chi` tới lúc bấm `Lưu khoản chi`. Đây là mục tiêu thiết kế, chặt hơn kỳ vọng dưới 10 giây của 82% (41/50) sinh viên khảo sát (`02 §4`). Gõ xong số tiền thì chỉ cần tối đa 2 lần chạm: chọn danh mục (bỏ qua nếu giữ mặc định) và bấm Lưu.
- **Zero Clutter:** màn hình chính chỉ có một con số chính là **"Hôm nay còn được tiêu"**. Không đặt biểu đồ trên màn hình chính.
- **Thumb-friendly:** nút hành động chính và bàn phím số nằm ở nửa dưới màn hình. Mọi vùng chạm tối thiểu `48 × 48px`.

## 3. Design tokens

### Màu giao diện
| Token | Giá trị | Dùng cho |
| :--- | :--- | :--- |
| `--color-primary` | `#4F46E5` | Nút chính, FAB `+ Ghi khoản chi`, tab đang chọn |
| `--color-primary-light` | `#EEF2FF` | Nền thẻ ngân sách, chip danh mục đang chọn |
| `--color-success` | `#10B981` | Trạng thái an toàn (ngưỡng ở §6) |
| `--color-warning` | `#F59E0B` | Sắp chạm hạn mức (ngưỡng ở §6) |
| `--color-danger` | `#EF4444` | Vượt hạn mức; số tiền khoản chi `-` |
| `--color-bg-page` | `#F9FAFB` | Nền ứng dụng |
| `--color-bg-card` | `#FFFFFF` | Nền Card, Bottom Sheet |
| `--color-text-primary` | `#111827` | Tiêu đề, số tiền chính |
| `--color-text-secondary` | `#6B7280` | Nhãn mô tả, ngày giờ |
| `--color-border` | `#E5E7EB` | Đường phân cách |

Màu của từng danh mục nằm ở §4.

### Typography
- **Font:** `'Inter', 'Roboto', sans-serif` (đủ dấu tiếng Việt). Mọi con số dùng chữ số đều độ rộng (tabular) để không bị nhảy khi giá trị thay đổi.
- **Hero Metric:** `36px`, weight `700`, line-height `1.1`.
- **Screen Title:** `20px`, weight `600`.
- **Section Heading:** `16px`, weight `600`.
- **Body:** `14px`, weight `400`.
- **Caption:** `12px`, weight `400`.

### Spacing, bo góc, đổ bóng
- Khoảng cách theo bội số của 4: `4, 8, 12, 16, 24, 32px`.
- Page padding trái/phải `16px` · Card padding `16px`.
- Bo góc Card `16px` · bo góc Button/Input `12px`.
- Shadow `0 1px 3px rgba(0, 0, 0, 0.08)`.

### Định dạng hiển thị
- **Tiền:** số nguyên, dấu chấm phân tách hàng nghìn, ký hiệu `₫` viết liền ngay sau, ví dụ `86.000₫`. Khoản chi hiển thị `-30.000₫`. Không dùng `đ`, `VND` hay số thập phân.
- **Phần trăm:** làm tròn đến số nguyên, ví dụ `45%`.
- **Giờ:** `HH:mm` (24 giờ) · **Ngày:** `dd/MM/yyyy`.

## 4. 6 danh mục chuẩn (cố định trong MVP)

| `id` | Nhãn trên chip | Gồm các khoản | Icon (tên trong Lucide) | Màu |
| :--- | :--- | :--- | :--- | :--- |
| `food` | Ăn uống | ăn sáng, cơm, cà phê, trà sữa | `utensils` | `#F97316` |
| `transport` | Di chuyển | xăng, gửi xe | `bike` | `#0EA5E9` |
| `housing` | Nhà trọ & Điện nước | tiền trọ, điện, nước | `house` | `#8B5CF6` |
| `study` | Học tập | tài liệu, photo | `book-open` | `#14B8A6` |
| `shopping` | Mua sắm & Sinh hoạt | đồ dùng cá nhân, mua sắm | `shopping-cart` | `#EC4899` |
| `other` | Khác | các khoản còn lại | `ellipsis` | `#94A3B8` |

- `id` dùng trong code và dữ liệu, không bao giờ đổi. Nhãn có thể sửa câu chữ, nhưng phải sửa đồng thời ở `06 §3`.
- Thứ tự trên lưới 3 × 2 theo đúng thứ tự trong bảng.
- Nếu stack dùng bộ icon khác Lucide thì chọn icon có ý nghĩa tương đương.
- Danh mục mặc định là `food`. `[GIẢ ĐỊNH]`: chưa có số liệu tần suất, sẽ kiểm chứng bằng dữ liệu dùng thử Sprint 3.

## 5. Data model (lưu cục bộ)

**Transaction**
| Trường | Kiểu | Ràng buộc |
| :--- | :--- | :--- |
| `id` | string (UUID) | duy nhất |
| `amount` | số nguyên (₫) | `1` – `999.999.999` |
| `categoryId` | string | một trong 6 `id` ở §4 |
| `note` | string | không bắt buộc, tối đa 100 ký tự |
| `spentAt` | ngày giờ địa phương (ISO 8601) | gán bằng lúc bấm Lưu; MVP không cho chọn ngày khác |
| `createdAt`, `updatedAt` | ngày giờ (ISO 8601) | `updatedAt` thay đổi khi sửa (US06) |

**Budget**
| Trường | Kiểu | Ràng buộc |
| :--- | :--- | :--- |
| `month` | string `YYYY-MM` | mỗi tháng tối đa 1 bản ghi |
| `amount` | số nguyên (₫) | `> 0` |

MVP không có khoản thu, không có tài khoản người dùng, không đồng bộ đám mây.

## 6. Công thức "Hôm nay còn được tiêu" (US03)

Ký hiệu, tính cho tháng hiện tại theo giờ của máy:
- `B`: ngân sách tháng (`Budget.amount`).
- `S`: tổng khoản chi từ ngày 1 đến **hết hôm qua**.
- `T`: tổng khoản chi **hôm nay**.
- `D`: số ngày còn lại trong tháng, **tính cả hôm nay** (= số ngày của tháng − ngày hôm nay + 1).

```
Hạn mức hôm nay      L = làm_tròn_xuống_hàng_nghìn( max(B − S, 0) / D )
Hôm nay còn được tiêu R = L − T
Đã dùng ngân sách     U = (S + T) / B
```

- `L` cố định trong ngày, sang ngày mới mới tính lại. `R` cập nhật ngay sau mỗi lần thêm, sửa hoặc xóa khoản chi.
- Sửa hoặc xóa một khoản chi của ngày trước (US06) làm `S` thay đổi, nên `L` được tính lại ngay.
- **Màu số `R`:** `T < 70% × L` thì `success` · `70% × L ≤ T ≤ L` thì `warning` · `T > L` (tức `R < 0`) hoặc `L = 0` thì `danger`.
- `R < 0` thì hiển thị `Đã vượt 12.000₫` (giá trị tuyệt đối của `R`), màu `danger`.
- **Màu ProgressBar tháng:** `U < 70%` thì `success` · `70% ≤ U ≤ 100%` thì `warning` · `U > 100%` thì `danger`.

**Ví dụ chuẩn (dùng làm unit test):** ngày 14/11/2026, tháng 11 có 30 ngày nên `D = 17`. `B = 3.000.000₫`, `S = 1.300.000₫`, hôm nay đã chi Cơm trưa 30.000₫ + Gửi xe 5.000₫ + Tài liệu 12.000₫, nên `T = 47.000₫`.
- `L = 1.700.000 / 17 = 100.000₫`
- `R = 100.000 − 47.000 = 53.000₫`. Tỷ lệ `T/L = 47%`, màu `success`.
- `U = 1.347.000 / 3.000.000 = 44,9%`, hiển thị `45%`.

**Ví dụ BudgetScreen:** đặt `3.000.000₫` vào ngày 01/11 khi chưa chi khoản nào thì `D = 30`, `L = 100.000₫/ngày`.

## 7. Component

1. **`DailyAllowanceCard`** (US03)
   - Nhãn `Hôm nay còn được tiêu` · số `R` cỡ Hero Metric, màu theo §6 · dòng phụ `Hạn mức hôm nay: 100.000₫`.
   - `ProgressBar` tháng kèm chữ `Ngân sách tháng đã dùng: 45% (1.347.000₫ / 3.000.000₫)`.
   - Tháng hiện tại chưa có ngân sách: thay cả thẻ bằng dòng `Đặt ngân sách tháng để biết hôm nay được tiêu bao nhiêu` và nút `Đặt ngân sách` mở `BudgetScreen`.
2. **`QuickCategoryChip`** (US01): lưới 3 cột × 2 hàng, mỗi chip có icon (màu danh mục) và nhãn. Chip đang chọn có nền `--color-primary-light` và viền `--color-primary`.
3. **`TransactionItem`** (US01, US06): bên trái là icon danh mục; giữa là ghi chú (để trống thì hiện tên danh mục) và giờ `HH:mm`; bên phải là số tiền `-30.000₫` màu `--color-danger`. Bấm vào thì mở `AddExpenseScreen` ở chế độ sửa (US06, Sprint 3).
4. **`NumericKeypad`** (US01): các phím `0–9`, `000` và nút xóa lùi. Mỗi phím cao tối thiểu `48px`. Nhận tối đa 9 chữ số.
5. **`ProgressBar`**: thanh ngang cao `8px`, bo góc tròn, màu theo §6.
6. **`DonutChart`** (US04): mỗi danh mục một màu theo §4, tâm hiển thị tổng chi. Danh mục có tổng 0₫ thì không vẽ.

## 8. Màn hình

| Màn hình | User Story | Sprint |
| :--- | :--- | :--- |
| `HomeScreen` | US01 (danh sách), US03 (thẻ hạn mức) | 1–2 |
| `AddExpenseScreen` | US01, US06 (chế độ sửa) | 1, 3 |
| `BudgetScreen` | US02 | 2 |
| `ReportScreen` | US04 | 3 |
| Lịch sử theo ngày | US07 | **Chưa có đặc tả**: bổ sung trước khi đưa US07 vào sprint |

### `HomeScreen`
- **Top bar:** `Chào bạn 👋` bên trái, icon mở `BudgetScreen` bên phải.
- **Hero:** `DailyAllowanceCard`.
- **Chi tiêu hôm nay:** danh sách `TransactionItem` của hôm nay, mới nhất ở trên. Chưa có khoản nào thì hiện `Chưa có khoản chi nào hôm nay`.
- **Dưới cùng:** thanh 3 tab `Trang chủ` · `Ngân sách` · `Báo cáo`, và FAB `+ Ghi khoản chi` màu `--color-primary`.

### `AddExpenseScreen`
- Bottom sheet toàn màn hình, có nút đóng `X` ở góc trên.
- **Ô số tiền** căn giữa, tự focus khi mở. Định dạng theo §3 ngay trong lúc gõ (ví dụ `35.000₫`).
- **Lưới 6 `QuickCategoryChip`**, mặc định chọn `Ăn uống`.
- **Ghi chú:** ô nhỏ, placeholder `Ghi chú nhanh (không bắt buộc)...`.
- **Nút `Lưu khoản chi`** rộng 100%, màu `--color-primary`, nằm ngay trên `NumericKeypad`. Số tiền bằng 0 thì nút bị vô hiệu hóa. Bấm Lưu thì lưu giao dịch, đóng sheet và quay về `HomeScreen`.
- **Chế độ sửa (US06):** tiêu đề `Sửa khoản chi`, điền sẵn dữ liệu cũ, có thêm nút `Xóa khoản chi` màu `--color-danger`. Bấm Xóa thì hiện hộp xác nhận trước khi xóa.

### `BudgetScreen`
- Ô nhập ngân sách tháng hiện tại. Nếu tháng này chưa có ngân sách, điền sẵn số của tháng trước (nếu có).
- **Xem trước:** `Với ngân sách này, từ hôm nay mỗi ngày bạn được tiêu khoảng 100.000₫.` Số này tính bằng `L` ở §6, cập nhật ngay khi gõ.
- Nút `Cập nhật ngân sách`. Ngân sách bằng 0 thì nút bị vô hiệu hóa.

### `ReportScreen`
- **Tab thời gian:** `Tuần này` (từ thứ Hai đến hôm nay) · `Tháng này` (từ ngày 1 đến hôm nay).
- **`DonutChart`** với tổng chi ở tâm và % từng danh mục.
- **Danh sách xếp hạng** từ chi nhiều đến chi ít, mỗi dòng gồm: icon, tên danh mục, thanh % nhỏ, tổng tiền.
- Chưa có dữ liệu thì hiện `Chưa có khoản chi nào trong khoảng thời gian này`.

## 9. Ngoài phạm vi MVP (không dựng giao diện)

Phân bổ ngân sách theo danh mục · khoản thu · Dark Mode (Could-Have) · chia tiền nhóm · chuỗi ngày ghi chép (streak) · liên kết ngân hàng · quét hóa đơn (OCR) · đầu tư/vay nợ · đăng nhập · quảng cáo.

## 10. Checklist review giao diện (DoD tiêu chí 1)

- [ ] Chỉ dùng token ở §3. Không có mã màu hay cỡ chữ viết cứng ngoài bảng.
- [ ] Số tiền, %, ngày giờ đúng định dạng §3.
- [ ] 6 danh mục đúng `id`, nhãn, thứ tự, màu như §4.
- [ ] Logic `L`, `R`, `U` cho ra đúng ví dụ chuẩn ở §6 (có unit test).
- [ ] Có trạng thái rỗng (empty state) và trạng thái chưa đặt ngân sách theo §7–§8.
- [ ] Vùng chạm ≥ `48px`, nút chính nằm ở nửa dưới màn hình.
- [ ] Không có phần tử nào thuộc danh sách §9.
