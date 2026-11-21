---
name: user-story-mapping
argument-hint: "[product or workflow]"
description: Tạo bản đồ user story (user story map) trình bày các hoạt động, bước, tác vụ và các lát cắt phát hành. Sử dụng khi lập kế hoạch luồng công việc, backlog hoặc MVP xoay quanh hành trình người dùng.
intent: >-
  Trực quan hóa hành trình người dùng bằng cách tạo bản đồ phân cấp chia nhỏ các hoạt động cấp cao thành các bước và tác vụ, sắp xếp từ trái sang phải như một dòng tự sự. Sử dụng skill này để xây dựng sự thấu hiểu chung giữa product, design và engineering, ưu tiên tính năng dựa trên luồng công việc của người dùng, đồng thời phát hiện các khoảng trống hoặc cơ hội trong trải nghiệm người dùng.
type: component
theme: pm-artifacts
best_for:
  - "Sắp xếp các hoạt động, bước và tác vụ xuyên suốt luồng công việc của người dùng"
  - "Cắt lát backlog thành các bản phát hành mà mỗi bản đều mang lại giá trị sử dụng được"
  - "Tìm ra các khoảng trống trong hành trình trước khi chúng trở thành sự cố trên môi trường production"
scenarios:
  - "Chúng tôi đang có một backlog phẳng và không hình dung được luồng công việc thực tế của người dùng"
  - "Tôi cần cắt lát phạm vi này thành các bản phát hành mà mỗi bản đều mang lại thứ gì đó dùng được"
estimated_time: "30-60 min"
---

# Skill: Lập bản đồ User Story (User Story Mapping)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/user-story-mapping/SKILL.md) (Dean Peters).

## Mục đích
Trực quan hóa hành trình người dùng bằng cách tạo bản đồ phân cấp chia nhỏ các hoạt động cấp cao thành các bước và tác vụ, sắp xếp từ trái sang phải như một dòng tự sự. Sử dụng skill này để xây dựng sự thấu hiểu chung giữa product, design và engineering, ưu tiên tính năng dựa trên luồng công việc của người dùng, đồng thời phát hiện các khoảng trống hoặc cơ hội trong trải nghiệm người dùng.

Đây không phải là một danh sách backlog — mà là một tài liệu chiến lược cho thấy *cách thức* người dùng hoàn thành mục tiêu của họ, từ đó định hướng *những gì* cần xây dựng.

## Đầu vào

**Hoạt động tốt nhất với:** Sản phẩm hoặc luồng công việc người dùng đang được lập bản đồ.
**Cũng hữu ích:** Người dùng chính, câu chuyện tự sự từ đầu đến cuối theo cách bạn hiểu, các mục backlog hiện có cần đặt vào bản đồ và mục tiêu phát hành.

Bất kỳ nội dung nào được cung cấp ngay trong lệnh gọi — văn bản sau tên skill, bản dán ngữ cảnh (context dump), hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã có. Hãy sử dụng chúng và bỏ qua các phần đã được bao phủ; không hỏi lại.

**Bắt đầu với hai bàn tay trắng? Hoàn toàn ổn.** Skill sẽ hỏi bạn đang lập bản đồ hành trình của ai và họ đang cố hoàn thành việc gì, sau đó xây dựng xương sống (backbone) → tác vụ (tasks) → lát cắt (slices).

**Ví dụ lệnh gọi:** `Story map for our expense-reporting flow, from receipt capture to reimbursement, with an MVP slice for the pilot.`

## Các khái niệm cốt lõi

### Khung Story Mapping của Jeff Patton
Được phát minh bởi Jeff Patton, story mapping tổ chức công việc theo cấu trúc 2 chiều:

**Trục ngang (trái sang phải):** Hành trình người dùng theo thời gian
- **Xương sống (Backbone):** Các hoạt động cấp cao mà người dùng thực hiện
- **Các bước (Steps):** Các hành động cụ thể trong từng hoạt động
- **Các tác vụ (Tasks):** Công việc chi tiết cần thiết để hoàn thành từng bước

**Trục dọc (trên xuống dưới):** Mức độ ưu tiên và các bản phát hành
- **Các hàng trên cùng:** Tác vụ thiết yếu (MVP / Bản phát hành 1)
- **Các hàng dưới:** Tác vụ nên có thêm (Các bản phát hành tương lai)

### Cấu trúc Story Map

```
Segment → Persona → Narrative (User's goal)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Activity 1] → [Activity 2] → [Activity 3] → [Activity 4] → [Activity 5]
     ↓              ↓              ↓              ↓              ↓
  [Step 1.1]     [Step 2.1]     [Step 3.1]     [Step 4.1]     [Step 5.1]
  [Step 1.2]     [Step 2.2]     [Step 3.2]     [Step 4.2]     [Step 5.2]
  [Step 1.3]     [Step 2.3]     [Step 3.3]     [Step 4.3]     [Step 5.3]
     ↓              ↓              ↓              ↓              ↓
  [Task 1.1.1]   [Task 2.1.1]   [Task 3.1.1]   [Task 4.1.1]   [Task 5.1.1]
  [Task 1.1.2]   [Task 2.1.2]   [Task 3.1.2]   [Task 4.1.2]   [Task 5.1.2]
  [Task 1.1.3]   [Task 2.1.3]   [Task 3.1.3]   [Task 4.1.3]   [Task 5.1.3]
  ...            ...            ...            ...            ...
```

### Tại sao cấu trúc này hiệu quả
- **Lấy người dùng làm trung tâm:** Tổ chức công việc xoay quanh mục tiêu người dùng, không phải các module kỹ thuật
- **Thấu hiểu chung:** Product, design, engineering đều nhìn thấy cùng một hành trình
- **Rõ ràng về ưu tiên:** Tác vụ ở trên = MVP, tác vụ ở dưới = các vòng lặp tương lai
- **Nhận diện khoảng trống:** Các bước hoặc tác vụ bị thiếu sẽ lộ ra rõ ràng
- **Lập kế hoạch phát hành:** Kẻ các "đường phát hành" (release lines) nằm ngang để định nghĩa phạm vi

### Phản mẫu (Những gì đây KHÔNG phải là)
- **Không phải biểu đồ Gantt:** Đây không phải quản lý dự án — đây là trực quan hóa hành trình người dùng
- **Không phải danh sách tính năng:** Hoạt động không phải là tính năng — chúng là hành vi của người dùng
- **Không phải tài liệu tĩnh:** Story map tiến hóa khi bạn hiểu thêm về người dùng

### Khi nào nên dùng
- Khởi động một sản phẩm mới hoặc tính năng lớn
- Đồng bộ các bên liên quan về luồng công việc của người dùng
- Ưu tiên hóa backlog dựa trên nhu cầu người dùng
- Xác định MVP so với các bản phát hành tương lai
- Onboarding thành viên mới vào tầm nhìn sản phẩm

### Khi nào KHÔNG nên dùng
- Cho các tính năng tầm thường (đừng lập bản đồ những gì bạn đã hiểu rõ)
- Khi luồng công việc người dùng thay đổi liên tục (bản đồ giúp ổn định các luồng công việc)
- Để thay thế cho user stories (bản đồ cung cấp thông tin cho stories, không thay thế chúng)

---

## Ứng dụng

### Bước 1: Xác định Ngữ cảnh

Sử dụng `template.md` để có cấu trúc điền đầy đủ.

#### Phân khúc (Segment)
Bạn đang xây dựng cho ai?

```markdown
### Segment:
- [Specify the target segment, e.g., "Small business owners using DIY accounting software"]
```

**Kiểm tra chất lượng:**
- **Cụ thể:** Không phải "người dùng" mà là "quản trị viên CNTT doanh nghiệp" hoặc "nhà thiết kế tự do"

---

#### Chân dung (Persona)
Cung cấp chi tiết về persona trong phân khúc này (tham khảo `skills/proto-persona/SKILL.md`).

```markdown
### Persona:
- [Describe the persona: demographics, behaviors, pains, goals]
```

**Ví dụ:**
- "Sarah, nhà thiết kế đồ họa tự do 35 tuổi, quản lý 5-10 dự án khách hàng cùng lúc, gặp khó khăn với việc xuất hóa đơn và theo dõi thanh toán, muốn dành ít thời gian cho việc hành chính hơn và nhiều thời gian thiết kế hơn"

---

### Bước 2: Xác định Câu chuyện tự sự (Narrative)
Người dùng đang cố hoàn thành điều gì? Đóng khung điều này như một phát biểu Jobs-to-be-Done (tham khảo `skills/jobs-to-be-done/SKILL.md`).

```markdown
### Narrative:
- [Concise narrative of the persona's objective, e.g., "Complete a client project from kickoff to final payment"]
```

**Kiểm tra chất lượng:**
- **Tập trung vào kết quả:** Không phải "sử dụng sản phẩm" mà là "bàn giao dự án khách hàng đúng hạn và nhận thanh toán"
- **Một câu:** Nếu cần nhiều hơn một câu, phạm vi có thể đang quá rộng

---

### Bước 3: Xác định Các hoạt động (Xương sống — Backbone)
Liệt kê 3-5 hoạt động cấp cao mà persona thực hiện để hoàn thành câu chuyện tự sự. Đây là phần xương sống của bản đồ.

```markdown
### Activities:
1. [Activity 1, e.g., "Negotiate project scope and pricing"]
2. [Activity 2, e.g., "Execute design work"]
3. [Activity 3, e.g., "Deliver final assets to client"]
4. [Activity 4, e.g., "Send invoice and receive payment"]
5. [Activity 5, optional]
```

**Kiểm tra chất lượng:**
- **Tuần tự:** Các hoạt động diễn ra theo thứ tự (trái sang phải)
- **Hành động của người dùng:** Mô tả những gì người dùng *làm*, không phải những gì sản phẩm *cung cấp*
- **3-5 hoạt động:** Quá ít = đơn giản hóa quá mức, quá nhiều = gây choáng ngợp

---

### Bước 4: Chia nhỏ Hoạt động thành Các bước (Steps)
Với mỗi hoạt động, liệt kê 3-5 bước mô tả chi tiết cách hoạt động đó được thực hiện.

```markdown
### Steps:

**For Activity 1: [Activity Name]**
- Step 1: [Detail step 1, e.g., "Review client brief"]
- Step 2: [Detail step 2, e.g., "Draft project proposal"]
- Step 3: [Detail step 3, e.g., "Negotiate timeline and budget"]
- Step 4: [Optional step 4]
- Step 5: [Optional step 5]

**For Activity 2: [Activity Name]**
- Step 1: [Detail step 1]
- Step 2: [Detail step 2]
...
```

**Kiểm tra chất lượng:**
- **Khả thi (Actionable):** Mỗi bước là một việc người dùng thực hiện
- **Quan sát được (Observable):** Bạn có thể quan sát ai đó thực hiện bước này
- **Trình tự logic:** Các bước tuân theo một thứ tự tự nhiên

---

### Bước 5: Chia nhỏ Các bước thành Các tác vụ (Tasks)
Với mỗi bước, liệt kê 5-7 tác vụ cần phải hoàn thành.

```markdown
### Tasks:

**For Activity 1, Step 1: [Step Name]**
- Task 1: [Detail task 1, e.g., "Read client brief document"]
- Task 2: [Detail task 2, e.g., "Identify key deliverables"]
- Task 3: [Detail task 3, e.g., "Note budget constraints"]
- Task 4: [Detail task 4, e.g., "Clarify timeline expectations"]
- Task 5: [Detail task 5, e.g., "List open questions for client"]
- Task 6: [Optional task 6]
- Task 7: [Optional task 7]

**For Activity 1, Step 2: [Step Name]**
- Task 1: [Detail task 1]
...
```

**Kiểm tra chất lượng:**
- **Chi tiết (Granular):** Các tác vụ là những hành động nhỏ, cụ thể
- **Hướng người dùng hoặc hậu trường:** Bao gồm cả hai (ví dụ: "Gửi email" và "Nhận xác nhận")
- **Ưu tiên hóa được:** Bạn sẽ sắp xếp ưu tiên các tác vụ theo chiều dọc (trên = thiết yếu, dưới = có thêm thì tốt)

---

### Bước 6: Ưu tiên hóa theo chiều dọc
Sắp xếp các tác vụ từ trên xuống dưới theo mức độ ưu tiên:
- **Các hàng trên cùng:** MVP / Bản phát hành 1 (bắt buộc phải có)
- **Các hàng giữa:** Bản phát hành 2 (quan trọng nhưng chưa tối quan trọng)
- **Các hàng dưới:** Tương lai / Có thêm thì tốt (Nice-to-have)

Kẻ các "đường phát hành" (release lines) nằm ngang để phân định phạm vi.

---

### Bước 7: Nhận diện Khoảng trống và Cơ hội
Rà soát bản đồ và tự hỏi:
- Có bước hoặc tác vụ nào bị thiếu không?
- Có điểm đau (pain points) nào chúng ta chưa giải quyết không?
- Có cơ hội nào để làm người dùng hài lòng vượt mong đợi không?
- Tất cả các hoạt động có nối tiếp nhau một cách logic không?

---

## Ví dụ

Xem `examples/sample.md` để tham khảo một ví dụ bản đồ story đầy đủ.

---

## Những cái bẫy thường gặp

### Bẫy 1: Hoạt động là Tính năng, không phải Hành vi người dùng
**Triệu chứng:** "Hoạt động 1: Dùng bảng điều khiển. Hoạt động 2: Xuất báo cáo."

**Hệ quả:** Bạn đã lập bản đồ sản phẩm, không phải hành trình người dùng.

**Cách khắc phục:** Đóng khung lại thành hành động của người dùng: "Hoạt động 1: Theo dõi tiến độ dự án. Hoạt động 2: Tổng hợp công việc cho các bên liên quan."

---

### Bẫy 2: Quá nhiều Hoạt động
**Triệu chứng:** Có hơn 10 hoạt động trên trục xương sống

**Hệ quả:** Bản đồ trở nên quá tải và mất trọng tâm.

**Cách khắc phục:** Hợp nhất lại. Nếu bạn có 10 hoạt động, nhiều khả năng bạn đang trộn lẫn hoạt động với các bước. Hãy nhắm đến 3-5 hoạt động cấp cao.

---

### Bẫy 3: Tác vụ quá mơ hồ
**Triệu chứng:** "Tác vụ 1: Làm việc đó"

**Hệ quả:** Không thể ưu tiên hóa hay ước lượng các tác vụ mơ hồ.

**Cách khắc phục:** Hãy cụ thể: "Tác vụ 1: Nhập địa chỉ email khách hàng vào trường 'Bill To'."

---

### Bẫy 4: Bỏ qua việc ưu tiên hóa theo chiều dọc
**Triệu chứng:** Mọi tác vụ đều nằm cùng một hàng — không phân định MVP so với các bản phát hành tương lai

**Hệ quả:** Không rõ cần xây dựng gì trước tiên.

**Cách khắc phục:** Ưu tiên hóa tường minh. Kẻ các đường phát hành. Buộc phải đưa ra những lựa chọn khó khăn về những gì thuộc MVP.

---

### Bẫy 5: Lập bản đồ trong cô lập
**Triệu chứng:** PM tự tạo bản đồ một mình, sau đó trình bày cho cả nhóm

**Hệ quả:** Không có sự đồng sở hữu hoặc thấu hiểu chung.

**Cách khắc phục:** Lập bản đồ mang tính cộng tác. Tổ chức workshop story mapping cùng với product, design và engineering.

---

## Tài liệu tham khảo

### Các Skill liên quan
- `skills/proto-persona/SKILL.md` — Định nghĩa persona cho story map
- `skills/jobs-to-be-done/SKILL.md` — Cung cấp thông tin cho câu chuyện tự sự và các hoạt động
- `skills/user-story/SKILL.md` — Các tác vụ trên bản đồ sẽ trở thành user stories
- `skills/problem-statement/SKILL.md` — Phát biểu vấn đề giúp đóng khung câu chuyện tự sự

### Khung tham chiếu bên ngoài
- Jeff Patton, *User Story Mapping* (2014) — Nguồn gốc kỹ thuật lập bản đồ story
- Teresa Torres, *Continuous Discovery Habits* (2021) — Cây giải pháp cơ hội (Opportunity solution trees — bổ trợ cho story maps)

### Tác phẩm của Dean
- User Story Mapping Prompt (chuyển thể từ phương pháp luận của Jeff Patton)

### Nguồn gốc
- Chuyển thể từ `prompts/user-story-mapping.md` trong kho lưu trữ `https://github.com/deanpeters/product-manager-prompts`.

---

**Loại skill:** Component
**Tên tệp gợi ý:** `user-story-mapping.md`
**Vị trí gợi ý:** `/skills/components/`
**Phụ thuộc:** Tham chiếu `skills/proto-persona/SKILL.md`, `skills/jobs-to-be-done/SKILL.md`, `skills/user-story/SKILL.md`, `skills/problem-statement/SKILL.md`
