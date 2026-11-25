<!-- Mẫu một task tính tiền trong plan docs/plans/YYYY-MM-DD-USxx-<english-slug>.md. Chép, điền <...>, xoá các dòng chú thích. -->

### Task <n>: <Tên hàm> [budget-logic §4.<x>, §4.4]

**AC trong PRD:** AC<x>, AC<y> (`docs/requirements/USxx-<english-slug>.md`)
**Test case:** TC<a>, TC<b>, TC<c>

**Files:**
- Tạo/Sửa: `src/logic/<file-name>.<ts|js>`
- Test: theo `docs/architecture/technical-design.md` mục 2 (hiện tại `__tests__/<file-name>-test.ts`)

- [ ] **Bước 1: Viết test fail**

<!-- Mỗi TC một test, tên test bắt đầu bằng mã TC. Số liệu chép đúng từ budget-logic mục 4.4. -->

```<ngôn ngữ>
test('TC<a> – <mô tả ngắn>', () => {
  // Cho trước: ngân sách <...>, thu <...>, ngày <...>, chi trước hôm nay <...>, chi hôm nay <...>
  // Mong đợi: hạn mức <...>, còn được tiêu <...>, trạng thái <...>
});
```

- [ ] **Bước 2: Chạy test, thấy fail**

Chạy: `<lệnh test> <file-name>` (lệnh ở `technical-design.md` mục 4)
Mong đợi: FAIL vì `<hàm>` chưa có.

- [ ] **Bước 3: Viết code tối thiểu cho test pass**

<!-- Hàm thuần: nhận `today` làm tham số, chỉ dùng số nguyên, làm tròn xuống tới 1.000đ. -->

- [ ] **Bước 4: Chạy test, thấy pass**

Chạy: `<lệnh test> <file-name>` (lệnh ở `technical-design.md` mục 4)
Mong đợi: PASS cả TC<a>, TC<b>, TC<c>.

- [ ] **Bước 5: Commit**

```bash
git add src/logic/<file-name>.*
git commit -m "feat(USxx): <hàm> theo budget-logic §4.<x> (TC<a>–TC<c>)"
```
