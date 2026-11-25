# US04 Báo cáo theo danh mục – Implementation Plan

> **Giai đoạn:** 4 – Vibe Code · **Skill:** writing-plans, frontend-ui (mục 4.3), budget-logic (mục 4.3) · **Trạng thái:** Nháp – **chỉ thực thi khi PRD US04 `Đã duyệt`, US01 `Done`** (hàng đợi mục 2a, dòng 8) · **Phụ trách:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa · **Cập nhật:** 26/11/2026

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Tab "Báo cáo" cho thấy tổng chi và từng danh mục (nhiều nhất trước, có %) trong "Tuần này" / "Tháng này", kèm biểu đồ vòng.

**Architecture:** Hàm thuần `reportByCategory` + `weekRange` / `monthRange`; `ReportScreen` vẽ `DonutChart` bằng `react-native-svg`.

**Tech Stack:** Expo SDK 58 + TypeScript, Expo Router, `expo-sqlite`, `react-native-svg` (thêm ở story này), Jest 30 + `jest-expo` (`technical-design.md` mục 1).

**Spec:** docs/plans/specs/2026-11-26-US04-category-report-design.md
**PRD:** docs/requirements/US04-category-report.md
**Skill nhóm áp dụng:** tech-decision (mục 6), frontend-ui (mục 4.3, 6), design-system (mục 4.2, 4.3, 6), budget-logic (mục 4.3, 4.4, 6), product-requirements (mục 6)

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

1. Hôm nay là Chủ nhật → "Tuần này" là thứ Hai trước đó tới hôm nay (`2026-11-22` → `16/11 – 22/11`) – test ở Task 1.
2. Hai danh mục bằng tiền nhau → thứ tự ổn định (theo thứ tự danh mục trong `CATEGORIES`) – test ở Task 1.
3. Một khoản rất nhỏ (1.000đ trong 1.577.000đ) → hiện 0% nhưng vẫn có hàng (khác 0 tiền) – test ở Task 1.
4. Đổi bộ lọc liên tục → không hiện số của bộ lọc cũ – bước kiểm ở Task 3.
5. Màn 360px với 6 danh mục và tên dài "Mua sắm & Sinh hoạt" → không vỡ hàng – bước kiểm ở Task 3.

---

### Task 1: `reportByCategory`, `weekRange`, `monthRange` [budget-logic §4.3, §4.4]

**AC trong PRD:** AC1 – AC5 (`docs/requirements/US04-category-report.md`)
**Test case:** TC18, TC19, TC20

**Files:**
- Create: `src/logic/reportByCategory.ts`
- Modify: `src/utils/date.ts`
- Test: `__tests__/reportByCategory-test.ts`, `__tests__/date-test.ts`

**Interfaces:**
- Consumes: `CATEGORIES` (US01)
- Produces: `reportByCategory(transactions: Transaction[], range: { from: string; to: string }): { total: number; rows: { categoryId: CategoryId; amount: number; percent: number }[] }`; `weekRange(today: string)`, `monthRange(today: string)`: `{ from: string; to: string }`

- [ ] **Step 1: Test hỏng – `TC18`, `TC19`, `TC20` của `budget-logic` 4.4** (TC18: `total` 1.577.000, `percent` 48, 32, 9, 6, 5, không có `khac`; TC19: `weekRange('2026-11-19')` = `{ from: '2026-11-16', to: '2026-11-22' }`, `total` 50.000, 60 / 40; TC20: `rows` rỗng). Thêm Review Focus 1 – 3; `monthRange('2026-11-19')` = `{ from: '2026-11-01', to: '2026-11-30' }`.
- [ ] **Step 2: Chạy** → FAIL; **viết code** (phần trăm `Math.round`, bỏ `INCOME`, bỏ đã xoá, bỏ danh mục 0đ); chạy → PASS
- [ ] **Step 3: Commit** – `feat(US04): category report (TC18-TC20)`

### Task 2: `DonutChart` [design-system §4.3, tech-decision §6]

**AC trong PRD:** AC1, AC7 (`docs/requirements/US04-category-report.md`)
**Đặc tả:** `ReportScreen.md` mục 1
**Hàm logic gọi tới:** Không

**Files:**
- Create: `src/components/DonutChart.tsx`
- Modify: `docs/architecture/technical-design.md` mục 6 (thêm `react-native-svg` – lý do: vẽ cung, spec US04)

- [ ] **Step 1: Cài** `npx expo install react-native-svg`; ghi vào `technical-design.md` mục 6
- [ ] **Step 2: Viết `DonutChart { rows; total }`**: mỗi cung màu `cat*` của danh mục; tâm "Tổng chi" + số tiền; 1 danh mục → vòng một màu
- [ ] **Step 3: Chạy** `npm run typecheck`, grep màu → sạch
- [ ] **Step 4: Commit** – `feat(US04): DonutChart with react-native-svg`

### Task 3: `ReportScreen`, tab "Báo cáo", kiểm AC, mở PR [frontend-ui §4.3, design-system §6, product-requirements §6]

**AC trong PRD:** AC1, AC6, AC8 (`docs/requirements/US04-category-report.md`)
**Đặc tả:** `ReportScreen.md` mục 1 – 4
**Hàm logic gọi tới:** `reportByCategory`, `weekRange`, `monthRange`

**Files:**
- Create: `src/screens/ReportScreen.tsx`, `src/app/(tabs)/report.tsx`
- Modify: `src/app/(tabs)/_layout.tsx` (bỏ `href: null` của tab `report`)

- [ ] **Step 1: Dựng màn** theo `ReportScreen.md`: "Báo cáo"; `SegmentedControl` "Tuần này" · "Tháng này" (mặc định Tháng này); dòng "dd/mm – dd/mm"; `DonutChart`; danh sách chấm màu · tên · `ProgressBar` · % · số tiền; trống: "Chưa có khoản chi nào trong tuần này" / "… tháng này" + "+ Ghi khoản chi".
- [ ] **Step 2: Chạy toàn bộ kiểm tra** → sạch
- [ ] **Step 3: Trên máy thật đi AC1 – AC8** (bảng 5.2) và Review Focus 4, 5. Ghi Đạt / Chưa đạt.
- [ ] **Step 4: Mở PR** nhánh `feature/US04-category-report`; cập nhật Trạng thái dòng 8 hàng đợi.
