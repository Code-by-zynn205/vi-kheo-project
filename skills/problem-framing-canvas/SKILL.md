---
name: problem-framing-canvas
argument-hint: "[vùng vấn đề]"
description: Hướng dẫn đội ngũ đi qua MITRE Problem Framing Canvas. Sử dụng khi bạn cần một phát biểu vấn đề rõ ràng hơn trước khi vội nhảy sang giải pháp.
intent: >-
  Hướng dẫn Product Manager đi qua quy trình MITRE Problem Framing Canvas bằng cách đặt các câu hỏi có cấu trúc qua ba giai đoạn: Look Inward (Nhìn vào trong — xem xét các giả định và thiên kiến của chính bạn), Look Outward (Nhìn ra ngoài — hiểu ai đang gặp vấn đề và ai không), và Reframe (Tái định hình — tổng hợp thông tin thành một phát biểu vấn đề khả thi và câu hỏi "How Might We"). Sử dụng kỹ năng này để đảm bảo bạn đang giải đúng vấn đề trước khi nhảy sang giải pháp — tránh thiên kiến xác nhận, bỏ sót các bên liên quan và tư duy ưu tiên giải pháp trước.
type: interactive
best_for:
  - "Làm rõ một vấn đề còn rối rắm trước khi thiết kế giải pháp"
  - "Làm lộ rõ các giả định và các bên liên quan bị bỏ sót"
  - "Tạo phát biểu vấn đề chống thiên kiến trong một buổi workshop"
scenarios:
  - "Chạy Problem Framing Canvas cho vấn đề giữ chân người dùng trên mobile của chúng ta"
  - "Giúp tôi tái định hình yêu cầu từ stakeholder này trước khi chúng ta xây dựng bất cứ thứ gì"
  - "Chúng ta cần một phát biểu vấn đề rõ ràng hơn cho tình trạng rớt người dùng khi onboarding"
theme: discovery-research
estimated_time: "30-45 phút"
---

# Skill: Khung định hình vấn đề (Problem Framing Canvas)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/problem-framing-canvas/SKILL.md) (deanpeters/Product-Manager-Skills).

## Mục đích
Hướng dẫn Product Manager đi qua quy trình MITRE Problem Framing Canvas bằng cách đặt các câu hỏi có cấu trúc qua ba giai đoạn: Look Inward (Nhìn vào trong — xem xét các giả định và thiên kiến của chính bạn), Look Outward (Nhìn ra ngoài — hiểu ai đang gặp vấn đề và ai không), và Reframe (Tái định hình — tổng hợp thông tin thành một phát biểu vấn đề khả thi và câu hỏi "How Might We"). Sử dụng kỹ năng này để đảm bảo bạn đang giải đúng vấn đề trước khi nhảy sang giải pháp — tránh thiên kiến xác nhận, bỏ sót các bên liên quan và tư duy ưu tiên giải pháp trước.

Đây không phải là buổi brainstorm giải pháp — đây là công cụ định hình vấn đề giúp mở rộng góc nhìn, thách thức các giả định và tạo ra một phát biểu vấn đề rõ ràng, hướng tới công bằng (equity-driven).

## Đầu vào

**Hiệu quả nhất với:** Vùng vấn đề — dù hiện tại bạn mới hiểu ở mức sơ bộ.
**Cũng hữu ích:** Đối tượng bạn tin là đang gặp vấn đề, các bằng chứng hiện có, và giải pháp mà mọi người đang bị neo vào sẵn (gọi tên nó ra giúp canvas loại bỏ thiên kiến).

Mọi thứ được cung cấp kèm khi gọi skill — văn bản sau tên skill, phần dán bối cảnh (context dump), hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã cung cấp. Hãy sử dụng chúng và bỏ qua những phần đã được đề cập; đừng hỏi lại.

**Đến tay trắng? Cũng hoàn toàn ổn.** Skill sẽ mở đầu bằng giai đoạn Look Inward: bạn đang giả định điều gì về vấn đề này?

**Ví dụ gọi skill:** `Frame this problem: field sales reps 'don't use the CRM' and leadership wants gamification.`

## Khái niệm cốt lõi

### MITRE Problem Framing Canvas là gì?

Problem Framing Canvas (MITRE Innovation Toolkit, v3) là một khung làm việc có cấu trúc giúp đội ngũ khám phá toàn diện không gian vấn đề trước khi đề xuất giải pháp. Khung này được chia thành **ba phần**:

1. **Look Inward (Nhìn vào trong)** — Xem xét các giả định, thiên kiến của chính bạn và cách bạn có thể đang là một phần của vấn đề
2. **Look Outward (Nhìn ra ngoài)** — Hiểu ai đang gặp vấn đề, ai được hưởng lợi từ nó và ai đã bị bỏ lại phía sau
3. **Reframe (Tái định hình)** — Tổng hợp nhận định thành một phát biểu vấn đề rõ ràng, khả thi và câu hỏi "How Might We"

### Cấu trúc Canvas

```
┌─────────────────────────────────────────────────────────────────┐
│ LOOK INWARD                                                     │
│ - What is the problem? (symptoms)                              │
│ - Why haven't we solved it? (new, hard, low priority, etc.)   │
│ - How are we part of the problem? (assumptions, biases)       │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ LOOK OUTWARD                                                    │
│ - Who experiences the problem? When/where/consequences?        │
│ - Who else has it? Who doesn't have it?                       │
│ - Who's been left out?                                        │
│ - Who benefits when problem exists/doesn't exist?             │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│ REFRAME                                                         │
│ - Stated another way, the problem is: [restatement]           │
│ - How might we [action] as we aim to [objective]?             │
└─────────────────────────────────────────────────────────────────┘
```

### Vì sao phương pháp này hiệu quả
- **Mở rộng góc nhìn:** Buộc bạn phải nhìn vượt ra ngoài các giả định của chính mình
- **Hướng tới công bằng (Equity-driven):** Đặt tiếng nói của nhóm yếu thế/ít được chú ý vào trung tâm và đặt câu hỏi "ai đã bị bỏ sót?"
- **Thách thức thiên kiến:** Yêu cầu rà soát tường minh các giả định trước khi định hình vấn đề
- **Đầu ra khả thi:** Tạo ra câu hỏi HMW sẵn sàng cho việc khám phá giải pháp

### Các phản mẫu (Những gì khung này KHÔNG phải)
- **Không phải brainstorm giải pháp:** Canvas dùng để định hình vấn đề; giải pháp sẽ đến sau
- **Không phải danh sách yêu cầu tính năng:** Tập trung vào vấn đề gốc rễ, không phải triệu chứng bề mặt
- **Không phải bài tập làm một mình:** Cần đa dạng góc nhìn để phá vỡ tư duy bầy đàn (groupthink)

### Khi nào nên dùng
- Bắt đầu giai đoạn discovery cho một sáng kiến mới
- Tái định hình một vấn đề hiện tại (khi nghi ngờ bạn đang giải nhầm thứ)
- Thách thức các giả định trước khi xây dựng giải pháp
- Đồng thuận liên phòng ban về định nghĩa vấn đề

### Khi nào KHÔNG nên dùng
- Khi vấn đề đã được hiểu rõ và kiểm chứng đầy đủ
- Cho các bản vá lỗi chiến thuật hoặc nợ kỹ thuật (không cần định hình sâu)
- Khi các bên liên quan đã cam kết cứng với một giải pháp (cần xử lý đồng thuận trước)

---

### Nguồn chuẩn điều phối (Facilitation Source of Truth)

Sử dụng [`workshop-facilitation`](../workshop-facilitation/SKILL.md) làm giao thức tương tác mặc định cho skill này.

**Chế độ bắt đầu mặc định:** Guided · được cấu hình trong `pm-skills.config.yaml` (mặc định toàn thư viện hoặc ghi đè theo từng skill); lựa chọn của chính người dùng trong phiên luôn được ưu tiên. Ở lượt đầu tiên, hãy đưa ra cả ba chế độ, sau đó mở ngay theo chế độ mặc định mà không chờ chọn: Guided đặt câu hỏi đầu tiên, Context dump mời dán bối cảnh, Best guess yêu cầu tối thiểu một câu và phác thảo với mọi giả định được gắn nhãn.

Tài liệu đó quy định:
- thông báo đầu phiên + chế độ vào (Guided, Context dump, Best guess)
- mỗi lượt một câu hỏi với lời nhắc bằng ngôn ngữ tự nhiên
- nhãn tiến độ (ví dụ: Context Qx/8 và Scoring Qx/5)
- xử lý gián đoạn và hành vi tạm dừng/tiếp tục
- các khuyến nghị được đánh số tại các điểm quyết định
- các tùy chọn trả lời đánh số chọn nhanh cho các câu hỏi thông thường (bao gồm `Other (specify)` khi hữu ích)

File này định nghĩa nội dung đánh giá chuyên biệt theo miền. Nếu có xung đột, hãy tuân theo logic miền của file này.

## Áp dụng

Sử dụng `template.md` để lấy cấu trúc điền đầy đủ.

Skill tương tác này tuân theo **quy trình ba giai đoạn**, đặt **các câu hỏi thích ứng** ở mỗi giai đoạn.

---

### Bước 0: Thu thập bối cảnh (Trước khi đặt câu hỏi)

**Agent đề xuất:**

Trước khi định hình vấn đề của bạn, hãy thu thập bối cảnh:

**Bối cảnh vấn đề:**
- Phát biểu vấn đề ban đầu hoặc yêu cầu từ stakeholder
- Các triệu chứng bạn đã quan sát (ticket hỗ trợ, dữ liệu churn, phàn nàn của người dùng)
- Nghiên cứu hiện có (phỏng vấn người dùng, khảo sát, dữ liệu phân tích)
- Các giả định bạn đang đặt ra về vấn đề

**Bối cảnh Stakeholder:**
- Ai đang bị ảnh hưởng bởi vấn đề này? (người dùng, khách hàng, các đội ngũ nội bộ)
- Ai đang yêu cầu giải quyết vấn đề này? (ban điều hành, sales, khách hàng)
- Ai có thể đã bị bỏ qua?

**Bạn có thể dán trực tiếp nội dung này, hoặc mô tả ngắn gọn vấn đề.**

---

## Giai đoạn 1: Look Inward (Nhìn vào trong)

**Mục tiêu:** Xem xét các giả định, thiên kiến của chính bạn và cách bạn có thể đang là một phần của vấn đề.

---

### Câu hỏi 1: Vấn đề là gì? (Mô tả triệu chứng)

**Agent hỏi:**
"Theo cách hiểu hiện tại của bạn, vấn đề là gì? Hãy mô tả các triệu chứng."

**Đưa ra 4 tùy chọn đánh số:**

1. **Điểm đau của khách hàng** — "Khách hàng gặp khó khăn với [tác vụ/kết quả cụ thể]" (ví dụ: "Khách hàng không tìm thấy tính năng họ cần")
2. **Vấn đề chỉ số kinh doanh** — "Chúng ta đang thấy [chỉ số suy giảm]" (ví dụ: "Tỷ lệ rời bỏ (churn) tăng 15% trong quý trước")
3. **Yêu cầu từ stakeholder** — "Các bên liên quan nói rằng chúng ta cần [tính năng/thay đổi]" (ví dụ: "Đội Sales nói chúng ta cần báo cáo tốt hơn")
4. **Hành vi quan sát được** — "Chúng tôi nhận thấy [mẫu hành vi/xu hướng]" (ví dụ: "Người dùng bỏ dở onboarding ở bước 3")

**Hoặc tự mô tả vấn đề/triệu chứng của bạn.**

**Phản hồi của người dùng:** [Chọn tùy chọn hoặc tự nhập]

**Agent trích xuất:**
- **Vấn đề (định hình ban đầu):** [Mô tả từ người dùng]

---

### Câu hỏi 2: Tại sao chúng ta chưa giải quyết được nó?

**Agent hỏi:**
"Tại sao vấn đề này đến giờ vẫn chưa được giải quyết?"

**Đưa ra 6 tùy chọn đánh số (có thể chọn nhiều):**

1. **Vấn đề mới** — "Vấn đề mới xuất hiện gần đây"
2. **Vấn đề khó** — "Phức tạp về mặt kỹ thuật hoặc tốn nhiều nguồn lực"
3. **Ưu tiên thấp** — "Các sáng kiến khác được ưu tiên hơn"
4. **Thiếu nguồn lực** — "Không đủ ngân sách, nhân sự hoặc thời gian"
5. **Thiếu thẩm quyền** — "Không thể tự ra quyết định hoặc chưa có sự đồng thuận"
6. **Sự bất bình đẳng mang tính hệ thống** — "Vấn đề ảnh hưởng không tương xứng đến các nhóm yếu thế, bị bỏ qua"

**Hoặc mô tả lý do của riêng bạn.**

**Phản hồi của người dùng:** [Chọn tùy chọn hoặc tự nhập]

**Agent ghi nhận:**
- **Rào cản giải quyết:** [Danh sách lý do]

---

### Câu hỏi 3: Chúng ta là một phần của vấn đề như thế nào? (Giả định & thiên kiến)

**Agent hỏi:**
"Bạn (hoặc đội ngũ của bạn) có thể đang là một phần của vấn đề như thế nào? Bạn đang mang theo những giả định hoặc thiên kiến nào?"

**Đưa ra 4 tùy chọn đánh số:**

1. **Giả định rằng mình biết khách hàng muốn gì** — "Chúng ta chưa kiểm chứng với người dùng thực" (Thiên kiến xác nhận - Confirmation bias)
2. **Tối ưu cho bản thân thay vì người dùng** — "Xây dựng thứ dễ cho mình, không phải thứ có giá trị cho họ" (Thiên kiến nội bộ - Internal bias)
3. **Bỏ sót các phân khúc người dùng cụ thể** — "Tập trung vào người dùng số đông, bỏ qua các trường hợp biên hoặc nhóm yếu thế" (Thiên kiến kẻ sống sót - Survivorship bias)
4. **Tư duy giải pháp trước** — "Nhảy thẳng sang 'chúng ta cần [tính năng X]' trước khi hiểu vấn đề gốc rễ" (Hội tụ sớm - Premature convergence)

**Hoặc mô tả các giả định/thiên kiến cụ thể của bạn.**

**Phản hồi của người dùng:** [Chọn tùy chọn hoặc tự nhập]

**Agent ghi nhận:**
- **Giả định cần thách thức:** [Danh sách thiên kiến]

---

## Giai đoạn 2: Look Outward (Nhìn ra ngoài)

**Mục tiêu:** Hiểu ai đang gặp vấn đề, ai được hưởng lợi từ nó và ai đã bị bỏ lại phía sau.

---

### Câu hỏi 4: Ai gặp phải vấn đề này? (Khi nào, ở đâu, hệ quả)

**Agent hỏi:**
"Ai gặp phải vấn đề này? Họ gặp nó khi nào và ở đâu? Họ phải đối mặt với những hệ quả gì?"

**Agent gợi ý người dùng mô tả:**
- **Ai (Who):** Các persona, phân khúc người dùng hoặc vai trò cụ thể
- **Khi nào (When):** Sự kiện kích hoạt hoặc bối cảnh (ví dụ: "trong quá trình onboarding", "vào kỳ chốt sổ cuối tháng")
- **Ở đâu (Where):** Địa điểm vật lý hoặc kỹ thuật số (ví dụ: "ứng dụng mobile", "triển khai enterprise")
- **Hệ quả (Consequences):** Tác động lên người dùng (ví dụ: "lãng phí 2 giờ/tuần", "trễ hạn", "rời bỏ sản phẩm")

**Thích ứng:** Sử dụng các persona từ bối cảnh (proto-personas, JTBD, nghiên cứu khách hàng)

**Phản hồi của người dùng:** [Mô tả chi tiết]

**Agent ghi nhận:**
- **Ai gặp vấn đề:** [Personas/phân khúc]
- **Khi nào/ở đâu:** [Bối cảnh]
- **Hệ quả:** [Tác động]

---

### Câu hỏi 5: Ai khác cũng gặp vấn đề này? Ai không gặp phải nó?

**Agent hỏi:**
"Còn ai khác gặp vấn đề này không? (Đồng nghiệp, đối thủ, các lĩnh vực khác?) Và ai KHÔNG gặp vấn đề này?"

**Agent gợi ý:**
- **Ai khác gặp vấn đề:** Các công ty, ngành nghề hoặc lĩnh vực khác có vấn đề tương tự
- **Họ xử lý nó thế nào:** Giải pháp tạm (workarounds), cách giải quyết hoặc sự thích nghi
- **Ai không gặp vấn đề:** Người dùng/công ty tránh được vấn đề (điều gì ở họ khác biệt?)

**Phản hồi của người dùng:** [Mô tả chi tiết]

**Agent ghi nhận:**
- **Ai khác gặp vấn đề:** [Ví dụ]
- **Ai không gặp vấn đề:** [Ví dụ đối chứng]

---

### Câu hỏi 6: Ai đã bị bỏ sót? Ai được hưởng lợi?

**Agent hỏi:**
"Ai đã bị bỏ sót khỏi cuộc thảo luận cho đến nay? Và ai được hưởng lợi khi vấn đề này tồn tại hoặc không tồn tại?"

**Agent gợi ý:**
- **Ai bị bỏ sót:** Tiếng nói của nhóm yếu thế, trường hợp biên, các bên liên quan bị xem nhẹ
- **Ai hưởng lợi khi vấn đề tồn tại:** Ai có lợi từ hiện trạng (status quo)?
- **Ai hưởng lợi khi vấn đề không tồn tại:** Ai chịu thiệt nếu vấn đề được giải quyết?

**Ví dụ:**
- "Ai hưởng lợi khi onboarding bị hỏng?" → "Đội Sales không phải hỗ trợ các quy trình phức tạp; đội kỹ thuật không phải xây luồng hướng dẫn"
- "Ai bị bỏ sót?" → "Người dùng không rành công nghệ, khách hàng quốc tế (onboarding chỉ có tiếng Anh)"

**Phản hồi của người dùng:** [Mô tả chi tiết]

**Agent ghi nhận:**
- **Ai bị bỏ sót:** [Danh sách]
- **Ai hưởng lợi (vấn đề tồn tại):** [Danh sách]
- **Ai hưởng lợi (vấn đề được giải quyết):** [Danh sách]

---

## Giai đoạn 3: Reframe (Tái định hình)

**Mục tiêu:** Tổng hợp nhận định thành một phát biểu vấn đề rõ ràng, khả thi và câu hỏi "How Might We".

---

### Câu hỏi 7: Diễn đạt lại vấn đề

**Agent nói:**
"Dựa trên tất cả những gì chúng ta đã khám phá, hãy diễn đạt lại vấn đề theo một cách mới."

**Agent tạo ra một phát biểu vấn đề được tinh chỉnh** sử dụng các nhận định từ Giai đoạn 1-2:

**Mẫu:**
"The problem is: [Who] struggles to [accomplish what] because [root cause], which leads to [consequence]. This affects [specific segments] and has been overlooked because [bias/assumption from Phase 1]."

**Ví dụ (Onboarding SaaS):**
"Vấn đề là: Các chủ doanh nghiệp nhỏ không rành công nghệ gặp khó khăn trong việc kích hoạt sản phẩm của chúng ta khi onboarding vì giao diện dùng nhiều thuật ngữ chuyên ngành và thiếu quy trình hướng dẫn, dẫn đến 60% bỏ dở trong vòng 24 giờ. Điều này ảnh hưởng không tương xứng đến những người làm chủ độc lập (solopreneurs) không có hỗ trợ kỹ thuật, và đã bị bỏ qua vì đội ngũ chúng ta tối ưu cho người dùng doanh nghiệp lớn vốn có bộ phận IT."

**Agent hỏi:**
"Cách diễn đạt lại này đã nắm bắt được vấn đề cốt lõi chưa? Chúng ta có cần tinh chỉnh thêm không?"

**Phản hồi của người dùng:** [Chấp thuận hoặc chỉnh sửa]

---

### Câu hỏi 8: Tạo câu hỏi "How Might We"

**Agent nói:**
"Bây giờ hãy biến nó thành hành động cụ thể bằng một câu hỏi 'How Might We'."

**Mẫu:**
"How might we [action that addresses the problem] as we aim to [objective/desired condition]?"

**Ví dụ (Onboarding SaaS):**
"Làm thế nào để chúng ta hướng dẫn người dùng không rành công nghệ vượt qua onboarding bằng các gợi ý ngôn ngữ đơn giản nhằm tăng tỷ lệ kích hoạt từ 40% lên 70%?"

**Agent hỏi:**
"Câu HMW này đã mở ra đúng không gian giải pháp chưa? Chúng ta có nên điều chỉnh không?"

**Phản hồi của người dùng:** [Chấp thuận hoặc chỉnh sửa]

---

### Đầu ra: Problem Framing Canvas + Câu hỏi HMW

Sau khi hoàn thành luồng, agent xuất ra:

```markdown
# Problem Framing Canvas: [Problem Name]

**Date:** [Today's date]

---

## Phase 1: Look Inward

### What is the problem? (Symptoms)
[Description from Q1]

### Why haven't we solved it?
- [Barrier 1 from Q2]
- [Barrier 2]
- [Barrier 3]

### How are we part of the problem? (Assumptions & biases)
- [Assumption 1 from Q3]
- [Assumption 2]
- [Assumption 3]

**Which of these might be redesigned, reframed, or removed?**
[Reflection on biases to challenge]

---

## Phase 2: Look Outward

### Who experiences the problem?
**Who:** [Personas/segments from Q4]
**When/Where:** [Context]
**Consequences:** [Impact on users]
**Lived experience varies:** [How different users experience it differently]

### Who else has this problem?
**Who else:** [Examples from Q5]
**How they deal with it:** [Workarounds]

### Who doesn't have it?
[Counter-examples from Q5]

### Who's been left out?
[Marginalized voices from Q6]

### Who benefits?
**When problem exists:** [Beneficiaries of status quo]
**When problem doesn't exist:** [Who loses if solved]

---

## Phase 3: Reframe

### Stated another way, the problem is:
[Refined problem statement from Q7]

### How Might We...
**How might we** [action from Q8] **as we aim to** [objective from Q8]?

---

## Next Steps

1. **Validate with users:** Use `skills/discovery-interview-prep/SKILL.md` to test reframed problem with customers
2. **Generate solutions:** Use `skills/opportunity-solution-tree/SKILL.md` to explore solution space
3. **Create problem statement:** Use `skills/problem-statement/SKILL.md` to formalize for PRD/roadmap
4. **Identify opportunities:** Use HMW statement to brainstorm solution ideas

---

**Ready to explore solutions? Let me know if you'd like to refine the problem framing or move to solution generation.**
```

---

## Ví dụ

Xem `examples/sample.md` để xem đầy đủ các ví dụ định hình vấn đề.

Đoạn trích ví dụ ngắn:

```markdown
**Look Inward:** Churn spiked after onboarding change
**Look Outward:** New SMB users are most affected
**Reframe:** How might we reduce onboarding friction for first-time users?
```

## Các cạm bẫy thường gặp

### Cạm bẫy 1: Bỏ qua "Look Inward" (Giả định mình trung lập)
**Triệu chứng:** Đội ngũ nhảy thẳng sang "Look Outward" mà không xem xét các thiên kiến của bản thân

**Hệ quả:** Tư duy bầy đàn tiếp diễn, các giả định không được thách thức

**Cách khắc phục:** Bắt buộc thảo luận tường minh về các giả định và thiên kiến (Q2-Q3)

---

### Cạm bẫy 2: Phớt lờ câu hỏi "Ai được hưởng lợi"
**Triệu chứng:** Hoàn thành canvas mà không khám phá xem ai hưởng lợi từ việc vấn đề vẫn tồn tại

**Hệ quả:** Bỏ lỡ động lực chính trị nội bộ và sự phản kháng đối với thay đổi

**Cách khắc phục:** Luôn hỏi "Ai chịu thiệt nếu vấn đề này được giải quyết?" (Q6)

---

### Cạm bẫy 3: Phát biểu vấn đề chung chung
**Triệu chứng:** Vấn đề tái định hình mơ hồ ("Cải thiện trải nghiệm người dùng")

**Hệ quả:** Câu hỏi HMW không thể chuyển thành hành động

**Cách khắc phục:** Làm cho vấn đề cụ thể (ai, cái gì, khi nào, hệ quả, nguyên nhân gốc rễ)

---

### Cạm bẫy 4: Câu hỏi HMW quá hẹp
**Triệu chứng:** "Làm thế nào để chúng ta thêm một ứng dụng di động?"

**Hệ quả:** Bóp nghẹt không gian giải pháp chỉ còn một ý tưởng

**Cách khắc phục:** Giữ HMW đủ rộng: "Làm thế nào để giúp người dùng ưu tiên di động truy cập các quy trình cốt lõi trên mọi thiết bị?"

---

### Cạm bẫy 5: Làm bài tập một mình (Thiếu góc nhìn đa dạng)
**Triệu chứng:** PM tự điền toàn bộ canvas một mình

**Hệ quả:** Thiên kiến vẫn tồn tại, tiếng nói của nhóm yếu thế vẫn bị bỏ sót

**Cách khắc phục:** Điều phối workshop canvas cùng đội ngũ liên phòng ban + đầu vào từ khách hàng

---

## Tài liệu tham khảo

### Các Skill liên quan
- `skills/problem-statement/SKILL.md` — Chuyển vấn đề đã tái định hình thành phát biểu vấn đề chính thức
- `skills/opportunity-solution-tree/SKILL.md` — Sử dụng câu hỏi HMW để tạo các phương án giải pháp
- `skills/discovery-interview-prep/SKILL.md` — Kiểm chứng vấn đề đã tái định hình với khách hàng

### Khung tham chiếu bên ngoài
- MITRE Innovation Toolkit, "Problem Framing Canvas v3" (2021) — Nguồn gốc của canvas, tư duy thiết kế hướng công bằng
- Stanford d.school, câu hỏi "How Might We" — Định hình vấn đề hướng hành động

### Tài nguyên của Dean
- [Nếu Dean có tài nguyên về problem framing, gắn liên kết tại đây]

---

**Loại Skill:** Interactive
**Tên file gợi ý:** `problem-framing-canvas.md`
**Vị trí gợi ý:** `/skills/interactive/`
**Phụ thuộc:** Sử dụng `skills/problem-statement/SKILL.md`
