---
name: design-system
description: Hệ thống thiết kế (màu, chữ, khoảng cách, component) và đặc tả 4 màn hình cốt lõi của Ví Khéo để AI sinh giao diện mobile-first trực tiếp thành code, không qua Figma. Dùng khi tạo hoặc sửa bất kỳ màn hình, component, màu sắc nào; khi làm bản HTML để test với sinh viên; khi review giao diện trước khi merge.
---

# Skill: Design System & UI Spec – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Việc chính | Trạng thái |
| :--- | :--- | :---: |
| **GĐ1 – Sprint 0** | Chốt nguyên tắc, token, component, đặc tả 4 màn hình | ✅ |
| **GĐ2 – Sprint 1** | Sinh bản HTML `HomeScreen` để test giả định A3 · `AddExpenseScreen` cho US01 | 🔄 |
| **GĐ2 – Sprint 2** | `BudgetScreen` · trạng thái màu của `DailyAllowanceCard` | ⬜ |
| **GĐ2 – Sprint 3** | `ReportScreen` · sửa/xoá giao dịch | ⬜ |

- **Phụ trách chính:** Lê Thị Nhật Vy, Phạm Viết Hưng
- **Review:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa (người code giao diện)

> Nhóm **không dùng Figma**. Skill này là nguồn thiết kế duy nhất; AI đọc skill rồi sinh code giao diện. Cặp UI/UX soát giao diện thật trên điện thoại thay vì soát bản vẽ.

## 2. Khi nào dùng / không dùng
**Dùng khi:** tạo/sửa màn hình hoặc component · chọn màu, cỡ chữ · làm bản HTML để test với SV · review giao diện trong Pull Request.
**Không dùng khi:** viết logic tính tiền, lưu dữ liệu (→ `budget-logic`).

## 3. Đầu vào
- `docs/discovery/03-personas.md` (Minh, Vy – dùng một tay, ngại thao tác nhiều)
- `docs/discovery/06-journey-features.md` (User Story + tiêu chí chấp nhận)

## 4. Nguyên tắc thiết kế

| Nguyên tắc | Quy định đo được | Truy về |
| :--- | :--- | :--- |
| **Ghi nhanh** | Từ màn hình chính đến lúc lưu: tối đa **3 thao tác** (bấm `+ Ghi khoản chi` → gõ số tiền → bấm `Lưu`; danh mục mặc định `Ăn uống`). Mục tiêu < 5 giây. | HMW1, P2 |
| **Một con số** | Màn hình chính chỉ có 1 số to: *Hôm nay còn được tiêu*. Không biểu đồ trên màn hình chính. | HMW2, P3 |
| **Một tay** | Nút chính, bàn phím số ở nửa dưới màn hình. Vùng chạm tối thiểu **48 × 48 px**. | Persona Minh |
| **Không quảng cáo, không đăng nhập** | Mở app là dùng được ngay. | P2, khảo sát lý do bỏ app |

## 5. Design Tokens

### Màu
```css
:root {
  --color-primary:        #4F46E5; /* Nút chính, tab đang chọn */
  --color-primary-light:  #EEF2FF; /* Nền thẻ ngân sách */
  --color-success:        #10B981; /* Nền/thanh: an toàn */
  --color-warning:        #F59E0B; /* Nền/thanh: sắp chạm hạn mức */
  --color-danger:         #EF4444; /* Nền/thanh: vượt hạn mức */
  /* Màu CHỮ trạng thái – đậm hơn để đọc được trên nền trắng (tương phản ≥ 4.5:1) */
  --color-success-text:   #047857;
  --color-warning-text:   #B45309;
  --color-danger-text:    #DC2626;
  --color-bg-page:        #F9FAFB;
  --color-bg-card:        #FFFFFF;
  --color-text-primary:   #111827;
  --color-text-secondary: #6B7280;
  --color-border:         #E5E7EB;
}
```
> Không dùng `--color-warning` (#F59E0B) làm màu chữ trên nền trắng: tương phản chỉ khoảng 2:1, khó đọc. Chữ trạng thái luôn dùng biến `*-text`.

### Chữ
| Vai trò | Cỡ | Độ đậm |
| :--- | :--- | :--- |
| Số tiền lớn (Hero) | 36px | 700 |
| Tiêu đề màn hình | 20px | 600 |
| Tiêu đề mục | 16px | 600 |
| Nội dung | 14px | 400 |
| Chú thích | 12px | 400 |

Font: `'Inter', 'Roboto', sans-serif` (đủ dấu tiếng Việt).

### Khoảng cách & bo góc
Lề trang 16px · Padding thẻ 16px · Bo góc thẻ 16px · Bo góc nút/ô nhập 12px · Đổ bóng `0 1px 3px rgba(0,0,0,0.08)`.

### Định dạng tiền
`35.000đ` – dấu chấm phân cách hàng nghìn, chữ `đ` liền sau, không có số lẻ. Khoản chi hiển thị `−35.000đ` màu `--color-danger-text`; khoản thu `+35.000đ` màu `--color-success-text`.

## 6. Component

| Component | Mô tả | Dùng ở |
| :--- | :--- | :--- |
| `DailyAllowanceCard` | Nhãn "Hôm nay còn được tiêu" + số Hero + thanh tiến độ ngân sách tháng. Màu theo trạng thái (bảng dưới). | Home |
| `QuickCategoryChip` | Lưới 3 cột × 2 hàng: Ăn uống · Di chuyển · Nhà trọ & Điện nước · Học tập & Tài liệu · Mua sắm & Sinh hoạt · Khác. Icon + tên ngắn. | AddExpense |
| `TransactionItem` | Icon danh mục (trái) · ghi chú + giờ (giữa) · số tiền (phải). Vuốt hoặc bấm giữ để sửa/xoá (Sprint 3). | Home, lịch sử |
| `NumericKeypad` | Phím 0–9, `000`, xoá lùi; mỗi phím cao ≥ 48px. | AddExpense, Budget |
| `ProgressBar` | Thanh % ngân sách tháng đã dùng. | Home, Budget |
| `EmptyState` | Màn hình trống có 1 câu hướng dẫn + 1 nút hành động. | Mọi màn hình |

**Trạng thái màu của `DailyAllowanceCard`** (quy tắc tính ở `skills/budget-logic`):

| Trạng thái | Điều kiện | Màu chữ số Hero | Dòng phụ |
| :--- | :--- | :--- | :--- |
| An toàn | đã tiêu hôm nay < 70% hạn mức ngày | `--color-success-text` | — |
| Sắp chạm | 70% – 100% | `--color-warning-text` | "Sắp chạm hạn mức hôm nay" |
| Vượt | > 100% | `--color-danger-text` | "Đã vượt 15.000đ" |
| Hết ngân sách tháng | ngân sách còn lại ≤ 0 | `--color-danger-text` | "Đã dùng hết ngân sách tháng" |
| Chưa đặt ngân sách | chưa có ngân sách tháng này | — | Nút "Đặt ngân sách tháng" |

## 7. Đặc tả 4 màn hình

> Số liệu trong đặc tả chỉ là dữ liệu minh hoạ để AI dựng giao diện, không phải số liệu thật.

### Màn hình 1 – `HomeScreen` `[Sprint 1 khung · Sprint 2 hoàn thiện]`
- Thanh trên: lời chào ngắn + icon cài đặt ngân sách (phải).
- `DailyAllowanceCard`: "Hôm nay còn được tiêu" · `86.000đ` · "Ngân sách tháng đã dùng 62% (1.860.000đ / 3.000.000đ)".
- Mục "Chi tiêu hôm nay": danh sách `TransactionItem` (Cơm trưa −30.000đ, Gửi xe −5.000đ, Tài liệu −12.000đ). Chưa có giao dịch → `EmptyState` "Chưa có khoản chi nào hôm nay".
- Thanh điều hướng dưới: `Trang chủ` · `Ngân sách` · `Báo cáo` + nút nổi `+ Ghi khoản chi` màu `--color-primary`.

### Màn hình 2 – `AddExpenseScreen` `[Sprint 1 – US01]`
- Mở dạng bottom sheet toàn màn hình, nút `X` đóng.
- Công tắc nhỏ `Chi | Thu` ở trên cùng, mặc định `Chi` (`Thu` dùng từ Sprint 2 – US07).
- Ô số tiền căn giữa, tự focus, hiển thị `35.000đ` khi gõ.
- Lưới 6 `QuickCategoryChip`, mặc định chọn `Ăn uống`.
- Ô ghi chú tuỳ chọn: placeholder "Ghi chú nhanh (không bắt buộc)…".
- Nút `Lưu khoản chi` rộng 100%, ngay trên `NumericKeypad`. Số tiền = 0 → nút bị vô hiệu.
- Lưu xong: đóng sheet, quay về Home, khoản mới nằm đầu danh sách, hiện thông báo nhỏ "Đã lưu".

### Màn hình 3 – `BudgetScreen` `[Sprint 2 – US02]`
- Ô nhập ngân sách tháng (ví dụ `3.000.000đ`).
- Khung xem trước: "Với ngân sách này, mỗi ngày còn lại bạn được tiêu khoảng **100.000đ**."
- Nút `Cập nhật ngân sách`.
- *(Không làm trong MVP: thanh trượt phân bổ theo danh mục – xếp vào Could-have.)*

### Màn hình 4 – `ReportScreen` `[Sprint 3 – US04]`
- Bộ lọc `Tuần này | Tháng này`.
- Biểu đồ tròn rỗng giữa (`DonutChart`), tổng chi ở tâm.
- Danh sách danh mục xếp từ chi nhiều đến ít: tên + thanh % + số tiền.
- Chưa có dữ liệu → `EmptyState`.

## 8. Quy tắc bắt buộc (chống AI Slop)
1. Chỉ dùng biến màu trong mục 5; không tự thêm màu, font, gradient, hiệu ứng.
2. Không thêm màn hình, tab, tính năng ngoài 4 màn hình trên nếu không có User Story.
3. Không đặt biểu đồ trên `HomeScreen`.
4. Mọi chữ trên giao diện bằng tiếng Việt có dấu.
5. Mọi vùng bấm ≥ 48 × 48 px.

## 9. Checklist review giao diện (trước khi merge)
- [ ] Màu, cỡ chữ, bo góc đúng token
- [ ] Ghi một khoản chi ≤ 3 thao tác, thử bấm giờ < 5 giây
- [ ] Chạy trên điện thoại thật (không chỉ trình giả lập), màn hình rộng 360px không vỡ
- [ ] Có trạng thái trống và trạng thái lỗi
- [ ] Số tiền đúng định dạng `35.000đ`
