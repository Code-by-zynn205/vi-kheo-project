# Chuẩn viết skill của nhóm

Skill là thư mục `.agents/skills/<tên>/` chứa file `SKILL.md` (và thư mục `templates/`) hướng dẫn AI agent làm một việc theo đúng quy trình, dữ liệu và định dạng của nhóm. Script `scripts/sync-skills.sh` kiểm tra chuẩn này trước khi chép sang `.claude/skills/`.

## 1. Cấu trúc thư mục

```
.agents/skills/<tên-skill>/
├── SKILL.md          bắt buộc
└── templates/        bắt buộc – mẫu cho MỌI file .md mà skill sinh ra
    └── <tên-mẫu>.md
```

Tên skill: chữ thường, nối bằng `-`, trùng tên thư mục.

## 2. Các mục bắt buộc trong `SKILL.md` (đúng thứ tự)

| # | Mục | Nội dung | Vì sao cần |
| :-: | :--- | :--- | :--- |
| 0 | **Frontmatter** `name`, `description` | `description` nói skill làm gì **và** "Dùng khi …" | Agent đọc phần này để quyết định có dùng skill hay không |
| 1 | `## 1. Giai đoạn & phụ trách` | Giai đoạn (1–5), Sprint, người phụ trách, người review | Biết skill dùng lúc nào, ai chịu trách nhiệm |
| 2 | `## 2. Khi nào dùng / không dùng` | Tình huống kích hoạt, chuyển sang skill nào khi không dùng | Tránh dùng sai skill |
| 3 | `## 3. Đầu vào` | File phải đọc trước khi làm | Làm trên dữ liệu thật của nhóm |
| 4 | `## 4. Quy trình` | Các bước đánh số | Ai chạy cũng ra cùng kết quả |
| 5 | `## 5. Đầu ra` | Bảng: file sinh ra · mẫu trong `templates/` · ai duyệt | Kiểm tra được đã xong chưa |
| 6 | `## 6. Khi viết plan` | Ràng buộc và task bắt buộc khi một plan code đụng tới skill này. Skill không liên quan tới code ghi `Không áp dụng.` | Để plan sinh ra luôn mang theo đúng luật của skill |
| 7 | `## 7. Quy tắc bắt buộc` | Những điều AI không được làm | Chặn số liệu bịa, tính năng ngoài phạm vi |
| 8 | `## 8. Checklist tự kiểm` | Danh sách `- [ ]` trước khi commit | Tự kiểm trước khi nhờ review |

## 3. Mục "Khi viết plan" viết thế nào

Mục này được chép **nguyên văn** vào phần *Global Constraints* của plan (`docs/plans/…md`) – xem `AGENTS.md` mục 3. Gồm 3 phần:

```markdown
## 6. Khi viết plan

**Ràng buộc (chép vào Global Constraints):**
- <một dòng mỗi ràng buộc, có giá trị cụ thể>

**Task bắt buộc:**
- <task mà plan nào đụng tới skill này cũng phải có>

**Lệnh kiểm tra:**
- `<lệnh>` → <kết quả mong đợi>
```

## 4. Mẫu file trong `templates/`

- Dòng đầu là tiêu đề có chỗ trống `<...>`.
- Dòng thứ hai là dòng trạng thái:

```markdown
> **Giai đoạn:** <số – tên> · **Trạng thái:** Chưa làm | Đang làm | Xong | Cần bổ sung · **Phụ trách:** <tên> · **Cập nhật:** <dd/mm/yyyy>
```

- Mỗi mục có 1 dòng hướng dẫn trong `<!-- ... -->` để AI biết cần điền gì; xoá dòng này khi điền xong.

## 5. Danh sách skill hiện có

| # | Giai đoạn | Skill | Phụ trách | Review |
| :-: | :--- | :--- | :--- | :--- |
| 1 | Research & Discovery | `user-research` | Nguyễn Thị Thương, Nguyễn Tuấn Kiệt | Dương Văn Hoan (PO) |
| 1 | Research & Discovery | `product-discovery` | Dương Văn Hoan (PO) | Trần Ninh Nhật Tân (SM) |
| 2 | Design System & Prototype | `design-system` | Lê Thị Nhật Vy, Phạm Viết Hưng | Lê Thị Phát, Nguyễn Đức Minh Nghĩa |
| 3 | Product Requirements | `product-requirements` | PA (Product Analyst) – `Cần bổ sung` tên | Dương Văn Hoan (PO) |
| 4 | Vibe Code | `frontend-ui` | Lê Thị Phát, Nguyễn Đức Minh Nghĩa | Lê Thị Nhật Vy, Phạm Viết Hưng |
| 4 | Vibe Code | `budget-logic` | Nguyễn Thị Bình Minh, Nguyễn Diên Tiến | Nguyễn Đức Minh Nghĩa |
| 5 | Present full product | `demo-present` | Trần Ninh Nhật Tân (SM) | Dương Văn Hoan (PO) |
| — | Xuyên suốt | `scrum-sprint` | Trần Ninh Nhật Tân (SM) | Dương Văn Hoan (PO) |

Bằng chứng đóng góp là lịch sử commit (`git log -- .agents/skills/<tên>`), không phải bảng này.
