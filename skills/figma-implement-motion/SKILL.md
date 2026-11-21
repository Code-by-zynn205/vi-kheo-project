---
name: figma-implement-motion
description: Chuyển đổi chuyển động và animation từ Figma thành mã ứng dụng sẵn sàng cho môi trường production. Sử dụng khi triển khai animation/motion từ thiết kế Figma — người dùng đề cập đến "implement this motion", "add animation from Figma", "animate this component", cung cấp URL Figma có node được animate, hoặc khi `get_design_context` trả về dữ liệu motion hoặc hướng dẫn bạn gọi `get_motion_context`.
disable-model-invocation: false
---

# Triển khai Motion

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-implement-motion/SKILL.md) (Figma chính thức).

## Tổng quan

Skill này hướng dẫn chuyển đổi các animation và transition từ Figma thành mã có thể chạy được (motion.dev, CSS keyframes, hoặc các thư viện theo từng framework).

Figma cung cấp dữ liệu motion thông qua hai công cụ:

- `get_motion_context` — công cụ motion chính thống. Trả về danh sách đầy đủ các node có animation, các đoạn mã tính sẵn (CSS `@keyframes` + motion.dev), keyframe binding dự phòng khi không có snippet, và gợi ý phối hợp timeline đệ quy (`timelineCohorts`). **Là nguồn chân lý cho dữ liệu animation và danh sách node ID có chuyển động.**
- `get_design_context` — **cấu trúc** của thiết kế: layout, kích thước, asset, styling, gợi ý Code Connect, ngữ cảnh ảnh chụp màn hình, và đôi khi có **các dấu vị trí motion** trên các phần tử chuyển động (`data-node-id`, và trên các node bị tách là `data-motion-keys` / `data-motion-wrapper-for` / `data-motion-transform-template`). Công cụ này có thể render một node chuyển động dưới dạng phần tử thường (`div`, `p`, `span`, v.v.) hoặc phần tử motion (`motion.div`); nó không nhúng trực tiếp các giá trị animation.

**Hai công cụ liên kết với nhau qua node id, và đó là toàn bộ quy trình làm việc.** `get_motion_context` cho bạn biết những node nào chuyển động và cung cấp giá trị keyframe, easing, timing và snippet. `get_design_context` cho bạn biết các node đó trông như thế nào và nằm ở đâu. Với mỗi node trong `get_motion_context.nodes`, hãy tìm `data-node-id` khớp trong design context và hợp nhất motion vào cấu trúc đó — thêm hoặc bọc bằng `motion.{tag}` khi phần tử cấu trúc là phần tử thường. Khi design context tái sử dụng một component Figma, motion node có thể kèm theo `fallbackNodeId`; chỉ dùng nó làm phương án dự phòng sau khi thử khớp chính xác `nodeId`.

## Phạm vi của Skill

- Sử dụng skill này khi sản phẩm đầu ra là mã motion trong repository của người dùng.
- Nếu người dùng yêu cầu tạo/chỉnh sửa animation ngay bên trong Figma, hãy chuyển sang [figma-use](../figma-use/SKILL.md) và làm theo skill đó.
- Skill này hiện bao phủ các **animation** được xuất ra bởi `get_motion_context` (các snippet cộng với track keyframe dự phòng, bao gồm cả motion tạo từ preset đã được phân giải sang các dạng đó). Các luồng variant tương tác rộng hơn vẫn có thể cần xử lý trạng thái riêng theo sản phẩm trong code.

## Điều kiện tiên quyết

- Đã kết nối và có thể truy cập Figma MCP server.
- Node ID được tách từ URL Figma do người dùng cung cấp. Định dạng URL: `https://figma.com/design/:fileKey/:fileName?node-id=1-2` — trích xuất `fileKey` (phần sau `/design/`) và `nodeId` (giá trị của tham số truy vấn `node-id`, ví dụ `42-15`).
- Codebase đích. Định dạng mã motion đầu ra sẽ thích ứng với stack công nghệ (xem [Khuyến nghị Framework](#khuyến-nghị-framework)).

## Lựa chọn công cụ

Để triển khai motion, hãy sử dụng cả hai công cụ với các vai trò riêng biệt:

| Tình huống | Công cụ | Lý do |
|---|---|---|
| Nắm bắt cấu trúc tĩnh, asset, style, Code Connect hoặc bố cục trực quan | `get_design_context` | Cung cấp mã tham chiếu component/trang và URL asset cần thiết để đặt các node chuyển động đúng vị trí. |
| Lấy dữ liệu animation cho bất kỳ node nào | `get_motion_context` | Được thiết kế chuyên biệt cho motion và là nguồn chân lý cho timing, easing, snippet và keyframe. |
| Một node có các dấu motion (`data-motion-keys`, `data-motion-wrapper-for`) | Dùng dấu để *đặt vị trí* tách lớp, `get_motion_context` để lấy *giá trị* | Các dấu tách lớp cho biết track nào đi vào phần tử nào; keyframe/easing/timing và danh sách node chuyển động đến từ `get_motion_context`. |

`get_motion_context` chấp nhận `recursive: true` (giới hạn tối đa 500 node) khi bạn cần lấy motion của các node con cháu trong một lần gọi.

## Quy trình bắt buộc

### Bước 1: Xác nhận ngữ cảnh thiết kế tĩnh đã sẵn sàng

```
get_design_context(fileKey=":fileKey", nodeId="<node-id>")
```

Nếu `get_design_context` đã được gọi cho node này trước đó, hãy tái sử dụng kết quả đó. Nếu chưa, hãy gọi như bình thường ngay bây giờ.

Sử dụng nó làm **cấu trúc chuẩn** — phân cấp, kích thước, styling, asset, gợi ý Code Connect, ngữ cảnh ảnh chụp màn hình và bất kỳ dấu vị trí motion nào có sẵn (Bước 3). Danh sách node chuyển động và các giá trị animation đến từ `get_motion_context` (Bước 2).

### Bước 2: Lấy dữ liệu motion chính thống

```
get_motion_context(fileKey=":fileKey", nodeId="<node-id>", recursive=true)
```

Cấu trúc phản hồi (một mục cho mỗi node có animation):

- `codeSnippets` — các chuỗi CSS `@keyframes` và motion.dev được tạo sẵn. **Sử dụng trực tiếp các đoạn mã này.** Không tạo lại chúng từ dữ liệu track dự phòng.
- `textAnimations` — Luôn triển khai các animation nhóm văn bản (text-group) này. Nếu `codeSnippets` cũng có mặt, hãy áp dụng cả hai; snippet không thay thế cho `textAnimations`.
  - Sử dụng `derivedTimingInfo`: mỗi nhóm bắt đầu tại `startMs + orderPosition * staggerStepMs` và chạy trong `groupDurationMs`. `startMs` đã bao gồm `delayMs`; không cộng thêm lần nữa. `presetDurationMs` bao trùm toàn bộ chuỗi so le (stagger), không phải từng nhóm.
  - Tính `orderPosition` từ `grouping` và `order`, không phải lúc nào cũng là chỉ số ký tự (`CENTER_OUT` bắt đầu các cặp đối xứng cùng lúc). Chuyển đổi mili-giây sang giây cho Motion.dev và khớp easing được cung cấp vào `groupDurationMs`, bao gồm cả spring.
- `keyframeBindings` — các track keyframe đã ràng buộc, bao gồm motion suy ra từ preset được phân giải thành dữ liệu track, chỉ được đưa vào làm dữ liệu dự phòng khi thiếu cả hai định dạng snippet.
- `motionSummary` — mô tả bằng ngôn ngữ tự nhiên (mỗi trường một dòng) của animation. Chỉ xuất hiện **khi không có snippet** (motion chỉ có keyframe-bindings mà codegen không thể biểu diễn thành CSS/motion.dev). Hãy xây dựng từ nó khi có mặt; bỏ qua nó bất cứ khi nào có snippet.
- `fallbackNodeId` — id dự phòng tùy chọn để khớp với design context đã component hóa. Nếu `nodeId` là id gắn với instance như `I4005:6111;30:8005`, D2R có thể render phần thân component tái sử dụng bằng id của component gốc, chẳng hạn `4002:3957`. Trong trường hợp đó, `fallbackNodeId` là `data-node-id` cần tìm nếu tra cứu chính xác `nodeId` thất bại.

Các phản hồi đệ quy cũng bao gồm `timelineCohorts` — một mảng **cấp cao nhất** (không nằm theo từng node) gồm các node dùng chung một timeline: `{ rootNodeId, durationMs, loopMode: 'once' | 'loop' | 'boomerang', memberNodeIds[] }`. Với chuyển động phối hợp nhiều node, hãy điều khiển tất cả `memberNodeIds` từ một vòng đời dùng chung với `durationMs` (÷1000 để ra giây) và `loopMode` — không suy đoán timing từ thứ tự node anh em.

Các chi tiết triển khai quan trọng đối với LLM:

- Khi có snippet, `motionSummary`, `timelineDurationMs` và `transformOrigin` có thể bị lược bỏ để thu gọn payload — snippet đã mang theo duration + transform-origin (trong motion.dev là `duration` / `style={{ transformOrigin }}`, hoặc trong CSS là `animation` / `transform-origin`) và cohort mang theo `durationMs`. Việc thiếu một trường không bao giờ có nghĩa là "không có animation."
- Phản hồi đệ quy loại bỏ trùng lặp các snippet giống hệt nhau. Một snippet có thể được thay thế bằng một comment trỏ tới node đầu tiên có motion giống hệt; hãy tái sử dụng cùng một component, variant, class hoặc hằng số thay vì viết lại animation thứ hai.
- MCP server suy luận snippet CSS hay motion.dev từ `clientFrameworks`; nếu phản hồi chỉ chứa một định dạng snippet, hãy chuyển thể định dạng đó sang stack của người dùng thay vì cho rằng định dạng kia bị lỗi.

### Bước 3: Hợp nhất ngữ cảnh tĩnh và ngữ cảnh motion

- Bắt đầu từ `get_motion_context.nodes`, không bắt đầu từ các thẻ `motion.*` nhìn thấy trong JSX tĩnh. **Mọi node được trả về đều có animation.** Khớp từng motion node ngược lại với `get_design_context` theo `nodeId` / `data-node-id` chính xác trước. Chỉ khi và chỉ khi không có khớp chính xác mới thử `fallbackNodeId` / `data-node-id`. Chỉ dùng tên/loại node và vị trí trên ảnh chụp màn hình làm phương án cuối cùng sau khi cả hai id đều không khớp.
- **Khớp id chính xác luôn thắng `fallbackNodeId`.** `fallbackNodeId` trỏ tới id component gốc mà D2R có thể xuất ra bên trong một component tái sử dụng. Nó được dùng chung bởi mọi instance của component đó. Nếu `nodeId` chính xác tồn tại trong design context, hãy áp dụng motion tại đó và bỏ qua fallback. Điều này rất quan trọng đối với animation trên root-instance: một instance có thể xoay hoặc di chuyển khác với một instance khác của cùng component đó, và việc áp dụng motion đó vào thân component dùng chung sẽ làm tất cả instance chuyển động sai.
- **Áp dụng từng motion node vào cấu trúc design-context khớp, được định danh theo `data-node-id`.** `data-node-id` khớp đóng vai trò điểm neo cấu trúc, không phải lúc nào cũng là phần tử DOM cuối cùng nhận motion. Hãy dựa vào hình dạng snippet và các dấu vị trí để quyết định motion đặt lên chính phần tử đó, một wrapper, một phần tử bên trong, hay một SVG path được inline. `get_design_context` có thể đã xuất sẵn `motion.{tag}` với giá trị bị lược bỏ, hoặc xuất một phần tử cấu trúc thường (`div`, `p`, `span`, root của component, v.v.). Nếu nó là phần tử thường và snippet nhắm tới chính phần tử đó, hãy chuyển đổi nó thành `motion.{tag}` tương ứng hoặc thêm một motion wrapper trong khi vẫn giữ nguyên văn bản, phần tử con, class/style, thuộc tính và `data-node-id` của node. Tải [references/examples-and-anti-examples.md](references/examples-and-anti-examples.md) để xem các ví dụ về bước hợp nhất này.
- **Motion của phần tử con đã component hóa thường khớp bằng fallback.** Khi design context tách một Figma instance thành React component tái sử dụng, các phần tử con bên trong thân component đó thường mang id component gốc (`4002:3957`) trong khi motion context báo cáo id instance thực tế (`I4005:6111;30:8005`). Trong trường hợp này, dùng `fallbackNodeId` để tìm `data-node-id` trong thân component, nhưng giữ phạm vi motion gắn với instance đang được render mà bạn triển khai. Nếu có nhiều instance và chỉ một instance có root motion khác biệt, việc khớp id chính xác sẽ giữ tách biệt phần motion riêng cho từng instance.
- Các node bị tách mang dấu `data-motion-keys` / `data-motion-wrapper-for` — xem phần _Xử lý transform đan xen_ bên dưới.
- **Giữ nguyên wrapper `display: contents` — trừ khi chính group đó có animation.** Các wrapper nhóm trong suốt về bố cục đi qua dưới dạng `contents` (Tailwind `contents`), thường đi kèm với `absolute`/`inset-[…]` vô hiệu (chúng không có tác dụng trên hộp `contents`). Với một group _tĩnh_, hãy giữ `display: contents` và để các phần tử con định vị theo phần tử tổ tiên thực gần nhất — việc biến `inset` của wrapper thành một hộp có định vị sẽ đổi cha cho các phần tử con sang một hộp nhỏ hơn, khiến chúng render quá nhỏ hoặc bị dịch vào trong. Với một group _có animation_ (chính node group có motion), `display: contents` không thể mang transform — hãy thay nó bằng một wrapper định vị thực sự và áp dụng motion của group vào đó. Tải [references/gotchas.md](references/gotchas.md) trước khi triển khai trường hợp này.
- **`get_motion_context` là danh sách đầy đủ các node có animation.** Một số node chuyển động được render thành phần tử thường (không phải `motion`) — root của component instance (`<div>` định vị thường), văn bản (`<p>`), mask — nhưng vẫn mang `data-node-id`. Hãy duyệt qua mọi node trong phản hồi motion và áp dụng motion của nó vào phần tử có `data-node-id` tương ứng, bọc hoặc chuyển đổi khi cần. Nếu một node chuyển động không có phần tử nào trong đầu ra (ví dụ: một mask chuyển động bị làm phẳng thành `mask-image` tĩnh), đừng âm thầm bỏ qua — hãy để lại comment `// TODO: <nodeId> motion unsupported` và nêu rõ trong phần tóm tắt của bạn.
- Nếu một node xuất hiện trong motion context nhưng không có trong JSX tĩnh, hãy thêm phần tử cần thiết để biểu diễn nó — mã design-context chỉ là tham chiếu, không phải bảng kiểm kê animation đầy đủ.
- Khi có xung đột giữa design context và motion context (timing/easing/giá trị chuyển động), ưu tiên `get_motion_context`.
- **Motion SVG cấp độ đường dẫn (path-level): inline SVG và animate thẻ `<path>` thực.** Khi `get_motion_context` nhắm tới đường dẫn của một vector (`PATH_TRIM`, `motion.path`, `stroke-dasharray`) nhưng design context lại render nó dưới dạng `<img>`, hãy inline SVG và áp dụng snippet cho `<path>`, giữ nguyên wrapper bố cục. Tải [references/svg-and-path-motion.md](references/svg-and-path-motion.md) để xem hướng dẫn chi tiết cho trường hợp này (`motion.path`, `pathLength="1"`, phân lớp wrapper+path, CSS path-trim).

#### Xử lý transform đan xen

Một node có **cả** transform nền tĩnh và các transform chuyển động sẽ được tách qua các phần tử lồng nhau để hai loại này kết hợp đúng thay vì xung đột: một `motion.div` không có id mang `data-motion-wrapper-for="<nodeId>"` (wrapper NGOÀI) bọc lấy một div mang transform tĩnh (ví dụ `rotate-45` + kích thước `hypot()` — hoặc chính wrapper mang `data-motion-transform-template="<css>"`), rồi div đó bọc lấy node TRONG (`data-node-id`). Giữ nguyên cấu trúc lồng `wrapper > static-transform div > inner` — gộp lại sẽ làm hỏng kích thước và transform nền.

- **Đặt các track theo `data-motion-keys`.** `data-motion-keys` của wrapper (các track transform — `x`/`y`/`rotate`/`scaleX`/`scaleY`/`skewX`) đi vào wrapper NGOÀI; `data-motion-keys` của phần tử trong đi vào phần tử TRONG. Khóa `scale` của snippet đại diện cho cả `scaleX` và `scaleY`, vì vậy hãy đặt nó lên wrapper khi wrapper liệt kê cả hai trục.
- **Áp dụng lại `data-motion-transform-template`.** Nếu wrapper mang thuộc tính này, hãy đặt CSS của nó trước transform chuyển động. Giữ nguyên mọi `transformTemplate` trong snippet và truyền tiếp cả hai tham số: `transformTemplate={(values, generated) => "<css> " + snippetTemplate(values, generated)}`. Các snippet cục bộ gốc dùng `(_, generated)` và cần chuỗi transform được tạo đó; giữ nguyên `transformOrigin` được xuất ra. Các template đặt tâm xoay tường minh dùng `transformOrigin: '0 0'`: với chúng, thêm tiền tố `"translate(50%, 50%) <css> translate(-50%, -50%) "` để CSS của wrapper vẫn xoay quanh tâm của nó. Trong cả hai trường hợp, hãy giữ nguyên template của snippet; thay thế nó bằng `generated` sẽ làm mất chuỗi transform tường minh.
- **Bù trừ transform chuyển động theo giá trị nền tĩnh (tránh xoay hai lần).** `get_motion_context` trả về transform _tuyệt đối_ của node, vốn đã bao gồm bất kỳ giá trị nền tĩnh nào mà các div kia áp dụng. Một snippet `rotate` là `[45, 125, 125]` trên nền `rotate-45` nghĩa là wrapper sẽ animate **phần bù** `[0, 80, 80]` (= tuyệt đối − 45), không phải giá trị tuyệt đối — nếu không góc 45° sẽ bị cộng hai lần và phần tử sẽ nằm ở 90° khi nghỉ. Các track không có nền tĩnh (ví dụ `x`/`y` bắt đầu từ 0) được giữ nguyên. Xem ví dụ về interleaved-transform.
- **Tách biệt transform bố cục khỏi transform của Motion.** Với mọi phần tử `motion.*` animate `rotate`, `scale` hoặc `skew`, hãy kiểm tra xem nó có đồng thời dựa vào các utility transform bố cục của Tailwind như `-translate-x-1/2` hoặc `-translate-y-1/2` để căn giữa/định vị hay không. Các utility đó dùng chung thuộc tính CSS `transform` mà Motion.dev ghi trực tiếp inline, nên transform của Motion có thể xóa mất phần dịch chuyển bố cục. Nếu cần cả hai, hãy tách phần tử thành một wrapper bố cục tĩnh mang transform căn giữa/định vị và một phần tử `motion.*` bên trong mang rotate/scale/opacity chuyển động, hoặc mã hóa phần dịch chuyển bố cục vào chính Motion (`x: "-50%"`) và duy trì nó ở mọi keyframe.

### Bước 4: Áp dụng motion vào code

- **Có motion.dev trong snippets?** Sử dụng nguyên văn mã motion.dev cho các target React. Import từ `motion/react` — trừ khi codebase đã dùng một thư viện motion khác (Framer Motion, React Spring, GSAP), khi đó hãy chuyển thể snippet sang thư viện đó. Tải [references/framework-recommendations.md](references/framework-recommendations.md) khi chuyển thể sang stack khác hoặc chọn thư viện.
- **Có CSS keyframes?** Sử dụng cho các target vanilla/không dùng React, hoặc khi codebase không có thư viện motion cho React.
- **Không có snippet (chỉ có keyframe-bindings)?** Tạo mã motion.dev/CSS tương đương từ `keyframeBindings` + `motionSummary`, lấy timing lặp từ `durationMs` / `loopMode` của cohort và đọc `transformOrigin` / duration từ các trường có cấu trúc. Trường hợp này hiếm gặp — thông thường luôn có snippet, kể cả cho SwiftUI/iOS (vẫn nhận định dạng CSS).

### Bước 5: Kiểm tra và xác thực

- Đọc các lệnh import/quy ước motion hiện có của component trước khi thêm mới. Nếu người dùng đã dùng Framer Motion / React Spring / anime.js, hãy chuyển thể thay vì ép dùng motion.dev.
- Kiểm tra thực tế một animation chạy từ đầu đến cuối (reload, quan sát, lặp lại chỉnh sửa) trước khi áp dụng hàng loạt cho nhiều node.
- Tải [references/gotchas.md](references/gotchas.md), tài liệu này đề cập đến các lỗi cụ thể và trường hợp biên gặp phải trong đầu ra motion của Figma, và khắc phục các trường hợp đó trong mã được tạo.

## Quy tắc tối quan trọng

Đây là các nguyên tắc chung. Các bẫy kỹ thuật cụ thể (tâm xoay, ngữ nghĩa HOLD, nội suy màu, v.v.) nằm trong các tài liệu tham khảo được phân loại ở mục [Tài liệu tham khảo](#tài-liệu-tham-khảo). Khi một tài liệu liên kết được nhắc đến trong văn bản skill này và tình huống đó áp dụng, hãy tải file đó trước khi tiếp tục.

1. **Tôn trọng *giá trị* từ đầu ra của công cụ, không rập khuôn bố cục của nó.** Giữ nguyên chính xác timing, easing, giá trị keyframe và `transformOrigin` từ `codeSnippets` — đừng tạo lại chúng từ `keyframeBindings` hoặc các trường có cấu trúc khi đã có snippet (tạo lại sẽ làm mất độ chính xác của custom bezier easing, xấp xỉ spring và giá trị overshoot). `transformOrigin` là **theo từng phần tử**: hãy áp dụng giá trị riêng của từng node thực hiện scale/rotate — kể cả các node scale lồng bên trong, không chỉ wrapper ngoài cùng — nếu không phần tử sẽ xoay quanh tâm mặc định và phóng to/xoay từ sai góc (xem ví dụ per-element-`transformOrigin`). Giữ nguyên `style.transformOrigin` của snippet ngay cả khi nó có `transformTemplate`: các template đặt tâm tường minh dùng `'0 0'`, trong khi các template cục bộ gốc giữ lại tâm của node. Tuy nhiên, snippet là dữ liệu của một node, không phải mẫu copy-paste: khi nhiều node dùng chung, hãy tách thành hàm/biến dùng chung theo Quy tắc 7 thay vì dán khối mã đó N lần.
2. **Khớp với motion stack hiện có của người dùng.** Đọc các lệnh import của component và bất kỳ animation anh em nào trước khi thêm dependency mới. Nếu người dùng đã có Framer Motion, React Spring, anime.js, GSAP — hãy chuyển thể đầu ra sang stack của họ thay vì ép buộc dùng motion.dev.
3. **Tuân thủ `prefers-reduced-motion`.** Bất kỳ motion nào được thêm vào phải được làm dịu hoặc tắt dưới `@media (prefers-reduced-motion: reduce)` — thông thường là bỏ qua `animate` (render trạng thái ban đầu/trạng thái nghỉ) hoặc rút ngắn thời lượng về gần bằng 0. Đây là mặc định về khả năng tiếp cận (accessibility), không phải tùy chọn thêm.
4. **Kiểm tra một animation từ đầu đến cuối trước khi làm hàng loạt.** Build, tải lại và xem trọn một vòng timeline — xác nhận mỗi node chuyển động xuất hiện đúng thời điểm mà keyframe track của nó quy định. "Render không lỗi" không đồng nghĩa với "render đúng". Lỗi motion sẽ nhân lên khi làm hàng loạt — một easing sai trên một node rất dễ nhận ra; cùng lỗi đó trên hai mươi node sẽ mất hàng giờ để gỡ rối.
5. **Không tự bịa motion.** Nếu một node không có dữ liệu motion trong phản hồi, hãy để nó đứng yên. Không mượn giá trị easing/duration mặc định từ nơi khác trong thiết kế, và không tự động tạo animation chỉ "vì phần còn lại của component đang chuyển động."
6. **Tải asset về và tham chiếu file cục bộ.** `get_design_context` / `get_motion_context` trả về asset dưới dạng URL có thời hạn (`/api/mcp/asset/...`), thường là SVG. Tải từng asset vào dự án bằng `curl -L` và tham chiếu file đã tải về, hoặc inline nội dung của nó (ví dụ inline SVG và render qua `NSImage(data:)` trên SwiftUI). Không tham chiếu các URL asset tạm thời trong mã ứng dụng. Đối với motion SVG cấp độ path, hãy inline SVG và animate thẻ path thực thay vì để sau thẻ `<img>`. Không truyền các file SVG đã tải về vào công cụ `Read` dưới dạng ảnh: SVG không phải định dạng ảnh được hỗ trợ nên việc đọc có thể lỗi hoặc treo.
7. **Tách dùng chung cho motion lặp lại — không bao giờ copy-paste snippet cho từng phần tử.** Nhiều node thường dùng chung *cùng một* animation chỉ khác nhau ở độ trễ stagger, phần bù hoặc giá trị đích. Hãy triển khai motion dùng chung **một lần** — một component chuyển động tái sử dụng hoặc một đối tượng `variants` được tham số hóa theo các giá trị thay đổi — render từ mảng được map (`items.map(...)`), và đưa các giá trị lặp lại (duration, mảng easing, offset) ra thành hằng số đặt tên. Các *giá trị* của animation giữ nguyên văn từ snippet (Quy tắc 1); phần *code* giữ nguyên tắc DRY. Dán cùng một transition object hơn 15 lần (800 dòng lẽ ra chỉ cần 150 dòng) là kết quả chất lượng kém — cả độ trung thực và khả năng bảo trì đều được đánh giá.

## Khuyến nghị Framework

Quy tắc 2 nêu rõ nguyên tắc chung: ưu tiên stack hiện có của người dùng. Khi chưa có sẵn, các lựa chọn mặc định gồm:

- **React**: [motion.dev](https://motion.dev) (gói `motion`). Công cụ trả về trực tiếp mã motion.dev — hãy dùng nó.
- **Web Vanilla / không dùng React**: CSS `@keyframes` với shorthand `animation`, được công cụ trả về trực tiếp.
- **SwiftUI**: Các modifier `.animation(...)` gốc, được chuyển dịch từ snippet **CSS** (`get_motion_context` không xuất mã SwiftUI, nhưng các client SwiftUI/iOS vẫn nhận định dạng CSS; chỉ dùng `keyframeBindings` / `motionSummary` / cohort làm phương án dự phòng khi không có snippet). **Chỉ sử dụng các API SwiftUI thực tế** — không có modifier nào nhận trực tiếp easing của Figma/CSS, vì vậy hãy tải [references/framework-recommendations.md](references/framework-recommendations.md#swiftui-translation), ánh xạ easing sang dạng tương đương trong SwiftUI và kiểm chứng thay vì tự bịa. Hướng này đang tiếp tục phát triển; hãy xác nhận với người dùng nếu không chắc chắn.

**Với các lớp hiệu ứng phổ biến, hãy ưu tiên thư viện thay vì tự viết CSS thủ công.** Các hiệu ứng như glass/glassmorphism, confetti, hệ thống hạt (particle systems), tương tác dựa trên vật lý và chuyển động gắn với cuộn trang đều có các thư viện đã được kiểm chứng thực tế, xử lý tương thích đa trình duyệt, khả năng tiếp cận và hiệu năng tốt hơn nhiều so với keyframe tự sinh. Tải [references/framework-recommendations.md](references/framework-recommendations.md) để xem bảng đầy đủ thư viện theo từng lớp hiệu ứng. Đưa ra các lựa chọn này dưới dạng đề xuất, không bắt buộc — người dùng sẽ quyết định.

## Ví dụ minh họa

Tải [references/examples-and-anti-examples.md](references/examples-and-anti-examples.md) khi bạn cần các ví dụ mẫu hoặc các mẫu lỗi cần tránh. Tài liệu này bao gồm luồng hợp nhất đơn giản, các phần tử văn bản thường cần thêm `motion.*`, transform tĩnh+chuyển động đan xen, motion cấp độ đường dẫn SVG, và các phản ví dụ cho việc dựng lại DOM, lệch node-id/vị trí, và thiếu `transformOrigin` theo từng phần tử.

## Tài liệu tham khảo

Sáu tài liệu chuyên sâu, chỉ tải khi cần. Các mối quan tâm chung của frontend (hiệu năng, đơn vị, cơ chế accessibility) đã được xử lý bởi các quy tắc tối quan trọng ở trên — các tài liệu tham khảo này chỉ tập trung vào tín hiệu đặc thù của Figma. Nếu skill này nhắc tên một trong các file này trong hướng dẫn nội tuyến, hãy tải file đó trước khi tiếp tục phần công việc tương ứng.

- [references/examples-and-anti-examples.md](references/examples-and-anti-examples.md) — các ví dụ mẫu và mẫu lỗi cần tránh. Tải khi áp dụng quy trình hợp nhất, xử lý transform đan xen, hoặc kiểm tra xem bản triển khai được tạo có dựng lại DOM, tráo đổi vị trí node hay làm rơi `transformOrigin` không.
- [references/gotchas.md](references/gotchas.md) — các lỗi motion đặc thù của Figma và cách khắc phục. Tâm xoay/scale trên các group lồng nhau, ngữ nghĩa HOLD easing, bảo toàn CUSTOM_SPRING, sự nhập nhằng khi scale độc lập từng trục, nội suy màu. Tải khi xử lý lỗi hành vi runtime bất ngờ. **Luôn tải [references/motion-lint-rules.md](references/motion-lint-rules.md) song song với file này** — các mục gotcha có tham chiếu đến những quy tắc lint cụ thể cần thông báo cho người dùng.
- [references/svg-and-path-motion.md](references/svg-and-path-motion.md) — triển khai motion nhắm vào đường dẫn vector SVG (inline asset, `motion.path`, `pathLength="1"`, phân lớp wrapper+path, CSS path-trim). Tải khi snippet của một vector nhắm vào đường dẫn chứ không phải transform của wrapper.
- [references/framework-recommendations.md](references/framework-recommendations.md) — motion.dev, CSS keyframes, mặc định cho SwiftUI, bảng thư viện theo lớp hiệu ứng (glass, confetti, particles, physics, scroll-linked). Tải trước khi tự viết tay một hiệu ứng.
- [references/unsupported-and-fallbacks.md](references/unsupported-and-fallbacks.md) — các tính năng motion của Figma hiện chưa export gọn gàng (text animations, path animations, masks/booleans, variants/transitions). Bao gồm hướng dẫn fallback video/lottie. Tải khi phản hồi của công cụ có vẻ thiếu sót. **Luôn tải [references/motion-lint-rules.md](references/motion-lint-rules.md) song song với file này** — các mục không hỗ trợ có tham chiếu đến các quy tắc lint cụ thể cần thông báo cho người dùng.
- [references/motion-lint-rules.md](references/motion-lint-rules.md) — Các quy tắc linting: những giới hạn export đã biết (lỗi và cảnh báo) phải được thông báo cho người dùng. Tải khi tạo mã motion để kiểm tra xem có giới hạn nào đang áp dụng hay không.
