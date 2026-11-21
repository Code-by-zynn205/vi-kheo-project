---
name: prd-development
argument-hint: "[feature or initiative]"
description: Xây dựng tài liệu PRD có cấu trúc chặt chẽ, kết nối vấn đề, người dùng, giải pháp và tiêu chí thành công. Sử dụng khi chuyển đổi ghi chú khám phá (discovery notes) thành tài liệu sẵn sàng cho đội kỹ thuật triển khai đối với một sáng kiến lớn.
intent: >-
  Hướng dẫn Product Manager xây dựng PRD (Product Requirements Document) có cấu trúc thông qua việc điều phối đóng khung vấn đề, tổng hợp nghiên cứu người dùng, định nghĩa giải pháp và thiết lập tiêu chí thành công thành một tài liệu thống nhất. Sử dụng quy trình này để chuyển từ các ghi chú rời rạc và chuỗi tin nhắn Slack sang một bản PRD rõ ràng, toàn diện giúp đồng bộ các bên liên quan, cung cấp ngữ cảnh cho đội kỹ thuật và đóng vai trò nguồn chân lý duy nhất (source of truth) — tránh sự mơ hồ, phình phạm vi (scope creep) và cái bẫy "tự làm theo những gì trong đầu tôi".
type: workflow
theme: pm-artifacts
best_for:
  - "Viết một bản PRD hoàn chỉnh từ đầu"
  - "Cấu trúc hóa yêu cầu sản phẩm để bàn giao cho đội kỹ thuật"
  - "Tài liệu hóa một tính năng mới quan trọng trước khi bắt đầu phát triển"
scenarios:
  - "Tôi cần viết PRD cho tính năng gợi ý sản phẩm ứng dụng AI mới trên nền tảng thương mại điện tử"
  - "Tôi vừa hoàn thành sprint khám phá (discovery sprint) và cần chuyển các phát hiện thành bản PRD để đội kỹ thuật có thể thực thi"
estimated_time: "60-120 min"
---

# Skill: Phát triển PRD (Product Requirements Document)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/prd-development/SKILL.md) (Dean Peters).

## Mục đích
Hướng dẫn Product Manager xây dựng PRD (Product Requirements Document) có cấu trúc thông qua việc điều phối đóng khung vấn đề, tổng hợp nghiên cứu người dùng, định nghĩa giải pháp và thiết lập tiêu chí thành công thành một tài liệu thống nhất. Sử dụng quy trình này để chuyển từ các ghi chú rời rạc và chuỗi tin nhắn Slack sang một bản PRD rõ ràng, toàn diện giúp đồng bộ các bên liên quan, cung cấp ngữ cảnh cho đội kỹ thuật và đóng vai trò nguồn chân lý duy nhất (source of truth) — tránh sự mơ hồ, phình phạm vi (scope creep) và cái bẫy "tự làm theo những gì trong đầu tôi".

Đây không phải là một bản đặc tả kiểu thác nước (waterfall spec) — mà là một tài liệu sống (living document) ghi lại ngữ cảnh chiến lược, vấn đề của khách hàng, giải pháp đề xuất và tiêu chí thành công, liên tục tiến hóa khi bạn học hỏi thêm trong quá trình triển khai.

## Đầu vào

**Hoạt động tốt nhất với:** Tính năng hoặc sáng kiến mà bản PRD bao phủ.
**Cũng hữu ích:** Ghi chú khám phá (discovery notes), phát biểu vấn đề (problem statements), nghiên cứu người dùng, chỉ số thành công và các ràng buộc — hãy dán bất kỳ thông tin nào hiện có; quy trình sẽ đưa chúng vào đúng giai đoạn và bỏ qua những phần đã được trả lời.

Bất kỳ nội dung nào được cung cấp ngay trong lệnh gọi — văn bản sau tên skill, bản dán ngữ cảnh (context dump), hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã có. Hãy sử dụng chúng và bỏ qua các phần đã được bao phủ; không hỏi lại.

**Bắt đầu với hai bàn tay trắng? Hoàn toàn ổn.** Quy trình sẽ bắt đầu từ bước định nghĩa vấn đề và xây dựng dần từ đó.

**Ví dụ lệnh gọi:** `Build a PRD for self-serve workspace provisioning — here are my discovery notes and the OKR it ladders to.`

## Các khái niệm cốt lõi

### PRD là gì?

PRD (Product Requirements Document) là tài liệu có cấu trúc trả lời các câu hỏi:
1. **Chúng ta đang giải quyết vấn đề gì?** (Problem statement — Phát biểu vấn đề)
2. **Cho ai?** (Target users/personas — Người dùng mục tiêu / chân dung người dùng)
3. **Tại sao lại là lúc này?** (Strategic context, business case — Ngữ cảnh chiến lược, luận chứng kinh doanh)
4. **Chúng ta đang xây dựng gì?** (Solution overview — Tổng quan giải pháp)
5. **Chúng ta sẽ đo lường thành công như thế nào?** (Metrics, success criteria — Chỉ số, tiêu chí thành công)
6. **Các yêu cầu cụ thể là gì?** (User stories, acceptance criteria, constraints — User story, tiêu chí nghiệm thu, ràng buộc)
7. **Chúng ta KHÔNG xây dựng gì?** (Out of scope — Ngoài phạm vi)

### Cấu trúc PRD (Mẫu tiêu chuẩn)

```markdown
# [Feature/Product Name] PRD

## 1. Executive Summary
- One-paragraph overview (problem + solution + impact)

## 2. Problem Statement
- Who has this problem?
- What is the problem?
- Why is it painful?
- Evidence (customer quotes, data, research)

## 3. Target Users & Personas
- Primary persona(s)
- Secondary persona(s)
- Jobs-to-be-done

## 4. Strategic Context
- Business goals (OKRs)
- Market opportunity (TAM/SAM/SOM)
- Competitive landscape
- Why now?

## 5. Solution Overview
- High-level description
- User flows or wireframes
- Key features

## 6. Success Metrics
- Primary metric (what we're optimizing for)
- Secondary metrics
- Targets (current → goal)

## 7. User Stories & Requirements
- Epic hypothesis
- User stories with acceptance criteria
- Edge cases, constraints

## 8. Out of Scope
- What we're NOT building (and why)

## 9. Dependencies & Risks
- Technical dependencies
- External dependencies (integrations, partnerships)
- Risks and mitigations

## 10. Open Questions
- Unresolved decisions
- Areas requiring discovery
```

### Tại sao cấu trúc này hiệu quả
- **Đồng bộ (Alignment):** Đảm bảo mọi người (PM, design, engineering, các bên liên quan) đều hiểu rõ lý do "tại sao"
- **Lưu giữ ngữ cảnh (Context preservation):** Ghi lại nghiên cứu và cơ sở chiến lược để tham chiếu về sau
- **Nhật ký quyết định (Decision log):** Tài liệu hóa những gì nằm trong phạm vi, ngoài phạm vi và lý do
- **Rõ ràng khi thực thi (Execution clarity):** Cung cấp cho đội kỹ thuật các user story và tiêu chí nghiệm thu cụ thể

### Phản mẫu (Những gì đây KHÔNG phải là)
- **Không phải đặc tả chi tiết:** PRD đóng khung vấn đề và giải pháp; nó không đặc tả giao diện từng pixel một
- **Không phải waterfall:** PRD tiến hóa theo quá trình học hỏi; nó không phải hợp đồng đóng băng cứng nhắc
- **Không thay thế cho sự cộng tác:** PRD bổ trợ cho trao đổi trực tiếp, không thay thế đối thoại

### Khi nào nên dùng
- Bắt đầu một tính năng lớn hoặc sáng kiến sản phẩm mới
- Đồng bộ các nhóm liên chức năng về phạm vi và yêu cầu
- Tài liệu hóa các quyết định để tham khảo trong tương lai
- Onboarding thành viên mới vào dự án

### Khi nào KHÔNG nên dùng
- Cho các bản sửa lỗi nhỏ hoặc tính năng tầm thường (quá cồng kềnh)
- Khi vấn đề và giải pháp đã rõ ràng và đồng thuận (chỉ cần viết user story)
- Cho các thử nghiệm khám phá liên tục (hãy dùng Lean UX Canvas thay thế)

---

### Nguồn chân lý về điều phối (Facilitation Source of Truth)

Khi chạy quy trình này dưới dạng hội thoại có dẫn dắt, sử dụng [`workshop-facilitation`](../workshop-facilitation/SKILL.md) làm giao thức tương tác.

**Chế độ vào mặc định:** Guided · được thiết lập trong `pm-skills.config.yaml` (mặc định toàn thư viện hoặc ghi đè theo từng skill); lựa chọn riêng của người dùng trong phiên luôn được ưu tiên. Ở lượt đầu tiên, đề xuất cả ba chế độ, sau đó mở ngay ở chế độ mặc định mà không cần chờ chọn: Guided sẽ hỏi câu đầu tiên, Context dump mời dán toàn bộ thông tin, Best guess hỏi tối thiểu một câu và phác thảo bản nháp với mọi giả định được gắn nhãn.

Giao thức này định nghĩa:
- thông báo đầu phiên + chế độ vào (Guided, Context dump, Best guess)
- mỗi lượt một câu hỏi với lời nhắc bằng ngôn ngữ dễ hiểu
- nhãn tiến độ (ví dụ: Context Qx/8 và Scoring Qx/5)
- xử lý gián đoạn và hành vi tạm dừng/tiếp tục
- các khuyến nghị đánh số tại các điểm quyết định
- các tùy chọn trả lời nhanh đánh số cho câu hỏi thông thường (bao gồm `Other (specify)` khi hữu ích)

Tệp này định nghĩa trình tự quy trình làm việc và các đầu ra đặc thù theo miền. Nếu có xung đột, hãy tuân theo logic quy trình của tệp này.

## Ứng dụng

Sử dụng `template.md` làm tài liệu điền mẫu. Tài liệu mẫu bao gồm:

- **Các khối hướng dẫn theo từng phần (Per-section coaching blocks)** — mỗi phần có Hướng dẫn, Các bước, Skill đóng góp và Hoạt động riêng để mẫu tự hướng dẫn ngay cả khi không có quy trình này.
- **Gắn thẻ khoảng trống trực tiếp (Inline gap tagging)** — gắn thẻ mọi khoảng trống là 🔶 **Assumption** (hợp lý nhưng chưa được kiểm chứng) hoặc 🔵 **Open Question** (chưa biết, cần khám phá). Gắn thẻ ngay tại vị trí xuất hiện khoảng trống, không chỉ ở cuối tài liệu.
- **Lời nhắc kiểm tra liên phần (Cross-section recommendation prompts)** — sau khi hoàn thành mỗi phần, khối "Before moving on" kiểm tra tính nhất quán với các phần trước và cảnh báo những gì phần tiếp theo sẽ cần.
- **Tự đánh giá (Self-assessment)** — sau Phần 10, một phần chẩn đoán ghi lại phần mạnh nhất, phần yếu nhất, các giả định hàng đầu cần kiểm chứng và bước tiếp theo được khuyến nghị trước khi chia sẻ PRD.
- **Bảng tham chiếu chéo skill (Skill cross-reference table)** — ánh xạ 15 skill tới các phần cụ thể mà chúng cung cấp dữ liệu (ví dụ: `problem-framing-canvas` → Phần 2, `epic-breakdown-advisor` → Phần 7).

Quy trình này điều phối **8 giai đoạn** trong **2-4 ngày**, sử dụng nhiều skill thành phần và skill tương tác. Các giai đoạn dưới đây mô tả trình tự điều phối; tệp mẫu ghi lại kết quả đầu ra.

---

## Giai đoạn 1: Tóm tắt điều hành — Executive Summary (30 phút)

**Mục tiêu:** Viết bản tổng quan một đoạn văn cho người đọc lướt.

### Các hoạt động

**1. Phác thảo Executive Summary**
- **Định dạng:** "Chúng tôi đang xây dựng [giải pháp] cho [chân dung người dùng] nhằm giải quyết [vấn đề], điều này sẽ mang lại [tác động]."
- **Ví dụ:**
  > "Chúng tôi đang xây dựng danh sách kiểm tra onboarding có hướng dẫn cho chủ doanh nghiệp nhỏ không rành kỹ thuật nhằm giải quyết vấn đề 60% người dùng bỏ cuộc trong 24 giờ đầu tiên do thiếu chỉ dẫn, qua đó tăng tỷ lệ kích hoạt từ 40% lên 60% và giảm tỷ lệ rời bỏ (churn) đi 10%."

- **Người tham gia:** PM
- **Thời lượng:** 30 phút
- **Đầu ra:** Bản tóm tắt một đoạn văn

**Mẹo:** Viết phần này trước tiên (ép buộc sự rõ ràng), nhưng tinh chỉnh nó sau cùng (sau khi các phần khác đã hoàn thiện).

---

## Giai đoạn 2: Phát biểu vấn đề — Problem Statement (60 phút)

**Mục tiêu:** Đóng khung vấn đề khách hàng kèm theo bằng chứng.

### Các hoạt động

**1. Viết Problem Statement**
- **Sử dụng:** `skills/problem-statement/SKILL.md` (thành phần)
- **Đầu vào:** Thông tin khám phá từ `skills/discovery-process/SKILL.md` hoặc `skills/problem-framing-canvas/SKILL.md`
- **Người tham gia:** PM
- **Thời lượng:** 30 phút
- **Đầu ra:** Phát biểu vấn đề có cấu trúc

**Ví dụ Problem Statement:**

```markdown
## 2. Problem Statement

### Who has this problem?
Non-technical small business owners (solopreneurs, 1-10 employees) who sign up for our SaaS product.

### What is the problem?
60% of users abandon onboarding within the first 24 hours because they don't know what to do first. They see an empty dashboard with no guidance, get overwhelmed by options, and leave.

### Why is it painful?
- **User impact:** Wastes time (30-60 min trying to figure out product), never reaches "aha moment," churns before experiencing value
- **Business impact:** 60% activation rate → high churn, low LTV, poor word-of-mouth

### Evidence
- **Interviews:** 8/10 churned users said "I didn't know what to do first" (discovery interviews, Feb 2026)
- **Analytics:** 60% of signups complete 0 actions within 24 hours (Mixpanel, Jan 2026)
- **Support tickets:** "How do I get started?" is #1 support question (350 tickets/month)
- **Customer quote:** "I logged in, saw an empty dashboard, and thought 'now what?' I gave up and went back to my spreadsheet."
```

**2. Bổ sung ngữ cảnh hỗ trợ (Tùy chọn)**
- **Bản đồ hành trình khách hàng:** Nếu vấn đề trải dài qua nhiều điểm chạm
- **Sử dụng:** Đầu ra của `skills/customer-journey-mapping-workshop/SKILL.md`
- **Jobs-to-be-done:** Nếu động lực người dùng là yếu tố then chốt
- **Sử dụng:** Đầu ra của `skills/jobs-to-be-done/SKILL.md`

### Đầu ra từ Giai đoạn 2

- **Phát biểu vấn đề:** Ai, cái gì, tại sao, bằng chứng
- **Tài liệu hỗ trợ:** Bản đồ hành trình, JTBD (nếu phù hợp)

---

## Giai đoạn 3: Người dùng mục tiêu & Chân dung — Target Users & Personas (30 phút)

**Mục tiêu:** Xác định bạn đang xây dựng cho ai.

### Các hoạt động

**1. Tài liệu hóa Personas**
- **Sử dụng:** Đầu ra của `skills/proto-persona/SKILL.md` (thành phần)
- **Người tham gia:** PM
- **Thời lượng:** 30 phút
- **Định dạng:** Bao gồm tên persona, vai trò, mục tiêu, điểm đau, hành vi

**Ví dụ:**

```markdown
## 3. Target Users & Personas

### Primary Persona: Solo Entrepreneur Sam
- **Role:** Freelance consultant, solopreneur
- **Company size:** 1 person (no IT support)
- **Tech savviness:** Low (uses email, spreadsheets, basic SaaS)
- **Goals:** Get value from software fast without technical expertise
- **Pain points:** Overwhelmed by complex UIs, no time to watch tutorials, needs immediate value
- **Current behavior:** Signs up for products, tries for 1 day, churns if not immediately useful

### Secondary Persona: Small Business Owner (5-10 employees)
- **Role:** Owner-operator, manages team
- **Needs:** Onboard team members quickly
- **Differs from primary:** More tolerant of complexity, willing to invest setup time
```

### Đầu ra từ Giai đoạn 3

- **Persona chính:** Hồ sơ chi tiết
- **Persona phụ:** (nếu có)

---

## Giai đoạn 4: Ngữ cảnh chiến lược — Strategic Context (45 phút)

**Mục tiêu:** Giải thích tại sao điều này quan trọng với doanh nghiệp và tại sao lại là lúc này.

### Các hoạt động

**1. Tài liệu hóa mục tiêu kinh doanh**
- **Nguồn:** OKR công ty, bản ghi nhớ chiến lược, lộ trình (roadmap)
- **Định dạng:** Liên kết tính năng với kết quả kinh doanh
- **Ví dụ:**
  > "Sáng kiến này hỗ trợ OKR Quý 1 của chúng ta: Giảm churn từ 15% xuống 8%. Cải thiện kích hoạt onboarding tác động trực tiếp đến tỷ lệ giữ chân."

**2. Định lượng cơ hội thị trường (Tùy chọn)**
- **Sử dụng:** Đầu ra của `skills/tam-sam-som-calculator/SKILL.md` (tương tác)
- **Khi nào:** Cho các sáng kiến lớn, sản phẩm mới, bài trình bày cấp điều hành
- **Ví dụ:**
  > "TAM: 50 triệu doanh nghiệp nhỏ toàn cầu. SAM: 5 triệu doanh nghiệp đang dùng công cụ SaaS. SOM: 500 nghìn người làm việc độc lập trong phân khúc mục tiêu. Cải thiện onboarding có thể mở khóa 30% SAM (1,5 triệu khách hàng tiềm năng)."

**3. Tài liệu hóa bức tranh cạnh tranh (Tùy chọn)**
- **Nguồn:** Nghiên cứu đối thủ, đánh giá trên G2/Capterra
- **Ví dụ:**
  > "Các đối thủ (Đối thủ A, B) đều có onboarding có hướng dẫn. Việc thiếu hướng dẫn của chúng ta được nêu là lý do rời bỏ trong các khảo sát thoát (exit surveys)."

**4. Giải thích "Tại sao lại là lúc này?" (Why Now?)**
- **Cơ sở lập luận:** Tại sao ưu tiên việc này ngay bây giờ thay vì để sau?
- **Ví dụ:**
  > "Churn tăng vọt 15% trong Quý 4. Onboarding là nguyên nhân số 1 (60% rời bỏ trong 30 ngày đầu). Khắc phục vấn đề này là điều tối quan trọng để đạt OKR giữ chân khách hàng."

### Đầu ra từ Giai đoạn 4

- **Mục tiêu kinh doanh:** OKR hoặc các sáng kiến chiến lược
- **Cơ hội thị trường:** TAM/SAM/SOM (nếu có)
- **Ngữ cảnh cạnh tranh:** Cách đối thủ giải quyết vấn đề này
- **Tại sao là lúc này:** Lý do về tính cấp bách

---

## Giai đoạn 5: Tổng quan giải pháp — Solution Overview (60 phút)

**Mục tiêu:** Mô tả những gì bạn đang xây dựng (ở mức tổng quan, không phải đặc tả chi tiết).

### Các hoạt động

**1. Viết mô tả giải pháp**
- **Định dạng:** Tổng quan cấp cao, 2-3 đoạn văn
- **Ví dụ:**

```markdown
## 5. Solution Overview

We're building a **guided onboarding checklist** that walks new users through core workflows step-by-step when they first log in.

**How it works:**
1. User signs up and logs in for the first time
2. Modal appears: "Let's get you set up! Complete these 3 steps to get started."
3. Checklist shows:
   - ☐ Create your first project
   - ☐ Invite a teammate (optional)
   - ☐ Complete a sample task
4. As user completes each step, checklist updates with checkmarks
5. After completion, celebration modal: "You're all set! Here's what to do next."

**Key features:**
- Minimal: Only 3 core steps (not overwhelming)
- Dismissible: Users can skip if they prefer to explore
- Progress tracking: Visual progress bar (1/3, 2/3, 3/3)
- Celebration: Positive reinforcement when complete
```

**2. Thêm Luồng người dùng (User Flows) hoặc Wireframes (Tùy chọn)**
- **Sử dụng:** Công cụ thiết kế (Figma, Sketch) hoặc bản phác thảo vẽ tay
- **Khi nào:** Cho các tính năng phức tạp cần giải thích trực quan
- **Đầu ra:** Nhúng trực tiếp vào PRD hoặc gắn liên kết

**3. Tham chiếu Story Map (Tùy chọn)**
- **Sử dụng:** Đầu ra của `skills/user-story-mapping-workshop/SKILL.md`
- **Khi nào:** Cho các tính năng phức tạp với nhiều lát cắt phát hành (release slices)
- **Đầu ra:** Liên kết đến story map

### Đầu ra từ Giai đoạn 5

- **Mô tả giải pháp:** Tổng quan cấp cao
- **User flows/wireframes:** (nếu có)
- **Story map:** (nếu có)

---

## Giai đoạn 6: Chỉ số thành công — Success Metrics (30 phút)

**Mục tiêu:** Xác định cách bạn sẽ đo lường thành công.

### Các hoạt động

**1. Xác định Chỉ số chính (Primary Metric)**
- **Câu hỏi:** Đâu là MỘT chỉ số duy nhất mà tính năng này phải thúc đẩy?
- **Ví dụ:** "Tỷ lệ kích hoạt (% người dùng hoàn thành hành động đầu tiên trong vòng 24 giờ)"
- **Mục tiêu:** "Tăng từ 40% lên 60%"

**2. Xác định Các chỉ số phụ (Secondary Metrics)**
- **Câu hỏi:** Chúng ta nên theo dõi thêm gì khác (nhưng không tối ưu hóa trực tiếp cho nó)?
- **Ví dụ:**
  - Thời gian đến hành động đầu tiên — Time-to-first-action (giảm từ 3 ngày xuống 1 ngày)
  - Tỷ lệ hoàn thành checklist onboarding (mục tiêu: 80%)
  - Khối lượng ticket hỗ trợ (giảm 50% số ticket hỏi "How do I get started?")

**3. Xác định Chỉ số rào chắn (Guardrail Metrics)**
- **Câu hỏi:** Điều gì KHÔNG được phép tệ đi?
- **Ví dụ:** "Tỷ lệ chuyển đổi đăng ký (không thêm ma sát vào luồng đăng ký)"

**Ví dụ:**

```markdown
## 6. Success Metrics

### Primary Metric
**Activation rate** (% of users completing first action within 24 hours)
- **Current:** 40%
- **Target:** 60%
- **Timeline:** Measure 30 days after launch

### Secondary Metrics
- **Time-to-first-action:** Reduce from 3 days to 1 day
- **Onboarding checklist completion rate:** 80% of users complete all 3 steps
- **Support tickets:** Reduce "How do I get started?" tickets from 350/month to 175/month

### Guardrail Metrics
- **Sign-up conversion rate:** Maintain at 10% (don't add friction to signup)
```

### Đầu ra từ Giai đoạn 6

- **Chỉ số chính:** Thứ bạn đang tối ưu hóa
- **Chỉ số phụ:** Các chỉ báo thành công bổ sung
- **Chỉ số rào chắn:** Những gì không được phép suy giảm

---

## Giai đoạn 7: User Stories & Yêu cầu (90-120 phút)

**Mục tiêu:** Chia nhỏ giải pháp thành các user story kèm tiêu chí nghiệm thu.

### Các hoạt động

**1. Viết Giả thuyết Epic (Epic Hypothesis)**
- **Sử dụng:** `skills/epic-hypothesis/SKILL.md` (thành phần)
- **Người tham gia:** PM
- **Thời lượng:** 30 phút
- **Đầu ra:** Phát biểu giả thuyết epic

**Ví dụ:**
> "Chúng tôi tin rằng việc bổ sung checklist onboarding có hướng dẫn cho người dùng không rành kỹ thuật sẽ tăng tỷ lệ kích hoạt từ 40% lên 60% vì người dùng hiện tại đang bỏ cuộc do thiếu chỉ dẫn. Chúng tôi sẽ đo lường thành công bằng tỷ lệ kích hoạt sau 30 ngày ra mắt."

**2. Chia nhỏ Epic thành User Stories**
- **Sử dụng:** `skills/epic-breakdown-advisor/SKILL.md` (tương tác - với 9 mẫu của Richard Lawrence)
- **Người tham gia:** PM, design, engineering
- **Thời lượng:** 90 phút
- **Đầu ra:** Các user story được chia theo mẫu (luồng công việc, CRUD, quy tắc nghiệp vụ, v.v.)

**3. Viết User Stories**
- **Sử dụng:** `skills/user-story/SKILL.md` (thành phần)
- **Người tham gia:** PM
- **Thời lượng:** 30 phút mỗi story
- **Định dạng:** User story + tiêu chí nghiệm thu (acceptance criteria)

**Ví dụ User Stories:**

```markdown
## 7. User Stories & Requirements

### Epic Hypothesis
We believe that adding a guided onboarding checklist for non-technical users will increase activation rate from 40% to 60% because users currently drop off due to lack of guidance.

### User Stories

**Story 1: Display onboarding checklist on first login**
As a new user, I want to see a guided checklist when I first log in, so I know what to do first.

**Acceptance Criteria:**
- [ ] When user logs in for the first time, modal appears with checklist
- [ ] Checklist shows 3 steps: "Create project," "Invite teammate," "Complete task"
- [ ] Modal is dismissible (close button)
- [ ] If dismissed, checklist doesn't reappear (user preference saved)

**Story 2: Track checklist progress**
As a new user, I want to see my progress as I complete checklist steps, so I feel a sense of accomplishment.

**Acceptance Criteria:**
- [ ] When user completes step 1, checkmark appears next to "Create project"
- [ ] Progress bar updates (1/3 → 2/3 → 3/3)
- [ ] Checklist persists across sessions (if user logs out and back in)

**Story 3: Celebrate checklist completion**
As a new user, I want to receive positive feedback when I complete the checklist, so I feel confident using the product.

**Acceptance Criteria:**
- [ ] When user completes all 3 steps, celebration modal appears
- [ ] Message: "You're all set! Here's what to do next: [suggested next actions]"
- [ ] Confetti animation (optional, nice-to-have)
```

**4. Tài liệu hóa Ràng buộc & Trường hợp biên (Constraints & Edge Cases)**
- **Ràng buộc kỹ thuật:** Giới hạn nền tảng, hỗ trợ trình duyệt, v.v.
- **Trường hợp biên:** Điều gì xảy ra nếu người dùng bỏ qua bước 2? Nếu họ hoàn thành các bước không theo thứ tự thì sao?

### Đầu ra từ Giai đoạn 7

- **Giả thuyết Epic:** Phát biểu có thể kiểm chứng
- **User stories:** 3-10 story kèm tiêu chí nghiệm thu
- **Ràng buộc:** Giới hạn kỹ thuật, trường hợp biên

---

## Giai đoạn 8: Ngoài phạm vi & Các phụ thuộc — Out of Scope & Dependencies (30 phút)

**Mục tiêu:** Xác định những gì bạn KHÔNG xây dựng và những gì bạn phụ thuộc vào.

### Các hoạt động

**1. Tài liệu hóa Out of Scope**
- **Định dạng:** Liệt kê các tính năng/yêu cầu bị loại trừ rõ ràng
- **Lý do:** Tại sao chưa xây dựng ngay bây giờ?

**Ví dụ:**

```markdown
## 8. Out of Scope

**Not included in this release:**
- **Advanced onboarding personalization** (e.g., different checklists per persona) — Adds complexity, test simple version first
- **Video tutorials embedded in checklist** — Resource-intensive, validate checklist concept first
- **Gamification (badges, points)** — Nice-to-have, focus on core workflow guidance

**Future consideration:**
- Mobile-optimized onboarding (desktop-first for now)
```

**2. Tài liệu hóa Các phụ thuộc (Dependencies)**
- **Phụ thuộc kỹ thuật:** Nâng cấp nền tảng, thay đổi API bắt buộc
- **Phụ thuộc bên ngoài:** Tích hợp bên thứ ba, đối tác
- **Phụ thuộc giữa các nhóm:** Bàn giao thiết kế, công việc đường ống dữ liệu (data pipeline)

**Ví dụ:**

```markdown
## 9. Dependencies & Risks

### Dependencies
- **Design:** Wireframes for checklist UI (ETA: Week 1)
- **Engineering:** No technical dependencies (uses existing modals framework)

### Risks & Mitigations
- **Risk:** Users dismiss checklist immediately, never see it
  - **Mitigation:** Track dismissal rate; if >50%, iterate on messaging or timing
- **Risk:** Checklist steps are too generic, don't resonate with all personas
  - **Mitigation:** Start with primary persona (Solo Entrepreneur Sam), personalize later
```

**3. Tài liệu hóa Câu hỏi mở (Open Questions)**
- **Quyết định chưa giải quyết:** Các khu vực cần khám phá hoặc thảo luận thêm

**Ví dụ:**

```markdown
## 10. Open Questions

- Should checklist be mandatory or optional? (Decision: Optional, dismissible)
- Should we A/B test checklist vs. no checklist? (Decision: Yes, show to 50% of new users)
- What happens if user completes steps out of order? (Decision: Allow any order, update checklist dynamically)
```

### Đầu ra từ Giai đoạn 8

- **Ngoài phạm vi:** Những gì chúng ta KHÔNG xây dựng
- **Phụ thuộc:** Những gì chúng ta cần trước khi bắt đầu
- **Rủi ro:** Các điểm nghẽn tiềm ẩn và phương án giảm thiểu
- **Câu hỏi mở:** Các quyết định chưa chốt

---

## Quy trình hoàn chỉnh: Tóm tắt từ đầu đến cuối

```
Day 1:
├─ Phase 1: Executive Summary (30 min)
├─ Phase 2: Problem Statement (60 min)
│  └─ Use: skills/problem-statement/SKILL.md
├─ Phase 3: Target Users & Personas (30 min)
│  └─ Use: skills/proto-persona/SKILL.md
└─ Phase 4: Strategic Context (45 min)
   └─ Use: skills/tam-sam-som-calculator/SKILL.md (optional)

Day 2:
├─ Phase 5: Solution Overview (60 min)
│  └─ Use: skills/user-story-mapping-workshop/SKILL.md (optional)
├─ Phase 6: Success Metrics (30 min)
└─ Phase 7: User Stories & Requirements (90-120 min)
   ├─ Use: skills/epic-hypothesis/SKILL.md
   ├─ Use: skills/epic-breakdown-advisor/SKILL.md
   └─ Use: skills/user-story/SKILL.md

Day 3:
├─ Phase 8: Out of Scope & Dependencies (30 min)
└─ Review & Refine (60 min)
   └─ Read full PRD, polish, get feedback

Day 4 (Optional):
└─ Stakeholder Review & Approval
   └─ Present PRD to stakeholders, incorporate feedback
```

**Tổng thời gian đầu tư:**
- **Lộ trình nhanh (Fast track):** 1,5-2 ngày (tính năng đơn giản, yêu cầu rõ ràng)
- **Thông thường (Typical):** 2-3 ngày (bao gồm tổng hợp khám phá, đánh giá với các bên liên quan)
- **Phức tạp (Complex):** 3-4 ngày (sáng kiến lớn, nhiều persona, nhiều user story)

---

## Ví dụ

Xem `examples/sample.md` để tham khảo các ví dụ PRD đầy đủ.

Đoạn trích ví dụ ngắn:

```markdown
## 2. Problem Statement
- 60% of trial users drop off in first 24 hours
## 6. Success Metrics
- Activation rate: 40% → 60%
```

## Những cái bẫy thường gặp

### Bẫy 1: Viết PRD trong cô lập
**Triệu chứng:** PM tự viết PRD một mình, sau đó trình bày tài liệu hoàn chỉnh cho cả nhóm

**Hệ quả:** Không có sự đồng thuận (buy-in), nhóm không hiểu cơ sở lập luận

**Cách khắc phục:** Cộng tác ở Giai đoạn 7 (user stories) cùng design + engineering; rà soát bản nháp PRD trước khi chốt

---

### Bẫy 2: Không có bằng chứng trong Problem Statement
**Triệu chứng:** "Chúng tôi tin rằng người dùng gặp vấn đề này" (không dữ liệu, không trích dẫn)

**Hệ quả:** Đội ngũ nghi ngờ liệu vấn đề có thực sự tồn tại hay không

**Cách khắc phục:** Sử dụng thông tin khám phá từ `skills/discovery-process/SKILL.md`; đưa vào trích dẫn khách hàng, dữ liệu phân tích (analytics), ticket hỗ trợ

---

### Bẫy 3: Giải pháp áp đặt quá chi tiết
**Triệu chứng:** PRD chỉ định chính xác UI, kích thước pixel, màu sắc nút bấm

**Hệ quả:** Triệt tiêu sự cộng tác với thiết kế, biến thành đặc tả thác nước cứng nhắc

**Cách khắc phục:** Giữ Giai đoạn 5 ở mức tổng quan; để đội thiết kế làm chủ chi tiết UI

---

### Bẫy 4: Thiếu Chỉ số thành công
**Triệu chứng:** PRD định nghĩa vấn đề + giải pháp nhưng không có chỉ số đo lường

**Hệ quả:** Không thể kiểm chứng liệu tính năng có thành công hay không

**Cách khắc phục:** Luôn xác định chỉ số chính trong Giai đoạn 6 (thứ bạn đang tối ưu hóa)

---

### Bẫy 5: Không tài liệu hóa Out of Scope
**Triệu chứng:** Không có mục liệt kê những gì KHÔNG được xây dựng

**Hệ quả:** Phình phạm vi (scope creep), các bên liên quan kỳ vọng những tính năng chưa hề lên kế hoạch

**Cách khắc phục:** Tài liệu hóa rõ ràng phần ngoài phạm vi trong Giai đoạn 8

---

## Tài liệu tham khảo

### Các Skill liên quan (Được điều phối bởi quy trình này)

**Giai đoạn 2:**
- `skills/problem-statement/SKILL.md` (thành phần)
- `skills/problem-framing-canvas/SKILL.md` (tương tác, để lấy ngữ cảnh)
- `skills/customer-journey-mapping-workshop/SKILL.md` (tương tác, tùy chọn)

**Giai đoạn 3:**
- `skills/proto-persona/SKILL.md` (thành phần)
- `skills/jobs-to-be-done/SKILL.md` (thành phần, tùy chọn)

**Giai đoạn 4:**
- `skills/tam-sam-som-calculator/SKILL.md` (tương tác, tùy chọn)

**Giai đoạn 5:**
- `skills/user-story-mapping-workshop/SKILL.md` (tương tác, tùy chọn)

**Giai đoạn 7:**
- `skills/epic-hypothesis/SKILL.md` (thành phần)
- `skills/epic-breakdown-advisor/SKILL.md` (tương tác)
- `skills/user-story/SKILL.md` (thành phần)

### Khung tham chiếu bên ngoài
- Martin Eriksson, "How to Write a Good PRD" (2012) — Cấu trúc PRD
- Marty Cagan, *Inspired* (2017) — Nguyên tắc đặc tả sản phẩm
- Amazon, "Working Backwards" (định dạng PR/FAQ) — Phương án thay thế cho PRD

### Tác phẩm của Dean
- [Nếu Dean có mẫu PRD, gắn liên kết tại đây]

---

**Loại skill:** Workflow
**Tên tệp gợi ý:** `prd-development.md`
**Vị trí gợi ý:** `/skills/workflows/`
**Phụ thuộc:** Điều phối hơn 8 skill thành phần và skill tương tác qua 8 giai đoạn
