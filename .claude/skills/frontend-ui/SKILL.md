---
name: frontend-ui
description: Quy trình lập trình giao diện Ví Khéo theo từng User Story – chọn công nghệ, cấu trúc thư mục, ghép giao diện từ design-system với hàm dữ liệu từ budget-logic, kiểm tra tiêu chí chấp nhận trên điện thoại thật. Dùng khi bắt đầu code một User Story, tạo màn hình mới, sửa lỗi giao diện, hoặc chuẩn bị bản demo cuối Sprint.
---

# Skill: Frontend UI – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Việc chính | User Story | Trạng thái |
| :--- | :--- | :--- | :---: |
| **GĐ2 – Sprint 1** (15/11 – 23/11) | Chốt công nghệ, dựng dự án, `HomeScreen` khung, `AddExpenseScreen` | US01 | Đang làm |
| **GĐ2 – Sprint 2** (24/11 – 03/12) | `BudgetScreen`, `DailyAllowanceCard` có màu trạng thái, ghi khoản thu · **đóng gói bản build dùng thử trước 03/12** | US02, US03, US07 | Chưa làm |
| **GĐ2 – Sprint 3** (04/12 – 12/12) | `ReportScreen`, nhắc nhở 21:00, sửa/xoá giao dịch · cập nhật bản dùng thử khi xong tính năng | US04, US05, US06 | Chưa làm |

- **Phụ trách chính:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa
- **Review:** Lê Thị Nhật Vy, Phạm Viết Hưng (soát giao diện đúng design-system)

## 2. Khi nào dùng / không dùng
**Dùng khi:** bắt đầu code một User Story · tạo màn hình · sửa lỗi giao diện · đóng gói bản demo.
**Không dùng khi:** quyết định màu/kích thước (→ `design-system`), viết công thức tính tiền (→ `budget-logic`).

## 3. Đầu vào (AI phải đọc cả 3 trước khi code)
1. `docs/discovery/06-journey-features.md` – User Story + tiêu chí chấp nhận (AC)
2. `skills/design-system/SKILL.md` – token, component, đặc tả màn hình
3. `skills/budget-logic/SKILL.md` – kiểu dữ liệu và hàm cần gọi

## 4. Quyết định công nghệ `[Sprint 1 – chốt tại Sprint Planning]`

**Trạng thái: Chưa chốt.** Nhóm chọn 1 trong các phương án dưới, ghi kết quả vào bảng "Đã chốt" và commit.

| Phương án | Ưu | Nhược |
| :--- | :--- | :--- |
| Web app chạy trên điện thoại (PWA: HTML/CSS/JS hoặc React + Vite) | Dễ nhất, AI sinh code tốt, test A3 bằng chính bản này, mở bằng trình duyệt điện thoại là dùng được, lưu `localStorage` | Nhắc nhở 21:00 (US05) trên iPhone bị hạn chế |
| React Native (Expo) | App thật, thông báo cục bộ dễ, cài qua Expo Go | Cần cài môi trường, nhóm cần biết React |
| Flutter | App thật, giao diện mượt | Ngôn ngữ Dart, ít thành viên quen |

**Đã chốt:** `<công nghệ>` – ngày `<dd/mm>` – lý do: `<...>`

## 5. Cấu trúc thư mục (áp dụng cho mọi phương án)

```
src/
├── theme/          tokens (màu, chữ, khoảng cách) – chép đúng từ design-system
├── components/     DailyAllowanceCard, QuickCategoryChip, TransactionItem, NumericKeypad, ProgressBar, EmptyState
├── screens/        HomeScreen, AddExpenseScreen, BudgetScreen, ReportScreen
├── logic/          code của budget-logic (tính tiền, thống kê) – KHÔNG gọi giao diện
├── storage/        lớp lưu trữ cục bộ
└── utils/          formatMoney ('35.000đ'), ngày tháng
```

Quy tắc: màn hình chỉ gọi `logic/` và `storage/`, không tự tính tiền trong màn hình.

## 6. Quy trình làm một User Story

| Bước | Việc | Ai |
| :-: | :--- | :--- |
| 1 | Tạo nhánh `feature/USxx-<mô-tả>` | Dev nhận thẻ |
| 2 | Đưa cho AI: AC của USxx + mục đặc tả màn hình tương ứng + hàm cần gọi | Dev |
| 3 | AI sinh component trước, màn hình sau; dev đọc lại từng file | Dev |
| 4 | Chạy trên **điện thoại thật**, đi lần lượt từng AC, bấm giờ thao tác ghi chi | Dev |
| 5 | Mở Pull Request kèm ảnh chụp màn hình và danh sách AC đã qua | Dev |
| 6 | Cặp UI/UX soát giao diện; 1 người cặp dữ liệu soát chỗ gọi hàm | Review chéo |
| 7 | Merge → chuyển thẻ Trello sang Done | Dev |

Mẫu yêu cầu cho AI:

```
Đọc skills/design-system/SKILL.md mục 6 và 7 (AddExpenseScreen) và skills/budget-logic/SKILL.md mục 4.
Làm US01 theo các AC trong docs/discovery/06-journey-features.md.
Chỉ dùng token trong src/theme. Không thêm tính năng ngoài AC.
```

## 7. Quy tắc bắt buộc (chống AI Slop)
1. Không thêm màn hình, nút, thư viện UI lớn ngoài phạm vi User Story đang làm.
2. Không viết màu/cỡ chữ trực tiếp (`#4F46E5`, `16px`) trong màn hình – dùng token.
3. Không dán code AI sinh ra mà chưa chạy thử.
4. Không commit khoá API, file build, `node_modules`.

## 8. Checklist trước khi mở Pull Request
- [ ] Tất cả AC của User Story đều qua trên điện thoại thật
- [ ] Ghi một khoản chi ≤ 3 thao tác, < 5 giây
- [ ] Không có màu/cỡ chữ viết cứng
- [ ] Không lỗi khi chưa có dữ liệu (lần đầu mở app)
- [ ] Có ảnh chụp màn hình trong Pull Request
