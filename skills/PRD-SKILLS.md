# Bộ Skill AI cho PRD, User Stories & Đặc tả sản phẩm

Danh sách **23 skill PRD & Quản lý sản phẩm** đã được Việt hóa và cài đặt vào thư mục `skills/` (theo chuẩn `SKILL.md` / [agentskills.io](https://agentskills.io)), kèm đầy đủ link nguồn gốc trên GitHub trong từng file `SKILL.md`.

## 1. Bảng nguồn gốc & danh sách Skill đã cài

| Nhóm | Nguồn GitHub chính thức | Số lượng | Danh sách Skill |
| :--- | :--- | :---: | :--- |
| **1. Viết PRD & Thực thi PM** | [phuryn/pm-skills](https://github.com/phuryn/pm-skills/tree/main/pm-execution/skills) | 8 | `create-prd`, `user-stories`, `job-stories`, `test-scenarios`, `outcome-roadmap`, `pre-mortem`, `prioritization-frameworks`, `wwas` |
| **2. Khung Problem → PRD → Story** | [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/tree/main/skills) | 9 | `prd-development`, `user-story`, `user-story-mapping`, `user-story-splitting`, `epic-hypothesis`, `problem-framing-canvas`, `problem-statement`, `jobs-to-be-done`, `release-readiness` |
| **3. Đặc tả & Brainstorming** | [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/tree/main/product-management/skills) | 4 | `write-spec`, `product-brainstorming`, `roadmap-update`, `sprint-planning` |
| **4. PRD phỏng vấn tương tác** | [github/awesome-copilot](https://github.com/github/awesome-copilot/tree/main/skills/prd) | 1 | `prd-copilot` |
| **5. PRD chia nhỏ cho AI Dev** | [snarktank/ralph](https://github.com/snarktank/ralph/tree/main/skills/prd) | 1 | `prd-ralph` |

> **Lưu ý:** Trong mỗi file `skills/<tên-skill>/SKILL.md` đều có dòng `> **Nguồn gốc & chuẩn hóa:** ...` dẫn link trực tiếp về file gốc trên GitHub.

## 2. Gợi ý gọi Skill theo tình huống
- **Viết PRD đầy đủ từ Product Discovery:** gọi `problem-framing-canvas` → `create-prd` hoặc `prd-development`.
- **Viết đặc tả tính năng (Functional Spec) nhanh:** gọi `write-spec` hoặc `prd-copilot` (có pha hỏi ngược làm rõ yêu cầu).
- **Chẻ PRD thành User Stories & Acceptance Criteria (`Given/When/Then`):** gọi `user-story`, `user-stories`, `user-story-splitting`, `test-scenarios`, `wwas`.
- **Chẻ PRD thành các task nhỏ để AI Agent code trực tiếp:** gọi `prd-ralph`.
