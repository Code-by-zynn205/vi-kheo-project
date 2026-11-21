---
name: epic-hypothesis
argument-hint: "[initiative or epic idea]"
description: Đóng khung một epic thành giả thuyết có thể kiểm chứng với người dùng mục tiêu, kết quả kỳ vọng và phương pháp xác thực. Sử dụng khi định nghĩa một sáng kiến lớn trước khi lập lộ trình, khám phá hoặc lập kế hoạch bàn giao.
intent: >-
  Đóng khung các epic thành những giả thuyết có thể kiểm chứng bằng cấu trúc nếu/thì (if/then) nhằm diễn đạt rõ hành động hoặc giải pháp, đối tượng hưởng lợi mục tiêu, kết quả kỳ vọng và cách thức xác thực thành công. Sử dụng skill này để quản lý sự bất định trong phát triển sản phẩm bằng cách bộc lộ tường minh các giả định, định nghĩa các thử nghiệm tinh gọn ("tiny acts of discovery") và thiết lập tiêu chí thành công đo lường được trước khi cam kết xây dựng toàn diện.
type: component
theme: pm-artifacts
best_for:
  - "Đóng khung một sáng kiến lớn thành thứ có thể chứng minh là sai"
  - "Buộc phải xác định kết quả và phương pháp xác thực trước khi bắt đầu xây dựng"
  - "Trao cho đội ngũ một ván cược chung để kiểm chứng thay vì một phạm vi cố định để bàn giao"
scenarios:
  - "Ban lãnh đạo đã phê duyệt một sáng kiến lớn và không ai nói được điều gì sẽ chứng minh nó sai"
  - "Tôi cần đóng khung epic này như một ván cược có phương pháp xác thực thực sự, chứ không phải một kế hoạch bàn giao"
estimated_time: "15-20 min"
---

# Skill: Giả thuyết Epic (Epic Hypothesis)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/epic-hypothesis/SKILL.md) (Dean Peters).

## Mục đích
Đóng khung các epic thành những giả thuyết có thể kiểm chứng bằng cấu trúc nếu/thì (if/then) nhằm diễn đạt rõ hành động hoặc giải pháp, đối tượng hưởng lợi mục tiêu, kết quả kỳ vọng và cách thức xác thực thành công. Sử dụng skill này để quản lý sự bất định trong phát triển sản phẩm bằng cách bộc lộ tường minh các giả định, định nghĩa các thử nghiệm tinh gọn ("tiny acts of discovery") và thiết lập tiêu chí thành công đo lường được trước khi cam kết xây dựng toàn diện.

Đây không phải là bản đặc tả yêu cầu — đây là một giả thuyết bạn đang kiểm chứng, không phải một tính năng bạn đã cam kết phải ra mắt.

## Đầu vào

**Hoạt động tốt nhất với:** Ý tưởng sáng kiến hoặc epic, dưới bất kỳ hình thức nào hiện có — chỉ một câu thôi cũng đủ.
**Cũng hữu ích:** Người dùng mục tiêu, kết quả bạn kỳ vọng và cách bạn có thể đo lường nó (skill sẽ giúp bạn làm sắc nét cả ba yếu tố này).

Bất kỳ nội dung nào được cung cấp ngay trong lệnh gọi — văn bản sau tên skill, bản dán ngữ cảnh (context dump), hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã có. Hãy sử dụng chúng và bỏ qua các phần đã được bao phủ; không hỏi lại.

**Bắt đầu với hai bàn tay trắng? Hoàn toàn ổn.** Skill sẽ hỏi sáng kiến là gì và dành cho ai, sau đó cùng bạn xây dựng giả thuyết if/then.

**Ví dụ lệnh gọi:** `Frame as an epic hypothesis: adding usage-based alerts so account admins catch overages before invoice shock.`

## Các khái niệm cốt lõi

### Khung Giả thuyết Epic (Epic Hypothesis Framework)
Lấy cảm hứng từ định dạng giả thuyết Lean UX của Tim Herbig, cấu trúc gồm:

**Giả thuyết Nếu/Thì (If/Then Hypothesis):**
- **If we** [hành động hoặc giải pháp thay mặt cho persona mục tiêu]
- **for** [persona mục tiêu]
- **Then we will** [đạt được một kết quả mong muốn hoặc job-to-be-done]

**Các thử nghiệm khám phá nhỏ (Tiny Acts of Discovery Experiments):**
- **We will test our assumption by:**
  - [Thử nghiệm 1]
  - [Thử nghiệm 2]
  - [Thêm nếu cần thiết]

**Thước đo xác thực (Validation Measures):**
- **We know our hypothesis is valid if within** [khung thời gian]
- **we observe:**
  - [Kết quả định lượng đo lường được]
  - [Kết quả định tính đo lường được]
  - [Thêm nếu cần thiết]

### Tại sao cấu trúc này hiệu quả
- **Hướng giả thuyết (Hypothesis-driven):** Buộc bạn phải phát biểu rõ những gì bạn tin (và có thể sai về điều đó)
- **Tập trung vào kết quả (Outcome-focused):** "Then we will" nhấn mạnh lợi ích người dùng, không phải đầu ra tính năng
- **Thử nghiệm trước (Experiment-first):** Khuyến khích xác thực tinh gọn trước khi xây dựng toàn diện
- **Có thể bác bỏ (Falsifiable):** Tiêu chí thành công rõ ràng giúp loại bỏ sớm các ý tưởng tồi
- **Quản trị rủi ro:** Coi các epic như những ván cược (bets), không phải cam kết chắc chắn

### Phản mẫu (Những gì đây KHÔNG phải là)
- **Không phải đặc tả tính năng:** "Xây dựng bảng điều khiển với 5 biểu đồ" là một tính năng, không phải giả thuyết
- **Không phải cam kết đảm bảo:** Giả thuyết có thể (và nên) bị bác bỏ nếu sai
- **Không tập trung vào đầu ra (output):** "Ra mắt tính năng X vào Quý 2" là đi chệch trọng tâm — nó có đạt được kết quả mong muốn không?
- **Không thiếu thử nghiệm:** Nếu bạn bỏ qua thử nghiệm và lao thẳng vào xây dựng, bạn không hề kiểm chứng giả thuyết

### Khi nào nên dùng
- Khám phá tính năng ở giai đoạn đầu (trước khi cam kết vào lộ trình đầy đủ)
- Kiểm chứng sự phù hợp sản phẩm-thị trường (product-market fit) cho các năng lực mới
- Ưu tiên hóa backlog (các epic có giả thuyết đã được xác thực sẽ nhận mức ưu tiên cao hơn)
- Quản lý kỳ vọng của các bên liên quan (đóng khung công việc như các thử nghiệm, không phải lời hứa)

### Khi nào KHÔNG nên dùng
- Cho các tính năng đã được kiểm chứng kỹ lưỡng (nếu bạn đã chứng minh được nhu cầu, hãy đi thẳng tới viết user stories)
- Cho các tính năng tầm thường (đừng phức tạp hóa các tinh chỉnh nhỏ)
- Khi không khả thi để thử nghiệm (hiếm gặp, nhưng đôi khi bạn buộc phải cam kết trước khi kiểm thử)

---

## Ứng dụng

Sử dụng `template.md` để có cấu trúc điền đầy đủ.

### Bước 1: Thu thập ngữ cảnh
Trước khi phác thảo một giả thuyết epic, hãy đảm bảo bạn có:
- **Hiểu biết về vấn đề:** Điều này giải quyết vấn đề gì của người dùng? (tham khảo `skills/problem-statement/SKILL.md`)
- **Persona mục tiêu:** Ai là người hưởng lợi? (tham khảo `skills/proto-persona/SKILL.md`)
- **Jobs-to-be-Done:** Họ đang cố đạt được kết quả gì? (tham khảo `skills/jobs-to-be-done/SKILL.md`)
- **Các phương án thay thế hiện tại:** Người dùng hiện đang làm gì? (dùng đối thủ, cách làm tạm bợ, hay không làm gì)

**Nếu thiếu ngữ cảnh:** Hãy thực hiện phỏng vấn khám phá hoặc công việc kiểm chứng vấn đề trước.

---

### Bước 2: Phác thảo Giả thuyết If/Then

Điền vào mẫu:

```markdown
### If/Then Hypothesis

**If we** [action or solution on behalf of the target persona]
**for** [target persona]
**Then we will** [attain or achieve a desirable outcome or job-to-be-done for the persona]
```

**Kiểm tra chất lượng:**
- **"If we" phải cụ thể:** Không phải "cải thiện sản phẩm" mà là "thêm thông báo Slack một chạm khi tác vụ được giao"
- **"For" phải là một persona rõ ràng:** Không phải "người dùng" mà là "quản lý dự án từ xa đang điều phối hơn 3 nhóm phân tán" (tham khảo `skills/proto-persona/SKILL.md`)
- **"Then we will" phải là một kết quả:** Không phải "người dùng sẽ có thông báo" mà là "người dùng sẽ phản hồi việc giao tác vụ nhanh hơn 50%"

**Ví dụ:**
- ✅ "If we add one-click Google Calendar integration for trial users, then we will increase activation rates by 20% within 30 days"
- ✅ "If we provide bulk delete functionality for power users managing 1000+ items, then we will reduce time spent on cleanup tasks by 70%"
- ❌ "If we build a dashboard, then users will use it" (mơ hồ, không đo lường được)

---

### Bước 3: Thiết kế các Thử nghiệm Khám phá Nhỏ (Tiny Acts of Discovery)

Trước khi xây dựng toàn bộ epic, hãy xác định các thử nghiệm tinh gọn để kiểm chứng giả thuyết:

```markdown
### Tiny Acts of Discovery Experiments

**We will test our assumption by:**
- [Experiment 1: low-cost, fast test]
- [Experiment 2: another low-cost, fast test]
- [Add more as necessary]
```

**Các loại thử nghiệm:**
- **Nguyên mẫu + kiểm thử người dùng (Prototype + user testing):** Giả lập tính năng bằng prototype có thể bấm được, thử nghiệm với 5-10 người dùng
- **Kiểm thử thủ công (Concierge test):** Thực hiện tính năng một cách thủ công cho một vài người dùng, xem họ có đánh giá cao không
- **Kiểm thử trang đích (Landing page test):** Mô tả tính năng, đo lường lượt đăng ký hoặc mức độ quan tâm
- **Kiểm thử Wizard of Oz:** Trình bày tính năng như thể nó tự động hóa, nhưng vận hành thủ công ở hậu trường
- **Kiểm thử A/B (nếu khả thi):** Thử nghiệm phiên bản tinh gọn so với nhóm đối chứng

**Kiểm tra chất lượng:**
- **Nhanh:** Thử nghiệm chỉ nên mất vài ngày/vài tuần, không phải nhiều tháng
- **Rẻ:** Tránh xây dựng kỹ thuật toàn phần — dùng prototype, quy trình thủ công hoặc công cụ sẵn có
- **Có thể bác bỏ:** Thiết kế các thử nghiệm có khả năng chứng minh bạn *sai*

**Ví dụ:**
- "Tạo nguyên mẫu Figma cho luồng xóa hàng loạt và thử nghiệm với 5 người dùng chuyên sâu (power users)"
- "Gửi thông báo Slack thủ công cho 10 người dùng dùng thử và theo dõi thời gian phản hồi"
- "Thêm nút 'Yêu cầu tính năng này' vào giao diện và đo tỷ lệ nhấp chuột"

---

### Bước 4: Xác định Thước đo Xác thực (Validation Measures)

Chỉ rõ thành công trông như thế nào và khung thời gian đánh giá:

```markdown
### Validation Measures

**We know our hypothesis is valid if within** [timeframe in days or weeks]
**we observe:**
- [Desirable quantitative, measurable outcome]
- [Desirable qualitative, measurable outcome]
- [Add more as necessary]
```

**Kiểm tra chất lượng:**
- **Khung thời gian thực tế:** Không phải "trong vòng 6 tháng" (quá chậm) hay "trong vòng 3 ngày" (quá nhanh)
- **Thước đo định lượng cụ thể:** Không phải "nhiều người dùng hơn" mà là "tỷ lệ kích hoạt tăng 20%"
- **Thước đo định tính quan sát được:** Không phải "người dùng thích nó" mà là "8 trên 10 người dùng nói rằng họ sẵn sàng trả tiền cho tính năng này"

**Ví dụ:**
- ✅ "Trong vòng 4 tuần, chúng tôi quan sát thấy:"
  - "Tỷ lệ kích hoạt tăng từ 40% lên 50% (định lượng)"
  - "75% người dùng dùng thử được khảo sát nói rằng tích hợp này giúp họ tiết kiệm thời gian (định tính)"
- ❌ "Trong vòng 1 năm, chúng tôi quan sát thấy:"
  - "Doanh thu tăng lên" (quá mơ hồ, quá lâu)

---

### Bước 5: Chạy thử nghiệm và Đánh giá

- **Thực thi thử nghiệm:** Xây dựng prototype, chạy kiểm thử, thu thập dữ liệu
- **Đo lường kết quả:** Bạn có đạt được các thước đo xác thực không?
- **Điểm quyết định:**
  - ✅ **Giả thuyết được xác thực:** Tiến hành viết user stories và đưa vào lộ trình
  - ❌ **Giả thuyết bị bác bỏ:** Hủy bỏ epic hoặc xoay trục sang một giả thuyết khác
  - ⚠️ **Chưa đủ kết luận:** Chạy thêm thử nghiệm hoặc siết chặt hơn các thước đo xác thực

---

### Bước 6: Chuyển đổi sang User Stories (Nếu được xác thực)

Khi giả thuyết đã được xác thực, chia nhỏ epic thành các user stories:

```markdown
### Epic: [Epic Name]

**Stories:**
1. [User Story 1 - reference `skills/user-story/SKILL.md`]
2. [User Story 2]
3. [User Story 3]
```

---

## Ví dụ

Xem `examples/sample.md` để tham khảo các ví dụ giả thuyết epic đầy đủ.

Đoạn trích ví dụ ngắn:

```markdown
**If we** provide one-click Google Calendar integration
**for** trial users managing multiple meetings
**Then we will** increase activation rate from 40% to 50%
```

---

## Những cái bẫy thường gặp

### Bẫy 1: Giả thuyết là một Tính năng, không phải Kết quả
**Triệu chứng:** "If we build a dashboard, then we will have a dashboard"

**Hệ quả:** Bạn đang mô tả đầu ra (output), không phải kết quả (outcome). Điều này không kiểm chứng được gì cả.

**Cách khắc phục:** Tập trung vào kết quả của người dùng: "If we build a dashboard showing real-time task status, then PMs will spend 50% less time asking for status updates."

---

### Bẫy 2: Bỏ qua các Thử nghiệm
**Triệu chứng:** "Chúng tôi sẽ kiểm chứng giả định bằng cách xây dựng toàn bộ tính năng"

**Hệ quả:** Bạn đã cam kết xây dựng trước khi xác thực. Đó không phải giả thuyết — đó là một cam kết tính năng.

**Cách khắc phục:** Thiết kế các thử nghiệm tinh gọn (prototype, concierge test, landing page) chỉ mất vài ngày/vài tuần, không phải nhiều tháng.

---

### Bẫy 3: Thước đo xác thực mơ hồ
**Triệu chứng:** "Chúng tôi biết nó hợp lệ nếu người dùng hài lòng"

**Hệ quả:** Tiêu chí thành công mang tính chủ quan và không đo lường được.

**Cách khắc phục:** Định nghĩa các chỉ số cụ thể, có thể bác bỏ: "80% người dùng được khảo sát đánh giá tính năng 4+ trên 5 sao" hoặc "Thời gian phản hồi giảm 50%."

---

### Bẫy 4: Khung thời gian phi thực tế
**Triệu chứng:** "Chúng tôi biết nó hợp lệ nếu trong vòng 6 tháng doanh thu tăng"

**Hệ quả:** Quá chậm để cung cấp thông tin cho việc ra quyết định. Đến lúc đó bạn đã xây dựng xong xuôi mất rồi.

**Cách khắc phục:** Nhắm tới các chu kỳ xác thực 2-4 tuần. Nếu không thể đo trong khung thời gian đó, hãy chọn một chỉ số dẫn dắt — leading indicator (ví dụ: tỷ lệ kích hoạt, thay vì doanh thu năm).

---

### Bẫy 5: Coi Epic như Cam kết chắc chắn
**Triệu chứng:** "Chúng tôi đã báo với CEO rằng sẽ ra mắt tính năng này, nên chúng tôi buộc phải xác thực cho bằng được"

**Hệ quả:** Thử nghiệm chỉ mang tính hình thức — bạn kiểu gì cũng sẽ xây dựng nó bất chấp kết quả.

**Cách khắc phục:** Đóng khung epic thành giả thuyết *trước khi* đưa ra cam kết. Nếu các bên liên quan cần sự chắc chắn, hãy giải thích rủi ro của việc xây dựng các tính năng chưa được kiểm chứng.

---

## Tài liệu tham khảo

### Các Skill liên quan
- `skills/problem-statement/SKILL.md` — Giả thuyết nên giải quyết một vấn đề đã được kiểm chứng
- `skills/proto-persona/SKILL.md` — Định nghĩa phần "for [persona]"
- `skills/jobs-to-be-done/SKILL.md` — Cung cấp thông tin cho kết quả "then we will"
- `skills/user-story/SKILL.md` — Các epic đã được xác thực sẽ phân rã thành user stories
- `skills/user-story-splitting/SKILL.md` — Cách chia nhỏ các epic đã xác thực thành stories

### Khung tham chiếu bên ngoài
- Tim Herbig, *Lean UX Hypothesis Statement* — Nguồn gốc định dạng giả thuyết if/then
- Jeff Gothelf & Josh Seiden, *Lean UX* (2013) — Phát triển sản phẩm theo định hướng giả thuyết
- Alberto Savoia, *Pretotype It* (2011) — Các thử nghiệm tinh gọn để kiểm chứng ý tưởng
- Eric Ries, *The Lean Startup* (2011) — Vòng lặp Build-Measure-Learn

### Tác phẩm của Dean
- Backlog Epic Hypothesis Prompt (lấy cảm hứng từ khung của Tim Herbig)

### Nguồn gốc
- Chuyển thể từ `prompts/backlog-epic-hypothesis.md` trong kho lưu trữ `https://github.com/deanpeters/product-manager-prompts`.

---

**Loại skill:** Component
**Tên tệp gợi ý:** `epic-hypothesis.md`
**Vị trí gợi ý:** `/skills/components/`
**Phụ thuộc:** Tham chiếu `skills/problem-statement/SKILL.md`, `skills/proto-persona/SKILL.md`, `skills/jobs-to-be-done/SKILL.md`
**Được sử dụng bởi:** `skills/user-story/SKILL.md`, `skills/user-story-splitting/SKILL.md`
