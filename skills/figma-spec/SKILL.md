---
name: figma-spec
description: "Skill này là bắt buộc để tạo, đọc, chỉnh sửa, rà soát hoặc bình luận trên các Figma spec. Bạn phải đọc skill này khi làm việc trên một PRD, brief, RFC hoặc bất kỳ loại tài liệu nào trong một Figma spec độc lập hay một Figma spec nhúng trong file Figma Design hoặc FigJam."
disable-model-invocation: false
---

# Làm việc với Figma spec

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-spec/SKILL.md) (Figma chính thức).

Kiểm tra xem `figma.spec` có được định nghĩa trong script `use_figma` đầu tiên của bạn hay không; thuộc tính này chỉ tồn tại khi gói dịch vụ (plan) của file có bật tính năng Specs. Nếu nó là `undefined`, hãy giải thích rằng Specs chưa được bật cho gói của file này và dừng quy trình. Để tạo một file Figma spec độc lập mới, gọi `whoami` để chọn gói đích, sau đó gọi `create_new_file` với `editorType: "figspec"` và `key` của gói đó làm `planKey`. Nếu hệ thống báo Figma Specs không khả dụng trên gói đó, hãy gợi ý các gói khác của người dùng hoặc dừng lại.

Một Figma spec gốc là GitHub-Flavored Markdown (GFM) nằm dưới một node `SPEC_BLOCK`. Một file Figma spec độc lập chỉ là một spec duy nhất; một file FigJam hoặc Design có thể chứa nhiều spec nhúng bên trong.

## Khám phá và chọn Figma spec

Phân giải tham số `node-id` từ URL được cung cấp khi có mặt bằng `figma.getNodeByIdAsync` và yêu cầu `type === "SPEC_BLOCK"` kèm `specBlockType === "DOCUMENT"`. Nếu không có, tìm kiếm trên trang hiện tại bằng `findAllWithCriteria({ types: ['SPEC_BLOCK'] })`, lọc theo `specBlockType === "DOCUMENT"` (và kiểm tra nội dung bằng `figma.spec.getContent` nếu cần) cho đến khi tìm thấy mục tiêu. Nếu không nằm trên trang hiện tại, nạp lần lượt từng trang khác bằng `page.loadAsync()` và lặp lại truy vấn, dừng lại ngay khi xác định được mục tiêu.

Truyền root ID đã phân giải vào mọi lệnh gọi nội dung. Chỉ bỏ qua `specNodeId` khi biết chắc chắn file chứa đúng một Figma spec duy nhất; nếu không việc bỏ qua sẽ ném lỗi. Tuyệt đối không chỉnh sửa các text node thông thường trên canvas làm phương án thay thế.

## Tạo Figma spec trên canvas

```js
// Creates an embedded Figma spec on a Design or FigJam canvas (not a standalone Figma spec file).
const { specNodeId } = await figma.spec.createOnCanvasAsync({
  title: 'Untitled spec',
  content: '# Title\n\nA paragraph.\n',
})

const specNode = await figma.getNodeByIdAsync(specNodeId)
if (!specNode) throw new Error('The created Figma spec could not be resolved')

const after = await figma.spec.getContent({ specNodeId })
if (!after.markdown.includes('A paragraph.')) {
  throw new Error('The new Figma spec content was not applied')
}
```

Luôn truyền `title` không rỗng và một chuỗi `content` (cho phép `''`). `title` đặt tên cho root; đưa bất kỳ tiêu đề `# H1` nào mong muốn vào bên trong `content`.

## Các phương thức thao tác nội dung

```js
// READ — returns specNodeId, markdown, title, etc.
// The body is `markdown`, not `content`.
const before = await figma.spec.getContent({ specNodeId: chosenSpec.id })
const page = await figma.spec.getContent({
  specNodeId: before.specNodeId,
  offset: 100,
  maxLines: 50,
})

// REPLACE — clears + recreates the document; use only for an empty first draft.
await figma.spec.setContent({
  specNodeId: before.specNodeId,
  content: '# Title\n\nA paragraph.\n',
})

// EDIT — find/replace; each oldText must match exactly once.
await figma.spec.editContent({
  specNodeId: before.specNodeId,
  edits: [{ oldText: 'First paragraph.', newText: 'Edited first paragraph.' }],
})

const after = await figma.spec.getContent({ specNodeId: before.specNodeId })
if (!after.markdown.includes('Edited first paragraph.')) {
  throw new Error('The targeted Figma spec edit was not applied')
}
```

- Dùng **`getContent`** với cùng `specNodeId` trước khi sửa và để xác minh các lần ghi; KHÔNG dựa vào screenshot.
- Mặc định dùng **`editContent`** có tính chọn lọc và an toàn cho cộng tác nhiều người (multiplayer-safe).
- Chỉ dùng **`setContent`** mang tính ghi đè toàn bộ cho bản nháp đầu tiên còn trống hoặc khi có yêu cầu thay thế toàn bộ tài liệu một cách tường minh.

## Quy tắc bắt buộc

1. **`editContent` yêu cầu khớp chính xác một lần duy nhất.** Không khớp hoặc khớp nhiều lần `oldText` đều thất bại mà không áp dụng thay đổi nào. Hãy thêm ngữ cảnh xung quanh để làm đoạn khớp trở nên duy nhất.
2. **Truyền Markdown dưới dạng chuỗi thuần (plain strings).** Tuyệt đối không mã hóa bằng `Buffer`/base64 hoặc giải mã bằng `atob()`. Base64 chỉ dùng cho image data URL bên trong Markdown.
3. **Tách biệt Markdown và thao tác duyệt node.** `figma.spec.*` xử lý nội dung; duyệt node chỉ phơi bày các document root và các nhánh embedded-canvas.
4. **Bảo toàn các marker bình luận.** Giữ nguyên vẹn các cặp `[comment:<uuid>]…[/comment:<uuid>]` chồng chéo quanh cùng một đoạn văn bản, nếu không luồng bình luận có thể bị tách rời hoặc biến mất. Khi phân vân, hãy sao chép chính xác đoạn được đánh dấu và chỉ chỉnh sửa xung quanh nó.
5. **Dùng các tham chiếu di động (portable references).** Các Figma spec được chia sẻ phải dùng các liên kết như GitHub permalink, tuyệt đối không dùng đường dẫn cục bộ trên máy hoặc URL `localhost`.

## Định dạng (Style)

- Giữ khối tiêu đề ở vị trí đầu tiên và định dạng là H1, ngay cả khi văn bản của nó đang trống. Không bao giờ xóa nó hoặc chèn các khối khác lên trước nó.
- Ưu tiên dùng chữ in đậm ở hàng tiêu đề bảng.
- Dùng `<ins>` cho gạch chân, bao gồm cả định dạng kết hợp: `<ins>**bold and underlined**</ins>`. Không dùng `<u>`, thẻ này chỉ hoạt động khi import HTML.

## Hình ảnh

Hình ảnh sử dụng cú pháp ảnh GFM bên trong `setContent` hoặc `editContent`:

- `![alt](data:image/png;base64,...)` nhúng dữ liệu byte được giải mã và tải lên.
- `![alt](https://host/img.png)` được tải về từ phía server; các host không được phép sẽ bị từ chối.

`getContent` trả về URL hình ảnh ở dạng `https://<host>/spec/<fileKey>/image/<sha>?w=<width>&h=<height>`.

## Bình luận (Comments)

Dùng `figma.spec.comments.*` cho các luồng bình luận gắn neo (anchored threads). Ưu tiên tạo bình luận thay vì âm thầm sửa đổi khi bạn chưa chắc chắn về một thay đổi.

```js
const comment = await figma.spec.comments.create({
  specNodeId: before.specNodeId,
  anchorText: 'the exact rendered text to anchor to', // MUST appear exactly once
  contextText: 'a longer unique substring containing anchorText', // optional; disambiguates repeats
  message: 'Comment body (markdown).',
})

const { root, replies, hasMore } = await figma.spec.comments.getThread({ uuid: comment.uuid })
await figma.spec.comments.reply({ uuid: comment.uuid, message: 'A reply.' })
```

- `anchorText` phải khớp chính xác một lần duy nhất trong bản Figma spec đã kết xuất. Dùng một `contextText` dài hơn chứa nó để phân biệt khi văn bản bị lặp lại.
- `getThread` và `reply` yêu cầu root comment UUID hiển thị qua marker `[comment:<uuid>]`; tuyệt đối không truyền UUID của một câu trả lời (reply) vào `reply`.
