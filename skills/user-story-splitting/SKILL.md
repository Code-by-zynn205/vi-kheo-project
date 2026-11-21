---
name: user-story-splitting
argument-hint: "[story or epic to split]"
description: Chia nhỏ một story lớn hoặc epic thành các story nhỏ hơn có thể bàn giao bằng các mẫu tách đã được chứng minh. Sử dụng khi các mục backlog quá lớn để ước lượng, sắp xếp thứ tự hoặc phát hành độc lập.
intent: >-
  Phân tách các user story, epic hoặc tính năng lớn thành những story nhỏ hơn, có thể bàn giao độc lập bằng các mẫu chia nhỏ (splitting patterns) có hệ thống. Sử dụng skill này để công việc dễ quản lý hơn, giảm rủi ro, đẩy nhanh vòng lặp phản hồi và duy trì luồng công việc mượt mà trong phát triển agile. Skill này áp dụng cho user story, epic và bất kỳ đầu việc nào quá lớn để hoàn thành trong một sprint.
type: component
theme: pm-artifacts
best_for:
  - "Chia nhỏ một story quá lớn không thể ước lượng hoặc hoàn thành trong một sprint"
  - "Áp dụng các mẫu chia nhỏ đã được chứng minh thay vì tách theo thành phần kỹ thuật"
  - "Giữ cho mỗi lát cắt có giá trị và khả năng phát hành độc lập"
scenarios:
  - "Story này quá lớn cho một sprint và việc tách theo frontend/backend không hiệu quả"
  - "Các mục backlog của chúng tôi liên tục bị trễ sang sprint sau — tôi cần các mẫu tách thực tế"
estimated_time: "15-25 min"
---

# Skill: Chia nhỏ User Story (User Story Splitting)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/user-story-splitting/SKILL.md) (Dean Peters).

## Mục đích
Phân tách các user story, epic hoặc tính năng lớn thành những story nhỏ hơn, có thể bàn giao độc lập bằng các mẫu chia nhỏ (splitting patterns) có hệ thống. Sử dụng skill này để công việc dễ quản lý hơn, giảm rủi ro, đẩy nhanh vòng lặp phản hồi và duy trì luồng công việc mượt mà trong phát triển agile. Skill này áp dụng cho user story, epic và bất kỳ đầu việc nào quá lớn để hoàn thành trong một sprint.

Đây không phải là việc cắt xén tùy tiện — mà là sự phân rã có chiến lược nhằm bảo toàn giá trị cho người dùng đồng thời giảm độ phức tạp.

## Đầu vào

**Hoạt động tốt nhất với:** Story hoặc epic đang quá lớn — hãy dán nguyên văn nội dung hiện tại.
**Cũng hữu ích:** Lý do nó quá lớn (không thể ước lượng, không thể hoàn thành trong một sprint, không thể phát hành độc lập) và ngưỡng kích thước tối đa của đội ngũ bạn.

Bất kỳ nội dung nào được cung cấp ngay trong lệnh gọi — văn bản sau tên skill, bản dán ngữ cảnh (context dump), hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã có. Hãy sử dụng chúng và bỏ qua các phần đã được bao phủ; không hỏi lại.

**Bắt đầu với hai bàn tay trắng? Hoàn toàn ổn.** Skill sẽ hỏi nội dung story, sau đó rà soát các mẫu chia nhỏ đối chiếu với nó.

**Ví dụ lệnh gọi:** `Split this: 'As an admin, I can bulk-import users from CSV, Excel, or our HR system with field mapping and error handling.'`

## Các khái niệm cốt lõi

### Khung chia nhỏ Story (Story Splitting Framework)
Dựa trên "Humanizing Work Guide to Splitting User Stories" của Richard Lawrence và Peter Green, khung làm việc này cung cấp 8 mẫu có hệ thống để chia nhỏ công việc:

1. **Các bước trong luồng công việc (Workflow steps):** Chia theo các bước tuần tự trong hành trình người dùng
2. **Biến thể quy tắc nghiệp vụ (Business rule variations):** Chia theo các kịch bản quy tắc khác nhau (phân quyền, công thức tính toán, v.v.)
3. **Biến thể dữ liệu (Data variations):** Chia theo các loại dữ liệu hoặc đầu vào khác nhau
4. **Độ phức tạp tiêu chí nghiệm thu (Acceptance criteria complexity):** Chia khi có nhiều mệnh đề "When" hoặc "Then"
5. **Nỗ lực lớn (Major effort):** Chia theo các cột mốc kỹ thuật hoặc các giai đoạn triển khai
6. **Phụ thuộc bên ngoài (External dependencies):** Chia theo ranh giới phụ thuộc (API, bên thứ ba, v.v.)
7. **Các bước DevOps (DevOps steps):** Chia theo yêu cầu triển khai hoặc hạ tầng
8. **Thử nghiệm khám phá nhỏ — Tiny Acts of Discovery (TADs):** Khi không có mẫu nào ở trên áp dụng được, sử dụng các thử nghiệm nhỏ để làm rõ những điều chưa biết

### Tại sao cần chia nhỏ Stories?
- **Phản hồi nhanh hơn:** Story nhỏ hơn được phát hành sớm hơn, cho phép kiểm chứng sớm hơn
- **Giảm rủi ro:** Xây dựng ít hơn = ít thứ có thể hỏng hơn
- **Ước lượng chính xác hơn:** Story nhỏ dễ ước lượng chính xác hơn
- **Duy trì luồng công việc:** Giữ công việc trôi chảy qua sprint mà không bị nghẽn cổ chai
- **Khả năng kiểm thử:** Phạm vi nhỏ hơn = dễ viết và chạy kiểm thử hơn

### Phản mẫu (Những gì đây KHÔNG phải là)
- **Không cắt lát ngang (horizontal slicing):** Đừng tách thành "front-end story" và "back-end story" (mỗi story phải mang lại giá trị cho người dùng)
- **Không phải phân rã tác vụ (task decomposition):** Story không phải là tác vụ ("Thiết lập cơ sở dữ liệu", "Viết API")
- **Không chặt khúc tùy tiện:** Đừng tách "Thêm quản lý người dùng" thành "Thêm người dùng" và "Quản lý" (vô nghĩa)

### Khi nào nên dùng
- Story quá lớn cho một sprint duy nhất
- Có nhiều mệnh đề "When" hoặc "Then" trong tiêu chí nghiệm thu
- Epic cần được chia nhỏ thành các phần tăng trưởng có thể bàn giao
- Nhóm không thể thống nhất về kích thước hoặc phạm vi của story
- Story gộp chung nhiều persona hoặc nhiều luồng công việc với nhau

### Khi nào KHÔNG nên dùng
- Story đã nhỏ và phạm vi rõ ràng (đừng chia nhỏ quá mức)
- Việc chia nhỏ sẽ tạo ra các phụ thuộc làm chậm tiến độ bàn giao
- Story thực chất là một tác vụ kỹ thuật (hãy dùng phân rã tác vụ kỹ thuật thay thế)

---

## Ứng dụng

### Bước 1: Xác định Story gốc
Bắt đầu với story/epic/tính năng cần chia nhỏ. Đảm bảo nó được viết theo định dạng user story (tham khảo `skills/user-story/SKILL.md` hoặc `skills/epic-hypothesis/SKILL.md`).

```markdown
### Original Story:
[Story formatted with use case and acceptance criteria]
```

---

### Bước 2: Áp dụng logic chia nhỏ

Sử dụng `template.md` để có cấu trúc điền đầy đủ và định dạng đầu ra.

Lần lượt đi qua 8 mẫu chia nhỏ theo đúng thứ tự. Dừng lại khi bạn tìm thấy một mẫu phù hợp.

#### Mẫu 1: Các bước trong luồng công việc (Workflow Steps)
**Hãy hỏi:** Story này có chứa nhiều bước tuần tự không?

**Ví dụ:**
- Gốc: "As a user, I want to sign up, verify my email, and complete onboarding"
- Chia nhỏ:
  1. "As a user, I want to sign up with email/password"
  2. "As a user, I want to verify my email via a confirmation link"
  3. "As a user, I want to complete onboarding by answering 3 profile questions"

---

#### Mẫu 2: Biến thể quy tắc nghiệp vụ (Business Rule Variations)
**Hãy hỏi:** Story này có các quy tắc khác nhau cho các kịch bản khác nhau không?

**Ví dụ:**
- Gốc: "As a user, I want to apply discounts (10% for members, 20% for VIPs, 5% for first-time buyers)"
- Chia nhỏ:
  1. "As a member, I want to apply a 10% discount at checkout"
  2. "As a VIP, I want to apply a 20% discount at checkout"
  3. "As a first-time buyer, I want to apply a 5% discount at checkout"

---

#### Mẫu 3: Biến thể dữ liệu (Data Variations)
**Hãy hỏi:** Story này có xử lý nhiều loại dữ liệu hoặc đầu vào khác nhau không?

**Ví dụ:**
- Gốc: "As a user, I want to upload files (images, PDFs, videos)"
- Chia nhỏ:
  1. "As a user, I want to upload image files (JPG, PNG)"
  2. "As a user, I want to upload PDF documents"
  3. "As a user, I want to upload video files (MP4, MOV)"

---

#### Mẫu 4: Độ phức tạp tiêu chí nghiệm thu (Acceptance Criteria Complexity)
**Hãy hỏi:** Story này có nhiều mệnh đề "When" hoặc "Then" không?

**Ví dụ:**
- Gốc: "As a user, I want to manage my cart"
  - When I add an item, Then it appears in my cart
  - When I remove an item, Then it disappears from my cart
  - When I update quantity, Then the cart total updates
- Chia nhỏ:
  1. "As a user, I want to add items to my cart so I can purchase them later"
  2. "As a user, I want to remove items from my cart so I can change my mind"
  3. "As a user, I want to update item quantities so I can buy the right amount"

**Lưu ý:** Đây là dấu hiệu phổ biến nhất cho thấy một story cần được chia nhỏ. Nếu bạn thấy nhiều cặp "When/Then", hãy tách theo các ranh giới đó.

---

#### Mẫu 5: Nỗ lực lớn (Major Effort)
**Hãy hỏi:** Story này có đòi hỏi công việc kỹ thuật đáng kể mà có thể bàn giao tăng dần không?

**Ví dụ:**
- Gốc: "As a user, I want real-time collaboration on documents"
- Chia nhỏ:
  1. "As a user, I want to see who else is viewing the document (read-only presence)"
  2. "As a user, I want to see live cursor positions of other editors"
  3. "As a user, I want to see live edits from other users in real-time"

---

#### Mẫu 6: Phụ thuộc bên ngoài (External Dependencies)
**Hãy hỏi:** Story này có phụ thuộc vào nhiều hệ thống hoặc API bên ngoài không?

**Ví dụ:**
- Gốc: "As a user, I want to log in with Google, Facebook, or Twitter"
- Chia nhỏ:
  1. "As a user, I want to log in with Google OAuth"
  2. "As a user, I want to log in with Facebook OAuth"
  3. "As a user, I want to log in with Twitter OAuth"

---

#### Mẫu 7: Các bước DevOps (DevOps Steps)
**Hãy hỏi:** Story này có đòi hỏi công việc triển khai, hạ tầng hoặc vận hành phức tạp không?

**Ví dụ:**
- Gốc: "As a user, I want to upload large files to cloud storage"
- Chia nhỏ:
  1. "As a user, I want to upload small files (<10MB) to cloud storage"
  2. "As a user, I want to upload large files (10MB-1GB) with progress tracking"
  3. "As a user, I want to resume interrupted uploads"

---

#### Mẫu 8: Thử nghiệm khám phá nhỏ — Tiny Acts of Discovery (TADs)
**Hãy hỏi:** Nếu không mẫu nào ở trên áp dụng được, có những điều chưa biết hoặc giả định nào cần được làm rõ không?

**Ví dụ:**
- Gốc: "As a user, I want AI-powered recommendations" (quá mơ hồ, quá nhiều ẩn số)
- Các TAD:
  1. Tạo nguyên mẫu 3 thuật toán gợi ý và thử nghiệm với 10 người dùng
  2. Xác định tiêu chí thành công (tỷ lệ nhấp chuột, mức độ hài lòng của người dùng)
  3. Xây dựng công cụ gợi ý đơn giản nhất (lọc cộng tác — collaborative filtering)
  4. Đo lường và lặp lại cải tiến

**Lưu ý:** TAD không phải là story — chúng là các thử nghiệm. Hãy dùng chúng để giảm rủi ro và làm rõ vấn đề trước khi viết story.

---

### Bước 3: Viết các Story đã chia nhỏ

Với mỗi phần tách ra, viết một user story hoàn chỉnh theo định dạng từ `skills/user-story/SKILL.md`:

```markdown
### Split 1 using [Pattern Name]:

#### User Story [ID]:
- **Summary:** [Brief title]

**Use Case:**
- **As a** [persona]
- **I want to** [action]
- **so that** [outcome]

**Acceptance Criteria:**
- **Scenario:** [Description]
- **Given:** [Preconditions]
- **When:** [Action]
- **Then:** [Outcome]
```

---

### Bước 4: Xác thực các phần đã chia

Đặt những câu hỏi sau:
1. **Mỗi phần tách có mang lại giá trị cho người dùng không?** (Không chỉ là "xong phần front-end")
2. **Mỗi phần tách có thể được phát triển độc lập không?** (Không có phụ thuộc cứng)
3. **Mỗi phần tách có thể được kiểm thử độc lập không?** (Tiêu chí nghiệm thu rõ ràng)
4. **Mỗi phần tách có đủ nhỏ cho một sprint không?** (1-5 ngày làm việc)
5. **Các phần tách khi gộp lại có bằng đúng story gốc không?** (Không mất mát gì trong quá trình chuyển đổi)

Nếu bất kỳ câu trả lời nào là "không", hãy chỉnh sửa lại.

---

## Ví dụ

Xem `examples/sample.md` để tham khảo các ví dụ chia nhỏ đầy đủ.

Đoạn trích ví dụ ngắn:

```markdown
### Original Story:
As a team admin, I want to manage team members so that I can control access.

### Suggested Splits (Acceptance Criteria Complexity):
1. Invite new team members
2. Remove team members
3. Update team member roles
```

---

## Những cái bẫy thường gặp

### Bẫy 1: Cắt lát ngang (Các tầng kỹ thuật)
**Triệu chứng:** "Story 1: Xây dựng API. Story 2: Xây dựng UI."

**Hệ quả:** Không story nào mang lại giá trị độc lập cho người dùng.

**Cách khắc phục:** Chia theo chiều dọc — mỗi story nên bao gồm cả công việc front-end + back-end để mang lại một khả năng hoàn chỉnh hướng tới người dùng.

---

### Bẫy 2: Chia nhỏ quá mức (Over-Splitting)
**Triệu chứng:** "Story 1: Thêm nút bấm. Story 2: Gắn nút bấm vào API. Story 3: Hiển thị kết quả."

**Hệ quả:** Tạo ra chi phí quản lý và các phụ thuộc không cần thiết.

**Cách khắc phục:** Chỉ chia khi story quá lớn. Một story mất 2 ngày làm việc không cần phải chia nhỏ.

---

### Bẫy 3: Chia nhỏ vô nghĩa
**Triệu chứng:** "Story 1: Nửa đầu của tính năng. Story 2: Nửa sau của tính năng."

**Hệ quả:** Chia tách tùy tiện không ánh xạ tới giá trị hay luồng công việc của người dùng.

**Cách khắc phục:** Sử dụng một trong 8 mẫu chia nhỏ — mỗi phần tách ra phải có cơ sở lập luận rõ ràng.

---

### Bẫy 4: Tạo ra các phụ thuộc cứng
**Triệu chứng:** "Story 2 không thể bắt đầu cho đến khi Story 1 hoàn thành 100%, đã kiểm thử và triển khai."

**Hệ quả:** Không thể làm song song, làm chậm tiến độ bàn giao.

**Cách khắc phục:** Chia theo cách cho phép phát triển độc lập. Nếu phụ thuộc là không thể tránh khỏi, hãy ưu tiên Story 1 trước.

---

### Bẫy 5: Bỏ qua mệnh đề "So That"
**Triệu chứng:** Các story sau khi chia có cùng một mệnh đề "so that" giống hệt nhau.

**Hệ quả:** Bạn đã chia nhỏ hành động chứ không chia nhỏ kết quả — nhiều khả năng đây là phân rã tác vụ (task decomposition), không phải chia nhỏ story.

**Cách khắc phục:** Đảm bảo mỗi phần tách có một kết quả riêng biệt cho người dùng. Nếu không, hãy cân nhắc lại mẫu chia nhỏ.

---

## Tài liệu tham khảo

### Các Skill liên quan
- `skills/user-story/SKILL.md` — Định dạng để viết các story đã chia nhỏ
- `skills/epic-hypothesis/SKILL.md` — Các epic thường cần chia nhỏ trước khi trở thành story
- `skills/jobs-to-be-done/SKILL.md` — Giúp xác định các lát cắt có ý nghĩa dọc theo công việc của người dùng

### Khung tham chiếu bên ngoài
- Richard Lawrence & Peter Green, *The Humanizing Work Guide to Splitting User Stories* — Nguồn gốc của 8 mẫu chia nhỏ
- Bill Wake, *INVEST in Good Stories* (2003) — Tiêu chí cho story chuẩn mực (Independent, Negotiable, Valuable, Estimable, Small, Testable)
- Mike Cohn, *User Stories Applied* (2004) — Kỹ thuật phân rã story

### Tác phẩm của Dean
- User Story Splitting Prompt Template (dựa trên khung Humanizing Work)

### Nguồn gốc
- Chuyển thể từ `prompts/user-story-splitting-prompt-template.md` trong kho lưu trữ `https://github.com/deanpeters/product-manager-prompts`.

---

**Loại skill:** Component
**Tên tệp gợi ý:** `user-story-splitting.md`
**Vị trí gợi ý:** `/skills/components/`
**Phụ thuộc:** Tham chiếu `skills/user-story/SKILL.md`, `skills/epic-hypothesis/SKILL.md`
**Áp dụng cho:** Các user story, epic và bất kỳ đầu việc nào quá lớn để hoàn thành trong một sprint
