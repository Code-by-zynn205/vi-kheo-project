---
name: tech-decision
description: Chọn công nghệ và viết tài liệu thiết kế kỹ thuật cho Ví Khéo – so sánh phương án theo tiêu chí của nhóm, ghi quyết định thành ADR, rồi gom kiến trúc, mô hình dữ liệu, cấu trúc thư mục, lệnh chạy/test/build vào một file technical-design. Dùng khi cần chọn hoặc đổi công nghệ (framework, lưu trữ, thư viện lớn, cách phát hành bản dùng thử), khi viết hoặc sửa file trong docs/architecture, hoặc khi plan code cần biết lệnh chạy, lệnh test, cấu trúc thư mục.
---

# Skill: Chọn công nghệ & Thiết kế kỹ thuật – Ví Khéo

## 1. Giai đoạn & phụ trách

| Giai đoạn | Sprint | Việc chính |
| :--- | :--- | :--- |
| 4 – Vibe Code (chuẩn bị) | Sprint 1 – trước khi viết plan US01 | ADR-01 chọn nền tảng app · ADR-02 cách lưu dữ liệu · `technical-design.md` bản đầu |
| 4 – Vibe Code | Sprint 2 | ADR cho thông báo 21:00 (US05) và cách phát hành bản dùng thử (trước 03/12) |
| 4 – Vibe Code | Bất kỳ lúc nào | ADR mới khi muốn thêm thư viện lớn hoặc đổi quyết định cũ |

- **Phụ trách chính:** Lê Thị Phát, Nguyễn Đức Minh Nghĩa (giao diện) · Nguyễn Thị Bình Minh, Nguyễn Diên Tiến (dữ liệu)
- **Duyệt:** 8 Developers thống nhất tại Sprint Planning (Scrum Guide 2020: Developers quyết định cách làm) · Trần Ninh Nhật Tân (SM) ghi nhận · Dương Văn Hoan (PO) được báo về ảnh hưởng tới phạm vi và lịch

## 2. Khi nào dùng / không dùng

**Dùng khi:** chọn framework, cách lưu trữ, thư viện lớn, cách phát hành bản dùng thử · muốn đổi một quyết định đã có · viết/sửa `docs/architecture/` · plan code cần lệnh chạy/test/build và cấu trúc thư mục.

**Không dùng khi:** chọn màu, font, component (→ `design-system`) · đổi công thức tính tiền (→ `budget-logic`, PO duyệt) · viết yêu cầu một User Story (→ `product-requirements`) · thêm thư viện nhỏ dùng trong một file (ghi lý do trong Pull Request là đủ).

## 3. Đầu vào

1. `docs/discovery/06-journey-features.md` – Backlog, mức MoSCoW (US05 nhắc 21:00 là Should)
2. `docs/discovery/07-roadmap.md` – lịch Sprint, hạn bản dùng thử 03/12, demo trước 13/12
3. `docs/discovery/03-personas.md` – sinh viên dùng điện thoại gì, cài app thế nào
4. `.agents/skills/budget-logic/SKILL.md` mục 4.1 – mô hình dữ liệu, lớp `storage`
5. `.agents/skills/design-system/SKILL.md` mục 4.2, 4.3 – token, component cần dựng
6. `docs/architecture/` – các ADR đã có (không quyết định trùng hoặc mâu thuẫn mà không ghi "thay thế ADR-xx")
7. Kết quả hỏi nhanh trong nhóm: mỗi Developer đã từng làm công nghệ nào (do SM hỏi, ghi vào ADR)

## 4. Quy trình

### 4.1 Viết một ADR (Architecture Decision Record)

1. **Nêu câu hỏi cần quyết định** trong 1 câu, ví dụ "App chạy trên nền tảng nào?". Mỗi ADR chỉ một câu hỏi.
2. **Liệt kê 2–4 phương án** thật sự khả thi. Không đưa phương án chỉ để làm nền. Với ADR-01 (nền tảng app), nhóm đã nêu sẵn 3 ứng viên ở Sprint 0 – đây là `[NHẬN ĐỊNH]`, phải kiểm chứng ở bước 5:

   | Ứng viên | Nhóm kỳ vọng được | Nhóm lo ngại |
   | :--- | :--- | :--- |
   | Web app chạy trên điện thoại (PWA, ví dụ React + Vite) | Dựng nhanh, dùng lại prototype HTML, mở bằng link | Nhắc 21:00 (US05) trên iPhone có thể bị hạn chế |
   | React Native (Expo) | App thật, thông báo cục bộ, cài thử qua Expo Go | Cần cài môi trường |
   | Flutter | App thật, giao diện mượt | Dart, có thể ít thành viên quen |
3. **Lọc bằng tiêu chí bắt buộc** (mục 4.2, nhóm A). Phương án trượt một tiêu chí bắt buộc → loại, ghi lý do.
4. **Chấm điểm** các phương án còn lại theo nhóm B: điểm 1–5 × trọng số. Mỗi điểm có 1 câu lý do và nguồn.
5. **Kiểm chứng thông tin kỹ thuật** (ví dụ "PWA trên iPhone có nhận thông báo không?") bằng tài liệu chính thức: ghi link, ngày đọc, nhãn `[THỨ CẤP]`. Không tìm được nguồn → ghi `Cần kiểm chứng`, không đoán.
6. **Ghi quyết định và hệ quả:** được gì, mất gì, rủi ro, cách giảm rủi ro, điều kiện để xem lại quyết định.
7. **Tạo file** `docs/architecture/ADR-<số 2 chữ số>-<mô-tả>.md` từ `templates/adr.md`, thêm 1 dòng vào `docs/architecture/README.md`.
8. **Duyệt:** mở Pull Request nhánh `docs/adr-<số>-<mô-tả>`; Developers thống nhất tại Sprint Planning hoặc trong PR → trạng thái `Đã chấp nhận`.
9. **Đổi quyết định:** không sửa ADR cũ. Viết ADR mới, ghi "Thay thế ADR-xx"; ADR cũ đổi trạng thái `Đã thay thế bởi ADR-yy`.

### 4.2 Tiêu chí của Ví Khéo

**Nhóm A – bắt buộc (trượt là loại):**

| Mã | Tiêu chí | Vì sao |
| :--- | :--- | :--- |
| A1 | Chạy trên điện thoại thật của sinh viên, cả Android và iPhone | Definition of Done: chạy trên điện thoại thật |
| A2 | Lưu dữ liệu trên máy, dùng được khi tắt mạng, không cần đăng nhập | Phạm vi MVP, `budget-logic` mục 4.1 |
| A3 | Có bản cho ≥ 5 sinh viên dùng thử trước 03/12 mà không cần lên App Store / Google Play | Lịch dùng thử 7 ngày 04/12 – 10/12 |
| A4 | Miễn phí cho nhóm (công cụ, dịch vụ, tài khoản) | Dự án môn học |

**Nhóm B – chấm điểm (1–5, nhân trọng số):**

| Mã | Tiêu chí | Trọng số | Cách chấm |
| :--- | :--- | :-: | :--- |
| B1 | Số Developer đã từng làm công nghệ này | 3 | Theo kết quả hỏi nhanh trong nhóm, ghi số người/8 |
| B2 | Thời gian dựng xong khung dự án và chạy được trên điện thoại | 3 | Ước lượng của Developers, ghi rõ là `[NHẬN ĐỊNH]` |
| B3 | Làm được nhắc 21:00 (US05) trên cả Android và iPhone | 2 | Theo tài liệu chính thức; làm được một nửa thì ≤ 3 |
| B4 | AI agent (Codex, Antigravity, Claude Code) sinh code tốt, tài liệu phổ biến | 2 | `[NHẬN ĐỊNH]` của nhóm, nêu ví dụ cụ thể |
| B5 | Viết unit test cho `src/logic/` dễ (chạy bằng một lệnh, không cần điện thoại) | 2 | Có bộ test chạy trên máy tính không |
| B6 | Cách cài cho người dùng thử đơn giản (mở link / quét QR / cài APK) | 1 | Số bước người dùng phải làm |

Trọng số chỉ được đổi khi cả nhóm đồng ý; đổi thì ghi trong ADR.

### 4.3 Viết `technical-design.md`

Sau khi ADR-01 (nền tảng) và ADR-02 (lưu trữ) được chấp nhận:

1. Tạo `docs/architecture/technical-design.md` từ `templates/technical-design.md`.
2. Điền **ngăn xếp công nghệ** kèm phiên bản cụ thể và ADR tương ứng.
3. Điền **cấu trúc thư mục** `src/` theo `frontend-ui` mục 4.2 (đổi đuôi file theo công nghệ đã chọn).
4. Điền **mô hình dữ liệu và lớp lưu trữ**: dẫn tới `budget-logic` mục 4.1, chỉ ghi thêm cách hiện thực (ví dụ khoá `localStorage`, bảng SQLite). Không định nghĩa lại kiểu dữ liệu.
5. Điền **lệnh chạy app, chạy unit test, build, phát hành bản dùng thử** – đúng lệnh, chép được.
6. Điền **quy ước code** (đặt tên file, format, lint) và **danh sách thư viện được phép**.
7. Cập nhật `frontend-ui` mục 4.1 dòng "Đã chốt" trỏ về ADR-01 (qua Pull Request sửa skill, chạy `bash scripts/sync-skills.sh`).

## 5. Đầu ra

| File | Mẫu | Duyệt |
| :--- | :--- | :--- |
| `docs/architecture/ADR-xx-<mô-tả>.md` | `templates/adr.md` | 8 Developers, SM ghi nhận |
| `docs/architecture/technical-design.md` | `templates/technical-design.md` | 1 người cặp giao diện + 1 người cặp dữ liệu |
| Dòng mới trong `docs/architecture/README.md` | — | — |

`technical-design.md` là đầu vào bắt buộc của `writing-plans`: phần **Tech Stack** của plan lấy từ mục 1, đường dẫn file lấy từ mục 2, lệnh kiểm tra lấy từ mục 4.

## 6. Khi viết plan

**Ràng buộc (chép vào Global Constraints):**
- Chỉ dùng công nghệ, phiên bản và thư viện có trong `docs/architecture/technical-design.md` mục 1 và mục 6; thư viện lớn mới phải có ADR được chấp nhận trước.
- Đường dẫn file theo `technical-design.md` mục 2; lệnh chạy/test/build theo mục 4.
- Không thêm máy chủ, đăng nhập, dịch vụ trả phí (ADR tiêu chí A2, A4).

**Task bắt buộc:**
- Plan đầu tiên của dự án (US01) có task dựng khung dự án theo `technical-design.md`, kết thúc bằng: chạy app trên điện thoại thật và chạy lệnh unit test thành công (dù chưa có test nào).

**Lệnh kiểm tra:**
- Lệnh unit test trong `technical-design.md` mục 4 → chạy được.
- Lệnh build trong `technical-design.md` mục 4 → không lỗi.

## 7. Quy tắc bắt buộc

1. **Không bịa thông tin kỹ thuật.** Khả năng của framework, giới hạn nền tảng phải có link tài liệu chính thức và ngày đọc. Không có → `Cần kiểm chứng`.
2. **Không bịa năng lực của nhóm.** Số người biết công nghệ lấy từ kết quả hỏi nhanh thật; chưa hỏi → `Cần bổ sung`.
3. **Mỗi ADR một quyết định**, có ít nhất 2 phương án và phần "Hệ quả" nêu cả điều mất đi.
4. **Không chọn công nghệ kéo theo phạm vi ngoài MVP** (máy chủ, đăng nhập, đồng bộ đám mây, dịch vụ trả phí).
5. **Không sửa ADR đã chấp nhận** – viết ADR mới thay thế.
6. Chưa có ADR nền tảng `Đã chấp nhận` thì không viết plan code (AGENTS.md quy tắc 1).
7. Tiếng Việt có dấu, không emoji; tên công nghệ, lệnh giữ nguyên tiếng Anh.

## 8. Checklist tự kiểm

- [ ] ADR có câu hỏi, ≥ 2 phương án, lọc nhóm A, bảng điểm nhóm B có lý do từng ô
- [ ] Mọi khẳng định kỹ thuật có link tài liệu chính thức và ngày đọc, hoặc ghi `Cần kiểm chứng`
- [ ] Số Developer biết công nghệ lấy từ hỏi nhanh thật
- [ ] Phần "Hệ quả" có cả được và mất, có điều kiện xem lại
- [ ] `technical-design.md` có lệnh chạy, test, build chép được
- [ ] Đã thêm dòng vào `docs/architecture/README.md`
