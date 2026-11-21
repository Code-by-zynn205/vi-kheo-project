---
name: problem-statement
argument-hint: "[người dùng và khó khăn của họ]"
description: Viết phát biểu vấn đề lấy người dùng làm trung tâm, nêu rõ ai đang bị cản trở, họ đang cố làm gì, tại sao điều đó quan trọng và cảm giác của họ ra sao. Sử dụng khi định hình discovery, sắp xếp ưu tiên hoặc viết PRD.
intent: >-
  Diễn đạt một vấn đề từ góc nhìn của người dùng bằng khung tư duy thấu cảm, nắm bắt họ là ai, họ đang cố đạt được điều gì, điều gì đang cản trở họ, tại sao lại như vậy và điều đó khiến họ cảm thấy thế nào. Sử dụng để đồng bộ các bên liên quan về vấn đề trước khi nhảy sang giải pháp, và định hướng công việc sản phẩm xoay quanh kết quả cho người dùng thay vì danh sách yêu cầu tính năng.
type: component
theme: discovery-research
best_for:
  - "Định hình vấn đề trước khi bất kỳ ai đề xuất giải pháp"
  - "Giúp đội ngũ thống nhất về việc ai đang bị cản trở và tại sao điều đó quan trọng"
  - "Biến một lời phàn nàn mơ hồ thành thứ đội ngũ có thể hành động"
scenarios:
  - "Đội ngũ cứ nhảy thẳng sang giải pháp mà chúng ta chưa từng viết ra vấn đề thực sự là gì"
  - "Tôi cần một phát biểu vấn đề sắc gọn cho PRD để một lãnh đạo khó tính đọc qua sẽ hiểu ngay"
estimated_time: "10-20 phút"
---

# Skill: Phát biểu vấn đề (Problem Statement)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/problem-statement/SKILL.md) (deanpeters/Product-Manager-Skills).

## Mục đích
Diễn đạt một vấn đề từ góc nhìn của người dùng bằng khung tư duy thấu cảm, nắm bắt họ là ai, họ đang cố đạt được điều gì, điều gì đang cản trở họ, tại sao lại như vậy và điều đó khiến họ cảm thấy thế nào. Sử dụng để đồng bộ các bên liên quan về vấn đề trước khi nhảy sang giải pháp, và định hướng công việc sản phẩm xoay quanh kết quả cho người dùng thay vì danh sách yêu cầu tính năng.

Đây không phải là tài liệu yêu cầu — đây là một câu chuyện vấn đề lấy con người làm trung tâm để đảm bảo bạn đang giải quyết một vấn đề thực sự đáng giải.

## Đầu vào

**Hiệu quả nhất với:** Người dùng là ai và họ đang chật vật làm điều gì.
**Cũng hữu ích:** Điều gì đang cản trở họ, tại sao điều đó quan trọng, cảm giác ra sao và các bằng chứng hỗ trợ.

Mọi thứ được cung cấp kèm khi gọi skill — văn bản sau tên skill, phần dán bối cảnh, hoặc dòng `ARGUMENTS:` đính kèm — đều được tính là câu trả lời đã cung cấp. Hãy sử dụng chúng và bỏ qua những phần đã được đề cập; đừng hỏi lại.

**Đến tay trắng? Cũng hoàn toàn ổn.** Skill sẽ hỏi về người dùng và mục tiêu của họ trước — một phát biểu vấn đề thiếu đối tượng 'ai' cụ thể chỉ là một giải pháp đang tìm vỏ bọc.

**Ví dụ gọi skill:** `Problem statement: clinic schedulers double-book exam rooms because the calendar doesn't show equipment availability.`

## Khái niệm cốt lõi

### Khung định hình vấn đề (Problem Framing Framework)
Dựa trên Jobs-to-be-Done và bản đồ thấu cảm (empathy mapping), khung này cấu trúc vấn đề như sau:

**Câu chuyện định hình vấn đề (Problem Framing Narrative):**
- **Tôi là (I am):** [Mô tả persona đang gặp vấn đề]
- **Đang cố gắng (Trying to):** [Kết quả mong muốn mà persona quan tâm]
- **Nhưng (But):** [Các rào cản ngăn cản đạt được kết quả]
- **Bởi vì (Because):** [Nguyên nhân gốc rễ của vấn đề]
- **Điều đó khiến tôi cảm thấy (Which makes me feel):** [Tác động cảm xúc]

**Bối cảnh & Ràng buộc (Context & Constraints):**
- [Các yếu tố địa lý, công nghệ, thời gian, nhân khẩu học]

**Phát biểu vấn đề cuối cùng (Final Problem Statement):**
- [Một tóm tắt duy nhất, súc tích và giàu tính thấu cảm]

### Vì sao cấu trúc này hiệu quả
- **Lấy persona làm trung tâm:** Buộc bạn nhìn vấn đề qua đôi mắt của người dùng
- **Tập trung vào kết quả (Outcome-focused):** "Đang cố gắng" nhấn mạnh kết quả mong muốn, không phải tác vụ rời rạc
- **Phân tích nguyên nhân gốc rễ:** "Bởi vì" đẩy tư duy vượt qua triệu chứng để chạm tới vấn đề nền tảng
- **Xác thực cảm xúc:** "Khiến tôi cảm thấy" nhân văn hóa vấn đề và xây dựng sự đồng cảm
- **Gắn với bối cảnh:** Các ràng buộc ghi nhận những giới hạn trong thực tế

### Các phản mẫu (Những gì tài liệu này KHÔNG phải)
- **Không phải giải pháp trá hình:** "Vấn đề là chúng ta thiếu phân tích bằng AI" = đang lén đưa giải pháp vào
- **Không phải vấn đề kinh doanh:** "Doanh thu đang giảm" không phải vấn đề của người dùng (đó là triệu chứng)
- **Không phải yêu cầu tính năng:** "Người dùng cần một dashboard" không phải là vấn đề (họ đang cố làm gì?)
- **Không chung chung:** "Người dùng muốn UX tốt hơn" quá mơ hồ để hành động

### Khi nào nên dùng
- Khởi động công việc discovery hoặc kiểm chứng vấn đề
- Đồng bộ các bên liên quan trước khi thiết kế giải pháp
- Truyền thông vấn đề tới đội ngũ kỹ thuật, thiết kế hoặc ban điều hành
- Khi bạn có nhiều yêu cầu tính năng nhưng chưa rõ vấn đề cốt lõi bên dưới
- Thuyết phục tại sao một vấn đề xứng đáng được giải quyết

### Khi nào KHÔNG nên dùng
- Khi bạn chưa làm bất kỳ nghiên cứu người dùng nào (đừng đoán mò — hãy phỏng vấn trước)
- Cho các vấn đề vận hành nội bộ (khung này dành cho vấn đề hướng tới người dùng)
- Để thay thế cho PRD (tài liệu này định hình vấn đề; PRD định nghĩa giải pháp)

---

## Áp dụng

Sử dụng `template.md` để lấy cấu trúc điền đầy đủ.

### Bước 1: Thu thập bối cảnh người dùng
Trước khi phác thảo, hãy đảm bảo bạn có:
- **Phỏng vấn hoặc nghiên cứu người dùng:** Trích dẫn trực tiếp, hành vi quan sát được, điểm đau
- **Nhận định Jobs-to-be-Done:** Người dùng đang "thuê" sản phẩm của bạn để làm việc gì (tham khảo `skills/jobs-to-be-done/SKILL.md`)
- **Làm rõ Persona:** Cụ thể ai đang gặp vấn đề này (tham khảo `skills/proto-persona/SKILL.md`)
- **Dữ liệu ràng buộc:** Giới hạn về địa lý, công nghệ, thời gian, nhân khẩu học

**Nếu thiếu bối cảnh:** Hãy thực hiện phỏng vấn khám phá, quan sát thực địa (contextual inquiry) hoặc theo sát người dùng (user shadowing). Đừng bịa ra vấn đề.

---

### Bước 2: Phác thảo Câu chuyện định hình vấn đề

Điền vào mẫu theo góc nhìn của persona:

```markdown
## Problem Framing Narrative

**I am:** [Describe the key persona, highlighting 3-4 key characteristics]
- [Key pain point or characteristic 1]
- [Key pain point or characteristic 2]
- [Key pain point or characteristic 3]

**Trying to:**
- [Single sentence listing the desired outcomes the persona cares most about]

**But:**
- [Describe the barriers preventing the persona from achieving outcomes]
- [Job-to-be-done or outcome obstruction 1]
- [Job-to-be-done or outcome obstruction 2]
- [Job-to-be-done or outcome obstruction 3]

**Because:**
- [Describe the root cause empathetically]

**Which makes me feel:**
- [Describe the emotions from the persona's perspective]
```

**Kiểm tra chất lượng:**
- **Độ cụ thể của "I am":** Bạn có hình dung được con người này không? Hay vẫn chung chung ("người đi làm bận rộn")?
- **Độ rõ ràng của "Trying to":** Đây là kết quả (đo lường được) hay chỉ là tác vụ (hoạt động)?
- **Chiều sâu của "But":** Đây có phải rào cản thực sự hay chỉ là sự bất tiện nhỏ?
- **Tính trung thực của "Because":** Đây là nguyên nhân gốc rễ hay chỉ là triệu chứng?
- **Tính chân thực của "Makes me feel":** Những cảm xúc này đến từ nghiên cứu thực tế hay suy đoán?

---

### Bước 3: Ghi nhận Bối cảnh & Ràng buộc

```markdown
## Context & Constraints

- [Enumerate geographic, technological, time-based, or demographic factors]
- [e.g., "Must work offline in rural areas with limited connectivity"]
- [e.g., "Used by non-technical users unfamiliar with complex software"]
- [e.g., "Time-sensitive: decisions must be made within 24 hours"]
```

**Kiểm tra chất lượng:**
- **Tính liên quan:** Các ràng buộc này có tác động trực tiếp đến vấn đề không?
- **Độ cụ thể:** Chúng có đủ rõ ràng để định hướng cho các quyết định thiết kế không?

---

### Bước 4: Hoàn thiện Phát biểu vấn đề cuối cùng

Tổng hợp câu chuyện thành một câu súc tích và mạnh mẽ:

```markdown
## Final Problem Statement

[Single, concise statement that provides a powerful and empathetic summary]
```

**Công thức:** `[Persona] cần một cách để [kết quả mong muốn] bởi vì [nguyên nhân gốc rễ], điều mà hiện tại [tác động cảm xúc/thực tế].`

**Ví dụ:** "Quản trị viên IT doanh nghiệp cần một cách để cấp phát tài khoản người dùng dưới 5 phút bởi vì quy trình hiện tại mất hơn 2 giờ với bước phê duyệt thủ công, gây ra chậm trễ dự án và khiến người dùng cuối bức xúc."

**Kiểm tra chất lượng:**
- **Một câu duy nhất:** Nếu cần nhiều câu, vấn đề vẫn chưa đủ sắc gọn
- **Đo lường được:** Bạn có thể nhận biết được khi đã giải quyết xong không?
- **Giàu thấu cảm:** Nó có chạm tới cảm xúc thực tế không?
- **Dễ chia sẻ:** Bạn có thể đọc câu này trong cuộc họp và khiến các bên liên quan gật gù đồng tình không?

---

### Bước 5: Kiểm chứng và Lan tỏa

- **Kiểm tra với người dùng:** Đọc to câu phát biểu cho những người đang gặp vấn đề. Họ có nói "Đúng, chính xác là vậy!" không?
- **Chia sẻ với các bên liên quan:** Product, kỹ thuật, thiết kế, ban điều hành. Nó có giúp mọi người đồng thuận không?
- **Lặp lại dựa trên phản hồi:** Nếu bất kỳ ai nói "Tôi không nghĩ đó là vấn đề thực sự", hãy đào sâu hơn.

---

## Ví dụ

Xem `examples/sample.md` để xem đầy đủ các ví dụ (phát biểu vấn đề tốt và chưa tốt).

Đoạn trích ví dụ ngắn:

```markdown
**I am:** A software developer on a distributed team
**Trying to:** Communicate in real-time with my team without losing context
**But:** Email is too slow and IM is ephemeral
**Because:** No tool combines real-time chat with searchable history
**Which makes me feel:** Frustrated and disconnected
```

---

## Các cạm bẫy thường gặp

### Cạm bẫy 1: Đánh tráo giải pháp (Solution Smuggling)
**Triệu chứng:** "Vấn đề là chúng ta không có [tính năng cụ thể]"

**Hệ quả:** Bạn đã mặc định trước giải pháp mà chưa kiểm chứng vấn đề.

**Cách khắc phục:** Tái định hình xoay quanh kết quả mong muốn của người dùng, không phải tính năng. Hãy hỏi "Họ đang cố gắng đạt được điều gì?"

---

### Cạm bẫy 2: Ngụy trang vấn đề kinh doanh thành vấn đề người dùng
**Triệu chứng:** "Người dùng muốn tăng doanh thu cho chúng ta" hoặc "Vấn đề là tỷ lệ rời bỏ (churn rate) của chúng ta"

**Hệ quả:** Đây là vấn đề của công ty, không phải vấn đề của người dùng. Người dùng không quan tâm đến chỉ số của bạn.

**Cách khắc phục:** Đào sâu *tại sao* người dùng rời bỏ hoặc *điều gì* khiến họ sẵn sàng chi tiêu nhiều hơn. Diễn đạt từ góc nhìn của họ.

---

### Cạm bẫy 3: Persona chung chung
**Triệu chứng:** "Tôi là một người đi làm bận rộn đang cố gắng làm việc năng suất hơn"

**Hệ quả:** Quá rộng để có thể hành động. Sản phẩm nào cũng tự nhận giúp "người đi làm bận rộn".

**Cách khắc phục:** Cụ thể hóa. "Tôi là nhân viên kinh doanh quản lý thủ công hơn 50 khách hàng tiềm năng trên bảng tính, đang cố ưu tiên việc chăm sóc lại mà không bỏ sót cơ hội giá trị cao."

---

### Cạm bẫy 4: Nhầm triệu chứng với nguyên nhân gốc rễ
**Triệu chứng:** "Bởi vì giao diện khó hiểu"

**Hệ quả:** Bạn đang mô tả triệu chứng, không phải nguyên nhân ẩn bên dưới.

**Cách khắc phục:** Hỏi "Tại sao giao diện lại khó hiểu?" Tiếp tục hỏi "tại sao" cho đến khi chạm tới nguyên nhân gốc rễ (ví dụ: "Bởi vì người dùng không có mô hình tư duy về cách hệ thống vận hành").

---

### Cạm bẫy 5: Cảm xúc bịa đặt
**Triệu chứng:** "Điều đó khiến tôi cảm thấy được trao quyền và thích thú"

**Hệ quả:** Nghe giống lời văn marketing hơn là cảm xúc thật của người dùng.

**Cách khắc phục:** Dùng trích dẫn thực tế từ phỏng vấn người dùng. Cảm xúc thật thường là: "bức xúc," "quá tải," "lo âu," "bế tắc."

---

## Tài liệu tham khảo

### Các Skill liên quan
- `skills/jobs-to-be-done/SKILL.md` — Cung cấp đầu vào cho phần "Trying to" và "But"
- `skills/proto-persona/SKILL.md` — Định nghĩa persona ở phần "I am"
- `skills/positioning-statement/SKILL.md` — Phát biểu vấn đề là đầu vào cho định vị sản phẩm
- `skills/user-story/SKILL.md` — Phát biểu vấn đề định hướng ưu tiên user story

### Khung tham chiếu bên ngoài
- Clayton Christensen, *Jobs to Be Done* — Nguồn gốc của cách định hình vấn đề tập trung vào kết quả
- Osterwalder & Pigneur, *Value Proposition Canvas* — Nỗi đau/lợi ích/công việc của khách hàng (pains/gains/jobs)
- Dave Gray, *Empathy Mapping* — Kỹ thuật định hình cảm xúc

### Tài nguyên của Dean
- [Gắn liên kết đến các bài viết Substack liên quan của Dean Peters nếu phù hợp]

### Nguồn gốc
- Chuyển thể từ `prompts/framing-the-problem-statement.md` trong repo `https://github.com/deanpeters/product-manager-prompts`.

---

**Loại Skill:** Component
**Tên file gợi ý:** `problem-statement.md`
**Vị trí gợi ý:** `/skills/components/`
**Phụ thuộc:** Tham chiếu `skills/jobs-to-be-done/SKILL.md`, `skills/proto-persona/SKILL.md`
