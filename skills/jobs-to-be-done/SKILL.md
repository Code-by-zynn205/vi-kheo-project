---
name: jobs-to-be-done
argument-hint: "[phân khúc khách hàng hoặc sản phẩm]"
description: Khám phá công việc cần hoàn thành (jobs), nỗi đau (pains) và lợi ích mong muốn (gains) của khách hàng theo cấu trúc JTBD. Sử dụng khi làm rõ nhu cầu chưa được đáp ứng, tái định vị sản phẩm hoặc cải thiện discovery và thông điệp.
intent: >-
  Khám phá có hệ thống những gì khách hàng đang cố gắng đạt được (công việc chức năng, xã hội, cảm xúc), những nỗi đau họ gặp phải và những lợi ích họ tìm kiếm. Sử dụng khung này để phát hiện các nhu cầu chưa được đáp ứng, kiểm chứng ý tưởng sản phẩm và đảm bảo giải pháp của bạn giải quyết đúng động lực thực sự — chứ không chỉ là các yêu cầu tính năng bề mặt.
type: component
theme: discovery-research
best_for:
  - "Làm rõ khách hàng thực sự 'thuê' sản phẩm của bạn để làm việc gì"
  - "Tái định vị sản phẩm xoay quanh nhu cầu chưa được đáp ứng thay vì tính năng"
  - "Biến phản hồi mơ hồ của người dùng thành cấu trúc jobs, pains và gains rõ ràng"
scenarios:
  - "Khách hàng cứ yêu cầu những tính năng không khớp với lộ trình của chúng ta — họ đang thuê chúng ta cho công việc (job) gì?"
  - "Chúng ta đang tái định vị và cần hiểu các nhu cầu chưa được đáp ứng đằng sau hành vi chuyển đổi sản phẩm"
estimated_time: "20-30 phút"
---

# Skill: Jobs-to-be-Done (JTBD)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/jobs-to-be-done/SKILL.md) (deanpeters/Product-Manager-Skills).

## Mục đích
Khám phá có hệ thống những gì khách hàng đang cố gắng đạt được (công việc chức năng, xã hội, cảm xúc), những nỗi đau họ gặp phải và những lợi ích họ tìm kiếm. Sử dụng khung này để phát hiện các nhu cầu chưa được đáp ứng, kiểm chứng ý tưởng sản phẩm và đảm bảo giải pháp của bạn giải quyết đúng động lực thực sự — chứ không chỉ là các yêu cầu tính năng bề mặt.

Đây không phải là một bản khảo sát — đây là lăng kính có cấu trúc để hiểu *tại sao* khách hàng "thuê" sản phẩm của bạn và điều gì sẽ khiến họ "sa thải" nó.

## Đầu vào

**Hiệu quả nhất với:** Phân khúc khách hàng (hoặc sản phẩm có tệp khách hàng đó) mà bạn đang phân tích.
**Cũng hữu ích:** Ghi chú phỏng vấn, ticket hỗ trợ hoặc tài liệu nghiên cứu để khai thác jobs, pains và gains; tình huống hoặc yếu tố kích hoạt mà bạn quan tâm.

Mọi thứ được cung cấp kèm khi gọi skill — văn bản sau tên skill, phần dán bối cảnh, hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã cung cấp. Hãy sử dụng chúng và bỏ qua những phần đã được đề cập; đừng hỏi lại.

**Đến tay trắng? Cũng hoàn toàn ổn.** Skill sẽ hỏi khách hàng là ai và bước tiến nào họ đang cố đạt được trước khi lập cấu trúc phân tích JTBD.

**Ví dụ gọi skill:** `Run JTBD for freelance designers using our invoicing tool — here are 6 interview summaries.`

## Khái niệm cốt lõi

### Khung Jobs-to-be-Done
Chịu ảnh hưởng từ Clayton Christensen và Value Proposition Canvas (Osterwalder), JTBD chia nhu cầu khách hàng thành ba nhóm:

**1. Customer Jobs (Công việc của khách hàng):**
- **Functional jobs (Công việc chức năng):** Các tác vụ khách hàng cần thực hiện (ví dụ: "gửi hóa đơn")
- **Social jobs (Công việc xã hội):** Cách khách hàng muốn người khác nhìn nhận mình (ví dụ: "trông chuyên nghiệp trong mắt khách hàng")
- **Emotional jobs (Công việc cảm xúc):** Trạng thái cảm xúc khách hàng muốn đạt được hoặc né tránh (ví dụ: "cảm thấy tự tin về công việc của mình")

**2. Pains (Nỗi đau):**
- **Challenges (Thách thức):** Các trở ngại khách hàng phải đối mặt
- **Costliness (Sự tốn kém):** Những gì quá đắt đỏ về thời gian, tiền bạc hoặc công sức
- **Common mistakes (Sai lầm phổ biến):** Những lỗi khách hàng hay mắc phải mà lẽ ra có thể phòng tránh
- **Unresolved problems (Vấn đề chưa được giải quyết):** Khoảng trống trong các giải pháp hiện tại

**3. Gains (Lợi ích mong muốn):**
- **Expectations (Kỳ vọng):** Điều gì sẽ vượt xa các giải pháp hiện tại
- **Savings (Tiết kiệm):** Những khoản giảm trừ thời gian, tiền bạc hoặc công sức khiến họ thích thú
- **Adoption factors (Yếu tố thúc đẩy chuyển đổi):** Điều gì làm tăng khả năng họ chuyển sang dùng sản phẩm mới
- **Life improvement (Cải thiện cuộc sống):** Cách giải pháp giúp công việc/cuộc sống dễ dàng hoặc thoải mái hơn

### Vì sao cấu trúc này hiệu quả
- **Tách rời "job" khỏi "giải pháp":** "Giao tiếp với đội ngũ" (job) ≠ "email" (giải pháp)
- **Làm lộ động lực ẩn:** Công việc chức năng có thể là "theo dõi chi tiêu", nhưng công việc cảm xúc là "cảm thấy kiểm soát được tài chính"
- **Phát hiện đối thủ vô hình:** Khách hàng "thuê" những giải pháp thay thế không ngờ tới (giấy bút, bảng tính, cách làm thủ công)
- **Ưu tiên theo cường độ:** Không phải nỗi đau nào cũng như nhau — hãy tập trung vào nỗi đau cấp bách nhất

### Các phản mẫu (Những gì khung này KHÔNG phải)
- **Không phải danh sách mơ ước tính năng:** "Tôi muốn AI, tự động hóa và dashboard" không phải là một job
- **Không phải nhân khẩu học:** "Thế hệ Millennials thích mobile-first" là đặc điểm persona, không phải job
- **Không chung chung:** "Làm việc năng suất hơn" quá mơ hồ — hãy đào sâu xem tác vụ *nào* và *tại sao*
- **Không một chiều:** Chỉ tập trung vào công việc chức năng sẽ bỏ sót động lực xã hội/cảm xúc

### Khi nào nên dùng
- Giai đoạn discovery ban đầu (trước khi bạn biết giải pháp là gì)
- Kiểm chứng product-market fit (giải pháp của bạn có giải đúng jobs không?)
- Sắp xếp ưu tiên lộ trình (những jobs nào đau đớn/quan trọng nhất?)
- Phân tích đối thủ (khách hàng đang "thuê" đối thủ để làm gì?)
- Thông điệp marketing (nói về jobs, không nói về tính năng)

### Khi nào KHÔNG nên dùng
- Sau khi bạn đã xây dựng xong sản phẩm (quá muộn cho discovery)
- Cho các tính năng nhỏ lẻ (đừng phân tích quá mức những tinh chỉnh nhỏ)
- Như một sự thay thế cho kiểm chứng định lượng (JTBD tạo giả thuyết; dữ liệu kiểm chứng giả thuyết)

---

## Áp dụng

Sử dụng `template.md` để lấy cấu trúc điền đầy đủ.

### Bước 1: Xác định bối cảnh
Trước khi khám phá JTBD, hãy làm rõ:
- **Phân khúc khách hàng mục tiêu:** Bạn đang nghiên cứu ai? (tham khảo `skills/proto-persona/SKILL.md`)
- **Tình huống:** Công việc phát sinh trong bối cảnh nào? (ví dụ: "Khi quản lý hạn chót dự án...")
- **Giải pháp hiện tại:** Hôm nay họ đang dùng gì? (đối thủ, cách làm tạm, hoặc không làm gì)

**Nếu thiếu bối cảnh:** Thực hiện phỏng vấn khách hàng, quan sát thực địa (contextual inquiry), hoặc "switch interviews" (hỏi lý do họ chuyển đổi từ giải pháp trước đây).

---

### Bước 2: Khám phá Customer Jobs

#### Functional Jobs (Công việc chức năng)
Hỏi: "Bạn đang cố gắng hoàn thành những tác vụ nào?"

```markdown
### Functional Jobs:
- [Task 1 customer needs to perform]
- [Task 2 customer needs to perform]
- [Task 3 customer needs to perform]
```

**Ví dụ:**
- "Đối soát chi phí hàng tháng để kê khai thuế"
- "Onboarding thành viên mới trong dưới 2 giờ"
- "Triển khai code lên production không bị gián đoạn (downtime)"

**Kiểm tra chất lượng:**
- **Bắt đầu bằng động từ:** Jobs là hành động ("gửi", "phân tích", "điều phối")
- **Không gắn giải pháp:** Đừng nói "dùng email để giao tiếp" — hãy nói "giao tiếp với đồng đội làm việc từ xa"
- **Cụ thể:** "Quản lý tài chính" quá rộng; "Theo dõi chi phí doanh nghiệp để khấu trừ thuế" là cụ thể

---

#### Social Jobs (Công việc xã hội)
Hỏi: "Bạn muốn được người khác nhìn nhận như thế nào?"

```markdown
### Social Jobs:
- [Way customer wants to be perceived socially 1]
- [Way customer wants to be perceived socially 2]
- [Way customer wants to be perceived socially 3]
```

**Ví dụ:**
- "Được ban điều hành nhìn nhận là người có tư duy chiến lược"
- "Thể hiện sự nhanh nhạy và đáng tin cậy với khách hàng"
- "Trông am hiểu công nghệ trước các đồng nghiệp trẻ"

**Kiểm tra chất lượng:**
- **Gắn với đối tượng cụ thể:** Khách hàng đang muốn gây ấn tượng với ai? (sếp, khách hàng, đồng nghiệp, v.v.)
- **Trọng số cảm xúc:** Social jobs thường thúc đẩy việc chấp nhận sản phẩm mạnh hơn cả functional jobs

---

#### Emotional Jobs (Công việc cảm xúc)
Hỏi: "Bạn muốn đạt được hoặc tránh trạng thái cảm xúc nào?"

```markdown
### Emotional Jobs:
- [Emotional state customer seeks or avoids 1]
- [Emotional state customer seeks or avoids 2]
- [Emotional state customer seeks or avoids 3]
```

**Ví dụ:**
- "Cảm thấy tự tin rằng mình không bỏ sót chi tiết quan trọng"
- "Tránh cảm giác lo âu do lỗi nhập liệu thủ công"
- "Cảm thấy thành tựu vào cuối ngày làm việc"

**Kiểm tra chất lượng:**
- **Tích cực và tiêu cực:** Bao gồm cả điều họ tìm kiếm ("cảm thấy làm chủ") và điều họ tránh ("tránh bị bẽ mặt")
- **Bám sát nghiên cứu:** Đừng bịa cảm xúc — hãy dùng trích dẫn từ khách hàng

---

### Bước 3: Xác định Pains (Nỗi đau)

#### Challenges (Thách thức)
Hỏi: "Những trở ngại nào đang ngăn cản bạn hoàn thành công việc này?"

```markdown
### Challenges:
- [Obstacle customer faces 1]
- [Obstacle customer faces 2]
- [Obstacle customer faces 3]
```

**Ví dụ:**
- "Các công cụ không tích hợp với nhau, buộc phải nhập liệu thủ công"
- "Không nắm được đồng đội đang làm gì"
- "Quy trình phê duyệt mất hơn 3 ngày, làm tắc nghẽn tiến độ"

---

#### Costliness (Sự tốn kém)
Hỏi: "Điều gì tốn quá nhiều thời gian, tiền bạc hoặc công sức?"

```markdown
### Costliness:
- [What's too costly in time, money, or effort 1]
- [What's too costly in time, money, or effort 2]
```

**Ví dụ:**
- "Tạo báo cáo hàng tháng tốn 8 giờ làm thủ công"
- "Thuê chuyên gia tốn 10.000 USD, vượt quá khả năng chi trả"
- "Học cách dùng công cụ hiện tại đòi hỏi hơn 20 giờ đào tạo"

---

#### Common Mistakes (Sai lầm phổ biến)
Hỏi: "Bạn thường xuyên mắc phải những lỗi nào mà lẽ ra có thể phòng tránh được?"

```markdown
### Common Mistakes:
- [Frequent error 1]
- [Frequent error 2]
```

**Ví dụ:**
- "Quên CC các bên liên quan vào những email quan trọng"
- "Tính sai khoản khấu trừ thuế do thiếu hóa đơn"
- "Vô tình ghi đè lên phần việc của người khác trong file dùng chung"

---

#### Unresolved Problems (Vấn đề chưa được giải quyết)
Hỏi: "Những vấn đề nào mà các giải pháp hiện tại chưa xử lý được?"

```markdown
### Unresolved Problems:
- [Problem not solved by current solutions 1]
- [Problem not solved by current solutions 2]
```

**Ví dụ:**
- "CRM hiện tại không theo dõi chỉ số sức khỏe khách hàng (customer health score)"
- "Email không giữ được ngữ cảnh cuộc trò chuyện khi thêm người mới vào giữa luồng"
- "Các công cụ hiện tại đòi hỏi chuyên môn kỹ thuật mà chúng tôi không có"

---

### Bước 4: Khám phá Gains (Lợi ích mong muốn)

#### Expectations (Kỳ vọng)
Hỏi: "Điều gì sẽ khiến bạn yêu thích một giải pháp?"

```markdown
### Expectations:
- [What could exceed expectations 1]
- [What could exceed expectations 2]
```

**Ví dụ:**
- "Tự động phân loại chi phí mà không cần gắn thẻ thủ công"
- "Gợi ý các bước tiếp theo dựa trên trạng thái dự án"
- "Tích hợp mượt mà với các công cụ chúng tôi đã dùng sẵn"

---

#### Savings (Tiết kiệm)
Hỏi: "Mức tiết kiệm thời gian, tiền bạc hoặc công sức nào sẽ khiến bạn hài lòng vượt mong đợi?"

```markdown
### Savings:
- [Way of saving time, money, or effort 1]
- [Way of saving time, money, or effort 2]
```

**Ví dụ:**
- "Giảm thời gian tạo báo cáo từ 8 giờ xuống 10 phút"
- "Loại bỏ nhu cầu cần một nhân sự quản trị toàn thời gian"
- "Cắt giảm thời gian onboarding từ 2 tuần xuống 2 ngày"

---

#### Adoption Factors (Yếu tố thúc đẩy chuyển đổi)
Hỏi: "Điều gì sẽ khiến bạn chuyển đổi từ giải pháp hiện tại sang giải pháp mới?"

```markdown
### Adoption Factors:
- [Factor increasing likelihood of adoption 1]
- [Factor increasing likelihood of adoption 2]
```

**Ví dụ:**
- "Dùng thử miễn phí không cần thẻ tín dụng"
- "Hỗ trợ di chuyển (migration) để nhập dữ liệu hiện có"
- "Đánh giá thực tế từ các công ty giống như chúng tôi"

---

#### Life Improvement (Cải thiện cuộc sống)
Hỏi: "Cuộc sống của bạn sẽ tốt hơn thế nào nếu công việc này trở nên dễ dàng hơn?"

```markdown
### Life Improvement:
- [How solution makes life easier or more enjoyable 1]
- [How solution makes life easier or more enjoyable 2]
```

**Ví dụ:**
- "Tôi có thể tan làm đúng giờ thay vì ở lại muộn hoàn thành báo cáo"
- "Tôi sẽ bớt căng thẳng về việc lỡ các hạn chót quan trọng"
- "Tôi có thể tập trung vào việc chiến lược thay vì việc vặt lặp đi lặp lại"

---

### Bước 5: Sắp xếp ưu tiên và Kiểm chứng

- **Xếp hạng pains theo cường độ:** Nỗi đau nào cấp bách so với sự khó chịu nhẹ?
- **Phân biệt gains bắt buộc (must-have) và điểm cộng (nice-to-have):** Điều gì thúc đẩy việc chuyển đổi so với điều gì chỉ là phần thưởng thêm?
- **Đối chiếu với các persona:** Các persona khác nhau có jobs/pains/gains khác nhau không? (tham khảo `skills/proto-persona/SKILL.md`)
- **Kiểm chứng bằng dữ liệu:** Khảo sát tệp đối tượng rộng hơn để xác nhận các nhận định JTBD từ phỏng vấn

---

## Ví dụ

Xem `examples/sample.md` để xem đầy đủ các ví dụ JTBD.

Đoạn trích ví dụ ngắn:

```markdown
**Functional Jobs:** Coordinate tasks across a distributed team
**Pains - Challenges:** Team members use different tools, creating silos
**Gains - Savings:** Reduce status reporting time from 3 hours to 15 minutes
```

---

## Các cạm bẫy thường gặp

### Cạm bẫy 1: Nhầm lẫn Jobs với Giải pháp
**Triệu chứng:** "Tôi cần dùng Slack" hoặc "Tôi cần phân tích bằng AI"

**Hệ quả:** Bạn đã bị neo vào một giải pháp, không phải job cốt lõi bên dưới.

**Cách khắc phục:** Hỏi "Tại sao?" 5 lần. "Tôi cần Slack" → "Tại sao?" → "Để giao tiếp với đội ngũ" → "Tại sao?" → "Để có câu trả lời nhanh" → "Tại sao?" → "Để tránh chậm tiến độ dự án."

---

### Cạm bẫy 2: Jobs chung chung
**Triệu chứng:** "Năng suất hơn" hoặc "Tiết kiệm thời gian"

**Hệ quả:** Quá mơ hồ để định hướng quyết định sản phẩm.

**Cách khắc phục:** Cụ thể hóa. "Tiết kiệm thời gian" → "Giảm thời gian tạo báo cáo hàng tháng từ 8 giờ xuống 1 giờ."

---

### Cạm bẫy 3: Bỏ qua Social/Emotional Jobs
**Triệu chứng:** Chỉ ghi nhận các functional jobs

**Hệ quả:** Bạn bỏ lỡ những động lực mạnh mẽ nhất. Con người thường mua hàng dựa trên nhu cầu cảm xúc/xã hội, không chỉ chức năng.

**Cách khắc phục:** Hỏi trực tiếp về cách nhìn nhận và cảm xúc trong các buổi phỏng vấn. "Giải quyết được việc này sẽ khiến bạn cảm thấy thế nào?" "Ai sẽ nhận ra nếu bạn giải quyết được việc này?"

---

### Cạm bẫy 4: Tự bịa JTBD mà không nghiên cứu
**Triệu chứng:** Điền mẫu dựa trên các suy đoán chủ quan

**Hệ quả:** Bạn đang đoán mò. Phân tích JTBD chỉ có giá trị khi bám sát nhận định thực tế từ khách hàng.

**Cách khắc phục:** Thực hiện "switch interviews" (hỏi lý do họ chuyển từ giải pháp cũ), quan sát thực địa (contextual inquiry), hoặc phỏng vấn kiểm chứng vấn đề.

---

### Cạm bẫy 5: Coi mọi nỗi đau đều ngang nhau
**Triệu chứng:** Liệt kê 20 nỗi đau mà không sắp xếp ưu tiên

**Hệ quả:** Không rõ nên giải quyết điều gì trước tiên.

**Cách khắc phục:** Xếp hạng pains theo cường độ (cấp bách so với nhẹ). Hỏi "Nếu chúng ta chỉ được giải quyết một nỗi đau duy nhất, cái nào sẽ tạo tác động lớn nhất?"

---

## Tài liệu tham khảo

### Các Skill liên quan
- `skills/proto-persona/SKILL.md` — Định nghĩa đối tượng có các jobs/pains/gains này
- `skills/problem-statement/SKILL.md` — JTBD cung cấp đầu vào cho phần "Trying to" và "But"
- `skills/positioning-statement/SKILL.md` — JTBD cung cấp đầu vào cho phát biểu "that need"

### Khung tham chiếu bên ngoài
- Clayton Christensen, *Competing Against Luck* (2016) — Nguồn gốc lý thuyết Jobs-to-be-Done
- Tony Ulwick, *Outcome-Driven Innovation* (2016) — Định lượng jobs và outcomes
- Alexander Osterwalder, *Value Proposition Canvas* (2014) — Khung jobs/pains/gains của khách hàng

### Tài nguyên của Dean
- [Gắn liên kết đến các bài viết Substack liên quan của Dean Peters nếu phù hợp]

### Nguồn gốc
- Chuyển thể từ `prompts/jobs-to-be-done.md` trong repo `https://github.com/deanpeters/product-manager-prompts`.

---

**Loại Skill:** Component
**Tên file gợi ý:** `jobs-to-be-done.md`
**Vị trí gợi ý:** `/skills/components/`
**Phụ thuộc:** Tham chiếu `skills/proto-persona/SKILL.md`
**Được sử dụng bởi:** `skills/positioning-statement/SKILL.md`, `skills/problem-statement/SKILL.md`, `skills/epic-hypothesis/SKILL.md`
