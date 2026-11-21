---
name: audit-design-system
description: Kiểm toán (audit) một màn hình hoặc component Figma để phát hiện sai lệch tích hợp design system, bao gồm thiếu shared component, local override và token chưa được liên kết (unbound tokens).
---

# Kiểm toán Design System (Audit Design System)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [edenspiekermann/Skills](https://github.com/edenspiekermann/Skills/blob/main/skills/audit-design-system/SKILL.md) (Edenspiekermann).

Rà soát một node Figma để tìm bằng chứng cho thấy thiết kế chưa được tích hợp đúng chuẩn với design system.

Skill này chỉ đọc (read-only). Khi người dùng muốn thực hiện hành động ghi sau đó, các skill tuyến sau (downstream skills) nên sử dụng `use_figma` thông qua một helper kiểu `figma-use` khi môi trường chạy yêu cầu.

## Lựa chọn định dạng đầu ra

- **Yêu cầu tường minh từ người dùng được ưu tiên cao nhất**:
  - Nếu người dùng yêu cầu `--json` hoặc JSON, xuất JSON thô (không có markdown fence, không có văn bản diễn giải).
  - Nếu người dùng yêu cầu `--markdown`, markdown hoặc một định dạng dễ đọc cụ thể, xuất báo cáo markdown dễ đọc cho người dùng.
- **Ứng dụng Codex Desktop**: Mặc định xuất JSON thô.
- **Codex CLI và các môi trường dạng chat khác**: Mặc định xuất báo cáo markdown dễ đọc cho người dùng.
- **Các giao diện rà soát tiêu thụ bởi máy (machine-consumed)**: Mặc định xuất JSON thô.
- **Môi trường không rõ ràng**: Nếu môi trường chưa rõ ràng, mặc định xuất markdown.

## Workflow

1. Phân tích dữ liệu đầu vào Figma.
   Chấp nhận một URL Figma đầy đủ, hoặc một cặp `fileKey` và `nodeId`.
   Chuẩn hóa node ID từ `72-293` sang `72:293` khi cần thiết.

2. Lấy tối thiểu các bằng chứng cần thiết bằng các công cụ đọc Figma MCP.
   Gọi `get_design_context` cho đúng node đang được rà soát.
   Gọi `get_screenshot` để xác nhận trực quan.
   Gọi `get_variable_defs` để xem những variable nào thực sự đang được bind.
   Gọi `get_code_connect_map` khi có liên quan.
   Gọi `get_metadata` khi node được rà soát có kích thước lớn, lặp lại nhiều lần hoặc dạng board và bạn cần lập bản đồ các nested instance trước khi đi sâu vào chi tiết.
   Gọi `search_design_system` khi bạn đã xác định được một primitive có khả năng chưa được hệ thống hóa và có cơ hội thực tế để đề xuất thành phần thay thế cụ thể từ design system đang kiểm toán.

3. Rà soát các lỗi hệ thống hóa, không đánh giá theo gu thẩm mỹ cá nhân.
   Tìm những chỗ mà thiết kế đáng lẽ phải kế thừa từ design system nhưng lại bị dựng cục bộ (locally constructed).
   Mọi finding phải dựa trên cấu trúc hiển thị trong Figma: các instance, các frame bị nhân bản thủ công, giá trị thô (raw values), sai lệch variant (variant drift) hoặc thiếu liên kết token.
   Thà bỏ sót còn hơn đưa ra các finding yếu thiếu cơ sở.

4. Khi bằng chứng đủ mạnh, hãy đề xuất ứng viên thay thế.
   Sau khi xác định được một custom primitive khả nghi, sử dụng `search_design_system` để tìm họ component (component family) khớp nhất từ design system đang kiểm toán.
   Chỉ đưa vào một ứng viên khi sự tương đồng đủ đáng tin cậy về mặt cấu trúc và đặt tên, không chỉ dựa vào sự giống nhau trên ảnh chụp màn hình.
   Nếu kết quả tìm kiếm bị nhiễu hoặc mơ hồ, hãy bỏ qua ứng viên thay vì đoán mò.

5. Trình bày các finding theo định dạng phù hợp dựa trên môi trường.
   Sử dụng JSON cho Codex Desktop và các giao diện rà soát tiêu thụ bởi máy, sử dụng markdown cho Claude Code CLI và các môi trường dạng chat khác (xem mục Lựa chọn định dạng đầu ra ở trên).

6. Khi người dùng muốn sửa lỗi, điều hướng đến đúng skill tuyến sau.
   Ưu tiên [fix-design-system-finding](../fix-design-system-finding/SKILL.md) khi cần sửa một node vi phạm cụ thể.
   Ưu tiên [apply-design-system](../apply-design-system/SKILL.md) khi người dùng muốn một lượt xử lý rộng trên toàn màn hình, nhiều section cần khắc phục đồng bộ, hoặc lượt rà soát này đang được dùng để xác định phạm vi trước khi tiến hành ghi sửa đổi.

## Những gì cần gắn cờ (Flag)

- Các UI primitive dùng chung bị tạo lại dưới dạng ad-hoc frame thay vì component instance.
  Các đối tượng thường gặp: buttons, icon buttons, cards, alerts, pills, chips, avatars, stat tiles, tab bars, nav bars, FABs, list rows.

- Các cấu trúc đồng cấp lặp lại mà lẽ ra phải gộp thành một primitive tái sử dụng.
  Ví dụ: ba stat tile gần như giống hệt nhau chỉ khác nội dung.

- Các giá trị trực quan bị hard-code ở những nơi mà phần còn lại của design system đang dùng variables.
  Các đối tượng thường gặp: fills, strokes, text colors, radius, spacing, typography, shadows.
  Chỉ gắn cờ mục này khi có bằng chứng cụ thể, ví dụ như một mã hex thô hoặc thông số hình học tự chế nằm ngay cạnh các thành phần đồng cấp đã được gắn token.

- Thanh điều hướng toàn cục (global navigation) hoặc các mẫu có sức ảnh hưởng lớn khác được dựng từ custom frame thay vì system component.
  Hãy gắn cờ quyết liệt các trường hợp này vì sự sai lệch ở đây sẽ lan rộng ra nhiều màn hình.

- Sai lệch variant (variant drift) bên trong một component mang tính danh nghĩa.
  Ví dụ: một nút chỉnh sửa cục bộ có kích thước, độ dày nét (stroke width) hoặc bo góc (radius) bất thường không khớp với icon-button primitive kỳ vọng.

## Những gì KHÔNG gắn cờ

- Các sở thích mang tính thẩm mỹ thuần túy.
- Nội dung văn bản (copywriting) hoặc các quyết định sản phẩm.
- Các lựa chọn bố cục có lý do chính đáng để giữ riêng cho từng màn hình.
- Các bố cục tổng hợp dùng một lần (one-off compositions) khi các primitive bên dưới đã được component hóa và gắn token đầy đủ.
- Các nhận định đòi hỏi phải suy đoán thiếu tài liệu về một design library.

## Tiêu chuẩn bằng chứng

Mỗi finding phải trả lời được cả hai câu hỏi:

1. Bằng chứng cụ thể nào trong Figma cho thấy thành phần này chưa được hệ thống hóa đúng cách?
2. Tại sao điều đó lại quan trọng đối với khả năng lan tỏa cập nhật (propagation), tính nhất quán, theming hoặc bảo trì?

Bằng chứng tốt bao gồm:

- một node đang là plain frame trong khi lẽ ra phải là một instance
- nhiều node đồng cấp lặp lại cùng một cấu trúc
- các giá trị màu sắc hoặc hình học thô xuất hiện tại nơi lẽ ra phải áp dụng variables hoặc các primitive chuẩn
- một mẫu toàn cục bị tự dựng thủ công

Bằng chứng yếu bao gồm:

- "cái này trông có vẻ tự chế"
- "bình thường tôi sẽ biến cái này thành một component"
- bất kỳ nhận định nào chỉ dựa trên cảm quan thẩm mỹ của ảnh chụp màn hình mà không có cơ sở cấu trúc

## Quy tắc đề xuất thay thế

Khi một finding liên quan đến việc thiếu một shared primitive, hãy cố gắng đính kèm một gợi ý thay thế khả dĩ.

Sử dụng `search_design_system` sau khi bạn đã biết loại thành phần nào đang bị thiếu, ví dụ:
- cụm avatar tự chế (custom avatar cluster)
- stat tile thiết kế riêng (bespoke stat tile)
- thẻ cảnh báo cục bộ (local alert card)
- mục điều hướng dựng tay (hand-built navigation item)

Chỉ đề xuất phương án thay thế khi:
- vai trò của node đã rõ ràng
- kết quả tìm kiếm thuộc về đúng library liên quan hoặc ngữ cảnh tệp đang kiểm toán
- ứng viên đó hợp lý về mặt cấu trúc đối với finding

Ngôn ngữ đề xuất tốt:
- `Custom avatar frame này nhiều khả năng có thể được thay thế bằng Avatar từ library X.`
- `Các stat tile lặp lại này dường như tương ứng với Metric item từ library X.`

Không phóng đại hoặc khẳng định quá mức:
- không khẳng định component được đề xuất chắc chắn đúng trừ khi bằng chứng thật sự rõ ràng
- không ép buộc phải có ứng viên thay thế cho mọi finding
- không khuyến nghị một component từ library không liên quan chỉ vì công cụ tìm kiếm trả về nó đầu tiên

## Định dạng đầu ra

### Đầu ra JSON

Khi định dạng đầu ra được chọn là JSON, trả về chính xác cấu trúc JSON này, không có markdown fence và không có văn bản thừa bên ngoài:

```json
{
  "findings": [
    {
      "title": "<= 80 chars, imperative>",
      "body": "<valid Markdown explaining why this is a problem>",
      "confidence_score": 0.0,
      "priority": 0,
      "code_location": {
        "absolute_file_path": "/figma/<fileKey>/nodes/<nodeId>",
        "line_range": {
          "start": 1,
          "end": 1
        }
      }
    }
  ],
  "overall_correctness": "patch is correct" | "patch is incorrect",
  "overall_explanation": "<1-3 sentence summary>",
  "overall_confidence_score": 0.0
}
```

Ghi chú về schema:

- Sử dụng `overall_correctness: "patch is incorrect"` bất cứ khi nào bạn phát hiện một hoặc nhiều vấn đề tích hợp design system.
- Chỉ sử dụng `overall_correctness: "patch is correct"` khi không có finding nào.
- Đối với mỗi finding, đặt `code_location.absolute_file_path` thành `/figma/<fileKey>/nodes/<nodeId>` sử dụng node vi phạm cụ thể nhất.
- Luôn đặt `line_range.start` và `line_range.end` bằng `1`.

### Báo cáo Markdown dễ đọc cho người dùng

Khi định dạng đầu ra được chọn là markdown, hãy trình bày một báo cáo markdown được định dạng gồm:

1. **Phần tiêu đề (Header section):**
   - Tên tệp và node đang được rà soát
   - Kết luận tổng thể: ✅ Passes / ⚠️ Needs Work / ❌ Significant Issues
   - Tỷ lệ phần trăm độ tin cậy

2. **Tóm tắt (Summary):** 2-3 câu giải thích trạng thái tổng thể

3. **Bảng các finding (Findings table):** Tổng quan nhanh kèm các chỉ báo mức độ ưu tiên
   - 🔴 Critical (priority 3): vấn đề nghiêm trọng ở cấp library hoặc cấp điều hướng
   - 🟠 High (priority 2): vấn đề quan trọng về reusable primitive hoặc token hóa
   - 🟡 Medium (priority 1): sai lệch hệ thống ở mức vừa phải
   - ⚪ Low (priority 0): lỗi nhỏ (nits) hoặc vấn đề nhất quán ít tác động

4. **Phần chi tiết (Details section):** Mở rộng từng finding với:
   - Vấn đề là gì (bằng chứng cụ thể từ cấu trúc Figma)
   - Tại sao điều này quan trọng (tác động tới bảo trì, tính nhất quán, theming)
   - Thành phần thay thế khả dĩ, khi được `search_design_system` hỗ trợ tìm thấy
   - Các node ID bị ảnh hưởng để tham chiếu

5. **Khuyến nghị (Recommendations):** Các hạng mục hành động theo thứ tự ưu tiên

### Quy tắc đầu ra

- Giữ các finding tập trung vào những vấn đề có tín hiệu cao nhất. Thường từ 0-6 finding.
- Giữ tiêu đề ở dạng câu mệnh lệnh (imperative) và dưới 80 ký tự.
- Luôn neo từng finding vào một node ID cụ thể để người dùng có thể định vị nó trong Figma.
- Đối với đầu ra JSON, không tự bịa ra đường dẫn hệ thống tệp. Sử dụng chính xác `/figma/<fileKey>/nodes/<nodeId>`.
- Khi có một đề xuất thay thế đáng tin cậy, hãy đưa nó vào phần `body` của finding.

## Heuristic rà soát

Sử dụng `priority` như sau:

- `0`: lỗi nhỏ (nit) hoặc vấn đề nhất quán tác động thấp
- `1`: sai lệch hệ thống ở mức vừa phải
- `2`: vấn đề quan trọng về reusable primitive hoặc token hóa
- `3`: vấn đề nghiêm trọng ở cấp library hoặc cấp điều hướng có khả năng lan rộng

Sử dụng `confidence_score` như sau:

- `0.9-1.0`: bằng chứng cấu trúc trực tiếp
- `0.7-0.89`: suy luận mạnh mẽ từ sự lặp lại và việc sử dụng token ở các thành phần lân cận
- `0.5-0.69`: có vẻ hợp lý nhưng bằng chứng chưa đầy đủ; ưu tiên bỏ qua thay vì đưa vào

## Phạm vi Board và Screen

Đối với một màn hình đơn lẻ:

- kiểm tra root node
- đào sâu vào các node con lặp lại hoặc có sức ảnh hưởng lớn
- neo các finding vào node vi phạm cụ thể nhất

Đối với một board hoặc trang lớn hơn:

- sử dụng `get_metadata` trước để xác định các màn hình ứng viên hoặc các module lặp lại
- chỉ rà soát những node liên quan nhất thay vì cố gắng kiểm toán mọi thứ
- giữ các finding đúng phạm vi và có bằng chứng hậu thuẫn

## Ví dụ câu lệnh kích hoạt

- "Review this Figma screen for design-system integration"
- "Audit this board for missing component usage"
- "Check whether this design uses tokens correctly"
- "/audit-design-system https://figma.com/design/..."
- "/audit-design-system --json https://figma.com/design/..." (dành cho đầu ra JSON)

## Hướng dẫn bàn giao

Sử dụng quy tắc điều hướng này sau khi rà soát:
- một finding cụ thể với phạm vi ghi hẹp: sử dụng [fix-design-system-finding](../fix-design-system-finding/SKILL.md)
- nhiều finding có thể gộp thành một lượt đối chiếu trên phạm vi màn hình hoặc section rộng hơn: sử dụng [apply-design-system](../apply-design-system/SKILL.md)

Không ép mọi kết quả rà soát đều phải đi qua skill sửa một finding đơn lẻ. Một số lượt rà soát phù hợp hơn để làm bước khám phá phạm vi cho một lượt áp dụng (apply pass) rộng hơn.
