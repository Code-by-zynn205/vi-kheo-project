# Bản đồ skill – skill nào làm ra file nào

> **Giai đoạn:** 1 → 5 · **Skill:** demo-present (mục 4) · **Trạng thái:** Đang làm · **Phụ trách:** <SM> · **Cập nhật:** <dd/mm/yyyy>

<!-- Trang trả lời câu hỏi của giảng viên "nhóm dùng skill nào để làm việc này". Mỗi dòng phải kiểm được: file có dòng **Skill:** khớp cột Skill; bằng chứng là commit/PR. Không có bằng chứng → "Cần bổ sung". -->

## 1. Cách truy vết

```
Giai đoạn → Skill (.agents/skills/<tên>/SKILL.md, mục) → Mẫu (templates/<mẫu>.md) → File đầu ra (dòng **Skill:**) → Commit / Pull Request
```

| Muốn kiểm | Lệnh / chỗ xem |
| :--- | :--- |
| File do skill nào làm | Dòng thứ 3 của file: `**Skill:** <tên> (mục <x>)` |
| Commit dùng skill nào | `git log --grep "Skill:" --pretty="%h %an %ad %s" --date=short` |
| Ai viết skill | `git log --pretty="%an %ad %s" --date=short -- .agents/skills/<tên>` |
| Mọi file đã có dòng Skill | `bash scripts/sync-skills.sh --check` |

## 2. Skill → file đầu ra

| Giai đoạn | Skill (mục) | Mẫu | File đầu ra | Phụ trách | Bằng chứng |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <1 – Discovery> | `<skill>` (<x>) | `<template>.md` | [<file>](<đường dẫn>) | <tên> | <commit / PR> |

## 3. Skill hỗ trợ và superpowers đã dùng

| Skill | Dùng ở đâu | Bằng chứng |
| :--- | :--- | :--- |
| `<writing-plans>` | <plan US01> | <đường dẫn plan> |

## 4. Agent đã dùng

| Agent | Dùng cho | Bằng chứng |
| :--- | :--- | :--- |
| <Claude Code / Codex / Antigravity> | <...> | <PR / commit trailer> |
