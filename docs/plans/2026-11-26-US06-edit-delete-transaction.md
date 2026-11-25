# US06 Sửa / xoá giao dịch – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – **chỉ thực thi khi PRD US06 `Đã duyệt`, US01 và US03 `Done`** (hàng đợi mục 2a, dòng 7) · **Phụ trách:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Bấm một khoản để sửa số tiền / danh mục / ghi chú hoặc xoá, có Hoàn tác 8 giây; mọi con số tính lại.

**Architecture:** Thêm `updateTransaction`, `deleteTransaction` (xoá mềm), `restoreTransaction` vào `storage`; route `edit/[id]` dùng lại component của US01; Hoàn tác bằng `Snackbar` ở Home.

**Tech Stack:** Expo SDK 58 + TypeScript, Expo Router, `expo-sqlite`, Jest 30 + `jest-expo` (`technical-design.md` mục 1).

**Spec:** docs/plans/specs/2026-11-26-US06-edit-delete-transaction-design.md
**PRD:** docs/requirements/US06-edit-delete-transaction.md
**Skill nhóm áp dụng:** tech-decision (mục 6), frontend-ui (mục 4.3, 6), design-system (mục 4.3, 6), budget-logic (mục 4.1, 4.4, 6), product-requirements (mục 6)

## Global Constraints

**Ràng buộc chung của dự án** (`AGENTS.md` mục 4, `CONTRIBUTING.md`):
- Tên file, thư mục, nhánh bằng tiếng Anh; chữ trên giao diện tiếng Việt có dấu, không emoji (quy tắc 4).
- Tiền là số nguyên VND, hiển thị `35.000đ` (quy tắc 5).
- Không commit thẳng vào `main`; nhánh theo cột "Nhánh" của hàng đợi `00-master-plan.md` mục 2a; commit `<loại>(<phạm vi>): <mô tả>`, thân commit có dòng `Skill: …` và `Agent: …` (quy tắc 9, `CONTRIBUTING.md` mục 2).
- Không commit khoá API, khoá ký, `credentials.json`, file build, `node_modules` (quy tắc 13).
- Lệnh: `npm run test` (unit test), `npm run typecheck`, `npx expo start` + Expo Go trên Android (`technical-design.md` mục 4).

#### `tech-decision` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Chỉ dùng công nghệ, phiên bản và thư viện có trong `docs/architecture/technical-design.md` mục 1 và mục 6; thư viện lớn mới phải có ADR được chấp nhận trước.
- Đường dẫn file theo `technical-design.md` mục 2; lệnh chạy/test/build theo mục 4.
- Không thêm máy chủ, đăng nhập, dịch vụ trả phí (ADR tiêu chí A2, A4).

**Task bắt buộc:**
- Plan đầu tiên của dự án (US01) có task dựng khung dự án theo `technical-design.md`, kết thúc bằng: chạy app trên điện thoại thật và chạy lệnh unit test thành công (dù chưa có test nào).

**Lệnh kiểm tra:**
- Lệnh unit test trong `technical-design.md` mục 4 → chạy được.
- Lệnh build trong `technical-design.md` mục 4 → không lỗi.

#### `frontend-ui` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Chỉ làm AC trong PRD; mục "Ngoài phạm vi" của PRD là cấm.
- Màn hình nằm trong `src/screens/`, chỉ gọi `src/logic/` và `src/storage/`, không tự tính tiền.
- Không thêm thư viện UI lớn (bộ component, framework CSS) khi chưa thống nhất ở Sprint Planning.
- Không commit khoá API, file build, `node_modules`.

**Task bắt buộc:**
- Mỗi màn hình là một task theo `templates/screen-task.md`.
- Task cuối: chạy trên điện thoại thật, đi từng AC của PRD, ghi kết quả vào mô tả Pull Request.

**Lệnh kiểm tra:**
- Lệnh chạy unit test (`technical-design.md` mục 4) → pass.
- Lệnh build (`technical-design.md` mục 4) → không lỗi.

#### `design-system` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Chỉ dùng token trong `src/theme/` (chép từ `design-system` mục 4.2); không viết cứng mã màu, `px` cỡ chữ, font trong `src/screens/` và `src/components/`.
- Chỉ dùng component ở `design-system` mục 4.3; component mới phải được thêm vào skill trước.
- Mọi vùng bấm ≥ 48 × 48 px; màn hình rộng 360px không vỡ, không cuộn ngang.
- Tiền hiển thị qua hàm `formatMoney` dạng `35.000đ`; chi `−`, thu `+`.
- Mọi chữ trên giao diện bằng tiếng Việt có dấu, không emoji.
- Mỗi màn hình có trạng thái trống (`EmptyState`) và trạng thái lỗi.
- Bố cục theo frame Figma ghi trong đặc tả; chữ hiển thị theo đặc tả `.md` mục 4. Hai bên lệch → dừng, hỏi cặp UI/UX.

**Task bắt buộc:**
- Task cuối của plan giao diện: soát theo `templates/ui-review.md`, chụp ảnh trên điện thoại thật gắn vào Pull Request.

**Lệnh kiểm tra:**
- `grep -rnE "#[0-9A-Fa-f]{6}" src/screens src/components` → không có kết quả

#### `budget-logic` mục 6 – chép nguyên văn

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

#### `product-requirements` mục 6 – chép nguyên văn

**Ràng buộc (chép vào Global Constraints):**
- Plan chỉ làm những gì có trong mục "Tiêu chí chấp nhận" của PRD; mục "Ngoài phạm vi" của PRD là cấm.
- Mỗi AC trong PRD phải được ít nhất 1 task kiểm tra (unit test hoặc bước kiểm tay trên điện thoại).
- PRD có câu hỏi mở chưa trả lời → không viết plan cho phần đó.
- Tên trường, enum, mã lỗi trong code lấy đúng `docs/requirements/data-analysis.md` (mục 4, 7, 12); không đặt tên khác.

**Task bắt buộc:**
- Task cuối: đi lần lượt từng AC của PRD trên điện thoại thật, ghi Đạt/Chưa đạt vào mô tả Pull Request.

**Lệnh kiểm tra:**
- Không có lệnh riêng; kiểm bằng bảng AC trong mô tả Pull Request.

## Review Focus

1. Hoàn tác sau khi đã ghi thêm một khoản mới → khoản cũ quay lại đúng vị trí theo `createdAt`, không lên đầu – test ở Task 1.
2. Sửa khoản rồi xoá chính khoản đó trong cùng phiên → bản ghi đã xoá giữ số tiền mới – test ở Task 1.
3. Mở `edit/<id>` của khoản đã bị xoá (bấm nhanh hai lần) → đóng màn, không lỗi – bước kiểm ở Task 3.
4. Xoá khoản duy nhất hôm nay khi đã bật nhắc (US05) → nhắc hôm nay được hẹn lại – bước kiểm ở Task 3.
5. Sửa số tiền thành giá trị cũ → "Lưu thay đổi" vô hiệu trở lại – test ở Task 2.

---

### Task 1: Sửa, xoá mềm, hoàn tác trong `storage` [budget-logic §4.1, §4.4]

**AC trong PRD:** AC2, AC5 – AC7, AC9 (`docs/requirements/US06-edit-delete-transaction.md`)
**Test case:** TC16

**Files:**
- Modify: `src/storage/transactions.ts`
- Test: `__tests__/storage-editDelete-test.ts`, `__tests__/tc16-test.ts`

**Interfaces:**
- Produces: `updateTransaction(t: Transaction): Promise<void>` (chỉ ghi `amount`, `category_id`, `note`, `updated_at`), `deleteTransaction(id: string): Promise<void>`, `restoreTransaction(id: string): Promise<void>`, `getTransaction(id: string): Promise<Transaction | null>`

- [ ] **Step 1: Test hỏng**
  - sửa 30.000 → 35.000: `amount` mới, `updatedAt` mới, `type` và `date` không đổi dù đối tượng truyền vào có `date` khác (BR-11)
  - xoá → `listTransactions` không còn; `getTransaction` vẫn trả, `deletedAt` có giá trị (xoá mềm)
  - hoàn tác → quay lại, `deletedAt` null; vị trí theo `createdAt` (Review Focus 1)
  - Review Focus 2
  - `TC16`: dữ liệu TC3 + khoản chi hôm qua 50.000 → xoá → `computeDayLimit(…).dayLimit` = 83.000
- [ ] **Step 2: Chạy** → FAIL; **viết code**; chạy → PASS
- [ ] **Step 3: Commit** – `feat(US06): update, soft delete, restore (TC16)`

### Task 2: `isEdited` [budget-logic §6]

**AC trong PRD:** AC1, AC2 (`docs/requirements/US06-edit-delete-transaction.md`)
**Test case:** — (so sánh bản nháp)

**Files:**
- Create: `src/logic/editForm.ts`
- Test: `__tests__/editForm-test.ts`

**Interfaces:**
- Produces: `isEdited(original: Pick<Transaction, 'amount' | 'categoryId' | 'note'>, draft: Pick<Transaction, 'amount' | 'categoryId' | 'note'>): boolean`

- [ ] **Step 1: Test hỏng:** giống hệt → false; đổi số → true; đổi rồi đổi lại → false (Review Focus 5); ghi chú `'cơm '` so với `'cơm'` → false (so sau khi bỏ khoảng trắng)
- [ ] **Step 2: Chạy** → FAIL; **viết code**; chạy → PASS
- [ ] **Step 3: Commit** – `feat(US06): edit form dirty check`

### Task 3: `EditTransactionSheet`, Hoàn tác ở Home [frontend-ui §4.3, design-system §4.3, §6]

**AC trong PRD:** AC1, AC3, AC4, AC6 – AC8, AC10, AC11 (`docs/requirements/US06-edit-delete-transaction.md`)
**Đặc tả:** `EditTransactionSheet.md` mục 1 – 4
**Hàm logic gọi tới:** `isEdited`, `updateTransaction`, `deleteTransaction`, `restoreTransaction`

**Files:**
- Create: `src/screens/EditTransactionSheet.tsx`, `src/app/edit/[id].tsx` (`presentation: 'modal'`)
- Modify: `src/components/TransactionItem.tsx` (bấm → `/edit/<id>`), `src/screens/HomeScreen.tsx` (`Snackbar` "Đã xoá khoản <số tiền>" + "Hoàn tác" 8 giây; "Đã lưu thay đổi")

- [ ] **Step 1: Dựng màn** theo `EditTransactionSheet.md`: "Sửa khoản chi" / "Sửa khoản thu"; "Ghi lúc <HH:mm>, <Thứ> <dd/mm>"; không công tắc `Chi | Thu`, không chọn ngày; "Lưu thay đổi" vô hiệu khi `!isEdited` hoặc số tiền 0; "Xoá khoản này" màu `dangerText`, cách nút chính ≥ 24; sửa rồi bấm `X` → `ConfirmDialog` "Bỏ thay đổi?" · "Bỏ" · "Tiếp tục sửa"; `id` không tồn tại / đã xoá → đóng màn (Review Focus 3).
- [ ] **Step 2: Sau xoá / hoàn tác gọi `syncReminders()`** nếu module `src/reminder` đã có (Review Focus 4)
- [ ] **Step 3: Chạy** `npm run typecheck`, `npm run test`, grep màu → sạch
- [ ] **Step 4: Commit** – `feat(US06): EditTransactionSheet with undo`

### Task 4: Kiểm AC trên máy thật, mở PR [product-requirements §6]

- [ ] **Step 1: Trên máy thật đi AC1 – AC11** (bảng 5.2) và Review Focus 3, 4. Ghi Đạt / Chưa đạt.
- [ ] **Step 2: Mở PR** nhánh `feature/US06-edit-delete-transaction`; cập nhật Trạng thái dòng 7 hàng đợi.
