# ADR-02: Lưu dữ liệu trên máy bằng cách nào?

> **Giai đoạn:** 4 – Vibe Code (chuẩn bị) · **Skill:** tech-decision (mục 4.1) · **Trạng thái:** Đề xuất · **Phụ trách:** Nguyễn Thị Bình Minh, Nguyễn Diên Tiến · **Cập nhật:** 26/11/2026

| Mục | Giá trị |
| :--- | :--- |
| Câu hỏi | Web app (ADR-01) lưu giao dịch, ngân sách, cài đặt trên máy bằng cơ chế nào? |
| Ảnh hưởng tới | Lớp `storage` của `budget-logic` 4.1; mọi story ghi/đọc E01 – E05; câu hỏi Q6 (xoá mềm) |
| Thay thế | Không |
| Hạn quyết định | 27/11/2026 – cùng ADR-01; US01 là story đầu tiên tạo E01 (`00-master-plan.md` mục 5) |

## 1. Bối cảnh

ADR-01 đề xuất web app (PWA), nên chỉ xét kho lưu trữ có sẵn trong trình duyệt. Mất dữ liệu giữa tuần dùng thử 04/12 – 10/12 là rủi ro lớn nhất: người dùng thử mất lịch sử thì kết quả A4 không còn ý nghĩa. Tiêu chí dữ liệu lấy từ `data-analysis.md:827`: ràng buộc duy nhất, ghi nhiều bản ghi nguyên tử, truy vấn theo khoảng ngày (mục 11), đường lên R3 (mục 6, 8.11). Lớp `storage` trong `budget-logic` 4.1 hiện viết **đồng bộ** (`listTransactions(): Transaction[]`).

## 2. Năng lực của nhóm

| Công nghệ | Số Developer đã từng làm | Nguồn |
| :--- | :-: | :--- |
| `localStorage` | Cần bổ sung | Chưa hỏi nhanh (chung câu hỏi ADR-01 mục 2) |
| IndexedDB / Dexie | Cần bổ sung | Chưa hỏi nhanh |

## 3. Phương án

| # | Phương án | Mô tả ngắn |
| :-: | :--- | :--- |
| 1 | `localStorage` | Một khoá chứa toàn bộ dữ liệu dạng JSON; đọc vào bộ nhớ, lọc bằng code |
| 2 | IndexedDB qua thư viện Dexie 4.x | Mỗi thực thể một bảng, chỉ mục theo `date`; thao tác bất đồng bộ (Promise) |

## 4. Lọc tiêu chí bắt buộc (nhóm A)

| Tiêu chí | PA 1 | PA 2 | Nguồn |
| :--- | :-: | :-: | :--- |
| A1 – Android và iPhone | Đạt | Đạt | s1, s2: cả hai là API chuẩn của trình duyệt |
| A2 – Lưu trên máy, offline, không đăng nhập | Đạt | Đạt | s1, s2 |
| A3 – Bản dùng thử trước 03/12 | Đạt | Đạt | Không cần cài gì thêm cho người dùng |
| A4 – Miễn phí | Đạt | Đạt | Dexie giấy phép Apache-2.0 (s5) |

## 5. Chấm điểm (nhóm B)

B3, B6 như nhau giữa hai phương án (không phụ thuộc cách lưu) nên ghi `—`. B1 chưa có dữ liệu, không tính.

| Tiêu chí | Trọng số | PA 1 localStorage | PA 2 IndexedDB + Dexie |
| :--- | :-: | :-: | :-: |
| B1 – Developer đã biết | 3 | Cần bổ sung | Cần bổ sung |
| B2 – Thời gian dựng khung | 3 | 5 | 3 |
| B3 – Nhắc 21:00 | 2 | — | — |
| B4 – AI agent sinh code tốt | 2 | 4 | 4 |
| B5 – Unit test dễ | 2 | 4 | 3 |
| B6 – Cài cho người dùng thử | 1 | — | — |
| **Tổng (chưa có B1)** | | **31** | **23** |

| Ô | Lý do | Nhãn / nguồn |
| :--- | :--- | :--- |
| B2 – PA 1 | API có sẵn, đồng bộ, khớp ngay chữ ký `storage` hiện tại | [NHẬN ĐỊNH] · `budget-logic` 4.1 |
| B2 – PA 2 | Cài thư viện, khai báo schema, đổi chữ ký `storage` sang Promise (sửa `budget-logic` 4.1) | [NHẬN ĐỊNH] |
| B4 – cả hai | Cả hai phổ biến, có tài liệu chính thức | [NHẬN ĐỊNH] |
| B5 – PA 1 | Môi trường test giả lập trình duyệt thường có sẵn `localStorage` | [NHẬN ĐỊNH] – Cần kiểm chứng khi dựng khung |
| B5 – PA 2 | Test lớp `storage` trên máy tính cần thêm bản IndexedDB giả | [NHẬN ĐỊNH] – Cần kiểm chứng khi dựng khung |

## 6. Tiêu chí dữ liệu (`data-analysis.md:827`, mục 11)

Không có trọng số – dùng để quyết định khi nhóm B nghiêng về một phía nhưng có rủi ro mất dữ liệu.

| Tiêu chí | PA 1 localStorage | PA 2 IndexedDB + Dexie | Nguồn |
| :--- | :--- | :--- | :--- |
| Ràng buộc duy nhất (`id`) | Phải tự kiểm bằng code | Khoá chính của bảng | s2 |
| Ghi nhiều bản ghi nguyên tử (xoá hết dữ liệu, nhập file R2) | Ghi lại cả khối JSON – Cần kiểm chứng | Transaction "tất cả hoặc không" | s2 |
| Truy vấn theo khoảng ngày (US01, US03, US04, US08) | Lọc trong bộ nhớ; đủ nhanh với lượng dữ liệu MVP | Chỉ mục `date`, truy vấn theo khoảng | [NHẬN ĐỊNH] · s2 |
| Dung lượng | 5 MiB mỗi origin | Theo dung lượng ổ (Safari 17+: tới khoảng 60% ổ đĩa) | s3 |
| Xin trình duyệt không tự xoá (`navigator.storage.persist()`) | Cần kiểm chứng – tài liệu không nói rõ có áp dụng cho localStorage | Áp dụng cho kho của origin, gồm IndexedDB | s3, s4 |
| Đường lên R3 (đồng bộ) | Phải chuyển dữ liệu sang kho khác | Giữ được, thêm trường đồng bộ | [NHẬN ĐỊNH] |

Ước lượng dung lượng `[NHẬN ĐỊNH]`: 10 giao dịch/ngày × 365 ngày ≈ 3.650 bản ghi/năm, khoảng 1 – 2 MB JSON – vừa 5 MiB trong MVP, nhưng R2 (ví, định kỳ, nhãn) sẽ chạm giới hạn. Cần đo thật khi có code.

**Cả hai phương án đều chịu chung một rủi ro trên iPhone:** Safari xoá dữ liệu do script ghi (gồm localStorage và IndexedDB) của trang không được tương tác trong 7 ngày; web app đã thêm vào màn hình chính có bộ đếm ngày riêng (s6).

## 7. Quyết định

**Đề xuất chọn:** PA 2 – IndexedDB qua Dexie 4.x, với lớp `storage` bất đồng bộ (Promise).

Nhóm B nghiêng về PA 1 (31 – 23) chỉ vì dựng nhanh hơn. Yếu tố quyết định là mục 6: tuần dùng thử không được mất dữ liệu, và `persist()` chỉ được xác nhận cho IndexedDB. Đổi kho lưu trữ **bây giờ** (chưa có dòng code, chưa có người dùng) rẻ hơn chuyển dữ liệu của người dùng thử sau này. `[NHẬN ĐỊNH]`

**Giữ đường lùi:** chữ ký `storage` đổi sang Promise ngay từ đầu. Nếu đến 28/11 cặp dữ liệu chưa dựng xong Dexie, viết tạm `storage` bằng localStorage sau cùng chữ ký đó; màn hình và logic không phải sửa.

**Q6 (xoá mềm, kiến trúc sư quyết):** ADR này đề xuất **xoá mềm** (`deletedAt`) như `po-decision-proposals.md` Q6. Dexie lọc được bản ghi `deletedAt` rỗng bằng truy vấn thường. Cặp dữ liệu điền cột "Quyết định" của Q6 khi ADR được chấp nhận.

## 8. Hệ quả

| Loại | Nội dung |
| :--- | :--- |
| Được | Dung lượng đủ cho R2; transaction nguyên tử cho xoá hết dữ liệu và nhập file; truy vấn theo ngày bằng chỉ mục; xin `persist()` được; có sẵn cách nâng phiên bản schema (khớp E05 `AppMeta.schemaVersion`) |
| Mất / chấp nhận đánh đổi | Thêm một thư viện (Dexie); mọi lời gọi `storage` thành `await`; phải sửa `budget-logic` 4.1 |
| Rủi ro | Người dùng iPhone dùng trong tab Safari, không thêm vào màn hình chính → dữ liệu có thể bị xoá sau 7 ngày không mở (s6) → Cách giảm: hướng dẫn cài 2 bước (ADR-01 mục 7); gọi `navigator.storage.persist()` lúc mở app lần đầu |
| Rủi ro | Người dùng tự xoá dữ liệu trình duyệt → Cách giảm: ngoài phạm vi R1; sao lưu ra file là R2 (E19) |
| Xem lại quyết định khi | Đến 28/11 chưa dựng xong Dexie (dùng đường lùi localStorage) · đo thật thấy dữ liệu bị xoá trên iPhone dù đã thêm vào màn hình chính · ADR-01 đổi sang app native |

## 9. Việc cần làm sau quyết định

- [ ] Sửa `budget-logic` mục 4.1: chữ ký `storage` trả `Promise` (Pull Request sửa skill, chạy `bash scripts/sync-skills.sh`) – cặp dữ liệu
- [ ] Điền cột "Quyết định" Q6 trong `po-decision-proposals.md`
- [ ] Ghi tên cơ sở dữ liệu, bảng, chỉ mục, cách nâng phiên bản schema vào `technical-design.md` mục mô hình dữ liệu
- [x] Thêm dòng vào `docs/architecture/README.md`

## 10. Người tham gia quyết định

| Ngày | Hình thức | Người tham gia | Kết quả |
| :--- | :--- | :--- | :--- |
| 26/11/2026 | Bản đề xuất do AI (Claude Code) soạn | Nguyễn Diên Tiến | Chờ Developers thống nhất trong Pull Request |

## Nguồn (đọc ngày 26/11/2026)

| Mã | Nguồn | Nội dung dùng |
| :--- | :--- | :--- |
| s1 | [MDN – Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API) | localStorage còn sau khi đóng trình duyệt |
| s2 | [MDN – IndexedDB key characteristics and basic terminology](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology) | Khoá, chỉ mục, transaction |
| s3 | [MDN – Storage quotas and eviction criteria](https://developer.mozilla.org/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) | localStorage 5 MiB; quota theo origin; origin `persist` chỉ bị xoá khi người dùng tự xoá; WebKit tới khoảng 60% ổ đĩa |
| s4 | [MDN – StorageManager.persist()](https://developer.mozilla.org/en-US/docs/Web/API/StorageManager/persist) · [WebKit – Updates to Storage Policy](https://webkit.org/blog/14403/updates-to-storage-policy/) | Xin lưu bền; chính sách lưu trữ Safari 17 |
| s5 | [npm – dexie](https://www.npmjs.com/package/dexie) · [GitHub – dexie/Dexie.js](https://github.com/dexie/Dexie.js/) | Bản mới nhất 4.4.7, giấy phép Apache-2.0 |
| s6 | [WebKit – Full Third-Party Cookie Blocking and More](https://webkit.org/blog/10218/full-third-party-cookie-blocking-and-more/) | Giới hạn 7 ngày cho dữ liệu do script ghi; web app trên màn hình chính có bộ đếm riêng |
