---
name: figma-shaders
description: "**Điều kiện tiên quyết BẮT BUỘC** — tải skill này trước khi gọi `create_shader` hoặc `update_shader`. Sử dụng khi người dùng yêu cầu tạo, viết, chỉnh sửa, sửa lỗi hoặc cải tiến một hiệu ứng shader, shader fill, custom effect, custom fill, hoặc procedural shader trong Figma."
disable-model-invocation: false
---

# Tạo và cập nhật Figma shader

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-shaders/SKILL.md) (Figma chính thức).

Tải skill này trước mỗi lần gọi `create_shader` hoặc `update_shader`. Skill này bao phủ việc viết shader cho thư viện tài khoản thông qua Figma MCP server. Việc đọc hoặc áp dụng một shader có sẵn không yêu cầu skill này.

Shader có hai loại:

- `effect` lấy mẫu và biến đổi layer đã render nằm bên dưới nó. Dùng cho làm mờ (blur), biến dạng (distortion), phát sáng (glow), chỉnh màu (color grading), pixelation, halftone hoặc các xử lý hậu kỳ khác.
- `fill` tạo ra pixel mà không cần ảnh đầu vào (input raster). Dùng cho gradient, hoa văn (pattern), nhiễu (noise), chất liệu (texture) và nền tạo theo thủ tục (procedural background).

Không âm thầm chuyển đổi loại trong khi cập nhật. Giá trị `kind` truyền vào `update_shader` phải khớp với shader hiện có.

## Quy trình tạo mới

1. Xác định xem yêu cầu là effect hay fill. Chỉ hỏi khi ý định thị giác chưa làm rõ được sự phân biệt này.
2. Xác định `planKey`. Tái sử dụng giá trị do người dùng cung cấp; nếu không có, hãy gọi `whoami`. Tự động dùng plan hợp lệ duy nhất, hoặc yêu cầu người dùng chọn khi có nhiều plan khác biệt đáng kể.
3. Gọi `create_shader` một lần với tên ngắn gọn, mô tả, `kind` đã chọn và `planKey`. Thao tác này tạo ra một khung mẫu khởi tạo, không phải shader hoàn chỉnh cuối cùng được yêu cầu.
4. Gọi `get_shader` với `id` trả về, sau đó đọc toàn bộ các source URI. Nếu client không thể đọc tài nguyên MCP, hãy gọi `get_shader` với `includeSource: true` thay thế. Bước này giúp nắm rõ các lệnh import runtime và hợp đồng metadata cố định của khung mẫu.
5. Viết file thay thế hoàn chỉnh `main.ts` cho kết quả được yêu cầu.
6. Gọi `update_shader` với `id` trả về, cùng `kind` đó, `files: [{ path: "main.ts", content: "..." }]`, và một `commitMessage` cụ thể. Sử dụng `metadata` khi thay đổi tên, mô tả hoặc khả năng chuyển động. Đặt `metadata.isAnimated: true` khi mã nguồn đọc các đầu vào frame liên quan đến thời gian và `metadata.usesMouse: true` khi mã nguồn đọc `frame.mousePosition`.

Không bao giờ dừng lại sau `create_shader`: khung mẫu khởi tạo chỉ là điểm xuất phát về mặt cấu trúc.

## Quy trình cập nhật

1. Xác định shader bằng `list_shaders`, sau đó gọi `get_shader`. Dùng `type` của nó (`effect` hoặc `fill`) làm `kind` bắt buộc khi cập nhật.
2. Đọc toàn bộ các source URI do `get_shader` trả về trước khi chỉnh sửa. Nếu client không thể đọc tài nguyên MCP, hãy gọi công cụ với `includeSource: true`. Coi các file đó là nguồn chân lý hiện tại.
3. Giữ nguyên các điều khiển và hành vi hiện có trừ khi người dùng yêu cầu thay đổi chúng.
4. Gọi `update_shader` với nội dung thay thế hoàn chỉnh cho `main.ts` trong mảng `files`, không phải một bản diff hay đoạn mã rời rạc. Mảng `files` rỗng chỉ hợp lệ cho một bản cập nhật chỉ sửa metadata.

## Ghi chú phiên bản

Đối với mỗi lần gọi `update_shader`, hãy kiểm tra input schema được công bố của công cụ và bao gồm từng trường dưới đây khi trường đó được hỗ trợ:

- `versionDescription`: Một dòng tóm tắt ngắn gọn, không bỏ trống về các thay đổi được bàn giao, tập trung vào kết quả người dùng nhìn thấy được.
- `versionDetail`: Một hoặc hai câu không bỏ trống giải thích chi tiết triển khai chính. Giữ mức độ chi tiết tương xứng với thay đổi, bám sát công việc đã thực hiện và tránh lặp lại phần tóm tắt.

Nếu một trong hai trường không có trong schema được công bố, hãy bỏ qua trường đó và tiếp tục cập nhật. Luôn bao gồm `commitMessage` bắt buộc. Không gửi placeholder rỗng hoặc khẳng định công việc chưa được thực hiện.

## Quy tắc viết mã nguồn

- Trước khi viết bản thay thế `main.ts`, hãy đọc [Shader source authoring](references/authoring.md). Tài liệu này chứa cấu trúc module bắt buộc, vòng đời WebGPU, các schema tham số được hỗ trợ, quy tắc alpha cho effect/fill và danh sách kiểm tra lỗi WGSL.
- Giữ metadata chuyển động khớp với mã nguồn. Đặt `metadata.isAnimated: true` nếu `main.ts` đọc `frame.time`, `frame.deltaTime` hoặc `frame.frame`, và đặt `metadata.usesMouse: true` nếu nó đọc `frame.mousePosition`. Đặt lại giá trị tương ứng thành `false` khi xóa lần sử dụng cuối cùng như vậy. `update_shader` áp dụng các trường metadata này vào manifest `features.json` cố định dù file đó không thể bị thay thế trực tiếp.
- Ưu tiên `frame.time` cho chuyển động để việc rớt khung hình không làm thay đổi kết quả. Đây là đồng hồ mili-giây tuyệt đối; chuyển đổi sang giây bằng `Number(frame.time) * 0.001` khi cần.
- Đưa ra các điều khiển (controls) cho những giá trị mà người dùng có khả năng tinh chỉnh trên từng layer; hardcode các chi tiết triển khai nội bộ.
- Giữ các dải giá trị số có giới hạn và đặt giá trị mặc định hữu ích về mặt thị giác.
- Với effect, hãy lấy mẫu input raster một cách có chủ đích. Với fill, không giả định rằng có tồn tại input raster.
- Coi kết quả `update_shader` không có lỗi là thành công. Ghi nhận phiên bản trả về nếu có; một phản hồi thành công có thể lược bỏ trường này.
- Khi có lỗi build, hãy dùng kết quả trình biên dịch trả về để thực hiện chỉnh sửa nhỏ nhất trong mã nguồn và thử lại một lần. Nếu vẫn thất bại, hãy hiển thị lỗi thay vì viết lại shader nhiều lần.
- Nếu công cụ báo rằng đầu vào chuyển động hoặc chuột không khả dụng, hãy coi đó là giới hạn năng lực cuối cùng: không thử lại hoặc tìm cách vượt qua. Thay vào đó, hãy đề xuất viết một shader tĩnh có các thuộc tính công khai để có thể gắn keyframe trong chế độ Motion.

## Hoàn tất

Báo cáo tên shader, loại (`kind`) và id, kèm theo phiên bản trả về nếu có. Mô tả ngắn gọn các điều khiển hoặc hành vi đã được thêm vào. Tạo và đính kèm một URL có thể nhấp để mở một file Design mới với shader chưa xuất bản đã sẵn sàng dùng thử, sử dụng chính xác shader id làm `try-tool-resource-content-id`. Đặt `try-tool-resource-type` theo loại shader: `gen_effect` cho effect và `gen_fill` cho fill.

`https://www.figma.com/file/new?try-tool-resource-content-id=<id>&try-tool-resource-type=<gen_effect|gen_fill>&type=design&mode=design`

Sau khi cung cấp liên kết file mới, hãy hỏi xem người dùng có muốn mở shader trong một file Figma Design hiện có hay không. Nếu có, hãy tái sử dụng URL file đã được cung cấp hoặc hỏi xin URL, sau đó thêm các tham số truy vấn `try-tool-resource-content-id` và `try-tool-resource-type` đã xác định tương tự vào URL đó. Không bao giờ tự đoán URL file.

Thay thế placeholder loại bằng chính xác một giá trị; không để lại dấu ngoặc nhọn hoặc dấu gạch đứng trong URL trả về.
