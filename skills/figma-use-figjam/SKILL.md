---
name: figma-use-figjam
description: "Skill này hỗ trợ các agent sử dụng công cụ MCP use_figma của Figma trong ngữ cảnh FigJam. Có thể dùng song song với figma-use vốn chứa ngữ cảnh nền tảng cho việc sử dụng công cụ use_figma."
disable-model-invocation: false
---

# use_figma — Skill Figma Plugin API cho FigJam

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-use-figjam/SKILL.md) (Figma chính thức).

Skill này chứa ngữ cảnh đặc thù cho FigJam của công cụ MCP `use_figma`. Skill [figma-use](../figma-use/SKILL.md) cung cấp ngữ cảnh nền tảng cho việc thực thi plugin API qua MCP cũng như toàn bộ Figma plugin API cho các trường hợp nâng cao hơn không được mô tả tại đây.

**Luôn đưa `figma-use-figjam` vào tham số `skillNames` phân tách bằng dấu phẩy khi gọi `use_figma` cho các thao tác FigJam. Nếu skill này được tải thông qua tài nguyên MCP, bạn BẮT BUỘC phải thêm tiền tố `resource:` vào tên (ví dụ `resource:figma-use-figjam`).** Đây là tham số ghi log dùng để theo dõi mức độ sử dụng skill — nó không ảnh hưởng đến quá trình thực thi.

> **URL của FigJam là `figma.com/board/...`.** KHÔNG gọi `figma.createPage()` trong FigJam — nó sẽ ném lỗi `TypeError: figma.createPage no such property 'createPage' on the figma global object`. `createPage()` là API chỉ dành riêng cho file Design (`figma.com/design/...`). Các file FigJam chỉ có một trang ngầm định duy nhất; hãy sắp xếp nội dung bằng các section thay thế (xem [create-section](references/create-section.md)).

## Kiểm tra nội dung file FigJam

**`get_figjam` là công cụ kiểm tra dành cho file FigJam.** Nó trả về toàn bộ cây node dưới dạng XML, bao gồm ID của page, section, sticky, connector và các node khác mà bạn cần tham chiếu trong các lần gọi `use_figma` tiếp theo.

- **Sử dụng `get_figjam` ngay từ đầu** trước khi viết bất kỳ mã `use_figma` nào cần tham chiếu đến các node hiện có (ID của trang, ID của section, v.v.). Đừng cố tìm ID bằng cách chạy một script kiểm tra — đầu ra `console.log` từ `use_figma` **không được trả về cho agent** (xem [Quy tắc tối quan trọng số 4 của figma-use](../figma-use/SKILL.md)). Chỉ giá trị `return` mới được trả về.
- **`get_metadata` KHÔNG hoạt động trên file FigJam** — nó chỉ dành cho chế độ design và sẽ lỗi ngay lập tức với thông báo "unsupported for FigJam files".
- **`get_screenshot` yêu cầu một `nodeId` hợp lệ** — truyền một nodeId rỗng sẽ trả về lỗi "invalid nodeId". Hãy lấy các ID từ `get_figjam` trước.
- Nếu bạn quên `return` một ID từ lần gọi `use_figma` trước và giờ đang cần nó, hãy gọi `get_figjam` thay vì chạy lại một script kiểm tra.

## Tải tài liệu tham khảo hiệu quả

Chỉ tải những tài liệu tham khảo mà tác vụ của bạn cần — nhưng khi bạn cần tải nhiều tài liệu, hãy **gọi tất cả các lệnh đọc trong một đợt tool-call song song duy nhất**, đừng gọi tuần tự qua nhiều lượt. Đối với một tác vụ tạo bảng thông thường, điều đó nghĩa là một tin nhắn duy nhất chứa các lệnh đọc cho `plan-board-content` cộng với 3-4 tài liệu tham khảo theo loại node cụ thể mà bạn sẽ dùng.

## Công cụ trì hoãn — Tải schema hàng loạt

Các công cụ MCP của Figma (`use_figma`, `get_figjam`, `get_screenshot`, `get_metadata`, `create_new_file`, `whoami`) thường xuất hiện dưới dạng công cụ trì hoãn (deferred tools) yêu cầu `ToolSearch` tải schema trước khi có thể gọi. **Tải tất cả schema trong một lần gọi `ToolSearch` duy nhất** bằng cú pháp `select:` thay vì mỗi công cụ một lần gọi:

```
ToolSearch query="select:use_figma,get_figjam,get_screenshot,get_metadata,create_new_file"
```

Sáu lần gọi `ToolSearch` tuần tự tương đương sáu lượt khứ hồi trước khi có bất kỳ công việc nào được thực hiện. Một lần gọi gộp chỉ mất một lượt khứ hồi.

## Thay đổi văn bản — Công thức chuẩn

Mọi thao tác thay đổi văn bản trong FigJam (sticky/shape/label/ô bảng/văn bản trên connector, text node độc lập) đều tuân theo cùng công thức như file Design: tải font → `await` → thay đổi → trả về các ID bị ảnh hưởng. Bỏ qua bước tải font sẽ ném lỗi `Cannot write to node with unloaded font "<family> <style>"`. Xem [figma-use → gotchas.md → Canonical text-edit recipe](../figma-use/references/gotchas.md#canonical-text-edit-recipe-font-load--await--mutate--return-ids). Lưu ý đặc thù của FigJam: giá trị mặc định của sublayer khác nhau (sticky → `Inter Medium`, shape → `Inter Medium`, connector → không hợp lệ cho đến khi được đặt), vì vậy hãy luôn tải từ `node.text.fontName` thay vì hardcode `{ family: 'Inter', style: 'Regular' }`.

## Thêm hình ảnh vào bảng FigJam

**`upload_assets` là cách duy nhất được hỗ trợ để thêm hình ảnh vào một file FigJam.** Gọi `upload_assets` với `fileKey` của FigJam; công cụ trả về các URL upload dùng một lần để bạn POST dữ liệu byte ảnh thô tới, và hình ảnh sẽ được lưu và đặt vào bảng tự động. Truyền `nodeIds` (mỗi mục tương ứng một ảnh tải lên) để gắn ảnh vào các node FigJam hiện có dưới dạng fill; bỏ qua `nodeIds` để thả ảnh lên bảng dưới dạng các layer mới.

Để xem cấu trúc request/response đầy đủ, hãy tham khảo [figma-use → api-reference.md → Images](../figma-use/references/api-reference.md#images).

## Tài liệu tham khảo

- [plan-board-content](references/plan-board-content.md) - Đọc tài liệu này cho mọi yêu cầu tạo nội dung bảng — mẫu bảng, retro, brainstorm, ice breaker, bảng họp, khung dàn ý
  - Bao gồm việc lập kế hoạch nội dung bảng được tạo, gồm dàn ý tuần tự, các section, ý định và văn bản phân cấp
  - Điều hướng sang các tài liệu tham khảo khác để xem chi tiết API cụ thể
- [create-section](references/create-section.md) — Tạo và cấu hình các section FigJam (kích thước, đặt tên, màu sắc, hiển thị nội dung, sắp xếp node, bố cục cột)
- [create-sticky](references/create-sticky.md) — Tạo và cấu hình giấy ghi chú FigJam sticky notes (màu sắc, kích thước, văn bản, hiển thị tác giả, tạo hàng loạt)
- [create-connector](references/create-connector.md) — Tạo và cấu hình đường nối FigJam connectors (điểm đầu cuối, mũi tên, kiểu đường, nhãn, màu sắc, nối sơ đồ)
- [create-text](references/create-text.md) — Tạo và cấu hình text node FigJam (tải font, font và màu cài sẵn, kích thước, danh sách, thao tác mind map)
- [position-figjam-nodes](references/position-figjam-nodes.md) — Định vị, chỉnh kích thước và đổi node cha trên canvas (bao gồm bên trong section)
- [create-shape-with-text](references/create-shape-with-text.md) — Tạo và cấu hình hình khối FigJam có văn bản nhúng (loại hình khối, bảng màu cài sẵn, chỉnh kích thước vừa văn bản, bố cục sơ đồ)
- [create-code-block](references/create-code-block.md) — Tạo và cấu hình các node khối mã FigJam code block (ngôn ngữ, tô sáng cú pháp, định vị, nhúng vào section)
- [create-table](references/create-table.md) — Tạo và cấu hình bảng FigJam (hàng, cột, văn bản ô, bảng màu cài sẵn, đổi kích thước)
- [edit-text](references/edit-text.md) — Chỉnh sửa các text node hiện có (tải font, vùng định dạng theo style, tìm/thay thế, màu mặc định FigJam Charcoal)
- [create-label](references/create-label.md) — Tạo và cấu hình các node nhãn FigJam (các dấu tròn đánh số/chữ cái nhỏ, chuỗi thứ tự, định vị)
- [batch-modify](references/batch-modify.md) — Các mẫu chỉnh sửa nhiều node hiện có cùng lúc (đổi style hàng loạt, sắp xếp lại vị trí, cập nhật thuộc tính)
- [figjam-colors](references/figjam-colors.md) — Bảng màu FigJam chuẩn cho mọi loại node (sticky, section, connector, shape, label) cùng quy tắc ký hiệu `hex/255` và hàm hỗ trợ `h()`
