---
name: figma-generate-diagram
description: "Điều kiện tiên quyết BẮT BUỘC — nạp skill này TRƯỚC mọi lần gọi tool `generate_diagram`. KHÔNG BAO GIỜ gọi `generate_diagram` trực tiếp mà chưa nạp skill này trước. Kích hoạt bất cứ khi nào người dùng yêu cầu tạo, sinh, vẽ, kết xuất, phác thảo hoặc xây dựng một sơ đồ — flowchart, architecture diagram, sequence diagram, ERD hoặc entity-relationship diagram, state diagram hoặc state machine, gantt chart hoặc timeline. Cũng kích hoạt khi người dùng nhắc đến cú pháp Mermaid hoặc muốn trực quan hóa kiến trúc hệ thống, cây quyết định, đồ thị phụ thuộc, luồng gọi API, quy trình bắt tay xác thực (auth handshake), lược đồ dữ liệu (schema) hoặc pipeline trong FigJam. Skill này điều hướng tới hướng dẫn theo từng loại sơ đồ, đặt các ràng buộc Mermaid phổ quát và cho bạn biết khi nào cần dùng loại sơ đồ khác hoặc bỏ qua tool hoàn toàn (mindmap, pie chart, class diagram, v.v.)."
---

# generate-diagram

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-generate-diagram/SKILL.md) (Figma chính thức).

**Bạn BẮT BUỘC phải nạp skill này trước mọi lần gọi tool `generate_diagram`.** Bỏ qua nó sẽ gây ra các lỗi kết xuất đáng tiếc và đầu ra kém chất lượng.

`generate_diagram` nhận cú pháp Mermaid.js và tạo ra một sơ đồ FigJam có thể chỉnh sửa được. Skill này dẫn bạn tới đúng hướng dẫn cho từng loại sơ đồ và thiết lập các ràng buộc phổ quát.

## Bước 1: `generate_diagram` có phải tool phù hợp không?

### Các loại sơ đồ được hỗ trợ

`flowchart`, `sequenceDiagram`, `stateDiagram` / `stateDiagram-v2`, `gantt`, `erDiagram`.

### Không được hỗ trợ — không gọi tool

Nếu người dùng muốn bất kỳ loại nào dưới đây, hãy báo thẳng cho họ biết `generate_diagram` không hỗ trợ thay vì gọi tool rồi để lỗi:
- **Pie chart, mindmap, venn diagram, class diagram, journey, timeline, quadrant, C4, git graph, requirement diagram**

### Khi nào nên hướng người dùng tự sửa trong Figma

Tool này không thể:
- Đổi font chữ trên một sơ đồ đã có sẵn
- Di chuyển từng hình khối riêng lẻ
- Sửa từng node của sơ đồ sau khi đã sinh

Nếu người dùng yêu cầu bất kỳ thao tác nào trong số đó trên một sơ đồ hiện có, hãy khuyến nghị họ mở sơ đồ trong Figma và chỉnh sửa tại đó. Đối với các thay đổi ở mức nội dung, sinh lại sơ đồ thường nhanh hơn.

## Bước 2: Chọn loại sơ đồ

Điều hướng nhanh — chọn mục khớp đầu tiên.

| Người dùng muốn… | Loại | Bước tiếp theo |
|---|---|---|
| Services + datastores + queues + integrations | **Architecture flowchart** | Đọc [references/architecture.md](./references/architecture.md) |
| Cây quyết định, luồng quy trình, pipeline, đồ thị phụ thuộc, hành trình người dùng | **Flowchart** | Đọc [references/flowchart.md](./references/flowchart.md) |
| Tương tác giữa các bên theo thời gian (gọi API, xác thực, nhắn tin) | **Sequence diagram** | Đọc [references/sequence.md](./references/sequence.md) |
| Mô hình dữ liệu, bảng, khóa (keys), quan hệ lực lượng (cardinality) | **ER diagram** | Đọc [references/erd.md](./references/erd.md) |
| Các trạng thái có tên kèm chuyển đổi qua lại giữa chúng | **State diagram** | Đọc [references/state.md](./references/state.md) |
| Lịch trình dự án kèm ngày tháng, cột mốc (milestones) | **Gantt chart** | Đọc [references/gantt.md](./references/gantt.md) |

Nếu một flowchart được yêu cầu mô tả hạ tầng phần mềm (services, datastores, queues, tích hợp ngoài), hãy điều hướng sang `architecture.md` — không phải `flowchart.md`. Khi phân vân, hãy hỏi người dùng.

## Bước 3: Ràng buộc phổ quát (áp dụng cho mọi loại sơ đồ)

1. **Không dùng emoji** ở bất kỳ phần nào trong mã nguồn Mermaid. Tool sẽ từ chối chúng.
2. **Không dùng `\n`** trong nhãn (label). Chỉ xuống dòng khi thực sự bắt buộc và chỉ dùng ký tự xuống dòng thật (không dùng chuỗi escape).
3. **Không dùng thẻ HTML** trong nhãn.
4. **Các từ khóa bảo lưu (Reserved words)** — không dùng `end`, `subgraph`, `graph` làm node ID.
5. **Node IDs**: dùng camelCase (`userService`), không khoảng trắng. Dấu gạch dưới có thể làm hỏng việc định tuyến cạnh ở một số bộ xử lý.
6. **Các ký tự đặc biệt trong nhãn** phải được bọc trong dấu ngoặc kép: `A["Process (main)"]`, `-->|"O(1) lookup"|`.
7. **Sequence diagrams** — các lệnh Mermaid `Note over X` / `Note left of X` / `Note right of X` bị trình kết xuất lược bỏ âm thầm; đừng đưa chúng vào mã nguồn. Nếu người dùng muốn có chú thích trên sequence diagram, hãy sinh sơ đồ nền trước rồi thêm sticky note/văn bản qua quy trình kết hợp ([references/workflow.md](references/workflow.md)).
8. **Gantt charts** — `classDef`, `class` và mọi định dạng style khác bị bước tiền xử lý lược bỏ; biểu đồ kết xuất ra sẽ không có màu sắc. Nếu người dùng muốn phân màu theo giai đoạn, cột mốc hoặc tác vụ, hãy sinh biểu đồ nền trước rồi thêm màu sắc/chú thích qua quy trình kết hợp ([references/workflow.md](references/workflow.md)) — hoặc, đối với các sơ đồ bắt buộc phải có styling ngay từ bản chất, hãy dựng timeline trực tiếp bằng `use_figma` thay thế (xem [references/gantt.md](references/gantt.md) §11).
9. **Chỉ dùng các API của FigJam trong bất kỳ phần mở rộng `use_figma` nào.** Đầu ra của `generate_diagram` nằm trong một file FigJam (`figma.com/board/...`), nên các phần mở rộng kết hợp phải tuân thủ các API được FigJam hỗ trợ. KHÔNG gọi `figma.createPage()` — hàm đó chỉ dành cho Design (`figma.com/design/...`) và ném lỗi `TypeError: figma.createPage no such property 'createPage' on the figma global object` trong FigJam. Hãy tổ chức nội dung bằng FigJam sections thay thế (xem [figma-use-figjam](../figma-use-figjam/SKILL.md)).

## Bước 4: Đầu vào rác thì đầu ra cũng rác

Chất lượng sơ đồ được sinh ra bị giới hạn bởi chất lượng mã Mermaid bạn viết, và chất lượng Mermaid lại bị giới hạn bởi ngữ cảnh bạn có. Trước khi viết Mermaid, hãy đảm bảo bạn có đủ thông tin thực tế để mô tả chính xác đối tượng — và tận dụng mọi thứ môi trường hiện tại cung cấp để thu thập thông tin đó.

Tùy vào những gì khả dụng, các nguồn ngữ cảnh hữu ích bao gồm:

- **Mã nguồn** — grep/đọc các file liên quan để sơ đồ phản ánh đúng tên service thực, nhãn cạnh thực, datastore thực, điểm đầu vào (entry point) thực. Lần theo các route/handler/consumer thực tế tốt hơn nhiều so với tự nhớ lại.
- **Tài liệu do người dùng cung cấp** — PRD, spec, ghi chú cuộc họp, bản chép lời (transcript), tổng hợp nghiên cứu, tài liệu onboarding, mô tả quy trình. Đề nghị người dùng dán hoặc đính kèm nếu chủ đề không phải mã nguồn.
- **Các file Figma hoặc FigJam hiện có** — nếu sơ đồ mới cần đồng bộ với một sơ đồ người dùng đã có, hãy đọc nó bằng `get_figjam` hoặc `get_design_context` (xem các skill `figma-use` và `figma-use-figjam`).
- **Các MCP server hoặc tool khác bạn có sẵn** — hệ thống quản lý issue, trang tài liệu, CRM, công cụ phân tích, wiki nội bộ, design system, database schema, v.v. Nếu một tool đã kết nối đang nắm nguồn chuẩn cho thứ bạn sắp vẽ sơ đồ, hãy lấy dữ liệu từ đó thay vì đoán.
- **Chính người dùng** — khi mô tả còn mỏng hoặc mơ hồ (không rõ chiều luồng đi, không rõ phạm vi, không rõ các thực thể nào quan trọng), hãy hỏi một hoặc hai câu hỏi trọng tâm trước khi sinh. Ví dụ: "3–5 bước chính là gì?", "Ai phụ trách mỗi bước?", "Điều gì kích hoạt bước tiếp theo?". Một câu hỏi hay tốt hơn một sơ đồ lãng phí.

Đừng tự bịa thêm cạnh, nhãn hay thực thể để "lấp đầy" sơ đồ. Thiếu thông tin còn hơn là thông tin bịa đặt — hãy để trống chỗ đó và báo lại cho người dùng.

## Bước 5: Sơ đồ có cần những thứ vượt quá khả năng biểu đạt của Mermaid không?

Mermaid không thể làm mọi thứ. Chú thích bằng sticky-note gắn vào các node cụ thể, tô màu theo domain trên từng node của ERD, các hộp chú giải (callout) kèm dữ liệu đính kèm — tất cả đều đòi hỏi phải kết hợp `generate_diagram` với `use_figma` (thông qua skill [figma-use-figjam](../figma-use-figjam/SKILL.md)). Đây là **quy trình kết hợp (hybrid workflow)**.

Đây là quyết định dựa trên phán đoán, không phải mặc định. Triển khai nó khi yêu cầu của người dùng thực sự hưởng lợi — bỏ qua khi sơ đồ nền hiển nhiên là đủ. Dấu hiệu nên dùng: người dùng yêu cầu rõ ràng các ghi chú, màu sắc, callout hoặc "X gắn vào mỗi node"; họ chia sẻ dữ liệu ánh xạ tới từng node cụ thể; sơ đồ là một sản phẩm để chia sẻ chính thức, không phải bản nháp tư duy. Dấu hiệu không cần: yêu cầu ngắn/tự giải thích rõ ràng, sơ đồ nhỏ, người dùng đang thăm dò hoặc thử nghiệm.

**Nếu quy trình kết hợp là cần thiết, hãy đọc [references/workflow.md](./references/workflow.md) trước khi gọi `generate_diagram`** — tài liệu đó trình bày mẫu thiết kế, hai công thức cốt lõi (chú thích + phân màu), phong cách giao tiếp và cách xử lý lỗi. Nếu không cần, đi thẳng tới Bước 6.

## Bước 6: Gọi tool

Tham số bắt buộc:
- `name`: tiêu đề mang tính mô tả (hiển thị cho người dùng)
- `mermaidSyntax`: mã nguồn Mermaid

Tham số tùy chọn:
- `userIntent`: một câu ngắn mô tả điều người dùng đang cố đạt được — hỗ trợ telemetry và tinh chỉnh phía sau
- `useArchitectureLayoutCode`: **chỉ dành cho sơ đồ kiến trúc**; giá trị được chỉ định trong `references/architecture.md`
- `fileKey`: nếu người dùng muốn thêm sơ đồ vào một file FigJam hiện có thay vì tạo file mới

**Không** gọi `create_new_file` trước `generate_diagram` — tool này tự tạo file riêng của nó.

## Bước 7: Sau khi sinh sơ đồ

- Tool trả về một liên kết (hoặc widget) để người dùng bấm vào mở sơ đồ trong FigJam. Hiển thị nó dưới dạng liên kết markdown trừ khi client tự kết xuất thành widget inline.
- Nếu cần các phần mở rộng (xem Bước 5), hãy kết hợp với `use_figma` ngay lúc này — mẫu thiết kế và công thức nằm trong [references/workflow.md](./references/workflow.md).
- Nếu người dùng không hài lòng sau 2 lần thử trên cùng một sơ đồ, hãy dừng việc sinh lại. Hỏi rõ điểm nào chưa đúng, hoặc gợi ý họ mở trong Figma và sửa thủ công thay vì tiêu tốn thêm các lượt gọi tool.

### Dùng lại cùng một file khi lặp lại chỉnh sửa hoặc thêm các sơ đồ liên quan

Mỗi lần gọi `generate_diagram` không có `fileKey` sẽ tạo một file FigJam mới trong mục nháp (drafts) của người dùng. Sinh lại 4 lần = 4 file nháp cần dọn dẹp. Ưu tiên dùng lại file hiện có khi:

- Người dùng đang lặp lại chỉnh sửa trên cùng một sơ đồ ("thử lại với…", "đổi các nhãn…").
- Người dùng muốn một sơ đồ tiếp nối nằm cạnh sơ đồ đầu tiên (ví dụ một sequence diagram nằm cạnh flowchart của cùng hệ thống).

Cách dùng lại:

1. **Truyền `fileKey`** trong các lần gọi `generate_diagram` tiếp theo. Trích xuất từ URL `figma.com/board/{fileKey}/...`. Sơ đồ sẽ được thêm vào file hiện có thay vì tạo file mới.
2. Nếu bạn muốn thay thế sơ đồ trước đó thay vì thêm vào bên cạnh, hãy dùng tool `use_figma` (xem skill `figma-use-figjam`) để xóa các node của sơ đồ cũ trước, sau đó gọi `generate_diagram` với cùng `fileKey`. Hoặc giữ lại sơ đồ cũ và đặt sơ đồ mới bên cạnh — người đọc thường hưởng lợi khi nhìn thấy lịch sử các lần thử.

Hãy hỏi người dùng xem họ thích phương án nào ngay lần đầu lặp lại — "sinh đè lên bản cũ, hay giữ cả hai bản đặt cạnh nhau?" — và ghi nhớ câu trả lời của họ cho các lần lặp tiếp theo trong phiên làm việc.
