---
name: user-story
argument-hint: "[feature or user need]"
description: Tạo user story theo định dạng Mike Cohn và tiêu chí nghiệm thu Gherkin. Sử dụng khi chuyển đổi nhu cầu người dùng thành đầu việc sẵn sàng phát triển với kết quả rõ ràng và điều kiện kiểm thử được.
intent: >-
  Tạo các user story rõ ràng, súc tích kết hợp định dạng user story của Mike Cohn với tiêu chí nghiệm thu kiểu Gherkin. Sử dụng skill này để chuyển hóa nhu cầu người dùng thành công việc phát triển khả thi, tập trung vào kết quả, đảm bảo sự hiểu biết chung giữa product và engineering, đồng thời cung cấp tiêu chí thành công có thể kiểm thử được.
type: component
theme: pm-artifacts
best_for:
  - "Viết user story kèm tiêu chí nghiệm thu chuẩn mực"
  - "Chuyển đổi yêu cầu thành các story sẵn sàng phát triển"
  - "Thiết lập tiêu chuẩn chất lượng story cho toàn đội ngũ"
scenarios:
  - "Tôi cần viết user story cho hệ thống thông báo mới trong ứng dụng B2B SaaS"
  - "Chuyển đổi yêu cầu PRD này thành user story đúng định dạng kèm tiêu chí nghiệm thu Gherkin"
estimated_time: "5-10 min"
---

# Skill: Viết User Story (Mike Cohn + Gherkin)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/user-story/SKILL.md) (Dean Peters).

## Mục đích
Tạo các user story rõ ràng, súc tích kết hợp định dạng user story của Mike Cohn với tiêu chí nghiệm thu kiểu Gherkin. Sử dụng skill này để chuyển hóa nhu cầu người dùng thành công việc phát triển khả thi, tập trung vào kết quả, đảm bảo sự hiểu biết chung giữa product và engineering, đồng thời cung cấp tiêu chí thành công có thể kiểm thử được.

Đây không phải là bản đặc tả tính năng — mà là điểm khởi đầu cho cuộc đối thoại, ghi lại *ai* được hưởng lợi, họ đang cố làm *gì*, *tại sao* điều đó quan trọng và *làm sao* bạn biết nó hoạt động.

## Đầu vào

**Hoạt động tốt nhất với:** Tính năng hoặc nhu cầu người dùng mà story mô tả.
**Cũng hữu ích:** Vai trò người dùng, kết quả họ mong muốn và các trường hợp biên (edge cases) mà tiêu chí nghiệm thu phải bao phủ.

Bất kỳ nội dung nào được cung cấp ngay trong lệnh gọi — văn bản sau tên skill, bản dán ngữ cảnh (context dump), hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã có. Hãy sử dụng chúng và bỏ qua các phần đã được bao phủ; không hỏi lại.

**Bắt đầu với hai bàn tay trắng? Hoàn toàn ổn.** Skill sẽ hỏi người dùng là ai và họ đang cố đạt được điều gì trước khi phác thảo story và các tiêu chí Gherkin.

**Ví dụ lệnh gọi:** `Write user stories for password reset via SMS for our banking app — include the lockout edge case.`

## Các khái niệm cốt lõi

### Định dạng Mike Cohn + Gherkin
Một user story kết hợp:

**Trường hợp sử dụng (Định dạng Mike Cohn):**
- **As a** [chân dung/vai trò người dùng]
- **I want to** [hành động để đạt kết quả]
- **so that** [kết quả mong muốn]

**Tiêu chí nghiệm thu (Định dạng Gherkin):**
- **Scenario:** [Mô tả ngắn gọn về kịch bản]
- **Given:** [Ngữ cảnh ban đầu hoặc điều kiện tiên quyết]
- **and Given:** [Các điều kiện tiên quyết bổ sung]
- **When:** [Sự kiện kích hoạt hành động]
- **Then:** [Kết quả kỳ vọng]

### Tại sao cấu trúc này hiệu quả
- **Lấy người dùng làm trung tâm:** Buộc phải tập trung vào người hưởng lợi và lý do
- **Tập trung vào kết quả:** Mệnh đề "So that" nhấn mạnh giá trị mang lại, không chỉ đơn thuần là hành động
- **Kiểm thử được (Testable):** Tiêu chí nghiệm thu Gherkin cụ thể và xác minh được
- **Mang tính đối thoại:** Story là phần mở đầu cho thảo luận, không phải bản đặc tả cuối cùng
- **Ngôn ngữ chung:** Product, engineering và QA đều hiểu rõ định dạng này

### Phản mẫu (Những gì đây KHÔNG phải là)
- **Không phải tác vụ kỹ thuật (task):** "As a developer, I want to refactor the database" (đây là việc kỹ thuật, không phải giá trị cho người dùng)
- **Không phải danh sách tính năng:** "I want dashboards, reports, and analytics" (quá lớn — cần chia nhỏ)
- **Không mơ hồ:** "I want a better experience" (không đo lường được, không có kết quả rõ ràng)
- **Không phải hợp đồng cứng:** Story là chỗ giữ chỗ cho cuộc hội thoại, không phải đặc tả khóa cứng

### Khi nào nên dùng
- Chuyển hóa nhu cầu người dùng thành đầu việc phát triển
- Tinh chỉnh backlog (backlog grooming) và lập kế hoạch sprint (sprint planning)
- Truyền đạt giá trị cho đội ngũ kỹ thuật và thiết kế
- Đảm bảo tiêu chí nghiệm thu có thể kiểm thử tồn tại trước khi phát triển

### Khi nào KHÔNG nên dùng
- Cho nợ kỹ thuật thuần túy hoặc tái cấu trúc mã nguồn (hãy dùng engineering tasks thay thế)
- Khi story quá lớn (hãy chia nhỏ trước — xem `skills/user-story-splitting/SKILL.md`)
- Trước khi hiểu vấn đề người dùng (hãy viết problem statement trước)

---

## Ứng dụng

### Bước 1: Thu thập ngữ cảnh
Trước khi viết một story, hãy đảm bảo bạn có:
- **Chân dung người dùng (User persona):** Việc này dành cho ai? (tham khảo `skills/proto-persona/SKILL.md`)
- **Hiểu biết về vấn đề:** Điều này giải quyết nhu cầu gì? (tham khảo `skills/problem-statement/SKILL.md`)
- **Kết quả mong muốn:** Thành công trông như thế nào?
- **Ràng buộc:** Giới hạn về kỹ thuật, thời gian hoặc phạm vi

**Nếu thiếu ngữ cảnh:** Hãy thực hiện phỏng vấn khám phá hoặc công việc kiểm chứng vấn đề trước.

---

### Tập lệnh hỗ trợ tùy chọn (Trình tạo mẫu)

Nếu bạn muốn có một khung Markdown nhất quán, bạn có thể tạo từ đầu vào CLI. Tập lệnh này mang tính tất định (deterministic) và không tải dữ liệu hay ghi tệp.

```bash
python3 scripts/user-story-template.py --persona \"trial user\" --action \"log in with Google\" --outcome \"access the app without creating a new password\"
```

---

### Bước 2: Viết Use Case

Sử dụng `template.md` để có cấu trúc điền đầy đủ.

Điền vào mẫu:

```markdown
### User Story [ID]:

- **Summary:** [Brief, memorable title focused on value to the user]

#### Use Case:
- **As a** [user name if available, otherwise persona, otherwise role]
- **I want to** [action user takes to get to outcome]
- **so that** [desired outcome]
```

**Kiểm tra chất lượng:**
- **Tính cụ thể của "As a":** Đây có phải là một persona cụ thể (ví dụ: "trial user") hay chung chung ("user")?
- **Tính rõ ràng của "I want to":** Đây là hành động người dùng thực hiện, hay là tính năng bạn đang xây dựng?
- **Kết quả của "So that":** Phần này có giải thích động lực của người dùng không? Hay chỉ nhắc lại hành động?

**Lỗi thường gặp:**
- ❌ "As a user, I want a login button, so that I can log in" (nhắc lại hành động)
- ✅ "As a trial user, I want to log in with Google, so that I can access the app without creating a new password"

---

### Bước 3: Viết Tiêu chí nghiệm thu (Acceptance Criteria)

Điền vào mẫu:

```markdown
#### Acceptance Criteria:

- **Scenario:** [Brief, human-readable scenario describing value]
- **Given:** [Initial context or precondition]
- **and Given:** [Additional context or preconditions]
- **and Given:** [Additional context as needed]
- **and Given:** [UI-focused context ensuring 'When' can happen]
- **and Given:** [Outcomes-focused context ensuring 'Then' is delivered]
- **When:** [Event that triggers the action—aligns with 'I want to']
- **Then:** [Expected outcome—aligns with 'so that']
```

**Kiểm tra chất lượng:**
- **Có thể có nhiều Given:** Các điều kiện tiên quyết xếp chồng lên nhau (ví dụ: "Given I'm logged in" + "Given I have items in my cart")
- **Chỉ một When:** Nếu bạn cần nhiều mệnh đề "When", khả năng cao bạn đang có nhiều story — hãy tách chúng ra
- **Chỉ một Then:** Nếu bạn cần nhiều mệnh đề "Then", khả năng cao bạn đang có nhiều story — hãy tách chúng ra
- **Sự đồng bộ:** "When" có khớp với "I want to" không? "Then" có khớp với "so that" không?

**Dấu hiệu cảnh báo (Red flags):**
- **Nhiều When/Then:** Dấu hiệu phình phạm vi — hãy chia nhỏ story (tham khảo `skills/user-story-splitting/SKILL.md`)
- **Then mơ hồ:** "Then I see improved performance" (không đo lường được — hãy làm cho nó cụ thể)

---

### Bước 4: Thêm Tóm tắt (Summary)

Viết một bản tóm tắt ngắn gọn, dễ nhớ nắm bắt được giá trị của story:

```markdown
- **Summary:** [Brief, human-readable title]
```

**Ví dụ:**
- ✅ "Enable Google login for trial users to reduce signup friction"
- ✅ "Bulk delete items to save time for power users"
- ❌ "Add delete button" (lấy tính năng làm trung tâm, không lấy giá trị làm trung tâm)

---

### Bước 5: Xác thực và Tinh chỉnh

- **Đọc to cho cả nhóm nghe:** Mọi người có hiểu rõ ai, cái gì, tại sao không?
- **Kiểm thử tiêu chí nghiệm thu:** QA có thể viết test case từ đây không?
- **Kiểm tra khả năng chia nhỏ:** Nếu story có vẻ quá lớn, hãy dùng `skills/user-story-splitting/SKILL.md`
- **Đảm bảo tính kiểm thử được:** Bạn có thể chứng minh "Then" đã xảy ra không?

---

## Ví dụ

Xem `examples/sample.md` để tham khảo các ví dụ đầy đủ (story tốt, story chưa đạt và story cần chia nhỏ).

Đoạn trích ví dụ ngắn:

```markdown
### User Story 042:

- **Summary:** Enable Google login for trial users to reduce signup friction

#### Use Case:
- **As a** trial user visiting the app for the first time
- **I want to** log in using my Google account
- **so that** I can access the app without creating and remembering a new password

#### Acceptance Criteria:
- **Scenario:** First-time trial user logs in via Google OAuth
- **Given:** I am on the login page
- **and Given:** I have a login account
- **When:** I click the "Sign in with Google" button and authorize the app
- **Then:** I am logged into the app and redirected to the onboarding flow
```

---

## Những cái bẫy thường gặp

### Bẫy 1: Tác vụ kỹ thuật đội lốt User Story
**Triệu chứng:** "As a developer, I want to refactor the API, so that the code is cleaner"

**Hệ quả:** Đây là tác vụ kỹ thuật, không phải user story. Không có giá trị nào được mang lại cho người dùng.

**Cách khắc phục:** Nếu không có kết quả cho người dùng, đó không phải là user story — hãy dùng engineering task hoặc ticket nợ kỹ thuật thay thế.

---

### Bẫy 2: "As a User" (Quá chung chung)
**Triệu chứng:** Mọi story đều bắt đầu bằng "As a user"

**Hệ quả:** Không rõ chân dung người dùng. Những người dùng khác nhau có nhu cầu khác nhau.

**Cách khắc phục:** Sử dụng các persona cụ thể: "As a trial user," "As a paid subscriber," "As an admin," v.v. (tham khảo `skills/proto-persona/SKILL.md`)

---

### Bẫy 3: "So That" chỉ lặp lại "I Want To"
**Triệu chứng:** "I want to click the save button, so that I can save my work"

**Hệ quả:** Không thấy được *tại sao* người dùng quan tâm. Chỉ đơn thuần lặp lại hành động.

**Cách khắc phục:** Đào sâu vào động lực: "so that I don't lose my progress if the page crashes" (kết quả thực sự).

---

### Bẫy 4: Nhiều mệnh đề When/Then
**Triệu chứng:** Tiêu chí nghiệm thu có 5 mệnh đề "When" và 5 mệnh đề "Then"

**Hệ quả:** Story quá lớn. Có thể nhiều tính năng đã bị gộp chung với nhau.

**Cách khắc phục:** Chia nhỏ story bằng `skills/user-story-splitting/SKILL.md`. Mỗi cặp When/Then nên là một story riêng (hoặc ít nhất phải được đánh giá để tách).

---

### Bẫy 5: Tiêu chí nghiệm thu không thể kiểm thử
**Triệu chứng:** "Then the user has a better experience" hoặc "Then it's faster"

**Hệ quả:** QA không thể xác minh thành công. Định nghĩa "hoàn thành" (definition of "done") bị mơ hồ.

**Cách khắc phục:** Làm cho nó đo lường được: "Then the page loads in under 2 seconds" hoặc "Then the user sees a success confirmation message."

---

## Tài liệu tham khảo

### Các Skill liên quan
- `skills/user-story-splitting/SKILL.md` — Cách chia nhỏ story lớn thành các story nhỏ hơn
- `skills/proto-persona/SKILL.md` — Định nghĩa phần "As a [persona]"
- `skills/problem-statement/SKILL.md` — Các story cần giải quyết những vấn đề đã được kiểm chứng
- `skills/epic-hypothesis/SKILL.md` — Các epic được phân rã thành user story

### Công cụ hỗ trợ tùy chọn
- `skills/user-story/scripts/user-story-template.py` — Trình tạo khung Markdown tất định (không truy cập mạng)

### Khung tham chiếu bên ngoài
- Mike Cohn, *User Stories Applied* (2004) — Nguồn gốc định dạng "As a / I want / so that"
- Gherkin (Cucumber) — Định dạng tiêu chí nghiệm thu "Given/When/Then"
- Tiêu chí INVEST (Independent, Negotiable, Valuable, Estimable, Small, Testable)

### Tác phẩm của Dean
- [Gắn liên kết tới các bài viết Substack liên quan của Dean Peters nếu có]

### Nguồn gốc
- Chuyển thể từ `prompts/user-story-prompt-template.md` trong kho lưu trữ `https://github.com/deanpeters/product-manager-prompts`.

---

**Loại skill:** Component
**Tên tệp gợi ý:** `user-story.md`
**Vị trí gợi ý:** `/skills/components/`
**Phụ thuộc:** Tham chiếu `skills/proto-persona/SKILL.md`, `skills/problem-statement/SKILL.md`
**Được sử dụng bởi:** `skills/user-story-splitting/SKILL.md`, `skills/epic-hypothesis/SKILL.md`
