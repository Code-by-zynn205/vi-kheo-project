<!-- Mẫu một task giao diện trong plan docs/plans/YYYY-MM-DD-USxx-<english-slug>.md. Chép, điền <...>, xoá các dòng chú thích. -->

### Task <n>: <ScreenName or ComponentName> [frontend-ui §4.2 · design-system §4.2, §4.3]

**AC trong PRD:** AC<x>, AC<y> (`docs/requirements/USxx-<english-slug>.md`)
**Đặc tả:** `docs/design/screens/<ScreenName>.md` mục <1–4>
**Hàm logic gọi tới:** `<tên hàm>` (`budget-logic` §4.<x>) <hoặc "Không">

**Files:**
- Tạo/Sửa: `src/screens/<ScreenName>.<ext>` hoặc `src/components/<ComponentName>.<ext>`
- Test: `<file test nếu có>`

- [ ] **Bước 1: Viết test hoặc kịch bản kiểm**

<!-- Có thể test tự động (hiển thị đúng chữ, nút vô hiệu khi số tiền = 0...) thì viết test fail trước.
     Không test tự động được thì ghi kịch bản kiểm tay: bước bấm → kết quả nhìn thấy, lấy từ PRD mục 5.2. -->

- [ ] **Bước 2: Dựng giao diện theo đặc tả**

<!-- Chỉ dùng token trong src/theme và component trong src/components. Chữ chép nguyên văn từ đặc tả mục 4. -->

- [ ] **Bước 3: Nối dữ liệu**

<!-- Gọi hàm trong src/logic, src/storage. Không tính tiền trong màn hình. -->

- [ ] **Bước 4: Kiểm**

Chạy: `<lệnh test>` → PASS
Kiểm tay trên điện thoại (rộng 360px): <trạng thái có dữ liệu · trống · lỗi> đúng đặc tả mục 2.
Không còn mã màu viết cứng: `grep -nE "#[0-9A-Fa-f]{6}" src/screens/<ScreenName>.<ext>` → không có kết quả.

- [ ] **Bước 5: Commit**

```bash
git add src/screens/<ScreenName>.* src/components/<...>
git commit -m "feat(USxx): <ScreenName> theo đặc tả"
```
