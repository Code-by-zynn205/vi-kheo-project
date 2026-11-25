# Thiết kế kỹ thuật – Ví Khéo

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.3) · **Trạng thái:** Đang làm · **Phụ trách:** <tên> · **Cập nhật:** <dd/mm/yyyy>

File này là nơi duy nhất ghi công nghệ, cấu trúc thư mục và lệnh của dự án. `writing-plans` lấy mục 1 làm **Tech Stack**, mục 2 làm đường dẫn file, mục 4 làm lệnh kiểm tra.

## 1. Ngăn xếp công nghệ

<!-- Mỗi dòng có phiên bản cụ thể và ADR đã chấp nhận. Không có ADR thì không ghi vào đây. -->

| Thành phần | Công nghệ | Phiên bản | Quyết định |
| :--- | :--- | :--- | :--- |
| Nền tảng app | <...> | <...> | ADR-01 |
| Lưu dữ liệu | <...> | <...> | ADR-02 |
| Unit test | <...> | <...> | ADR-<xx> |
| Thông báo 21:00 (US05) | <...> | <...> | ADR-<xx> |
| Phát hành bản dùng thử | <...> | — | ADR-<xx> |

## 2. Cấu trúc thư mục

<!-- Theo frontend-ui mục 4.2, đổi đuôi file theo công nghệ đã chọn. -->

```
src/
├── theme/          token từ design-system mục 4.2
├── components/     component từ design-system mục 4.3
├── screens/        HomeScreen, AddExpenseScreen, BudgetScreen, ReportScreen
├── logic/          hàm thuần của budget-logic – không gọi giao diện
├── storage/        lớp lưu trữ cục bộ
└── utils/          formatMoney, ngày tháng
```

Quy tắc phụ thuộc: `screens` → `components`, `logic`, `storage`, `utils` · `logic` không phụ thuộc gì ngoài `utils` · `storage` không gọi `screens`.

## 3. Dữ liệu và lưu trữ

<!-- Kiểu dữ liệu theo budget-logic mục 4.1 – KHÔNG định nghĩa lại. Chỉ ghi cách hiện thực. -->

| Dữ liệu (`budget-logic` 4.1) | Lưu ở đâu | Khoá / bảng | Ghi chú |
| :--- | :--- | :--- | :--- |
| `Transaction` | <localStorage / SQLite / ...> | <...> | <...> |
| `MonthlyBudget` | | | |

Cách đổi cấu trúc dữ liệu khi đã có người dùng thử: <...>

## 4. Lệnh

<!-- Đúng lệnh, chép được, chạy từ thư mục gốc repo. -->

| Việc | Lệnh | Kết quả mong đợi |
| :--- | :--- | :--- |
| Cài thư viện | `<...>` | Không lỗi |
| Chạy app trên máy tính | `<...>` | Mở được ở <địa chỉ / trình giả lập> |
| Mở trên điện thoại thật | `<...>` | <cách mở: link mạng nội bộ, quét QR ...> |
| Chạy unit test | `<...>` | Mọi test pass |
| Build | `<...>` | Không lỗi, ra <thư mục / file> |
| Phát hành bản dùng thử | `<...>` | Người dùng thử mở/cài được theo hướng dẫn mục 5 |

## 5. Hướng dẫn cài cho người dùng thử

1. <bước, không quá 3 bước>

## 6. Quy ước code và thư viện

| Mục | Quy ước |
| :--- | :--- |
| Đặt tên file | <PascalCase cho component/màn hình, camelCase cho hàm ...> |
| Format, lint | <công cụ, lệnh> |
| Ngôn ngữ chữ trên giao diện | Tiếng Việt có dấu, chép từ đặc tả màn hình |

**Thư viện được phép:**

| Thư viện | Dùng cho | Quyết định |
| :--- | :--- | :--- |
| <...> | <...> | ADR-<xx> / Pull Request #<...> |

## 7. Lịch sử thay đổi

| Ngày | Thay đổi | ADR | Người sửa |
| :--- | :--- | :--- | :--- |
| <dd/mm/yyyy> | Tạo bản đầu | ADR-01, ADR-02 | <tên> |
