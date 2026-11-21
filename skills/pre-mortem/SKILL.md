---
name: pre-mortem
description: "Thực hiện phân tích rủi ro pre-mortem trên một PRD hoặc kế hoạch ra mắt (launch plan). Phân loại rủi ro thành Tigers (vấn đề thực sự), Paper Tigers (lo ngại bị thổi phồng), và Elephants (nỗi lo chưa được nói ra), sau đó xếp loại thành launch-blocking (chặn ra mắt), fast-follow (xử lý ngay sau ra mắt), hoặc track (theo dõi). Dùng khi chuẩn bị ra mắt sản phẩm, stress-test kế hoạch sản phẩm, hoặc nhận diện những gì có thể gặp sự cố."
---

# Pre-Mortem: Phân tích Rủi ro cho Kế hoạch Ra mắt Sản phẩm

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [phuryn/pm-skills](https://github.com/phuryn/pm-skills/blob/main/pm-execution/skills/pre-mortem/SKILL.md) (phuryn).

## Mục đích

Bạn là một product manager kỳ cựu đang thực hiện phân tích pre-mortem cho `$ARGUMENTS`. Skill này giả định kịch bản ra mắt thất bại và lần ngược lại để xác định các rủi ro thực sự, phân biệt chúng với những lo lắng cảm tính, và lập kế hoạch hành động nhằm giảm thiểu các vấn đề có thể chặn việc ra mắt (launch-blocking).

## Bối cảnh

Pre-mortem là một bài tập nhận diện rủi ro có cấu trúc, buộc đội ngũ phải tư duy phản biện về những gì có thể trục trặc trước khi ra mắt, khi vẫn còn thời gian để hành động. Bằng cách giả định rằng dự án đã thất bại, chúng ta đưa những lo ngại ẩn giấu ra ánh sáng và tách bạch mối đe dọa thực thụ khỏi những lo âu bị thổi phồng.

## Hướng dẫn thực hiện

1. **Thu thập PRD**: Nếu người dùng cung cấp tệp PRD hoặc kế hoạch sản phẩm, hãy đọc kỹ lưỡng. Hiểu rõ sản phẩm, thị trường mục tiêu, các giả định chính và tiến độ. Nếu liên quan, hãy sử dụng tìm kiếm web để nghiên cứu bối cảnh cạnh tranh hoặc điều kiện thị trường.

2. **Tư duy từng bước**:
   - Hãy tưởng tượng sản phẩm sẽ ra mắt trong 14 ngày nữa
   - Giờ hãy tưởng tượng nó thất bại — khách hàng không đón nhận, mục tiêu doanh thu không đạt, uy tín bị ảnh hưởng
   - Điều gì đã xảy ra sai sót?
   - Chúng ta đã bỏ sót điều gì hoặc thực thi chưa tốt ở đâu?
   - Chúng ta đã quá tự tin vào điều gì?

3. **Phân loại rủi ro**: Xếp mỗi nguy cơ thất bại tiềm ẩn vào một trong ba nhóm:

   **Tigers (Hổ thật)**: Những vấn đề thực sự mà chính bạn nhìn thấy có thể làm trật bánh dự án
   - Dựa trên bằng chứng, kinh nghiệm quá khứ hoặc logic rõ ràng
   - Đáng khiến bạn mất ngủ
   - Đòi hỏi hành động xử lý

   **Paper Tigers (Hổ giấy)**: Những vấn đề người khác có thể lo ngại, nhưng bạn không tin chúng là mối nguy thực sự
   - Thoạt nhìn có vẻ hợp lý, nhưng ít khả năng xảy ra hoặc bị thổi phồng
   - Không đáng đầu tư nhiều nguồn lực
   - Đáng ghi nhận lại để tạo sự đồng thuận với các bên liên quan

   **Elephants (Con voi trong phòng)**: Điều bạn chưa chắc có phải vấn đề hay không, nhưng cả đội đang không thảo luận đủ về nó
   - Những lo ngại ngầm hoặc giả định chưa có ai kiểm chứng
   - Có thể là rủi ro thật; bạn chưa chắc chắn
   - Xứng đáng được điều tra kỹ trước khi ra mắt

4. **Phân loại Tigers theo mức độ khẩn cấp**:

   **Launch-Blocking (Chặn ra mắt)**: Bắt buộc phải giải quyết trước khi ra mắt
   - Ví dụ: Tính năng cốt lõi bị hỏng, rào cản pháp lý/quy định, phụ thuộc với khách hàng trọng điểm chưa được đáp ứng

   **Fast-Follow (Xử lý nối tiếp nhanh)**: Bắt buộc phải giải quyết trong vòng 30 ngày sau khi ra mắt
   - Ví dụ: Vấn đề hiệu năng, các tính năng phụ chưa hoàn thiện

   **Track (Theo dõi)**: Giám sát sau khi ra mắt; xử lý nếu nó thực sự trở thành vấn đề
   - Ví dụ: Các tính năng bổ trợ (nice-to-have), các trường hợp biên (edge cases)

5. **Tạo kế hoạch hành động**: Với mỗi Tiger ở mức Launch-Blocking:
   - Mô tả rủi ro một cách rõ ràng
   - Đề xuất hành động giảm thiểu cụ thể
   - Xác định người phụ trách phù hợp nhất (bộ phận/cá nhân)
   - Đặt ngày ra quyết định/hoàn thành

6. **Cấu trúc đầu ra**: Trình bày bản phân tích theo cấu trúc:

   ```
   ## Pre-Mortem Analysis: [Product Name]

   ### Tigers (Real Risks)
   [List each real risk with category and mitigation plan]

   ### Paper Tigers (Overblown Concerns)
   [List each, explain why it's not a true risk]

   ### Elephants (Unspoken Worries)
   [List each, recommend investigation approach]

   ### Action Plans for Launch-Blocking Tigers
   [For each, include: Risk, Mitigation, Owner, Due Date]
   ```

7. **Lưu đầu ra**: Lưu thành một tài liệu markdown: `PreMortem-[product-name]-[date].md`

## Lưu ý

- Hãy trung thực và mang tính xây dựng — mục tiêu là nâng cao mức độ sẵn sàng ra mắt, không phải quy trách nhiệm
- Mặc định xếp vào "Tiger" nếu còn phân vân; xử lý rủi ro sớm luôn tốt hơn
- Thu hút góc nhìn đa chức năng (kỹ thuật, thiết kế, go-to-market) vào quá trình phân tích
- Các "Elephants" chỉ lộ diện khi mọi người có thể nêu ý kiến ẩn danh. Khi làm việc cùng đội ngũ, hãy thu thập rủi ro ẩn danh trước khi thảo luận: một phòng hỏi đáp trực tiếp nơi mọi người viết ra rủi ro và bình chọn (upvote) ý kiến của nhau sẽ giúp xếp hạng nỗi lo phổ biến nhất lên đầu (skill `live-qa`)
- Xem lại bản pre-mortem 2–3 tuần trước ngày ra mắt để xác nhận các biện pháp giảm thiểu đang đi đúng tiến độ

---

### Tài liệu đọc thêm

- [How Meta and Instagram Use Pre-Mortems to Avoid Post-Mortems](https://www.productcompass.pm/p/how-to-run-pre-mortem-template)
- [How to Manage Risks as a Product Manager](https://www.productcompass.pm/p/how-to-manage-risks-as-a-product-manager)
