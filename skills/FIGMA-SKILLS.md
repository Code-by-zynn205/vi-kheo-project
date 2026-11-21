# Bộ Skill AI cho Figma, Design Intent & Prototype

Danh sách **43 skill** đã được Việt hóa và cài đặt vào thư mục `skills/` (theo chuẩn `SKILL.md` / [agentskills.io](https://agentskills.io)), kèm đầy đủ link nguồn gốc trên GitHub trong từng file `SKILL.md`.

## 1. Bảng nguồn gốc & danh sách Skill đã cài

| Nhóm | Nguồn GitHub chính thức | Số lượng | Danh sách Skill |
| :--- | :--- | :---: | :--- |
| **1. Nền tảng chính chủ Figma** | [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide) | 17 | `figma-use`, `figma-generate-design`, `figma-generate-library`, `figma-generate-diagram`, `figma-spec`, `figma-code-connect`, `figma-design-to-code`, `figma-code-workflows`, `figma-create-new-file`, `figma-generative-plugins`, `figma-implement-motion`, `figma-use-motion`, `figma-3d-transforms`, `figma-shaders`, `figma-swiftui`, `figma-use-figjam`, `figma-use-slides` |
| **2. Hiểu ý đồ Designer & UX** | [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/tree/main/design/skills) | 5 | `design-handoff`, `design-critique`, `accessibility-review`, `research-synthesis`, `ux-copy` |
| **3. Lên flow Prototype & Ghi chú** | [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills/tree/main/skills) | 9 | `figma-prototype-plan`, `figma-annotation-guide`, `figma-user-flow-planner`, `figma-design-brief`, `figma-design-qa`, `figma-design-review`, `figma-component-audit`, `figma-spacing-system`, `figma-variant-matrix` |
| **4. Nối dây Prototype & Sửa file an toàn** | [thiagoxikota/figma-maxxing](https://github.com/thiagoxikota/figma-maxxing/tree/main/skills) | 8 | `figma-canon`, `figma-click-flow`, `figma-preflight`, `figma-orient`, `figma-handoff-gate`, `figma-slop-check`, `figma-comment-fix-loop`, `figma-bridge-doctor` |
| **5. Đồng bộ & Audit Design System** | [edenspiekermann/Skills](https://github.com/edenspiekermann/Skills/tree/main/skills) | 3 | `apply-design-system`, `audit-design-system`, `fix-design-system-finding` |
| **6. Figma-to-Code & Visual Diff** | [applyagency/figma-to-code-skill](https://github.com/applyagency/figma-to-code-skill) | 1 | `figma-to-code` |

> **Lưu ý:** Trong mỗi file `skills/<tên-skill>/SKILL.md` đều có dòng `> **Nguồn gốc & chuẩn hóa:** ...` dẫn link trực tiếp về file gốc trên GitHub. Các thư mục `references/` và `scripts/` đi kèm được giữ nguyên đường dẫn để các skill gọi đúng tài liệu kỹ thuật và script khi chạy.

## 2. Gợi ý gọi Skill theo tình huống
- **Muốn AI hiểu đúng ý đồ thiết kế từ mô tả hoặc Figma:** gọi `design-handoff`, `design-critique`, `figma-spec`, `figma-annotation-guide`.
- **Muốn AI lập flow & nối Prototype trực tiếp trên Figma:** gọi `figma-prototype-plan` → `figma-use` + `figma-canon` + `figma-click-flow`.
- **Muốn AI kiểm tra / áp dụng đúng Design System:** gọi `audit-design-system`, `apply-design-system`, `fix-design-system-finding`.
- **Muốn AI chuyển Figma thành Code chuẩn pixel:** gọi `figma-design-to-code` hoặc `figma-to-code`.
