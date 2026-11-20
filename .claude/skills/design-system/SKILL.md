---
name: design-system
description: Hệ thống thiết kế của Ví Khéo – nguyên tắc, design token (màu, chữ, khoảng cách), component, quy trình viết đặc tả màn hình và làm prototype HTML (không dùng Figma). Dùng khi tạo hoặc sửa màn hình, component, màu sắc; khi viết đặc tả màn hình trong docs/design/screens; khi làm prototype HTML để test với sinh viên; khi review giao diện trước khi merge.
---

# Skill: Design System & Prototype – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 2 – Design System & Prototype | Sprint 0 → 1 | Chốt nguyên tắc, token, component · đặc tả 4 màn hình · prototype `home.html` để test A3 |
| 2 – Design System & Prototype | Đầu Sprint 2, Sprint 3 | Cập nhật đặc tả màn hình của các User Story trong Sprint, **trước** khi PA viết PRD |
| 4 – Vibe Code | Mỗi Pull Request giao diện | Soát giao diện thật trên điện thoại theo checklist mục 8 |

- **Phụ trách chính:** Lê Thị Nhật Vy, Phạm Viết Hưng
- **Review:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa (người code giao diện)

> Nhóm **không dùng Figma**. Thiết kế gồm: skill này (token, component) + đặc tả màn hình `docs/design/screens/*.md` + prototype HTML `docs/design/prototype/*.html`.

## 2. Khi nào dùng / không dùng

**Dùng khi:** tạo/sửa màn hình, component · chọn màu, cỡ chữ · viết đặc tả màn hình · làm prototype HTML · review giao diện trong Pull Request.

**Không dùng khi:** viết công thức tính tiền, lưu dữ liệu (→ `budget-logic`) · viết yêu cầu, AC (→ `product-requirements`).

**Skill hỗ trợ (chỉ để gợi ý, không ghi đè token ở mục 4.2):**

| Skill | Dùng để |
| :--- | :--- |
| `ui-ux-pro-max` | Tra quy tắc UX/accessibility cho app tài chính mobile, ví dụ: `python .agents/skills/ui-ux-pro-max/scripts/search.py "fintech mobile budget" --domain ux` |
| `frontend-design` | Gợi ý 2–3 hướng thể hiện khác nhau cho một màn hình khi làm prototype, tránh giao diện rập khuôn |

Gợi ý nào muốn dùng → sửa skill này qua Pull Request (cặp UI/UX duyệt), rồi mới dùng trong code.

## 3. Đầu vào

- `docs/discovery/03-personas.md` – Persona Minh, Persona Vy (dùng một tay, ngại thao tác nhiều)
- `docs/discovery/06-journey-features.md` – User Story trong Sprint
- `docs/design/screens/` – đặc tả màn hình hiện có

## 4. Quy trình và nội dung

### 4.1 Nguyên tắc thiết kế

| Nguyên tắc | Quy định đo được | Truy về |
| :--- | :--- | :--- |
| **Ghi nhanh** | Từ màn hình chính đến lúc lưu tối đa **3 thao tác** (`+ Ghi khoản chi` → gõ số tiền → `Lưu`; danh mục mặc định `Ăn uống`). Mục tiêu < 5 giây. | HMW1, P2 |
| **Một con số** | Màn hình chính chỉ có 1 số to: *Hôm nay còn được tiêu*. Không biểu đồ trên màn hình chính. | HMW2, P3 |
| **Một tay** | Nút chính, bàn phím số ở nửa dưới màn hình. Vùng chạm tối thiểu **48 × 48 px**. | Persona Minh |
| **Không emoji** | Trạng thái thể hiện bằng màu token và chữ. | Quy tắc chung |
| **Không quảng cáo, không đăng nhập** | Mở app là dùng được ngay. | P2 |

### 4.2 Design token

```css
:root {
  --color-primary:        #4F46E5; /* Nút chính, tab đang chọn */
  --color-primary-light:  #EEF2FF; /* Nền thẻ ngân sách */
  --color-success:        #10B981; /* Nền/thanh: an toàn */
  --color-warning:        #F59E0B; /* Nền/thanh: sắp chạm hạn mức */
  --color-danger:         #EF4444; /* Nền/thanh: vượt hạn mức */
  /* Màu CHỮ trạng thái – tương phản ≥ 4.5:1 trên nền trắng */
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

Không dùng `--color-warning` làm màu chữ trên nền trắng (tương phản khoảng 2:1). Chữ trạng thái luôn dùng biến `*-text`.

| Vai trò chữ | Cỡ | Độ đậm |
| :--- | :--- | :--- |
| Số tiền lớn (Hero) | 36px | 700 |
| Tiêu đề màn hình | 20px | 600 |
| Tiêu đề mục | 16px | 600 |
| Nội dung | 14px | 400 |
| Chú thích | 12px | 400 |

Font: `'Inter', 'Roboto', sans-serif` (đủ dấu tiếng Việt). Lề trang 16px · padding thẻ 16px · bo góc thẻ 16px · bo góc nút/ô nhập 12px · bóng `0 1px 3px rgba(0,0,0,0.08)`.

**Định dạng tiền:** `35.000đ`. Khoản chi `−35.000đ` màu `--color-danger-text`; khoản thu `+35.000đ` màu `--color-success-text`.

### 4.3 Component

| Component | Mô tả | Dùng ở |
| :--- | :--- | :--- |
| `DailyAllowanceCard` | Nhãn "Hôm nay còn được tiêu" + số Hero + thanh % ngân sách tháng. Màu theo trạng thái (bảng dưới). | Home |
| `QuickCategoryChip` | Lưới 3 × 2: Ăn uống · Di chuyển · Nhà trọ & Điện nước · Học tập & Tài liệu · Mua sắm & Sinh hoạt · Khác. | AddExpense |
| `TransactionItem` | Icon danh mục · ghi chú + giờ · số tiền. Bấm giữ để sửa/xoá (Sprint 3). | Home, lịch sử |
| `NumericKeypad` | Phím 0–9, `000`, xoá lùi; mỗi phím cao ≥ 48px. | AddExpense, Budget |
| `ProgressBar` | Thanh % ngân sách tháng đã dùng. | Home, Budget |
| `EmptyState` | 1 câu hướng dẫn + 1 nút hành động. | Mọi màn hình |

Trạng thái màu của `DailyAllowanceCard` (điều kiện tính ở `budget-logic` mục 4.2):

| Trạng thái | Mã | Màu số Hero | Dòng phụ |
| :--- | :--- | :--- | :--- |
| An toàn | `SAFE` | `--color-success-text` | — |
| Sắp chạm | `WARNING` | `--color-warning-text` | "Sắp chạm hạn mức hôm nay" |
| Vượt | `OVER` | `--color-danger-text` | "Đã vượt 15.000đ" |
| Hết ngân sách tháng | `OUT_OF_BUDGET` | `--color-danger-text` | "Đã dùng hết ngân sách tháng" |
| Chưa đặt ngân sách | `NO_BUDGET` | — | Nút "Đặt ngân sách tháng" |

### 4.4 Viết đặc tả màn hình

1. Mỗi màn hình một file `docs/design/screens/<TênMàn hình>.md` từ mẫu `templates/screen-spec.md`.
2. Liệt kê bố cục từ trên xuống, chỉ dùng component ở mục 4.3. Cần component mới → thêm vào mục 4.3 trước.
3. Ghi đủ các trạng thái: có dữ liệu · trống · lỗi · (nếu có) theo `SAFE/WARNING/...`.
4. Số liệu trong đặc tả là dữ liệu minh hoạ, ghi rõ điều này.
5. Đặt trạng thái `Xong` khi cặp UI/UX đồng ý → PA dùng file này để viết PRD.

### 4.5 Làm prototype HTML

1. Một file HTML tĩnh `docs/design/prototype/<tên>.html`, nhúng sẵn token ở mục 4.2, chạy được khi mở trực tiếp trên điện thoại.
2. Rộng 360px không vỡ, không cần mạng (không tải font/thư viện ngoài; thiếu Inter thì dùng Roboto/sans-serif của máy).
3. Ghi đường dẫn prototype vào đặc tả màn hình. Kết quả test với SV ghi bằng skill `user-research`.

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/design/screens/<TênMàn hình>.md` | `templates/screen-spec.md` | Cặp UI/UX + 1 người cặp giao diện |
| `docs/design/prototype/<tên>.html` | — | Cặp UI/UX |
| Nhận xét review giao diện trong Pull Request | `templates/ui-review.md` | — |

## 6. Khi viết plan

**Ràng buộc (chép vào Global Constraints):**
- Chỉ dùng token trong `src/theme/` (chép từ `design-system` mục 4.2); không viết cứng mã màu, `px` cỡ chữ, font trong `src/screens/` và `src/components/`.
- Chỉ dùng component ở `design-system` mục 4.3; component mới phải được thêm vào skill trước.
- Mọi vùng bấm ≥ 48 × 48 px; màn hình rộng 360px không vỡ, không cuộn ngang.
- Tiền hiển thị qua hàm `formatMoney` dạng `35.000đ`; chi `−`, thu `+`.
- Mọi chữ trên giao diện bằng tiếng Việt có dấu, không emoji.
- Mỗi màn hình có trạng thái trống (`EmptyState`) và trạng thái lỗi.

**Task bắt buộc:**
- Task cuối của plan giao diện: soát theo `templates/ui-review.md`, chụp ảnh trên điện thoại thật gắn vào Pull Request.

**Lệnh kiểm tra:**
- `grep -rnE "#[0-9A-Fa-f]{6}" src/screens src/components` → không có kết quả

## 7. Quy tắc bắt buộc

1. Chỉ dùng token ở mục 4.2; không tự thêm màu, font, gradient, hiệu ứng.
2. Không thêm màn hình, tab, tính năng nếu không có User Story.
3. Không đặt biểu đồ trên `HomeScreen`.
4. Gợi ý từ `frontend-design`, `ui-ux-pro-max` không được dùng thẳng vào code khi chưa sửa skill này.
5. Mọi chữ trên giao diện bằng tiếng Việt có dấu; mọi vùng bấm ≥ 48 × 48 px.

## 8. Checklist tự kiểm

- [ ] Đặc tả màn hình đủ các trạng thái (có dữ liệu, trống, lỗi)
- [ ] Màu, cỡ chữ, bo góc đúng token
- [ ] Ghi một khoản chi ≤ 3 thao tác, < 5 giây
- [ ] Chạy trên điện thoại thật, rộng 360px không vỡ
- [ ] Số tiền đúng định dạng `35.000đ`
