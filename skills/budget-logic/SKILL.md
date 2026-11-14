---
name: budget-logic
description: Mô hình dữ liệu, lưu trữ cục bộ và thuật toán của Ví Khéo – công thức "Hôm nay còn được tiêu", trạng thái màu cảnh báo, thống kê theo danh mục – kèm bộ test case có số cụ thể. Dùng khi viết hoặc sửa code lưu giao dịch, ngân sách, khoản thu, tính hạn mức ngày, báo cáo; hoặc khi viết unit test cho các phần đó.
---

# Skill: Budget Logic & Dữ liệu – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Việc chính | User Story | Trạng thái |
| :--- | :--- | :--- | :---: |
| **GĐ2 – Sprint 1** (14/11 – 23/11) | Mô hình dữ liệu, lưu/đọc giao dịch trên máy | US01 | 🔄 |
| **GĐ2 – Sprint 2** (24/11 – 03/12) | Ngân sách tháng, khoản thu, công thức hạn mức ngày, trạng thái màu | US02, US03, US07 | ⬜ |
| **GĐ2 – Sprint 3** (04/12 – 12/12) | Thống kê theo danh mục, sửa/xoá giao dịch | US04, US06 | ⬜ |

- **Phụ trách chính:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến
- **Review:** Nguyễn Đức Minh Nghĩa (người gọi các hàm này từ giao diện)

## 2. Khi nào dùng / không dùng
**Dùng khi:** viết code lưu/đọc dữ liệu · tính tiền · viết unit test · sửa lỗi sai số tiền.
**Không dùng khi:** chỉnh giao diện, màu sắc (→ `design-system`, `frontend-ui`).

## 3. Đầu vào
- `docs/discovery/06-journey-features.md` – tiêu chí chấp nhận US01–US07
- `skills/design-system/SKILL.md` mục 6 – bảng trạng thái màu

## 4. Mô hình dữ liệu `[Sprint 1]`

```ts
type TransactionType = 'expense' | 'income';

type CategoryId =
  | 'an_uong' | 'di_chuyen' | 'nha_tro' | 'hoc_tap' | 'mua_sam' | 'khac'; // 6 danh mục cố định

interface Transaction {
  id: string;              // uuid
  type: TransactionType;
  amount: number;          // số nguyên VND, > 0, tối đa 99.999.999
  categoryId: CategoryId | null; // null với khoản thu
  note?: string;           // tối đa 100 ký tự
  date: string;            // 'YYYY-MM-DD' theo giờ máy (Asia/Ho_Chi_Minh)
  createdAt: string;       // ISO 8601, dùng để sắp xếp
}

interface MonthlyBudget {
  month: string;           // 'YYYY-MM'
  amount: number;          // số nguyên VND, > 0
}
```

**Lưu trữ:** cục bộ trên máy (offline, không đăng nhập). Viết qua 1 lớp `storage` để đổi được nền tảng (localStorage / AsyncStorage / SQLite tuỳ công nghệ nhóm chốt ở `frontend-ui`):

```ts
saveTransaction(t: Transaction): void
updateTransaction(t: Transaction): void       // Sprint 3
deleteTransaction(id: string): void           // Sprint 3
listTransactions(fromDate: string, toDate: string): Transaction[]
getBudget(month: string): MonthlyBudget | null
setBudget(b: MonthlyBudget): void
```

## 5. Công thức "Hôm nay còn được tiêu" `[Sprint 2 – US03]`

Ký hiệu cho tháng hiện tại, tính tại ngày `d` của tháng có `N` ngày:

```
Quỹ còn lại đầu ngày  = Ngân sách tháng + Tổng thu trong tháng − Tổng chi từ ngày 1 đến ngày d−1
Số ngày còn lại       = N − d + 1                       (tính cả hôm nay)
Hạn mức hôm nay       = làm tròn XUỐNG tới 1.000đ ( Quỹ còn lại đầu ngày ÷ Số ngày còn lại )
Hôm nay còn được tiêu = Hạn mức hôm nay − Tổng chi hôm nay
```

**Vì sao tính "đầu ngày" rồi mới trừ chi hôm nay:** nếu chia lại sau mỗi khoản chi, tiêu 30.000đ thì con số chỉ giảm khoảng 2.000đ (vì chia đều cho các ngày còn lại) – sinh viên sẽ thấy vô lý. Cách trên làm con số giảm đúng bằng số tiền vừa tiêu.

**Vì sao làm tròn xuống:** con số dùng để ra quyết định "có nên mua không", nên an toàn hơn khi hơi thấp.

**Trạng thái** (để giao diện chọn màu):

```
nếu chưa có ngân sách tháng này         → NO_BUDGET
nếu Quỹ còn lại đầu ngày ≤ 0            → OUT_OF_BUDGET
tỷ lệ = Tổng chi hôm nay ÷ Hạn mức hôm nay   (Hạn mức = 0 thì coi tỷ lệ = 1)
tỷ lệ < 0,7                             → SAFE
0,7 ≤ tỷ lệ ≤ 1                         → WARNING
tỷ lệ > 1                               → OVER        (hiển thị "Đã vượt <số tiền>")
```

**Quy tắc đi kèm**
- Khoản thu (US07) cộng vào quỹ của tháng nó được ghi. *(Đề xuất của cặp dữ liệu – 🟡 PO chốt.)*
- Sang tháng mới mà chưa đặt ngân sách → `NO_BUDGET`; `BudgetScreen` gợi ý sẵn số tiền tháng trước, người dùng bấm xác nhận. *(🟡 PO chốt.)*
- **Không lưu số dư.** Mọi con số luôn tính lại từ danh sách giao dịch, để sửa/xoá một khoản cũ là kết quả tự đúng.
- Chỉ dùng số nguyên VND, không dùng số thực cho tiền.

## 6. Thống kê theo danh mục `[Sprint 3 – US04]`
- Chỉ tính khoản `expense`. Lọc `Tuần này` (thứ Hai → Chủ nhật của tuần hiện tại) hoặc `Tháng này`.
- Trả về: tổng chi, và mỗi danh mục `{categoryId, tổng tiền, phần trăm làm tròn số nguyên}`, sắp xếp giảm dần, bỏ danh mục bằng 0.

## 7. Bộ test case bắt buộc

Tháng 11/2026 có 30 ngày, tháng 2/2027 có 28 ngày.

| # | Ngân sách | Thu trong tháng | Ngày | Chi trước hôm nay | Chi hôm nay | Hạn mức hôm nay | Còn được tiêu | Trạng thái |
| :-: | --: | --: | :-: | --: | --: | --: | --: | :--- |
| 1 | 3.000.000 | 0 | 01/11 | 0 | 0 | 100.000 | 100.000 | SAFE |
| 2 | 3.000.000 | 0 | 01/11 | 0 | 47.000 | 100.000 | 53.000 | SAFE |
| 3 | 3.000.000 | 0 | 16/11 | 1.800.000 | 60.000 | 80.000 | 20.000 | WARNING |
| 4 | 3.000.000 | 0 | 16/11 | 1.800.000 | 95.000 | 80.000 | −15.000 | OVER |
| 5 | 3.000.000 | 0 | 25/11 | 3.100.000 | 0 | — | 0 | OUT_OF_BUDGET |
| 6 | 2.500.000 | 0 | 10/11 | 700.000 | 0 | 85.000 *(85.714 làm tròn xuống)* | 85.000 | SAFE |
| 7 | 2.500.000 | 1.200.000 | 16/11 | 2.000.000 | 0 | 113.000 *(113.333 làm tròn xuống)* | 113.000 | SAFE |
| 8 | 3.000.000 | 0 | 30/11 | 2.950.000 | 0 | 50.000 | 50.000 | SAFE |
| 9 | 2.800.000 | 0 | 01/02/2027 | 0 | 0 | 100.000 | 100.000 | SAFE |
| 10 | *(chưa đặt)* | 0 | 01/12 | 0 | 0 | — | — | NO_BUDGET |
| 11 | 3.000.000 | 0 | 01/11 | 2.990.000 *(nhập ngân sách muộn)* | 0 | 0 *(333 làm tròn xuống)* | 0 | WARNING |

Test nhập liệu (US01):

| # | Đầu vào | Kết quả mong đợi |
| :-: | :--- | :--- |
| 12 | Số tiền = 0 | Không lưu, nút Lưu bị vô hiệu |
| 13 | Số tiền = 100.000.000 | Không lưu, báo "Số tiền tối đa 99.999.999đ" |
| 14 | Không chọn danh mục | Lưu với `an_uong` (mặc định) |
| 15 | Ghi chú 150 ký tự | Cắt hoặc chặn ở 100 ký tự |
| 16 | Xoá một khoản chi hôm qua 50.000đ (ngày 16/11, TC3) | Hạn mức hôm nay tăng tương ứng: (1.250.000 ÷ 15) → 83.000 |

## 8. Quy tắc bắt buộc (chống AI Slop)
1. Không đổi công thức ở mục 5 nếu PO chưa duyệt; đổi thì cập nhật cả bảng test.
2. Không thêm đồng bộ máy chủ, đăng nhập, liên kết ngân hàng (Won't-have).
3. Mọi hàm tính tiền phải có unit test chạy được với các dòng trong bảng mục 7.
4. Không dùng `float` cho tiền; không làm tròn lên.

## 9. Checklist tự kiểm
- [ ] 16 test case ở mục 7 đều qua
- [ ] Đổi ngày trên máy sang ngày 1 tháng sau → ra `NO_BUDGET`
- [ ] Sửa/xoá giao dịch cũ → số hôm nay cập nhật đúng
- [ ] Tắt mạng vẫn dùng bình thường
