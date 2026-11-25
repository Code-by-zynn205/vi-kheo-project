# Kế hoạch tổng thể – Sprint theo User Story

> **Giai đoạn:** 1 → 5 · **Skill:** scrum-sprint (mục 4.1) · **Trạng thái:** Đề xuất – chờ Sprint Planning thống nhất · **Phụ trách:** Trần Ninh Nhật Tân (SM), Dương Văn Hoan (PO) · **Cập nhật:** 23/11/2026

File này trả lời 3 câu hỏi: **Sprint nào làm User Story nào, mỗi story đang ở bước nào, và ra lệnh cho AI thế nào**. **Đơn vị chia Sprint là User Story** (`scrum-sprint` mục 4.1): mỗi story đi hết chuỗi *Dữ liệu → Đặc tả màn hình → PRD → Spec + plan → Code + PR → Done*. Việc không thuộc story nào (khảo sát, ADR, báo cáo) là **việc hỗ trợ** và phải ghi nó mở khoá story nào.

Ngày, người phụ trách lấy từ `docs/discovery/07-roadmap.md` và `docs/skill-standard.md`. Hạn là đề xuất, SM chốt lại ở Sprint Planning. Story Point lấy từ Backlog `06-journey-features.md` mục 5.

---

## 1. Hiện trạng ngày 23/11/2026 (cuối Sprint 1)

| Giai đoạn | Đã có | Còn thiếu | Chặn User Story nào |
| :--- | :--- | :--- | :--- |
| 1 – Discovery | 8 file `docs/discovery/`, Backlog US01 – US08 | `docs/evidence/survey/` chưa có file trả lời; 2 tỷ lệ "lý do bỏ app" chưa kiểm lại; chưa có biên bản phỏng vấn | Mục "Bối cảnh" của mọi PRD (con số người dùng) |
| 2 – Design | 161 khung Figma, prototype 18 luồng, 14 đặc tả màn hình, `screen-inventory.md`, `prototype/home.html` | Mọi đặc tả ở `Đang làm – chờ UI/UX duyệt`; 8 câu D1 – D8 của `figma-gap-report.md` chưa chốt; test A3 chưa chạy | PRD của mọi story (cần đặc tả `Xong`); PRD US03 (cần A3) |
| 3 – Requirements | `data-analysis.md` (dữ liệu cho US01 – US08, mục 11), `po-decision-proposals.md` | Cột "Quyết định" Q1 – Q16 còn trống; **chưa có PRD nào** | US02 (Q2, Q3), US03 + US07 (Q1), US05 (Q5, Q8, Q16), US06 (Q6, Q7, Q15) |
| 4 – Code | — | Chưa có ADR, chưa có `technical-design.md` | Spec + plan của **mọi** story |

**Kết luận Sprint 1:** US01 đã xong bước Dữ liệu, đang ở bước Đặc tả màn hình; **chưa code được** (rủi ro R1 cũ đã xảy ra). Code US01 thành việc đầu tiên của Sprint 2.

---

## 2. Chuỗi việc của một User Story

Mỗi bước có skill và file đầu ra – bảng này cũng là câu trả lời khi được hỏi "bước này dùng skill nào". Bản đầy đủ skill → file → commit: `docs/present/skill-usage-map.md`.

| Bước | Việc | Skill | Đầu ra | Cổng (phải có trước) |
| :-: | :--- | :--- | :--- | :--- |
| 1 | Dữ liệu của story | `product-requirements` (4.1) | Dòng USxx trong `data-analysis.md` mục 11; BR, EC, ERR liên quan | Backlog đã duyệt |
| 2 | Đặc tả màn hình + Figma | `design-system` (4.4, 4.4a) | `docs/design/screens/<ScreenName>.md` `Xong`, frame Figma | Bước 1 |
| 3 | PRD | `product-requirements` (4.3) | `docs/requirements/USxx-<english-slug>.md` `Đã duyệt` | Bước 2 · câu hỏi PO của story đã chốt |
| 4 | Spec + plan | `frontend-ui`, `budget-logic`, `brainstorming`, `writing-plans` | `docs/plans/specs/…-USxx-…-design.md`, `docs/plans/…-USxx-…md` | Bước 3 · ADR-01, ADR-02 `Đã chấp nhận` + `technical-design.md` |
| 5 | Code + Pull Request | `frontend-ui`, `budget-logic`, `test-driven-development`, `requesting-code-review` | Code trong `src/`, PR | Bước 4 |
| 6 | Done | `verification-before-completion`, `scrum-sprint` | Mọi AC Đạt trên điện thoại thật, thẻ Trello Done | DoD `07-roadmap.md` |

---

## 3. Sprint 2 (24/11 – 03/12): ghi chi, ngân sách, con số hôm nay – bản dùng thử

**Sprint Goal:** sinh viên cài bản dùng thử trên điện thoại thật, ghi được khoản chi/thu, đặt ngân sách và thấy "Hôm nay còn được tiêu" – trước 03/12.

### 3.1 User Story (việc chính)

| Story | SP | Dữ liệu | Đặc tả màn hình | PRD duyệt | Spec + plan | Code + PR | Người code · review |
| :--- | :-: | :--- | :--- | :--- | :--- | :--- | :--- |
| **US01** Ghi khoản chi | 3 | Xong | `HomeScreen`, `AddExpenseScreen` – 24/11 | 25/11 | 26/11 | 28/11 | Phát, Nghĩa (giao diện); Bình Minh, Tiến (lưu trữ) · Vy, Hưng |
| **US02** Ngân sách tháng | 2 | Xong | `BudgetScreen` – 24/11 (sau Q2, Q3) | 26/11 | 27/11 | 30/11 | Nghĩa · Phát |
| **US03** Hôm nay còn được tiêu | 3 | Xong | `HomeScreen` – 24/11; sửa theo A3 – 25/11 | 26/11 | 27/11 | 01/12 | Bình Minh, Tiến (công thức, TDD) · Nghĩa |
| **US07** Ghi khoản thu | 1 | Xong | `AddExpenseScreen` chế độ Thu – 24/11 (sau Q1) | 26/11 | 27/11 | 01/12 | Phát · Hưng |

**Story Point cam kết:** 9. Bản dùng thử (B1) đóng gói 03/12 từ 4 story này.

**Chuẩn bị cho Sprint 3 (chỉ tài liệu, không code):**

| Story | Đặc tả màn hình | PRD duyệt |
| :--- | :--- | :--- |
| **US04** Báo cáo theo danh mục | `ReportScreen` + `DonutChart` vào `design-system` 4.3 – 01/12 | 03/12 |
| **US06** Sửa/xoá giao dịch | `EditTransactionSheet` – 01/12 (sau Q6, Q7, Q15) | 03/12 |
| **US05** Nhắc 21:00 | `SettingsScreen` – 01/12 (sau Q5, Q8, Q16, ADR-04) | 03/12 |
| **US08** Xem lịch sử (nếu kịp) | `HistoryScreen` – 03/12 | 04/12 |

### 3.2 Việc hỗ trợ (mở khoá User Story)

| Mã | Việc | Skill | Đầu ra | Mở khoá | Phụ trách | Hạn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| P1 | PO điền cột "Quyết định" Q1 – Q16 và D2, D4, D7, D8; cập nhật `data-analysis.md` mục 8, 13 | `product-requirements` (4.2) | `po-decision-proposals.md`, `data-analysis.md`, `06-journey-features.md` | US02, US03, US07 bước 3; US05, US06 bước 2 | Hoan (PO), PA | 24/11 |
| S1 | Cặp UI/UX duyệt đặc tả, đặt `Xong` | `design-system` (4.4a) | `docs/design/screens/*.md` | Bước 3 của US01, US02, US03, US07 | Vy, Hưng | 24/11 |
| S3 | Test A3 với 5 SV bằng `home.html` / prototype Figma | `user-research` | `docs/evidence/prototype-tests/A3-<yyyy-mm-dd>.md`, `05-vision.md` (A3) | US03 bước 3 | Thương, Kiệt | 25/11 |
| K1 – K4 | Hỏi năng lực 8 Developer → ADR-01 nền tảng → ADR-02 lưu trữ (tiêu chí từ `data-analysis.md` mục 11) → `technical-design.md` | `tech-decision` | `docs/architecture/ADR-01-app-platform.md`, `ADR-02-local-storage.md`, `technical-design.md` | Bước 4 của **mọi** story | Phát, Nghĩa, Bình Minh, Tiến | 25/11 |
| D1, D2 | Đưa file khảo sát lên repo, đếm lại 2 tỷ lệ | `user-research` | `docs/evidence/survey/`, `00-research-log.md` | Mục "Bối cảnh" của PRD | Thương, Kiệt | 26/11 |
| K5 | Chọn cách phát hành bản dùng thử | `tech-decision` | `ADR-03-trial-distribution.md` | B1, D5 | Phát, Nghĩa | 27/11 |
| K6 | Chọn cách làm thông báo 21:00 | `tech-decision` | `ADR-04-reminder-notifications.md` | US05 bước 2 | Phát, Nghĩa | 01/12 |
| D5 | Tuyển 20 SV (tối thiểu 5), hướng dẫn cài | `user-research` | `docs/evidence/trial/recruitment.md` (không ghi tên, SĐT) | Dùng thử 04/12 | Thương, Kiệt | 01/12 |
| B1 | Đóng gói bản dùng thử | `frontend-ui` | Bản build + mục 5 `technical-design.md` | Dùng thử 04/12 | Phát, Nghĩa | 03/12 |
| T1 | Sprint 1 Review, Sprint 2 Planning | `scrum-sprint` (4.2) | `docs/sprints/sprint-1-review.md`, `sprint-2-planning.md` | — | Tân (SM) | 24/11 |

---

## 4. Sprint 3 (04/12 – 12/12): báo cáo, sửa/xoá, nhắc nhở – dùng thử, demo

**Sprint Goal:** sinh viên xem được tiền đi đâu, sửa được khoản nhập nhầm, được nhắc ghi mỗi tối; nhóm có kết quả dùng thử 7 ngày để demo trước 13/12.

### 4.1 User Story (việc chính)

| Story | SP | Dữ liệu | Đặc tả màn hình | PRD duyệt | Spec + plan | Code + PR | Người code · review |
| :--- | :-: | :--- | :--- | :--- | :--- | :--- | :--- |
| **US04** Báo cáo theo danh mục | 5 | Xong | Sprint 2 | Sprint 2 (03/12) | 04/12 | 08/12 | Phát, Nghĩa · Vy, Hưng |
| **US06** Sửa/xoá giao dịch | 3 | Xong (chờ Q6, Q7, Q15) | Sprint 2 | Sprint 2 (03/12) | 04/12 | 08/12 | Bình Minh, Tiến · Nghĩa |
| **US05** Nhắc 21:00 | 3 | Xong (chờ Q5, Q8, Q16) | Sprint 2 | Sprint 2 (03/12) | 05/12 | 09/12 | Phát, Nghĩa · Bình Minh |
| **US08** Xem lịch sử (nếu kịp) | 2 | Xong | 03/12 | 04/12 | 05/12 | 10/12 | Tiến · Phát |

**Story Point cam kết:** 11 (13 nếu làm US08). PO có thể đẩy US05 lên trước US04 nếu muốn nhắc nhở có tác dụng trong tuần dùng thử (`05-vision.md`, ghi chú A4).

### 4.2 Việc hỗ trợ

| Mã | Việc | Skill | Đầu ra | Mở khoá | Phụ trách | Hạn |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| D6 | Chạy dùng thử 7 ngày, ghi ngày cập nhật bản build | `user-research` | `docs/evidence/trial/` | A4 | Thương, Kiệt | 04/12 – 10/12 |
| D7 | Tổng hợp kết quả A4 | `user-research` | `00-research-log.md`, `05-vision.md` (A4) | T2 | Thương, Kiệt | 11/12 |
| T2 | Kịch bản demo, báo cáo tổng kết, dàn ý slide, bản đồ skill | `demo-present` | `docs/present/demo-script.md`, `final-report.md`, `skill-usage-map.md` | Demo 13/12 | Tân (SM) + mỗi cặp | 12/12 |
| T3 | Sprint 2 Review, Sprint 3 Planning / Review | `scrum-sprint` (4.2) | `docs/sprints/sprint-2-review.md`, `sprint-3-*.md` | — | Tân (SM) | 04/12, 12/12 |

---

## 5. Thứ tự User Story và lý do

| Thứ tự | Story | Sprint | Phụ thuộc | Vì sao đứng ở đây |
| :-: | :--- | :--- | :--- | :--- |
| 1 | US01 Ghi khoản chi | 2 | ADR-01, ADR-02 | Tạo `Transaction` (E01) và lớp lưu trữ mà mọi story sau dùng (`data-analysis.md` mục 11: US01 là story đầu tiên **tạo** E01; US07 tạo E01 loại `INCOME` trên cùng lớp lưu trữ) |
| 2 | US02 Ngân sách tháng | 2 | US01 | Tạo E02; không có ngân sách thì không tính được hạn mức ngày |
| 3 | US03 Hôm nay còn được tiêu | 2 | US01, US02, A3 | Chỉ **đọc** E01 + E02; cách hiển thị phụ thuộc kết quả A3 |
| 4 | US07 Ghi khoản thu | 2 | US01, US03 | Dùng lại màn hình nhập của US01, cộng vào công thức của US03 (BR-21) |
| — | Bản dùng thử | 2 (03/12) | US01, US02, US03, US07 | Dùng thử 7 ngày phải bắt đầu 04/12 |
| 5 | US04 Báo cáo theo danh mục | 3 | US01, `DonutChart` | Must – xếp trước 2 story Should |
| 6 | US06 Sửa/xoá giao dịch | 3 | US01, US03 (TC16) | Should; sửa/xoá đổi E01 nên phải có US03 để kiểm hạn mức tính lại (EC-04) |
| 7 | US05 Nhắc 21:00 | 3 | ADR-04 | Should, ghi E04 (cài đặt) và chỉ đọc E01 để biết hôm nay đã ghi chưa – ít phụ thuộc story khác |
| 8 | US08 Xem lịch sử | 3 – nếu kịp | US01 | Should, chỉ đọc E01, E03 |

---

## 6. Rủi ro lịch

| Mã | Rủi ro | Dấu hiệu | Cách xử lý (PO/SM quyết) |
| :--- | :--- | :--- | :--- |
| R1 | ADR-01, ADR-02 trễ → không story nào vào được bước 4 | 25/11 chưa có ADR `Đã chấp nhận` | Họp 30 phút với 4 Developer chốt ngay; ADR ghi `Đề xuất` vẫn cho viết spec, plan chỉ duyệt khi ADR chấp nhận |
| R2 | PO chưa chốt Q1 – Q16 → PRD US02, US03, US07 trễ | 24/11 cột "Quyết định" còn trống | PRD viết trước với phương án đề xuất, ghi vào "Câu hỏi mở"; PO duyệt PRD là duyệt luôn câu trả lời |
| R3 | Không tìm lại được file khảo sát gốc | D1 trễ | Ghi `Cần bổ sung` cạnh 6 con số khảo sát; không dùng 2 tỷ lệ chưa kiểm lại trong PRD và slide |
| R4 | A3 không đạt (< 4/5 hiểu) | Kết quả S3 | Sửa nhãn/cách hiển thị trong `HomeScreen.md` trước khi viết PRD US03 |
| R5 | Bản dùng thử trễ 03/12 | US03 chưa xong ngày 01/12 | Phát bản có US01 + US02 trước, cập nhật sau; ghi ngày cập nhật |

---

## 7. Lệnh cho AI agent theo bước của User Story

Dán vào Codex / Antigravity / Claude Code. Thân commit của kết quả ghi `Skill: <tên>` và `Agent: <tên>` (`CONTRIBUTING.md` mục 2).

**Bước 1 – Cập nhật dữ liệu khi PO chốt quyết định**
```
Dùng skill product-requirements mục 4.1, 4.2. PO đã chốt: <dán các quyết định Qx>.
Cập nhật docs/requirements/po-decision-proposals.md (cột Quyết định), docs/requirements/data-analysis.md
(cột Trạng thái của BR liên quan, mục 13) và AC trong docs/discovery/06-journey-features.md.
Liệt kê chỗ cần sửa trong skill budget-logic (chưa sửa skill – mở Pull Request riêng).
```

**Bước 2 – Đặc tả màn hình**
```
Dùng skill design-system mục 4.4a. Hoàn thiện docs/design/screens/<ScreenName>.md cho US<xx>:
điền mọi chỗ "Cần bổ sung", đủ trạng thái theo docs/design/screen-inventory.md, mỗi EC-xx và ERR_… của US<xx>
trong docs/requirements/data-analysis.md có trạng thái thể hiện. Chữ trên màn hình đúng nguyên văn. Chỉ dùng component mục 4.3.
```

**Bước 3 – PRD**
```
Dùng skill product-requirements mục 4.3. Viết PRD cho US<xx> từ docs/discovery/06-journey-features.md,
docs/requirements/data-analysis.md (dòng US<xx> mục 11, BR mục 8, ERR mục 12, EC mục 14)
và docs/design/screens/<ScreenName>.md. Trạng thái "Chờ duyệt". Thêm dòng vào docs/requirements/README.md.
Điều gì chưa rõ thì ghi vào mục "Câu hỏi mở", không tự đoán.
```

**Bước 4 – Spec và plan (chưa code)**
```
Dùng skill frontend-ui. Làm brainstorming rồi writing-plans cho US<xx> theo PRD docs/requirements/US<xx>-<english-slug>.md
và docs/architecture/technical-design.md. Phần đầu plan và Global Constraints theo AGENTS.md mục 3.
Chỉ viết spec và plan, KHÔNG viết code. Cập nhật cột "Plan" trong docs/requirements/README.md.
```

**Việc hỗ trợ – ADR (K2, K3, K5, K6)**
```
Dùng skill tech-decision. Viết docs/architecture/ADR-<xx>-<english-slug>.md cho câu hỏi "<câu hỏi>".
Năng lực nhóm: <dán kết quả hỏi nhanh>. Tiêu chí lưu trữ lấy từ docs/requirements/data-analysis.md mục 11.
Mọi khẳng định kỹ thuật phải có link tài liệu chính thức và ngày đọc; không có thì ghi "Cần kiểm chứng". Trạng thái "Đề xuất".
```

**Việc hỗ trợ – Thiết kế kỹ thuật (K4)**
```
Dùng skill tech-decision. ADR-01 và ADR-02 đã chấp nhận. Viết docs/architecture/technical-design.md
theo mẫu, dẫn tới budget-logic mục 4.1 và docs/requirements/data-analysis.md mục 4 cho dữ liệu, không định nghĩa lại kiểu dữ liệu.
```

**Việc hỗ trợ – Khảo sát (D1, D2)**
```
Dùng skill user-research. Đọc docs/evidence/survey/responses.csv và questions.md.
Tạo docs/evidence/survey/summary.md theo mẫu survey-summary.md, ghi tử số/mẫu số mọi tỷ lệ.
Đối chiếu với bảng "Kết quả khảo sát S1" trong docs/discovery/00-research-log.md và liệt kê chỗ lệch.
Chưa sửa file discovery – chỉ báo cáo chỗ lệch.
```

**Việc hỗ trợ – Báo cáo Sprint (T1, T3)**
```
Dùng skill scrum-sprint mục 4.2. Viết docs/sprints/sprint-<N>-review.md từ git log từ <ngày> đến <ngày>
và danh sách thẻ Trello tôi dán dưới đây. Bảng "Skill đã dùng" lấy từ dòng **Skill:** của các file và git log --grep "Skill:".
Việc không có bằng chứng ghi "Cần bổ sung". Cập nhật trạng thái từng User Story trong docs/plans/00-master-plan.md.
```

---

## 8. Cập nhật file này

- SM cập nhật bảng User Story của Sprint sau mỗi Sprint Planning và Sprint Review; `sprint-N-planning.md` chép bảng đó.
- Bước xong: thay hạn bằng `Xong` và đường dẫn file đầu ra.
- Thêm việc hỗ trợ: chọn mã tiếp theo, bắt buộc ghi cột "Mở khoá".
