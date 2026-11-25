# Sprint 3 Planning – Nhắc nhở, sửa/xoá, báo cáo – dùng thử và demo (04/12 – 12/12/2026)

> **Giai đoạn:** 3, 4, 5 · **Skill:** scrum-sprint (mục 4.2) · **Trạng thái:** Đang làm – bản đề xuất soạn trước ngày 26/11/2026, SM và PO chốt tại Sprint Planning 04/12 · **Phụ trách:** Trần Ninh Nhật Tân (SM) · **Cập nhật:** 26/11/2026

**Sprint Goal:** Trong tuần dùng thử 04/12 – 10/12, người dùng thử được nhắc ghi chép mỗi tối và sửa được khoản nhập nhầm; trước 12/12 có báo cáo theo danh mục, kết quả A4 và bản demo trên điện thoại thật.

**Chuẩn bị từ Sprint 2 (26/11/2026):** PRD, spec, plan của US05, US06, US04 đã có (`Chờ duyệt` / `Nháp`) – ngày đầu Sprint code được ngay khi PO duyệt PRD (hàng đợi `00-master-plan.md` mục 2a, dòng 6 – 8). Đặc tả `SettingsScreen`, `EditTransactionSheet`, `ReportScreen` đã `Xong`.

## 1. User Story trong Sprint

| Story | Story Point | Đặc tả màn hình (hạn) | PRD (hạn) | Spec + plan (hạn) | Code + PR (hạn) | Người code | Người review |
| :--- | :-: | :--- | :--- | :--- | :--- | :--- | :--- |
| *(nếu bị cắt ở Sprint 2)* US07 Ghi khoản thu | 1 | `AddExpenseScreen.md` – Xong | `US07-add-income.md` (duyệt trước 03/12) | Có – `2026-11-26-US07-add-income.md` | 04/12 | Phát | Tiến |
| US05 Nhắc ghi chép mỗi tối | 3 | `SettingsScreen.md` – Xong | `US05-evening-reminder.md` (duyệt 03/12) | Có – soát 04/12 | 06/12 | Phát, Nghĩa | Bình Minh |
| US06 Sửa / xoá giao dịch | 3 | `EditTransactionSheet.md` – Xong | `US06-edit-delete-transaction.md` (duyệt 03/12) | Có – soát 04/12 | 07/12 | Bình Minh, Tiến | Nghĩa |
| US04 Báo cáo theo danh mục | 5 | `ReportScreen.md` – Xong | `US04-category-report.md` (duyệt 03/12) | Có – soát 05/12 | 09/12 | Phát, Nghĩa | Vy, Hưng |
| US20 Quyền riêng tư, xoá dữ liệu – *nếu kịp* | 2 | `PrivacyScreen.md`, `AboutScreen.md`, `DeleteAllDataScreen.md` (03/12) | Chưa có – viết 04/12 nếu PO duyệt US20 | 05/12 | 10/12 | Thương, Kiệt | Vy |
| US08 Xem lịch sử – *nếu kịp* | 2 | `HistoryScreen.md` (03/12) | Chưa có – viết 04/12 | 05/12 | 10/12 | Tiến | Phát |

**Tổng Story Point cam kết:** 11 (US05, US06, US04) – thêm 1 nếu US07 bị cắt sang; 15 nếu làm cả US20, US08.

**Thứ tự:** US05 → US06 → US04 (`00-master-plan.md` mục 5): nhắc nhở và sửa nhầm có tác dụng ngay trong tuần dùng thử; báo cáo không ảnh hưởng A4. **11/12 – 12/12 không nhận story mới.**

**Cập nhật bản dùng thử:** mỗi story xong → build APK (ADR-03, cùng khoá ký), thử cài đè trên 1 máy có dữ liệu, rồi gửi link; ghi ngày cập nhật vào `docs/evidence/trial/` (D6).

## 2. Việc hỗ trợ (mở khoá User Story)

| Việc | Skill | Mở khoá | Người làm | Hạn |
| :--- | :--- | :--- | :--- | :--- |
| Chạy dùng thử 7 ngày, ghi ngày cập nhật bản build, nhắc người dùng thử chụp `TrialInfoScreen` ngày thứ 7 | `user-research` | A4 | Thương, Kiệt | 04/12 – 10/12 |
| Đo giờ nhận nhắc thật trên 2 máy Android khác hãng | `tech-decision` (ADR-04) | US05 AC5 | Nghĩa | 05/12 |
| Viết PRD US20, US08 (chỉ khi PO duyệt US20 và Sprint còn dư sức) | `product-requirements` | US20, US08 | PA, cặp dữ liệu | 04/12 |
| Tổng hợp kết quả A4 | `user-research` | Demo, báo cáo tổng kết | Thương, Kiệt | 11/12 |
| Kịch bản demo, báo cáo tổng kết, dàn ý slide, bản đồ skill | `demo-present` | Demo 13/12 | Tân (SM) + mỗi cặp một phần | 12/12 |
| Sprint 2 Review (03/12), Sprint 3 Review và Retrospective (12/12) | `scrum-sprint` 4.2 | — | Tân (SM) | 03/12, 12/12 |

## 3. Kiểm tra phân công

| Thành viên | Thẻ nhận | PR sẽ review |
| :--- | :--- | :--- |
| Dương Văn Hoan (PO) | Duyệt PRD US05, US06, US04 (và US20, US08 nếu có); nhận / không nhận story ở Review | PR tài liệu PRD |
| Trần Ninh Nhật Tân (SM) | Sprint Planning / Review / Retro, demo, báo cáo tổng kết | PR `skill-usage-map.md` |
| Nguyễn Thị Thương | Dùng thử 7 ngày, tổng hợp A4, US20 (nếu kịp) | PR US04 (đọc AC) |
| Nguyễn Tuấn Kiệt | Dùng thử 7 ngày, tổng hợp A4, US20 (nếu kịp) | PR US06 (đọc AC) |
| Lê Thị Nhật Vy | Soát giao diện, ảnh demo | PR US04, US20 (giao diện) |
| Phạm Viết Hưng | Soát giao diện, slide | PR US05, US04 (giao diện) |
| Lê Thị Phát | US05, US04, build cập nhật | PR US08 |
| Nguyễn Đức Minh Nghĩa | US05, US04, đo giờ nhắc | PR US06 |
| Nguyễn Thị Bình Minh | US06 (lưu trữ, TC16) | PR US05 |
| Nguyễn Diên Tiến | US06, US08 (nếu kịp) | PR US07 (nếu bị cắt sang) |

Đủ 10 người; mỗi người có ít nhất 1 thẻ và 1 PR review ở cặp khác.

## 4. Rủi ro

- **PO chưa duyệt PRD Sprint 3 trước 04/12:** code theo đề xuất trong PRD, ghi vào PR (`00-master-plan.md` R2).
- **Cập nhật làm mất dữ liệu người dùng thử (R6):** một khoá ký, thử cài đè trước mỗi lần phát; migration cho mọi đổi bảng (US05 thêm cột – migration v2).
- **Nhắc lệch giờ nhiều trên Android 12+:** AC ghi "khoảng 21:00 – 22:00" (Q16); lệch > 1 giờ → xem lại ADR-04.
- **Lỗi nặng trong tuần dùng thử:** sửa trên nhánh `fix/<english-slug>`, ưu tiên hơn story mới.
- **Hết lượt build miễn phí EAS:** tối đa 1 bản dùng thử mỗi ngày (ADR-03).
