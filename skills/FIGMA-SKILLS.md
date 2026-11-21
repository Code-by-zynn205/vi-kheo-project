# Bộ Skill AI cho Figma, Design Intent & Prototype

Danh sách các skill được cài đặt từ các bộ mã nguồn mở trên GitHub vào thư mục `skills/` (theo chuẩn `SKILL.md` / Agent Skills).

## Nguồn & Danh sách Skill đã cài (43 skill)

### 1. Bộ chính chủ Figma (`figma/mcp-server-guide`)
- `figma-use` — Nền tảng thực thi Plugin API (`use_figma`) đọc/ghi trực tiếp trên Figma.
- `figma-generate-design` — Dựng màn hình và layout trên Figma từ mô tả/code.
- `figma-generate-library` — Tạo thư viện component & design system trên Figma.
- `figma-generate-diagram` — Tạo sơ đồ kiến trúc/luồng trên Figma.
- `figma-spec` — Đọc/viết đặc tả `SPEC_BLOCK` ngay trên canvas Figma/FigJam.
- `figma-code-connect` — Ánh xạ Code Connect giữa component Figma và codebase.
- `figma-design-to-code` — Đọc ngữ cảnh thiết kế, token, annotations và chuyển sang code.
- `figma-code-workflows`, `figma-create-new-file`, `figma-generative-plugins`, `figma-implement-motion`, `figma-use-motion`, `figma-3d-transforms`, `figma-shaders`, `figma-swiftui`, `figma-use-figjam`, `figma-use-slides`.

### 2. Hiểu đúng ý đồ Designer & UX (`anthropics/knowledge-work-plugins` — `design/skills`)
- `design-handoff` — Trích xuất layout, tokens, breakpoints, variants, interaction states & accessibility.
- `design-critique` — Đánh giá giao diện theo visual hierarchy, usability flow, consistency & WCAG.
- `accessibility-review` — Kiểm tra tương phản, keyboard navigation, focus & touch target.
- `research-synthesis` — Tổng hợp nghiên cứu người dùng thành insight & khuyến nghị thiết kế.
- `ux-copy` — Rà soát và viết microcopy/UX writing rõ ràng, nhất quán.

### 3. Lên kế hoạch Prototype & Ghi chú Design (`mohitagw15856/pm-claude-skills`)
- `figma-prototype-plan` — Lập bản đồ flow, triggers, overlays & kịch bản test trước khi nối dây.
- `figma-annotation-guide` — Chuẩn hóa annotations (trạng thái, tương tác, edge cases).
- `figma-user-flow-planner` — Lập sơ đồ luồng người dùng.
- `figma-design-brief`, `figma-design-qa`, `figma-design-review`, `figma-component-audit`, `figma-spacing-system`, `figma-variant-matrix`.

### 4. Nối dây Prototype & Thao tác file Figma an toàn (`thiagoxikota/figma-maxxing`)
- `figma-canon` — Quy tắc chuẩn chống AI slop & xử lý các bẫy Plugin API (bao gồm `setReactionsAsync()`, `actions`, `matchLayers`, `NAVIGATE`).
- `figma-click-flow` — Nối tương tác click-flow & overlay chuẩn xác trên Figma.
- `figma-preflight`, `figma-orient`, `figma-handoff-gate`, `figma-slop-check`, `figma-comment-fix-loop`, `figma-bridge-doctor`.

### 5. Đồng bộ & Kiểm tra Design System (`edenspiekermann/Skills`)
- `apply-design-system` — Đối chiếu & ghép lại UI về đúng thư viện component chuẩn (`already-connected`, `exact-swap`, `compose-from-primitives`, `blocked`).
- `audit-design-system` — Rà soát lệch design system (unbound tokens, detached instances, local overrides).
- `fix-design-system-finding` — Sửa từng lỗi sai chuẩn design system cụ thể.

### 6. Chuyển Figma sang Code & Kiểm tra trực quan (`applyagency/figma-to-code-skill`)
- `figma-to-code` — Xuất code từ Figma MCP kết hợp visual diff kiểm tra sai lệch pixel.
