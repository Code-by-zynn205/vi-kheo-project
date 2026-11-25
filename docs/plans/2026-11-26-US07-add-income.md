# US07 Ghi khoản thu – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3) · **Trạng thái:** Nháp – **chỉ thực thi khi PRD US07 `Đã duyệt`, US01 và US03 `Done`** (hàng đợi mục 2a, dòng 5 – cắt sang Sprint 3 nếu 01/12 dòng 1 – 3 chưa Done) · **Phụ trách:** Lê Thị Phát · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Trên màn nhập, chuyển `Chi | Thu` sang "Thu" để ghi khoản thu; Home hiện "+…" màu thu và "Hôm nay còn được tiêu" tăng tương ứng.

**Architecture:** Dùng lại `createTransaction` (US01) với `type: 'INCOME'`; `SegmentedControl` trên `AddExpenseScreen`; công thức đã cộng khoản thu (US02, US03) nên không sửa logic tính tiền.

**Tech Stack:** Expo SDK 58 + TypeScript, Expo Router, `expo-sqlite`, Jest 30 + `jest-expo` (`technical-design.md` mục 1).

**Spec:** docs/plans/specs/2026-11-26-US07-add-income-design.md
**PRD:** docs/requirements/US07-add-income.md
**Skill nhóm áp dụng:** tech-decision (mục 6), frontend-ui (mục 4.3, 6), design-system (mục 4.2, 4.3, 6), budget-logic (mục 4.1, 4.2, 4.4, 6), product-requirements (mục 6)

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

1. Đổi "Chi" → "Thu" khi đang có lỗi vượt mức → lỗi biến mất, số giữ nguyên – bước kiểm ở Task 2.
2. Khoản thu không có danh mục → `TransactionItem` vẫn hiện được (không lỗi khi `categoryId` null) – bước kiểm ở Task 2.
3. Khoản thu ghi ngày 30/11 → không làm tăng hạn mức ngày 01/12 (BR-21) – test ở Task 1.
4. Tổng "Chi tiêu hôm nay" khi chỉ có khoản thu → "0đ" hoặc trạng thái trống đúng đặc tả – test ở Task 1.
5. Lưu khoản thu khi chưa có ngân sách → vẫn `NO_BUDGET`, không lỗi – test ở Task 1.

---

### Task 1: Khoản thu trong logic [budget-logic §4.2, §4.4]

**AC trong PRD:** AC2, AC4, AC6 (`docs/requirements/US07-add-income.md`)
**Test case:** TC7

**Files:**
- Test: `__tests__/income-test.ts`

**Interfaces:**
- Consumes: `createTransaction` (US01 Task 4), `computeDayLimit` (US02), `computeDailyAllowance` (US03), `sumByType` (US01)

- [ ] **Step 1: Viết test**
  - `createTransaction({ type: 'INCOME', amount: 1200000, categoryId: 'an_uong' }, now).categoryId` = null (BR-10)
  - `TC7` qua đường khoản thu thật: giao dịch thu 1.200.000 ngày `2026-11-05` + chi 2.000.000 trước 16/11 → `computeDailyAllowance(… today '2026-11-16').dayLimit` = 113.000 (AC4)
  - thu ngày `2026-11-30` không tính vào tháng 12 (AC6, Review Focus 3)
  - chỉ có khoản thu hôm nay → `sumByType(…, 'EXPENSE', today, today)` = 0 (Review Focus 4)
  - không có ngân sách, có khoản thu → `status` `NO_BUDGET` (Review Focus 5)
- [ ] **Step 2: Chạy** `npm run test -- income` → FAIL ở dòng `categoryId` (nếu US01 chưa ép null)
- [ ] **Step 3: Sửa `createTransaction`**: `INCOME` thì `categoryId = null`
- [ ] **Step 4: Chạy** → PASS
- [ ] **Step 5: Commit** – `feat(US07): income transactions in logic (TC7)`

### Task 2: Chế độ "Thu" trên màn nhập, khoản thu ở Home [frontend-ui §4.3, design-system §4.3, §6]

**AC trong PRD:** AC1 – AC3, AC5 (`docs/requirements/US07-add-income.md`)
**Đặc tả:** `AddExpenseScreen.md` mục 3, 4; `HomeScreen.md` mục 2 ("Có khoản thu hôm nay")
**Hàm logic gọi tới:** `createTransaction`, `sumByType`

**Files:**
- Create: `src/components/SegmentedControl.tsx`
- Modify: `src/screens/AddExpenseScreen.tsx`, `src/components/TransactionItem.tsx`

- [ ] **Step 1: Hiện công tắc `Chi | Thu`**; chế độ Thu: tiêu đề "Ghi khoản thu", ẩn lưới danh mục, số màu `successText`, placeholder "Ví dụ: lương làm thêm, nhà gửi", nút "Lưu khoản thu"; đổi chế độ giữ số tiền.
- [ ] **Step 2: `TransactionItem`** khoản thu: "+<số tiền>" màu `successText`, không icon danh mục (Review Focus 2).
- [ ] **Step 3: Chạy** `npm run typecheck`, `npm run test`, grep màu → sạch
- [ ] **Step 4: Commit** – `feat(US07): income mode on AddExpenseScreen`

### Task 3: Kiểm AC trên máy thật, mở PR [product-requirements §6]

- [ ] **Step 1: Trên máy thật đi AC1 – AC6 của PRD** (bảng 5.2) và Review Focus 1, 2. Ghi Đạt / Chưa đạt.
- [ ] **Step 2: Mở PR** nhánh `feature/US07-add-income`; cập nhật Trạng thái dòng 5 hàng đợi.
