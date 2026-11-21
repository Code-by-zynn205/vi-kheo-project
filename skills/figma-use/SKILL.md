---
name: figma-use
description: "**Điều kiện tiên quyết BẮT BUỘC** — bạn PHẢI kích hoạt skill này TRƯỚC mọi lần gọi tool `use_figma`. KHÔNG BAO GIỜ gọi `use_figma` trực tiếp mà chưa nạp skill này trước. Việc bỏ qua sẽ gây ra các lỗi phổ biến và rất khó debug. Kích hoạt bất cứ khi nào người dùng muốn thực hiện thao tác ghi hoặc thao tác đọc đặc thù đòi hỏi thực thi JavaScript trong ngữ cảnh file Figma — ví dụ: tạo/sửa/xóa node, thiết lập variable hoặc token, xây dựng component và variant, chỉnh sửa auto-layout hoặc fill, bind variable vào property, hoặc kiểm tra cấu trúc file bằng code."
disable-model-invocation: false
---
# use_figma — Skill Figma Plugin API

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-use/SKILL.md) (Figma chính thức).

Sử dụng tool `use_figma` để thực thi JavaScript trong các file Figma thông qua Plugin API. Toàn bộ tài liệu tham khảo chi tiết nằm trong `references/`.

Khi khả dụng, hãy gọi `create_session` với `fileKey` và `description` trước khi đọc hoặc chỉnh sửa file (tạo file trước nếu cần), sau đó truyền nguyên vẹn `sessionId` trả về vào mọi lệnh gọi có nhận tham số này, bao gồm cả các bước tiếp theo và công việc xuyên suốt nhiều file.

**Luôn đưa `figma-use` vào tham số `skillNames` phân tách bằng dấu phẩy khi gọi `use_figma`. Nếu skill này được nạp qua MCP resource, bạn BẮT BUỘC phải thêm tiền tố `resource:` vào tên (ví dụ: `resource:figma-use`).** Đây là tham số ghi log dùng để theo dõi việc sử dụng skill — không ảnh hưởng đến quá trình thực thi.

**Nếu các tool Figma MCP xuất hiện dưới dạng deferred tools, hãy nạp hàng loạt toàn bộ schema của chúng trong một lần gọi `ToolSearch` duy nhất** bằng cú pháp `select:` — ví dụ: `ToolSearch query="select:use_figma,get_screenshot,get_metadata,create_new_file"`. Một lượt gọi luôn tốt hơn sáu lượt.

**BẮT BUỘC đối với các thay đổi thiết kế hiển thị trực quan:** Trước lần gọi `use_figma` có thao tác ghi (mutating) đầu tiên, hãy nạp [figma-generate-design](../figma-generate-design/SKILL.md) cùng với skill này và đưa cả hai tên vào tham số `skillNames` của mọi lệnh gọi có thao tác ghi. Quy tắc này áp dụng từ một thuộc tính hoặc phần tử hiển thị đơn lẻ cho đến toàn bộ trang, màn hình, hoặc khung nhìn tổng hợp nhiều phần — ngay cả khi người dùng gọi khung nhìn đó là một component. `figma-use` cung cấp các quy tắc Plugin API; `figma-generate-design` cung cấp khả năng khám phá design system thông qua `search_design_system`, import asset và lắp ráp từng phần.

**Ngoại lệ cho thư viện tái sử dụng:** Nếu sản phẩm bàn giao chính là một component tái sử dụng, component set, hệ thống variant, bộ sưu tập variable/token, nền tảng style, hoặc asset thư viện khác nhằm mục đích tái sử dụng hay xuất bản (publish), hãy nạp [figma-generate-library](../figma-generate-library/SKILL.md) thay thế. Skill đó cung cấp quy trình tạo component — nền tảng variable, bộ variant và liên kết design-token — mà riêng `figma-use` không bao quát. Với các tác vụ bao gồm cả asset thư viện lẫn thiết kế hoàn chỉnh sử dụng chúng, hãy nạp cả hai skill đi kèm. Các lệnh gọi `use_figma` chỉ đọc (read-only) không cần nạp thêm hai skill này.

**Biến đổi 3D (3D transforms):** Với phối cảnh (perspective), chiều sâu (depth), độ nghiêng X/Y, khối lập phương isometric hoặc các dáng 3D tĩnh khác, hãy nạp [figma-3d-transforms](../figma-3d-transforms/SKILL.md) khi khả dụng. Skill này phụ trách hướng dẫn API có kiểm soát gồm `transform3d`, `scene3d` và `transformOrigin`, bao gồm các trường có thể không có trong file typing chung. Tuân thủ quy tắc tạo node của skill này trước, sau đó áp dụng dáng 3D lên các node kết quả. Nếu skill 3D hoặc các API đó không khả dụng, hãy giải thích rằng tính năng dựng 3D chưa được bật trong phiên này. Phép xoay phẳng trong mặt phẳng 2D sử dụng `node.rotation` và không cần skill 3D.

Đối với các API khác, hãy nạp [plugin-api-standalone.index.md](references/plugin-api-standalone.index.md) để nắm được những gì API hỗ trợ. Khi được yêu cầu viết mã Plugin API, hãy dùng ngữ cảnh này để grep trong [plugin-api-standalone.d.ts](references/plugin-api-standalone.d.ts) tìm các type, method và property liên quan. Đây là nguồn tham chiếu chuẩn xác nhất cho bề mặt API chung. Do file typings rất lớn, không nạp toàn bộ cùng lúc mà chỉ grep các phần cần thiết.

QUAN TRỌNG: Bất cứ khi nào làm việc với design system, hãy bắt đầu với [working-with-design-systems/wwds.md](references/working-with-design-systems/wwds.md) để nắm các khái niệm cốt lõi, quy trình và hướng dẫn làm việc với design system trong Figma. Sau đó nạp thêm các tài liệu tham khảo chuyên sâu về components, variables, text styles và effect styles khi cần.

## 1. Quy tắc bắt buộc

1.  **Dùng `return` để trả dữ liệu về.** Giá trị trả về được tuần tự hóa JSON tự động (object, array, string, number). KHÔNG gọi `figma.closePlugin()` hoặc bọc code trong một async IIFE — hệ thống tự xử lý việc này.
2.  **Viết JavaScript thuần với `await` và `return` ở cấp cao nhất (top-level).** Code được tự động bọc trong ngữ cảnh async. KHÔNG bọc trong `(async () => { ... })()`.
3.  `figma.notify()` **ném lỗi "not implemented"** — tuyệt đối không dùng.
3a. **Trả về node ID và giữ trạng thái quy trình (workflow state) bên ngoài file Figma.** Chỉ đặt mô tả mục đích và cách dùng component dành cho người đọc trong `node.description` trên `COMPONENT` hoặc `COMPONENT_SET` — không bao giờ đặt lên frame hay instance.
3b. **Thu hẹp kiểu (narrow) trước khi truy cập thuộc tính đặc thù theo loại node.** Kiểm tra `node.type`, dùng kiểm tra khả năng như `"characters" in node`, hoặc lọc trước bằng `findAllWithCriteria`. Thuộc tính `characters` đòi hỏi node có hỗ trợ văn bản; optional chaining (`?.`) không bảo vệ được việc truy cập thuộc tính không được hỗ trợ.
4.  `console.log()` KHÔNG được trả về — dùng `return` để xuất kết quả.
5.  **Chia kích thước các lệnh gọi dựng hình để retry an toàn và kiểm chứng dựa trên bằng chứng.** Không tách nhỏ một thao tác đang hoạt động tốt chỉ để tạo các điểm kiểm tra (validation checkpoint). Gom nhóm công việc liên quan khi script kết quả vẫn đảm bảo retry an toàn; một section hoàn chỉnh hoặc cả một trang có thể được dựng trong một lần gọi. Chỉ tách khi vượt ranh giới ngữ cảnh trang (page context), khi việc thực thi dở dang khó khôi phục, hoặc sau khi có lỗi thực tế cần retry có mục tiêu. Trả về các ID bị ảnh hưởng cùng số lượng, tên hoặc kích thước biên (bounds) liên quan sau mỗi lần ghi — đây được tính là kiểm chứng cấu trúc. Chỉ chạy một bước kiểm tra cấu trúc riêng khi thiếu bằng chứng bắt buộc hoặc sau một thao tác ghi làm thay đổi trạng thái liên quan. Thông thường, chụp một screenshot sau khi lắp ráp hoàn chỉnh và một screenshot sau khi sửa lỗi hiển thị. Ảnh chụp đạt yêu cầu gần nhất là bước kiểm tra cuối cùng; không chụp lặp lại khi không có gì thay đổi liên quan. Dừng lại khi các yêu cầu đã đạt.
6.  Màu sắc dùng **thang 0–1** (không phải 0–255): `{r: 1, g: 0, b: 0}` = màu đỏ. Object `color` của Paint chỉ dùng `{r, g, b}` **— không có trường `a`**; độ trong suốt (opacity) nằm ở cấp paint (`{ type: 'SOLID', color: {...}, opacity: 0.5 }`).
7.  `fills`/`strokes` là **mảng chỉ đọc (read-only arrays)** — phải sao chép (clone), chỉnh sửa rồi gán lại.
8.  **Mọi thao tác sửa văn bản phải tuân theo quy trình chuẩn: nạp font → `await` → sửa đổi → trả về các node ID bị ảnh hưởng.** Bỏ qua bước nạp font sẽ ném lỗi `Cannot write to node with unloaded font "<family> <style>"`. Quy tắc này áp dụng rộng hơn `characters` — nó áp dụng cho mọi thao tác trên node có font chưa nạp (`appendChild`, `insertChild`, `setBoundVariable`, `setExplicitVariableModeForCollection`, `setValueForMode`, callback của `findAll` chạm vào text). Khi sửa văn bản hiện có, hãy nạp *các font hiện tại* của node thông qua `getStyledTextSegments(['fontName'])`, không dùng giá trị mặc định hardcode. Inter thường được nạp sẵn ở hầu hết môi trường nên các font family khác dễ làm lộ lỗi này hơn — nhưng quy trình chuẩn áp dụng cho mọi font. Gọi `await figma.listAvailableFontsAsync()` trước nếu chuỗi style chưa được xác minh — **tuyệt đối không đoán** (`"SemiBold"` so với `"Semi Bold"` là lỗi rất hay gặp). Với variable có scope `FONT_FAMILY`, phải nạp toàn bộ giá trị trên mọi mode liên quan trước khi gọi `setBoundVariable("fontFamily", …)`, `setValueForMode` hoặc `setExplicitVariableModeForCollection`. `lineHeight`/`letterSpacing` nhận `{unit, value}`, không nhận số trần. Xem [Canonical text-edit recipe](references/gotchas.md#canonical-text-edit-recipe-font-load--await--mutate--return-ids).
9.  **Các trang được nạp dần (incremental)** — dùng `await figma.setCurrentPageAsync(page)` để chuyển trang và nạp nội dung trang đó. Setter đồng bộ `figma.currentPage = page` **KHÔNG** hoạt động và ném lỗi `"Setting figma.currentPage is not supported"`. Ngữ cảnh trang đặt lại về **trang đầu tiên** ở đầu mỗi lần gọi `use_figma`, vì vậy phải chuyển lại ở mỗi lần gọi; chuyển trang **tối đa một lần mỗi lệnh gọi** và phân tán (fan out) công việc đa trang chạy song song — xem [Quy tắc trang](#2-quy-tắc-trang-quan-trọng) và [gotchas.md](references/gotchas.md#set-current-page-once-per-use_figma-call--split-multi-page-work-into-parallel-calls).
10. `setBoundVariableForPaint` trả về một paint **MỚI** — bắt buộc phải gán biến hứng kết quả và gán lại.
11. `createVariable` chấp nhận **collection object hoặc ID string** (ưu tiên object).
12. **`layoutSizingHorizontal/Vertical` bị giới hạn giá trị theo ngữ cảnh cấu trúc — `FIXED` luôn dùng được, `HUG` và `FILL` thì không.** `'HUG'` chỉ hợp lệ trên chính một auto-layout frame HOẶC trên node con **TEXT** của nó. `'FILL'` chỉ hợp lệ trên một node con của auto-layout frame đồng thời không đặt vị trí tuyệt đối (absolute-positioned), không nằm trong frame bất biến (immutable frame) và không phải con của canvas-grid. Hệ quả thực tế: hãy append vào auto-layout parent TRƯỚC, sau đó mới đặt `HUG`/`FILL` — một node mới tạo hoặc chưa có parent chưa thể thỏa mãn quy tắc này. Bản thân property tồn tại trên mọi `SceneNode`; lỗi ở đây là từ chối giá trị, không phải "không có thuộc tính". Xem [Gotchas](references/gotchas.md#layoutsizinghorizontallayoutsizingvertical-value-rules-fixed-hug-fill).
12a. **Dùng auto-layout cho các container chứa các node con có liên quan.** Khi các node con có quan hệ cấu trúc — xếp chồng, đặt cạnh nhau, căn chỉnh, giãn cách (gap), ôm khít nội dung (hug) — hãy bọc chúng trong `figma.createAutoLayout()`, không dùng `figma.createFrame()` với tọa độ `x`/`y` tuyệt đối. Tọa độ tuyệt đối quyết định vị trí của container trên canvas; auto-layout quyết định cách các node con liên kết bên trong nó. Bỏ qua container sẽ không có cơ chế bảo vệ khi text xuống dòng, đổi nội dung hoặc bị chồng lấp.
12b. **`layoutSizing*` và `*AxisSizingMode` là hai enum khác nhau — không được nhầm lẫn.** `layoutSizingHorizontal`/`layoutSizingVertical` (đặt trên **node con**) nhận `'FIXED'|'HUG'|'FILL'`; `primaryAxisSizingMode`/`counterAxisSizingMode` (đặt trên chính **frame**) nhận `'FIXED'|'AUTO'`. Vì vậy `layoutSizingVertical = 'AUTO'` là không hợp lệ (hãy dùng `'HUG'`), còn `counterAxisSizingMode = 'FILL'` sẽ ném lỗi `Expected 'FIXED' | 'AUTO', received 'FILL'` (hãy dùng `'FIXED'`/`'AUTO'`). Hai lỗi khác từ cùng setter — `Error: in set_layoutSizingHorizontal: node must be an auto-layout frame or a child of an auto-layout frame` và `Error: in set_layoutSizingHorizontal: FILL can only be set on children of auto-layout frames` — có nghĩa là node chưa nằm trong ngữ cảnh auto-layout; **khuyến nghị: biến parent thành auto-layout (`figma.createAutoLayout()`) và `appendChild` node trước khi thiết lập** (xem Quy tắc 12). Xem [Gotchas](references/gotchas.md#layoutsizing-vs-axissizingmode-two-different-sizing-enums).
12c. **`resize()` đặt lại các chế độ kích thước về `FIXED`, vì vậy hãy gọi nó TRƯỚC khi đặt `layoutSizing*`.** Một khối **TEXT** tự động xuống dòng cần `textAutoResize = 'HEIGHT'` cộng với chiều rộng FIXED tường minh (`resize()`), KHÔNG chỉ đặt `FILL` đơn lẻ — chế độ mặc định `WIDTH_AND_HEIGHT` sẽ bỏ qua `FILL` và làm node co rúm thành một dải rộng gần bằng 0. Kiểm tra lại `node.width > 0` sau đó.
13. **Đặt các node cấp cao nhất (top-level) mới tạo ra xa khỏi tọa độ (0,0).** Các node append trực tiếp vào page mặc định nằm ở (0,0). Quét `figma.currentPage.children` để tìm vị trí trống (ví dụ: bên phải node nằm xa nhất về bên phải). Quy tắc này chỉ áp dụng cho node cấp page — các node lồng trong frame hoặc container auto-layout khác được định vị bởi parent của chúng. Xem [Gotchas](references/gotchas.md).
14. **Khi `use_figma` báo lỗi, tuân thủ `safeToRetryWithoutCanvasRead`.** Nếu `true`, sửa lỗi và thử lại. Nếu `false`, đọc lại canvas, xác định những gì đã thay đổi, sau đó mới sửa tiếp. Xem [Khôi phục lỗi](#7-khôi-phục-lỗi--tự-sửa-lỗi).
15. **BẮT BUỘC `return` TẤT CẢ node ID đã tạo hoặc chỉnh sửa.** Bất cứ khi nào script tạo node mới hoặc chỉnh sửa node sẵn có trên canvas, hãy thu thập mọi node ID bị ảnh hưởng và trả về trong một object có cấu trúc (ví dụ: `return { createdNodeIds: [...], mutatedNodeIds: [...] }`). Điều này thiết yếu để các lần gọi sau tham chiếu, kiểm chứng hoặc dọn dẹp các node đó. Không có trạng thái nào được lưu giữ giữa các lần gọi `use_figma`, nên hãy truyền ID từ các lần gọi trước dưới dạng **chuỗi ký tự tường minh (string literals)**, không dùng tên biến. Xem [common-patterns.md](references/common-patterns.md) để xem ví dụ quy trình nhiều bước.
16. **Luôn đặt `variable.scopes` tường minh khi tạo variable.** Mặc định `ALL_SCOPES` làm rác mọi bộ chọn thuộc tính — hầu như không bao giờ là điều bạn muốn. Hãy dùng các scope cụ thể như `["FRAME_FILL", "SHAPE_FILL"]` cho nền, `["TEXT_FILL"]` cho màu chữ, `["GAP"]` cho khoảng cách, v.v. Xem [variable-patterns.md](references/variable-patterns.md) để lấy danh sách đầy đủ.
17. **`await` mọi Promise.** Không bao giờ bỏ qua `await` trước Promise — các lệnh gọi bất đồng bộ không có `await` (ví dụ `figma.loadFontAsync(...)` thiếu `await`, hoặc `figma.setCurrentPageAsync(page)` thiếu `await`) sẽ chạy kiểu fire-and-forget, gây lỗi âm thầm hoặc race condition. Script có thể kết thúc trước khi thao tác bất đồng bộ hoàn tất, dẫn đến thiếu dữ liệu hoặc thay đổi áp dụng nửa vời.
18. **Không bao giờ đọc `componentPropertyDefinitions` từ một variant component.** Hãy thu hẹp chủ sở hữu trước: dùng chính node đó khi nó là `COMPONENT_SET`, chỉ dùng `COMPONENT` khi parent của nó không phải `COMPONENT_SET`, và ngược lại hãy nâng cấp từ variant `COMPONENT` lên `COMPONENT_SET` cha của nó. Optional chaining không làm getter này an toàn. Xem [Component-property owner narrowing](references/component-patterns.md#component-property-owner-narrowing).
19. **Không bao giờ đọc `componentPropertyDefinitions`, `componentProperties` hoặc `valuesByMode` trên cả một tập hợp.** Hãy xác định các node ID cụ thể trước, sau đó chỉ đọc gói thuộc tính cho riêng các ID đó. Đọc một node đã xác định là an toàn; map các getter này qua kết quả `findAll*`, `children` hoặc `getLocalVariables*` là nguyên nhân lớn nhất gây tràn kích thước dữ liệu trả về.
20. **Các lệnh đọc diện rộng chỉ trả về `id`, `name`, `type` và số lượng (counts).** Lấy chi tiết cho các ID đã chọn ở các lần gọi sau. Trả về từng danh mục toàn file — variables, text styles, effect styles, paint styles, components, pages — trong lệnh gọi riêng của nó; không gộp chung vào một kết quả trả về.
21. **Khi một lệnh đọc có thể trả về dữ liệu lớn, hãy đo kích thước chuỗi tuần tự hóa trước khi return.** Tính bằng byte, không phải độ dài mảng: `.slice()` giới hạn số dòng nhưng không giới hạn kích thước từng phần tử. Nếu vượt ngân sách, thu hẹp tập ID hoặc tách qua nhiều lần gọi. Không bao giờ bỏ sót ID bắt buộc hoặc âm thầm cắt bớt dữ liệu.
> Để xem ví dụ SAI/ĐÚNG chi tiết cho từng quy tắc, xem [Gotchas & Common Mistakes](references/gotchas.md).

## 2. Quy tắc trang (Quan trọng)

Setter chỉ hỗ trợ async và việc reset ngữ cảnh sau mỗi lần gọi đã được đề cập ở Quy tắc 9. Phần này làm rõ quy tắc cần ví dụ minh họa cụ thể: **chuyển trang tối đa một lần mỗi script, và phân tán công việc đa trang chạy song song.**

Không bao giờ lặp qua `figma.root.children` và chuyển trang bên trong vòng lặp — mỗi lần chuyển sẽ nạp lại file. Nếu công việc trải dài nhiều trang, **hãy tách thành N lệnh gọi `use_figma` (mỗi trang đích một lệnh) và phát chúng song song** — một tin nhắn assistant duy nhất chứa N khối gọi tool `use_figma`. Hệ thống thực thi sẽ chạy đồng thời các lệnh gọi này; mỗi script chỉ thiết lập `currentPage` đúng một lần.

> **Hướng dẫn bắt buộc:** khi phân tán (fan out), bạn PHẢI phát N lệnh gọi tool trong **cùng một tin nhắn**. Không gửi rải rác qua nhiều lượt. Không chờ lệnh này xong mới phát lệnh tiếp theo. Gọi tuần tự từng trang sẽ làm mất hoàn toàn lợi ích của việc tách lệnh.

```js
// AVOID — switches pages N times in one script, reloads the file each time
for (const page of figma.root.children) {
  await figma.setCurrentPageAsync(page);
  // ... touch this page ...
}

// PREFER — read-only discovery call to get page IDs, then in the NEXT message
// emit N parallel use_figma tool calls (one per page), each setting currentPage once.
```

Mặc định dùng fan-out song song cho mọi tác vụ đa trang — cả đọc lẫn ghi. Bạn cũng có thể gọi `use_figma` nhiều lần để dựng từng bước (ví dụ: `return` metadata về các node hiện có, sau đó sửa chúng trong script tiếp theo). Xem [gotchas.md → Set current page once per `use_figma` call](references/gotchas.md#set-current-page-once-per-use_figma-call--split-multi-page-work-into-parallel-calls) để hiểu đầy đủ lý do.

## 3. `return` là kênh xuất kết quả của bạn

Agent **CHỈ** thấy giá trị mà bạn `return` — `console.log()` vô hình (Quy tắc 4), và các lỗi ném ra được tự động bắt lại (cứ để lỗi lan truyền hoặc `throw` tường minh). Yêu cầu cứng là Quy tắc 15: mọi script tạo hoặc chỉnh sửa node trên canvas **BẮT BUỘC** trả về toàn bộ node ID bị ảnh hưởng cùng bất kỳ trạng thái xử lý được nào trong một object có cấu trúc — ví dụ: `return { createdNodeIds: [...], mutatedNodeIds: [...], count: 5, errors: [] }` — để các lệnh gọi sau có thể tham chiếu, kiểm chứng hoặc dọn dẹp chúng.

## 4. Chế độ Editor (Editor Mode)

`use_figma` hoạt động ở **design mode** (editorType `"figma"`, mặc định). FigJam (`"figjam"`) và Slides (`"slides"`) có bộ loại node khả dụng khác — hầu hết design node bị chặn trong FigJam, và các node chỉ có ở FigJam bị chặn trong Slides.

**Nhận biết editor qua URL:** Design = `figma.com/design/...`, FigJam = `figma.com/board/...`, Slides = `figma.com/slides/...`. Xác nhận trước khi giả định một API khả dụng.

Khả dụng trong design mode: Rectangle, Frame, Component, Text, Ellipse, Star, Line, Vector, Polygon, BooleanOperation, Slice, Page, Section, TextPath.

**Bị chặn** trong design mode: Sticky, Connector, ShapeWithText, CodeBlock, Slide, SlideRow, SlideGrid, InteractiveSlideElement, Webpage.

Khả dụng trong Slides mode: Rectangle, Frame, Component, Text, Ellipse, Star, Line, Vector, Polygon, BooleanOperation, Slice, Section, TextPath, Slide, SlideRow, SlideGrid, InteractiveSlideElement.

**Bị chặn** trong Slides mode: Sticky, Connector, ShapeWithText, CodeBlock, Webpage, Page.

**API chỉ dành cho Design (không chỉ riêng loại node):** `figma.createPage()` chỉ khả dụng trong các file Design (`figma.com/design/...`). Trong cả FigJam (`figma.com/board/...`) và Slides (`figma.com/slides/...`), nó ném lỗi `TypeError: figma.createPage no such property 'createPage' on the figma global object`. Không gọi `figma.createPage()` trong quy trình FigJam hoặc Slides.

> **Lưu ý về Slides:** Hiện chưa có tool đọc chuyên dụng cho file Slides. Hãy dùng `use_figma` với các script chỉ đọc để kiểm tra (xem mẫu "Kiểm tra trước" ở Mục 6), và dùng `get_screenshot` / `await node.screenshot()` để lấy ngữ cảnh trực quan. Để biết hướng dẫn API dành riêng cho Slides, hãy nạp skill [figma-use-slides](../figma-use-slides/SKILL.md).

## 5. Các API hiệu quả — Ưu tiên dùng thay cho cách viết dài dòng

Các API này giúp giảm code thừa, loại bỏ lỗi thứ tự và nén lượng token đầu ra. **Luôn ưu tiên chúng thay cho các cách thay thế dài dòng.**

### `node.query(selector)` — Tìm kiếm node giống CSS

Tìm các node trong một cây con (subtree) bằng bộ chọn giống CSS. Thay thế các vòng lặp `findAll` + filter dài dòng.

```js
// BEFORE — verbose traversal
const texts = frame.findAll(n => n.type === 'TEXT' && n.name === 'Title')

// AFTER — one-liner with query
const texts = frame.query('TEXT[name=Title]')
```

**Cú pháp selector:**
- Loại node (Type): `FRAME`, `TEXT`, `RECTANGLE`, `ELLIPSE`, `COMPONENT`, `INSTANCE`, `SECTION` (không phân biệt hoa thường)
- Thuộc tính khớp chính xác: `[name=Card]`, `[visible=true]`, `[opacity=0.5]`
- Thuộc tính khớp chuỗi con: `[name*=art]` (chứa), `[name^=Header]` (bắt đầu bằng), `[name$=Nav]` (kết thúc bằng)
- Duyệt theo đường dẫn chấm (dot-path): `[fills.0.type=SOLID]`, `[fills.*.type=SOLID]` (chỉ số wildcard)
- Khớp instance: `[mainComponent=nodeId]`, `[mainComponent.name=Button]`
- Bộ kết hợp (Combinators): `FRAME > TEXT` (con trực tiếp), `FRAME TEXT` (mọi hậu duệ), `A + B` (anh em liền kề), `A ~ B` (anh em chung cấp)
- Pseudo-classes: `:first-child`, `:last-child`, `:nth-child(2)`, `:not(TYPE)`, `:is(FRAME, RECTANGLE)`, `:where(TEXT, ELLIPSE)`
- Node ID: `#nodeId` hoặc GUID trần
- Dấu phẩy: `TEXT, RECTANGLE` (hợp - union)
- Wildcard: `*` (bất kỳ loại nào)

**Các method của QueryResult:**
| Method | Mô tả |
|---|---|
| `.length` | Số lượng node khớp |
| `.first()` | Node khớp đầu tiên (hoặc `null`) |
| `.last()` | Node khớp cuối cùng (hoặc `null`) |
| `.toArray()` | Chuyển thành mảng thông thường |
| `.each(fn)` | Duyệt với callback, trả về `this` để gọi nối chuỗi (chaining) |
| `.map(fn)` | Ánh xạ thành mảng mới |
| `.filter(fn)` | Lọc thành QueryResult mới |
| `.values(keys)` | Trích xuất giá trị thuộc tính: `.values(['name', 'x', 'y'])` → `[{name, x, y}, ...]` |
| `.set(props)` | Đặt thuộc tính lên toàn bộ node khớp (xem `node.set()` bên dưới) |
| `.query(selector)` | Truy vấn con bên trong các node khớp |
| `for...of` | Hỗ trợ duyệt iterable — dùng được trong vòng lặp `for` |

**Phạm vi:** `node.query()` tìm kiếm bên trong cây con của node đó. Để tìm toàn bộ trang: `figma.currentPage.query('...')`. Không có `figma.query()` toàn cục.

**Ví dụ:**
```js
// Recolor all text inside cards
figma.currentPage.query('FRAME[name^=Card] TEXT').set({
  fills: [{type: 'SOLID', color: {r: 0.2, g: 0.2, b: 0.8}}]
})

// Get names and positions of all frames
return figma.currentPage.query('FRAME').values(['name', 'x', 'y'])

// Find the first component named "Button"
const btn = figma.currentPage.query('COMPONENT[name=Button]').first()

// Find all instances of a specific component
figma.currentPage.query(`INSTANCE[mainComponent=${compId}]`)

// Find nodes with solid fills using dot-path traversal
figma.currentPage.query('[fills.0.type=SOLID]')
```

### `node.set(props)` — Cập nhật thuộc tính hàng loạt

Thiết lập nhiều thuộc tính trong một lần gọi. Trả về `this` để gọi nối chuỗi.

```js
// BEFORE — one line per property
frame.opacity = 0.5
frame.cornerRadius = 8
frame.name = "Card"

// AFTER — single call
frame.set({ opacity: 0.5, cornerRadius: 8, name: "Card" })
```

**Thứ tự ưu tiên key:** `layoutMode` luôn được áp dụng trước các thuộc tính khác (như `width`/`height`) bất kể thứ tự key trong object. Điều này ngăn lỗi phổ biến khi `resize()` hoạt động khác nhau tùy vào việc `layoutMode` đã được đặt hay chưa.

**Xử lý width/height:** `width` và `height` tự động được định tuyến qua `node.resize()` — đặt `{ width: 200 }` sẽ gọi `resize(200, currentHeight)`.

**Gọi nối chuỗi với query:**
```js
// Find all rectangles named "Divider" and update them
figma.currentPage.query('RECTANGLE[name=Divider]').set({
  fills: [{type: 'SOLID', color: {r: 0.9, g: 0.9, b: 0.9}}],
  cornerRadius: 2
})
```

### `figma.createAutoLayout(direction?, props?)` — Tạo frame auto-layout

Tạo một frame đã bật sẵn auto-layout và cả hai trục đều ôm khít nội dung (`HUG`). **Đây là container mặc định bất cứ khi nào các node con có quan hệ cấu trúc với nhau (xem Quy tắc 12a).**

```js
// BEFORE — manual setup, easy to get ordering wrong
const frame = figma.createFrame()
frame.layoutMode = 'VERTICAL'
frame.primaryAxisSizingMode = 'AUTO'
frame.counterAxisSizingMode = 'AUTO'
frame.layoutSizingHorizontal = 'HUG'
frame.layoutSizingVertical = 'HUG'

// AFTER — one call, layout ready
const frame = figma.createAutoLayout('VERTICAL')
```

Các node con có thể dùng ngay `layoutSizingHorizontal/Vertical = 'FILL'` sau khi được append — không cần tự đặt các chế độ sizing thủ công.

Chấp nhận một object props tùy chọn ở tham số thứ nhất hoặc thứ hai:
```js
figma.createAutoLayout({ name: 'Card', itemSpacing: 12 })               // HORIZONTAL + props
figma.createAutoLayout('VERTICAL', { name: 'Column', itemSpacing: 8 })  // VERTICAL + props
```

### `node.placeholder` — Lớp phủ shimmer báo hiệu AI đang xử lý

Đặt một lớp phủ hiệu ứng shimmer trực quan lên node để báo hiệu công việc đang tiến hành. **Luôn gỡ bỏ shimmer khi làm xong** — các shimmer còn sót lại gây nhầm lẫn cho người dùng và báo hiệu công việc chưa hoàn thành.

```js
// Mark as in-progress
frame.placeholder = true

// ... build out the content ...

// MUST remove when done — never leave shimmers on finished nodes
frame.placeholder = false
```

Khi dựng các layout phức tạp, hãy đặt `placeholder = true` trên các section trước khi đổ nội dung, sau đó đặt `placeholder = false` cho từng section ngay khi nó hoàn tất.

### `await node.screenshot(opts?)` — Chụp ảnh màn hình trực tiếp (inline)

Chụp một node thành ảnh PNG và trả về trực tiếp trong phản hồi. Loại bỏ nhu cầu gọi thêm tool `get_screenshot` riêng biệt.

```js
// Take a screenshot of a frame (returned inline in the tool response)
await frame.screenshot()

// Custom scale (default auto-scales: 0.5x or capped so max dimension ≤ 1024px)
await frame.screenshot({ scale: 2 })

// Include overlapping content from sibling nodes
await frame.screenshot({ contentsOnly: false })
```

**Khi nào dùng:** Tuân thủ Quy tắc 5. Chụp một screenshot tổng hợp khi cần bằng chứng trực quan. Nếu tiếp theo có bước sửa lỗi hiển thị, chụp một screenshot sau khi sửa; ảnh đạt yêu cầu đó là ảnh cuối cùng. Không chụp thêm một ảnh "cuối cùng" khi không có thay đổi gì.

**Tự động đặt tên:** Chú thích ảnh bao gồm metadata của node — `"Card (300x150 at 0,60).png"` — cung cấp ngữ cảnh không gian mà không cần phân tích hình ảnh.

**Tỉ lệ mặc định:** Dùng tỉ lệ 0.5x, nhưng tự động giới hạn sao cho chiều lớn nhất của ảnh đầu ra không vượt quá 1024px. Truyền tường minh `{ scale: N }` sẽ bỏ qua giới hạn này.

## 6. Quy trình từng bước (Cách tránh lỗi)

Nguyên nhân phổ biến nhất gây lãng phí là phân mảnh không cần thiết, kiểm chứng dư thừa và viết script không thể retry an toàn. **Hãy áp dụng quy ước retry an toàn và kiểm chứng dựa trên bằng chứng ở Quy tắc 5.**

### Quy tắc cốt lõi

- **Chọn ranh giới lệnh gọi vì khả năng khôi phục, không phải vì nhịp kiểm chứng.** Gom nhóm các thao tác tạo, cập nhật thuộc tính, gắn parent và chẩn đoán có mục tiêu liên quan khi an toàn. Một trang hoàn chỉnh có thể nằm trong một lần gọi; đừng tách thành các lệnh gọi riêng cho header/content/footer chỉ để kiểm chứng từng phần. **Ngoại lệ Slides:** trong file Slides, các slide là những cây con độc lập — giới hạn cần quan tâm là độ phức tạp trên mỗi slide, không phải tổng số node trên toàn bộ slide. Dựng 3–5 slide mới trong một lần gọi là an toàn, và việc áp dụng cùng một chỉnh sửa (ví dụ: thêm footer, đổi màu tiêu đề) trên mọi slide trong deck trong một lần gọi cũng vậy. Xem [figma-use-slides](../figma-use-slides/SKILL.md) để biết quy trình dựng deck.
- **Dựng từ trên xuống (top-down), bắt đầu với placeholder.** Tạo cấu trúc ngoài cùng trước với `placeholder = true` trên mỗi section, sau đó thay thế dần các placeholder bằng nội dung thật trong các lần gọi tiếp theo.

### Quy trình chuẩn

1. **Kiểm tra trước (Inspect first).** Trước khi tạo bất cứ thứ gì, chạy một lệnh `use_figma` chỉ đọc để khám phá những gì đã tồn tại trong file — các trang, component, variable, quy ước đặt tên. Làm khớp theo những gì đã có.
2. **Dựng bộ khung (Build the skeleton).** Tạo cấu trúc cấp cao nhất với các section placeholder. Đặt `placeholder = true` trên từng section để người dùng thấy tiến trình.
3. **Điền nội dung theo từng lô retry an toàn.** Nhiều section liên quan có thể được điền cùng lúc khi thao tác vẫn đảm bảo retry an toàn. Đặt `placeholder = false` cho mỗi section khi hoàn thành.
4. **Trả về các ID sau mọi lệnh gọi** (Quy tắc 15) — bạn sẽ cần các node/variable/collection ID mới tạo làm đầu vào cho các lệnh gọi tiếp theo.
5. **Trả về bằng chứng kiểm chứng từ các thao tác ghi.** Trả về các ID cùng số lượng, tên, cấu trúc phân cấp hoặc kích thước biên liên quan. Chỉ bổ sung kiểm tra riêng khi thiếu bằng chứng hoặc sau khi một thao tác ghi làm mất hiệu lực bằng chứng trước đó. Tuân thủ Quy tắc 5 cho các bước kiểm tra trực quan.
6. **Sửa lỗi trước khi đi tiếp.** Nếu kiểm chứng phát hiện vấn đề, hãy sửa nó trước khi sang bước tiếp theo. Không xây tiếp trên một nền tảng đang lỗi.

### Thứ tự bước gợi ý cho tác vụ phức tạp

```
Step 1: Inspect file — discover existing pages, components, variables, conventions
Step 2: Create tokens/variables (if needed)
       → return collection, variable, and mode counts
Step 3: Create individual components
       → return component IDs and relevant child/variant counts
Step 4: Compose layouts from component instances
       → return layout IDs/bounds + take a composition screenshot
Step 5: Apply a targeted visual fix only if needed
       → take one post-fix screenshot; this is final
Step 6: Stop if nothing relevant changed
```

### Cần kiểm chứng gì ở mỗi bước

| Sau khi... | Kiểm tra với `get_metadata` | Kiểm tra với `get_screenshot` |
|---|---|---|
| Tạo variables | Số lượng collection, số lượng variable, tên các mode | — |
| Tạo components | Số lượng node con, tên các variant, property definitions | Các variant hiển thị rõ, không bị sụp/chồng, lưới dễ đọc |
| Bind variables | Thuộc tính node phản ánh đúng binding | Màu sắc/token được phân giải chính xác |
| Lắp ráp layouts | Các instance node có `mainComponent`, phân cấp đúng | Không bị cắt/xén chữ, không chồng lấp phần tử, khoảng cách chuẩn |

## 7. Khôi phục lỗi & Tự sửa lỗi

Khi có bất kỳ lỗi `use_figma` nào, tuân thủ `safeToRetryWithoutCanvasRead` (Quy tắc 14): `true` → sửa lỗi đã xác định và thử lại mà không cần thêm lệnh đọc chẩn đoán canvas; `false` → đọc canvas, xác định những gì đã thay đổi, sau đó mới thực hiện chỉnh sửa. Nếu cùng một lỗi API hoặc thuộc tính xảy ra hai lần, hãy kiểm tra định nghĩa của nó một lần và sửa tận gốc trước khi thử lại; không tiếp tục chia nhỏ thao tác xoay quanh cùng một lệnh ghi không hợp lệ. Các lỗi đã có cách sửa trong Quy tắc bắt buộc đều được chẩn đoán tại đó — `"not implemented"` (`figma.notify`, Quy tắc 3), các lỗi từ chối HUG/FILL của `layoutSizing*` (Quy tắc 12, 12b), `"Setting figma.currentPage is not supported"` (Quy tắc 9), `componentPropertyDefinitions` trên một variant (Quy tắc 18), và `characters`/`description` trên sai loại node (Quy tắc 3a, 3b). Bảng dưới đây xử lý các lỗi chưa được đặt tên trong quy ước trên:

| Thông báo lỗi | Nguyên nhân khả dĩ | Cách khắc phục |
|---|---|---|
| Property value out of range | Kênh màu > 1 (dùng thang 0–255 thay vì 0–1) | Chia cho 255 |
| `"Cannot read properties of null"` | Node không tồn tại (sai ID, sai trang) | Kiểm tra ngữ cảnh trang, xác minh ID |
| Script treo / không phản hồi | Vòng lặp vô hạn hoặc promise chưa xử lý | Kiểm tra `while(true)` hoặc thiếu `await`; đảm bảo code kết thúc được |
| `"The node with id X does not exist"` | Instance cha đã bị detach ngầm bởi lệnh `detachInstance()` ở con, làm thay đổi các ID | Tìm lại các node bằng cách duyệt từ một frame cha ổn định (không phải instance) |

### Khi script chạy thành công nhưng kết quả trông sai

Gọi `get_metadata` để kiểm tra tính đúng đắn về cấu trúc (phân cấp, số lượng, vị trí) và `get_screenshot` để kiểm tra tính đúng đắn về thị giác — quan sát kỹ các lỗi cắt/xén chữ (line height cắt mất phần nét dưới/trên của chữ) và các phần tử chồng lấp nhau, đây là các lỗi rất phổ biến và dễ bị bỏ sót. Xác định xem sai lệch là về cấu trúc hay thị giác, sau đó viết một script sửa lỗi **có mục tiêu** chỉ chỉnh những phần bị hỏng — không dựng lại toàn bộ.

> Để xem quy trình kiểm chứng đầy đủ, xem [Validation & Error Recovery](references/validation-and-recovery.md).

## 8. Danh sách kiểm tra trước khi chạy (Pre-Flight Checklist)
Trước khi gửi BẤT KỲ lệnh gọi `use_figma` nào, hãy rà soát lại script đối chiếu với quy ước vận hành ở [Mục 1](#1-quy-tắc-bắt-buộc). Mọi chốt chặn từng được liệt kê ở đây giờ đều nằm tại mục đó — một script vi phạm bất kỳ điều nào sau đây đều chưa sẵn sàng để gửi:

- [ ] **Đầu ra (Output)** — dùng `return` (không dùng `figma.closePlugin()`), không bọc trong async IIFE, không dùng `console.log()` làm đầu ra; `return` dữ liệu có cấu trúc chứa TẤT CẢ node ID đã tạo/chỉnh sửa (Quy tắc 1, 2, 4, 15)
- [ ] **Màu sắc & fills** — thang 0–1; `color` của paint chỉ gồm `{r, g, b}` (không có `a`); `fills`/`strokes` được gán lại bằng mảng mới (Quy tắc 6, 7)
- [ ] **Thu hẹp kiểu (Type narrowing)** — kiểm tra bảo vệ/thu hẹp trước khi truy cập `characters`, `description` và `componentPropertyDefinitions` (Quy tắc 3a, 3b, 18)
- [ ] **Trang (Pages)** — chuyển trang bằng `await figma.setCurrentPageAsync(page)`, tối đa một lần mỗi lệnh gọi (Quy tắc 9)
- [ ] **Layout & sizing** — các node con liên quan nằm trong `figma.createAutoLayout()`; các node cấp cao nhất đặt xa (0,0); đặt `HUG`/`FILL` sau `appendChild`; gọi `resize()` trước các chế độ sizing; TEXT tự xuống dòng dùng `textAutoResize='HEIGHT'` + chiều rộng FIXED (Quy tắc 12, 12a, 12b, 12c, 13)
- [ ] **Văn bản (Text)** — quy trình nạp font chuẩn với tên style đã xác minh qua `listAvailableFontsAsync()`; `lineHeight`/`letterSpacing` dạng `{unit, value}`; variable `FONT_FAMILY` nạp trước giá trị của mọi mode (Quy tắc 8)
- [ ] **Async & trạng thái** — mọi Promise đều được `await`; các ID nhiều bước được truyền dưới dạng chuỗi ký tự tường minh (Quy tắc 15, 17)

## 9. Khám phá quy ước trước khi tạo mới

**Luôn kiểm tra file Figma trước khi tạo bất cứ thứ gì.** Các file khác nhau dùng quy ước đặt tên, cấu trúc variable và mẫu component khác nhau. Code của bạn cần khớp với những gì đã có sẵn, không áp đặt quy ước mới.

Khi phân vân về bất kỳ quy ước nào (đặt tên, phạm vi scope, cấu trúc), hãy kiểm tra file Figma trước, sau đó kiểm tra codebase của người dùng. Chỉ quay về các mẫu phổ biến khi cả hai đều không có.

### Các script kiểm tra nhanh

**Liệt kê toàn bộ trang và các node cấp cao nhất:**
```js
const pages = figma.root.children.map(p => `${p.name} id=${p.id} children=${p.children.length}`);
return pages.join('\n');
```

**Liệt kê các component hiện có trên tất cả các trang:**

`search_design_system` là một lựa chọn cho các component đã publish. Với các component nằm trên canvas, hãy dùng kỹ thuật fan-out hai bước — **không lặp qua các trang trong một script.**

Bước 1: một lệnh `use_figma` chỉ đọc để lấy các page ID:
```js
return figma.root.children.map(p => ({ id: p.id, name: p.name }));
```

Bước 2: ở **lượt phản hồi assistant tiếp theo, phát song song mỗi trang một `use_figma`** (một tin nhắn duy nhất chứa N khối gọi tool). Mỗi lệnh chạy:
```js
const page = await figma.getNodeByIdAsync(PAGE_ID);
await figma.setCurrentPageAsync(page);
// findAllWithCriteria uses an indexed type lookup — hundreds of times faster
// than the findAll(n => n.type === '…') side-effect-in-predicate antipattern.
const matches = page.findAllWithCriteria({ types: ['COMPONENT', 'COMPONENT_SET'] });
return matches.map(n => ({ page: page.name, name: n.name, type: n.type, id: n.id }));
```

**Liệt kê các variable collection hiện có và quy ước của chúng:**
```js
const collections = await figma.variables.getLocalVariableCollectionsAsync();
const results = collections.map(c => ({
  name: c.name, id: c.id,
  varCount: c.variableIds.length,
  modes: c.modes.map(m => m.name)
}));
return results;
```

## 10. Tài liệu tham khảo

Nạp các tài liệu này khi cần tùy thuộc vào công việc trong tác vụ của bạn:

| Tài liệu | Khi nào cần nạp | Nội dung bao gồm |
|-----|-------------|----------------|
| [gotchas.md](references/gotchas.md) | Trước mọi lệnh `use_figma` | Mọi bẫy lỗi đã biết kèm ví dụ code WRONG/CORRECT — bắt đầu với [canonical text-edit recipe](references/gotchas.md#canonical-text-edit-recipe-font-load--await--mutate--return-ids) |
| [common-patterns.md](references/common-patterns.md) | Cần ví dụ code chạy được | Khung script mẫu: hình khối, văn bản, auto-layout, variables, components, quy trình nhiều bước |
| [plugin-api-patterns.md](references/plugin-api-patterns.md) | Tạo/chỉnh sửa node | Fills, strokes, Auto Layout, effects, grouping, cloning, styles |
| [api-reference.md](references/api-reference.md) | Cần bề mặt API chính xác | Tạo node, variables API, thuộc tính cốt lõi, những gì hoạt động và không hoạt động |
| [validation-and-recovery.md](references/validation-and-recovery.md) | Ghi nhiều bước hoặc khôi phục lỗi | Quy trình `get_metadata` vs `get_screenshot`, các bước khôi phục lỗi bắt buộc |
| [component-patterns.md](references/component-patterns.md) | Tạo component/variant | combineAsVariants, component properties, INSTANCE_SWAP, bố cục variant, khám phá component sẵn có, duyệt metadata |
| [variable-patterns.md](references/variable-patterns.md) | Tạo/bind variables | Collections, modes, scopes, aliasing, các mẫu binding, khám phá variable sẵn có |
| [text-style-patterns.md](references/text-style-patterns.md) | Tạo/áp dụng text styles | Type ramps, khám phá font qua `listAvailableFontsAsync`, liệt kê style, áp dụng style cho node |
| [effect-style-patterns.md](references/effect-style-patterns.md) | Tạo/áp dụng effect styles | Drop shadows, liệt kê style, áp dụng style cho node |
| [plugin-api-standalone.index.md](references/plugin-api-standalone.index.md) | Cần nắm toàn bộ bề mặt API | Mục lục toàn bộ types, methods và properties trong Plugin API |
| [plugin-api-standalone.d.ts](references/plugin-api-standalone.d.ts) | Cần chữ ký kiểu (type signature) chính xác | File typings đầy đủ — grep từng symbol cụ thể, không nạp toàn bộ cùng lúc |

## 11. Ví dụ đoạn mã (Snippets)

Bạn sẽ thấy các đoạn mã mẫu xuyên suốt tài liệu tại đây. Các đoạn mã này chứa code Plugin API hữu ích có thể tái sử dụng. Hãy dùng nguyên bản hoặc làm code khởi đầu trong quá trình làm việc. Nếu có những khái niệm quan trọng phù hợp nhất để lưu thành đoạn mã dùng chung, hãy trích xuất và ghi ra đĩa để tái sử dụng trong tương lai.
