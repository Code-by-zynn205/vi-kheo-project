---
name: budget-logic
description: Mô hình dữ liệu, lưu trữ cục bộ và thuật toán của Ví Khéo – công thức "Hôm nay còn được tiêu", trạng thái màu cảnh báo, thống kê theo danh mục – kèm bộ test case có số cụ thể và mẫu task TDD cho plan. Dùng khi viết hoặc sửa code lưu giao dịch, ngân sách, khoản thu, tính hạn mức ngày, báo cáo; khi viết unit test cho các phần đó; hoặc khi viết plan có phần tính tiền.
---

# Skill: Budget Logic & Dữ liệu – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính | User Story |
| :--- | :--- | :--- | :--- |
| 4 – Vibe Code | Sprint 1 (15/11 – 23/11) | Mô hình dữ liệu, lưu/đọc giao dịch trên máy | US01 |
| 4 – Vibe Code | Sprint 2 (24/11 – 03/12) | Ngân sách tháng, khoản thu, hạn mức ngày, trạng thái màu | US02, US03, US07 |
| 4 – Vibe Code | Sprint 3 (04/12 – 12/12) | Thống kê theo danh mục, sửa/xoá giao dịch | US04, US06 |

- **Phụ trách chính:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến
- **Review:** Nguyễn Đức Minh Nghĩa (người gọi các hàm này từ giao diện)

## 2. Khi nào dùng / không dùng

**Dùng khi:** viết code lưu/đọc dữ liệu · tính tiền · viết unit test · sửa lỗi sai số tiền · viết plan có task tính tiền.

**Không dùng khi:** chỉnh giao diện, màu sắc (→ `design-system`, `frontend-ui`).

## 3. Đầu vào

- PRD của User Story: `docs/requirements/USxx-*.md` (trạng thái `Đã duyệt`)
- `design-system` mục 4.3 – bảng trạng thái màu (để biết giao diện cần mã trạng thái nào)

## 4. Quy trình và nội dung

Mọi code ở mục này viết theo `superpowers:test-driven-development`: viết test từ bảng 4.4 trước, chạy thấy fail, rồi mới viết hàm.

### 4.1 Mô hình dữ liệu `[Sprint 1]`

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
  updatedAt: string;       // ISO 8601, bằng createdAt khi tạo (data-analysis.md mục 4)
  deletedAt: string | null; // xoá mềm (Q6, ADR-02); null = đang dùng; mọi con số bỏ qua bản ghi đã xoá (BR-91)
}

interface MonthlyBudget {
  month: string;           // 'YYYY-MM'
  amount: number;          // số nguyên VND, > 0
}
```

**Lưu trữ:** cục bộ trên máy (offline, không đăng nhập) bằng SQLite qua `expo-sqlite` (ADR-02). Mọi truy cập đi qua 1 lớp `storage` **bất đồng bộ** để đổi được cách lưu mà không sửa màn hình và logic. Bảng, cột, chỉ mục, migration: `docs/architecture/technical-design.md` mục 3.

```ts
saveTransaction(t: Transaction): Promise<void>
updateTransaction(t: Transaction): Promise<void>      // Sprint 3
deleteTransaction(id: string): Promise<void>          // Sprint 3 – xoá mềm: đặt deletedAt
restoreTransaction(id: string): Promise<void>         // Sprint 3 – Hoàn tác (BR-90): xoá deletedAt
listTransactions(fromDate: string, toDate: string): Promise<Transaction[]> // chỉ bản ghi deletedAt = null
getBudget(month: string): Promise<MonthlyBudget | null>
setBudget(b: MonthlyBudget): Promise<void>
```

Hàm tính tiền ở mục 4.2, 4.3 vẫn là **hàm thuần đồng bộ**: nhận danh sách giao dịch đã đọc từ `storage`, không tự gọi `storage`.

### 4.2 Công thức "Hôm nay còn được tiêu" `[Sprint 2 – US03]`

Tại ngày `d` của tháng có `N` ngày:

```
Quỹ còn lại đầu ngày  = Ngân sách tháng + Tổng thu trong tháng − Tổng chi từ ngày 1 đến ngày d−1
Số ngày còn lại       = N − d + 1                       (tính cả hôm nay)
Hạn mức hôm nay       = làm tròn XUỐNG tới 1.000đ ( Quỹ còn lại đầu ngày ÷ Số ngày còn lại )
Hôm nay còn được tiêu = Hạn mức hôm nay − Tổng chi hôm nay
```

- Tính "đầu ngày" rồi mới trừ chi hôm nay để con số giảm đúng bằng số tiền vừa tiêu.
- Làm tròn xuống vì con số dùng để quyết định "có nên mua không", thấp hơn một chút thì an toàn hơn.

**Trạng thái** (giao diện chọn màu theo `design-system` mục 4.3):

```
chưa có ngân sách tháng này              → NO_BUDGET
Quỹ còn lại đầu ngày ≤ 0                 → OUT_OF_BUDGET
tỷ lệ = Tổng chi hôm nay ÷ Hạn mức hôm nay   (Hạn mức = 0 thì tỷ lệ = 1)
tỷ lệ < 0,7                              → SAFE
0,7 ≤ tỷ lệ ≤ 1                          → WARNING
tỷ lệ > 1                                → OVER   (hiển thị "Đã vượt <số tiền>")
```

**Quy tắc đi kèm**
- Khoản thu (US07) cộng vào quỹ của tháng nó được ghi. *(Chờ PO chốt.)*
- Sang tháng mới chưa đặt ngân sách → `NO_BUDGET`; `BudgetScreen` gợi ý số tiền tháng trước. *(Chờ PO chốt.)*
- **Không lưu số dư.** Mọi con số tính lại từ danh sách giao dịch.

### 4.3 Thống kê theo danh mục `[Sprint 3 – US04]`

- Chỉ tính `expense`. Lọc `Tuần này` (thứ Hai → Chủ nhật) hoặc `Tháng này`.
- Trả về tổng chi và mỗi danh mục `{categoryId, tổng tiền, phần trăm làm tròn số nguyên}`, giảm dần, bỏ danh mục bằng 0.

### 4.4 Bộ test case bắt buộc

Tháng 11/2026 có 30 ngày, tháng 2/2027 có 28 ngày.

| TC | Ngân sách | Thu trong tháng | Ngày | Chi trước hôm nay | Chi hôm nay | Hạn mức hôm nay | Còn được tiêu | Trạng thái |
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
| 11 | 3.000.000 | 0 | 02/11 | 2.990.000 *(chi ngày 01/11, đặt ngân sách muộn)* | 0 | 0 *(10.000 ÷ 29 = 344, làm tròn xuống)* | 0 | WARNING |

Test nhập liệu và sửa/xoá:

| TC | Đầu vào | Kết quả mong đợi |
| :-: | :--- | :--- |
| 12 | Số tiền = 0 | Không lưu, nút Lưu bị vô hiệu |
| 13 | Số tiền = 100.000.000 | Không lưu, báo "Số tiền tối đa 99.999.999đ" |
| 14 | Không chọn danh mục | Lưu với `an_uong` (mặc định) |
| 15 | Ghi chú 150 ký tự | Chặn ở 100 ký tự |
| 16 | Xoá một khoản chi hôm qua 50.000đ (ngày 16/11, TC3) | Hạn mức hôm nay = làm tròn xuống (1.250.000 ÷ 15) = 83.000 |

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| Code `src/logic/`, `src/storage/` và test tương ứng | — | Nguyễn Đức Minh Nghĩa |
| Task tính tiền trong plan `docs/plans/…md` | `templates/logic-task.md` | Người viết plan tự kiểm |

## 6. Khi viết plan

**Ràng buộc (chép vào Global Constraints):**
- Tiền là số nguyên VND (`number` nguyên); không dùng số thực, không làm tròn lên. Hạn mức ngày làm tròn xuống tới 1.000đ.
- Công thức và mã trạng thái đúng nguyên văn `budget-logic` mục 4.2; không lưu số dư, luôn tính lại từ giao dịch.
- Code tính tiền nằm trong `src/logic/`, là hàm thuần (không đọc ngày giờ hệ thống bên trong – nhận `today` làm tham số), không gọi giao diện.
- Lưu trữ chỉ qua lớp `src/storage/` (SQLite, `expo-sqlite`, ADR-02), mọi hàm trả `Promise`; chạy offline, không gọi mạng.
- Test case lấy đúng số liệu từ `budget-logic` mục 4.4, ghi mã `TC<số>` trong tên test.

**Task bắt buộc:**
- Mỗi hàm tính tiền là một task theo mẫu `templates/logic-task.md`: test fail trước → code → test pass → commit.
- Task có sửa/xoá giao dịch phải có TC16.

**Lệnh kiểm tra:**
- Lệnh chạy unit test của dự án (`docs/architecture/technical-design.md` mục 4) → mọi `TC` liên quan đều pass.

## 7. Quy tắc bắt buộc

1. Không đổi công thức mục 4.2 khi PO chưa duyệt; đổi thì cập nhật cả bảng 4.4 và báo PA sửa PRD.
2. Không thêm đồng bộ máy chủ, đăng nhập, liên kết ngân hàng.
3. Mọi hàm tính tiền có unit test chạy được với các dòng trong bảng 4.4.
4. Không dùng số thực cho tiền; không làm tròn lên.

## 8. Checklist tự kiểm

- [ ] Các TC liên quan trong mục 4.4 đều pass
- [ ] Đổi ngày sang ngày 1 tháng sau → ra `NO_BUDGET`
- [ ] Sửa/xoá giao dịch cũ → số hôm nay cập nhật đúng
- [ ] Tắt mạng vẫn dùng bình thường
