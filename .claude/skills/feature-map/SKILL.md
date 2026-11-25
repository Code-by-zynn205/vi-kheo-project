---
name: feature-map
description: Lập "bản đồ" một User Story hoặc một màn hình của Ví Khéo từ file thật trước khi đề xuất hay sửa – đi qua các lớp tài liệu (Backlog → data-analysis → đặc tả màn hình + Figma → PRD → plan) và các lớp code (giao diện → trạng thái → logic tính tiền → lưu trữ trên máy), mỗi mục có file:dòng và nhãn đã đọc / suy đoán. Dùng khi người dùng gửi ảnh chụp màn hình hoặc link Figma, khi ý tưởng gắn vào một màn hình có sẵn (vd. thêm nút vào HomeScreen), khi hỏi "USxx đang tới đâu, đụng những gì", hoặc khi chưa chắc một nút, quy tắc, trường dữ liệu nằm ở đâu. Không dùng khi cuộc trò chuyện này đã có bản đồ cho đúng khu đó.
---

# Bản đồ một User Story / màn hình

Không đề xuất gì cho một khu mình chưa lập bản đồ. Bản đồ dựng từ file đọc được, không dựng từ trí nhớ, README hay tên file.

## Cách làm

1. **Tìm điểm vào** từ chữ người dùng nói: mã `USxx`, tên màn hình PascalCase, nhãn tiếng Việt trên nút. Grep trong `docs/design/screens/`, `docs/discovery/06-journey-features.md`, `docs/requirements/data-analysis.md`.
2. **Đi qua các lớp.** Mỗi lớp ghi: cái gì, `file:dòng`, nhãn `[đã đọc]` hoặc `[suy đoán]`; lớp chưa có file ghi `Chưa có` (đó cũng là thông tin).

   | Lớp | Câu hỏi | Chỗ tìm |
   | :--- | :--- | :--- |
   | Backlog | Dòng User Story, AC gốc, Story Point | `06-journey-features.md` mục 5 |
   | Dữ liệu | Story đọc/ghi thực thể nào; BR, ERR, EC, câu hỏi Qx còn chặn | `data-analysis.md` mục 11 (ma trận), 8, 12, 13, 14 |
   | Màn hình | Đặc tả nào, trạng thái gì, frame Figma nào, component nào | `docs/design/screens/<ScreenName>.md`, `screen-inventory.md` |
   | Yêu cầu | PRD và trạng thái duyệt | `docs/requirements/USxx-*.md` |
   | Plan | Spec, plan, nhánh | `docs/plans/specs/`, `docs/plans/`, `git branch -a` |
   | Code | Giao diện → trạng thái → logic → lưu trữ | đường dẫn lấy từ `docs/architecture/technical-design.md`; logic tính tiền theo `budget-logic` |

3. **Ghi ranh giới:** dữ liệu thuộc thực thể nào, hai nơi nào phải khớp nhau (đặc tả ↔ Figma, PRD ↔ `data-analysis.md`, công thức trong code ↔ `budget-logic` mục 4.2).
4. **Ghi mục "Chưa rõ":** những gì chưa đọc tới. Không lấp chỗ trống bằng phỏng đoán.
5. **Trình bày** bằng một cây hoặc bảng ≤ 20 dòng (xem `show-me`).

## Ví dụ (đọc ngày 26/11/2026, đọc lại trước khi dựa vào)

```
US03 Hôm nay còn được tiêu
├─ Backlog: 06-journey-features.md:88 (Must), F5 (:41), AC gốc (:146)              [đã đọc]
├─ Dữ liệu: data-analysis.md:676 – đọc E01 Transaction, E02 MonthlyBudget          [đã đọc]
│   └─ Công thức 10.1 (:623); BR-21 chờ PO (:426) → Q1 chặn PRD US03 (:726)        [đã đọc]
├─ Màn hình: HomeScreen.md:5,16 – DailyAllowanceCard, chờ cặp UI/UX duyệt           [đã đọc]
├─ Yêu cầu: chưa có docs/requirements/US03-*.md                                    Chưa có
├─ Plan: chưa có                                                                   Chưa có
└─ Code: chưa có src/, chưa có technical-design.md                                 Chưa có
Chưa rõ: kết quả test A3 có đổi cách hiển thị DailyAllowanceCard không.
```

## Không được

- Ghi `[đã đọc]` cho thứ chỉ thấy qua tên file hoặc một dòng grep.
- Đề xuất chỗ đặt tính năng mới trước khi xong lớp "Dữ liệu": phần lớn lỗi sai số, mất dữ liệu nằm ở lớp này.
- Chép bản đồ vào `AGENTS.md` hay memory: tài liệu đổi thì bản đồ thành sai. Cần lưu lâu thì đưa vào `docs/` và kèm ngày kiểm.
