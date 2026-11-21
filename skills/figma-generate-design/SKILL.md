---
name: figma-generate-design
description: "Sử dụng skill này cùng với `figma-use` khi tác vụ liên quan đến việc chuyển đổi một trang ứng dụng, khung nhìn (view), hoặc bố cục nhiều phần sang Figma. Các từ khóa kích hoạt: 'write to Figma', 'create in Figma from code', 'push page to Figma', 'take this app/page and build it in Figma', 'create a screen', 'build a landing page in Figma', 'update the Figma screen to match code', 'convert this modal/dialog/drawer/panel to Figma'. Đây là skill quy trình ưu tiên bất cứ khi nào người dùng muốn dựng hoặc cập nhật toàn bộ trang, modal, dialog, drawer, sidebar, panel, form, dashboard, list, table, card, header, bản xem trước tin nhắn, hoặc các UI sản phẩm tổng hợp khác trong Figma từ code hoặc mô tả — ngay cả khi người dùng gọi UI tổng hợp đó là một component. Skill giúp khám phá các component, variable và style của design system từ các file Code Connect, màn hình hiện có và tìm kiếm thư viện, sau đó import chúng và lắp ráp khung nhìn từng bước theo từng phần bằng các token của design system thay vì giá trị hardcode."
disable-model-invocation: false
---
# Xây dựng / Cập nhật Màn hình và Khung nhìn từ Design System

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-generate-design/SKILL.md) (Figma chính thức).

**Chốt chặn sản phẩm bàn giao cứng (Hard deliverable gate):** Đầu ra từ code sang thiết kế phải tái tạo giao diện dưới dạng văn bản chỉnh sửa được, các component, biểu tượng (icon) và cấu trúc phân cấp rõ ràng.
Chỉ coi bất kỳ ảnh chụp màn hình (screenshot) hay bản kết xuất phẳng (flattened rendering) nào của toàn bộ UI là tài liệu tham khảo trực quan: tuyệt đối không upload hoặc import nó vào sản phẩm bàn giao, kể cả dưới dạng fill của khung bọc ngoài (wrapper fill) hay một node con, ngay cả khi nó có sẵn trong repository hoặc trông giống pixel hơn. Trước khi hoàn tất, hãy kiểm tra kết quả; nếu UI không được biểu diễn chủ yếu bằng các layer chỉnh sửa được, hãy dựng lại theo ngữ nghĩa (semantically) hoặc báo thất bại.

Sử dụng skill này để tạo mới hoặc cập nhật **màn hình, khung nhìn (view) và các container UI nhiều phần** trong Figma bằng cách **tái sử dụng design system đã xuất bản (published)** — các component, variable và style — thay vì vẽ các hình khối cơ bản với giá trị hardcode. Phạm vi này bao gồm toàn bộ trang, modal, dialog, drawer, sidebar, panel và bất kỳ khung nhìn tổng hợp nào có nhiều phần. Điểm mấu chốt: file Figma nhiều khả năng đã có một design system được xuất bản chứa các component, variable màu/khoảng cách và text/effect style tương ứng với các UI component và token trong codebase. Hãy tìm và sử dụng chúng thay vì vẽ các khung hộp với mã màu hex.

**BẮT BUỘC**: Bạn PHẢI nạp thêm [figma-use](../figma-use/SKILL.md) trước bất kỳ lệnh gọi `use_figma` nào. Skill đó chứa các quy tắc quan trọng (thang màu, nạp font, v.v.) áp dụng cho mọi script bạn viết.

Khi khả dụng, hãy gọi `create_session` với `fileKey` và `description` trước khi đọc hoặc chỉnh sửa file (tạo file trước nếu cần), sau đó truyền nguyên vẹn `sessionId` trả về vào mọi lệnh gọi có nhận tham số này, bao gồm cả các bước tiếp theo và công việc xuyên suốt nhiều file.

**Luôn đưa `figma-generate-design` vào tham số `skillNames` phân tách bằng dấu phẩy khi gọi `use_figma` trong khuôn khổ skill này. Nếu skill này được nạp qua MCP resource, bạn BẮT BUỘC phải thêm tiền tố `resource:` vào tên (ví dụ: `resource:figma-generate-design`).** Đây là tham số ghi log — không ảnh hưởng đến quá trình thực thi.

## Tài nguyên hình ảnh và vector

Ưu tiên tái sử dụng các asset từ mã nguồn, bản chụp (captured) hoặc thư viện sẵn có trước. Nếu không có asset phù hợp, hãy dùng `generate_image` của Figma cho ảnh raster hoặc `generate_vector_illustration` cho các icon, logo và hình minh họa có thể chỉnh sửa.

## Phạm vi ranh giới của Skill

- Sử dụng skill này khi sản phẩm bàn giao là một **khung nhìn Figma tổng hợp (composed Figma view)** (tạo mới hoặc cập nhật) — bao gồm form, dashboard, danh sách, bảng, card, header, panel, dialog, bản xem trước tin nhắn hoặc các container nhiều phần khác — được dựng từ các instance component của design system. Điều này áp dụng ngay cả khi người dùng gọi khung nhìn tổng hợp đó là một component.
- Nếu sản phẩm bàn giao chính là một **thành phần cơ sở hoặc nền tảng thư viện tái sử dụng** dành cho các variant, token hoặc xuất bản (publication), hãy dùng [figma-generate-library](../figma-generate-library/SKILL.md) cùng với [figma-use](../figma-use/SKILL.md).
- Nếu người dùng muốn viết **các ánh xạ Code Connect**, hãy chuyển sang [figma-code-connect](../figma-code-connect/SKILL.md).

## Điều kiện tiên quyết

- Figma MCP server phải được kết nối.
- File Figma đích phải có một design system đã xuất bản kèm các component (hoặc có quyền truy cập vào thư viện nhóm - team library).
- Người dùng phải cung cấp file Figma đích (URL hoặc `fileKey`). Nếu họ chưa có, hãy kích hoạt `/figma-create-new-file` (hoặc gọi `create_new_file`) trước và dùng lại `file_key` trả về. Cả `use_figma` và `generate_figma_design` đều yêu cầu một `fileKey` đã tồn tại.
- Mã nguồn hoặc mô tả của màn hình/khung nhìn cần dựng hoặc cập nhật.

## Quy trình song song với generate_figma_design (Chỉ dành cho Web App)

Khi dựng một màn hình từ một **web app** có thể kết xuất trên trình duyệt, kết quả tốt nhất đạt được khi chạy song song cả hai hướng tiếp cận:

1. **Chạy song song:**
   - Bắt đầu dựng màn hình theo quy trình của skill này (`use_figma` + các component của design system) trên file Figma đích (`fileKey`).
   - Chạy `generate_figma_design` vào **cùng `fileKey` đó** để chụp lại bản kết xuất chính xác từng pixel của web app đang chạy vào file đó. `generate_figma_design` luôn yêu cầu `fileKey` — nếu người dùng chưa có file Figma, trước tiên hãy kích hoạt `/figma-create-new-file` (hoặc gọi MCP tool `create_new_file`) để lấy file và dùng lại `file_key` đó cho cả skill này lẫn quá trình chụp.
2. **Khi cả hai hoàn tất:** Cập nhật đầu ra từ `use_figma` để khớp với bố cục chính xác từng pixel từ bản chụp `generate_figma_design`. Bản chụp cung cấp chính xác khoảng cách, kích thước và cách xử lý trực quan cần hướng tới, trong khi đầu ra `use_figma` của bạn chứa các component instance chuẩn liên kết với design system. Nếu bản chụp có chứa hình ảnh, hãy chuyển chúng sang đầu ra `use_figma` của bạn bằng cách sao chép các giá trị `imageHash` từ image fill của bản chụp (xem Bước 5 để biết chi tiết).
3. **Sau khi xác nhận hiển thị tốt:** Xóa đầu ra của `generate_figma_design` — nó chỉ được dùng làm tài liệu tham khảo trực quan.

Cách này kết hợp ưu điểm của cả hai: `generate_figma_design` đem lại độ chính xác bố cục từng pixel, còn `use_figma` đem lại các component instance chuẩn của design system luôn được liên kết và cập nhật được.

**Quy trình song song này là BẮT BUỘC khi mã nguồn chứa các hình ảnh nội dung riêng lẻ mà ứng dụng sử dụng, chẳng hạn như ảnh chụp, avatar, logo hoặc icon. Ảnh chụp màn hình hay bản kết xuất phẳng của toàn bộ UI chỉ là tài liệu tham khảo trực quan, không phải ảnh nội dung.** Plugin API của `use_figma` không thể tải các URL hình ảnh bên ngoài — nó chỉ có thể đặt image fill bằng cách sao chép giá trị `imageHash` từ các node đã có trong file. `generate_figma_design` raster hóa toàn bộ hình ảnh hiển thị vào Figma, cung cấp các mã hash bạn cần. Nếu bạn bỏ qua bước chụp khi có các ảnh nội dung này, các khung ảnh của chúng sẽ bị bỏ trống.

Đối với các ứng dụng không phải web (iOS, Android, v.v.) hoặc khi cập nhật màn hình có sẵn, hãy dùng quy trình tiêu chuẩn dưới đây.

## Quy trình bắt buộc

**Thực hiện các bước sau theo đúng thứ tự. Không bỏ qua bước nào.**

> **Các bất biến bắt buộc:**
>
> - Hoàn tất khám phá Code Connect và chọn thư viện đích trước khi chỉnh sửa sản phẩm bàn giao. Các lệnh import chỉ phục vụ khám phá và các instance tạm thời được phép dùng; phải xóa bỏ instance tạm ngay lập tức.
> - Áp dụng từng asset đã chọn tại nơi nó được import. Nếu lệnh import thất bại, hãy thử kết quả khớp chính xác phù hợp tiếp theo trước khi tự dựng phương án dự phòng thủ công.

### Bước 1: Hiểu rõ sản phẩm bàn giao

Trước khi chạm vào Figma, hãy hiểu rõ bạn đang dựng gì:

1. Nếu dựng từ code, đọc các file mã nguồn liên quan để hiểu cấu trúc, các section và những component nào được sử dụng.
2. Xác định các section chính của khung nhìn (ví dụ, với một trang: Header, Hero, Content Panels, Footer; với một modal: Title Bar, Form Sections, Action Bar; với một sidebar: Navigation, Content Area, Footer Actions).
3. Với mỗi section, liệt kê các UI component tham gia (button, input, card, navigation pill, accordion, v.v.).
4. **Xác định font family của sản phẩm từ mã nguồn. Không mặc định chọn Inter.** Hãy tìm xem sản phẩm sử dụng *kiểu chữ* nào trước khi viết bất kỳ script nào. Xem [references/discover-product-font.md](references/discover-product-font.md) để biết nơi tìm (CSS variables, file component) và cách xử lý tên font Figma rắc rối.
5. **Kiểm tra xem khung nhìn có chứa hình ảnh nào không** (ví dụ `<img>`, `<Image>`, ảnh nền, ảnh sản phẩm, avatar, icon tải từ URL). Nếu có và đây là web app, bạn **bắt buộc** chạy quy trình chụp `generate_figma_design` song song — khởi chạy nó ngay cùng với Bước 2 để bản chụp chạy trong lúc bạn khám phá component. Xem mục "Quy trình song song với generate_figma_design" ở trên.

### Bước 2: Thu thập Component Keys, Variables và Styles

Bạn cần ba thứ từ design system: **components** (buttons, cards, v.v.), **variables** (màu sắc, khoảng cách, bo góc), và **styles** (text styles, effect styles như đổ bóng). Không hardcode mã màu hex hay giá trị pixel khi đã có design system token.

#### 2a: Khám phá components

**2a-i — BẮT BUỘC: Kiểm tra Code Connect cho các component cần dùng.** Bắt đầu từ danh sách component đã lập ở Bước 1, kiểm tra xem mỗi component có file Code Connect trong codebase hay không. Các file Code Connect nằm cạnh mã nguồn component và được đặt tên theo nền tảng:

- **TypeScript/JS**: `*.figma.ts`, `*.figma.js`
- **React (dựa trên parser)**: `*.figma.tsx`
- **Kotlin/Compose**: các file `.kt` chứa `@FigmaConnect`
- **Swift**: các file `.swift` chứa `FigmaConnect`

Với mỗi component bạn cần (ví dụ: Button, Card, Input), tìm file Code Connect của nó — glob hoặc grep theo tên component (ví dụ `**/Button.figma.tsx`, `**/Card.figma.ts`). Chỉ đọc các file khớp với component bạn thực sự cần.

Từ mỗi file Code Connect khớp, trích xuất URL component Figma. Phân tách `fileKey` và `nodeId` từ URL (chuyển dấu gạch ngang thành dấu hai chấm: `123-456` → `123:456`). Sau đó phân giải component key qua `use_figma`:

**Ví dụ:** File Code Connect chứa `// url=https://figma.com/design/ABC123/File?node-id=609-35535`. Phân tách `fileKey` = `ABC123`, `nodeId` = `609:35535`. Chạy `use_figma` nhắm vào **file thư viện** (`fileKey` `ABC123`, không phải file đích) để lấy key:

```js
const node = await figma.getNodeByIdAsync("609:35535");
const set = node?.parent?.type === "COMPONENT_SET" ? node.parent : node;
if (set?.type === "COMPONENT_SET") {
  return { assetType: "component_set", componentSetKey: set.key };
}
if (set?.type === "COMPONENT") {
  return { assetType: "component", componentKey: set.key };
}
throw new Error("Expected a component or component set");
```

Gom nhiều lượt tra cứu vào một lần gọi duy nhất. Dùng các key trả về với `importComponentByKeyAsync()` hoặc `importComponentSetByKeyAsync()` tùy theo `assetType` của từng mục ở Bước 4.

Đánh dấu các component đã tìm thấy và tiếp tục xử lý các component chưa giải quyết được.

**2a-ii — BẮT BUỘC: Chọn phạm vi thư viện, sau đó tìm kiếm và kiểm tra toàn bộ khung nhìn.** Gọi `get_libraries`. Nếu người dùng nêu tên một hoặc nhiều thư viện, hãy dùng chính xác key của chúng bất kể chúng nằm trong `libraries_added_to_file` hay `libraries_available_to_add`. Ngược lại, hãy tìm kiếm đồng thời trên tất cả thư viện có trong `libraries_added_to_file`. Truyền các key đã chọn vào `includeLibraryKeys` trong mọi lần tìm kiếm. Chỉ khi các phần còn thiếu chưa giải quyết được không có kết quả khớp phù hợp, mới thêm cụ thể các thư viện liên quan từ `libraries_available_to_add` và thử lại các truy vấn chưa giải quyết đó; không mở rộng sang các thư viện khả dụng không liên quan. Trong lần gọi `search_design_system` gom nhóm đầu tiên, đưa vào một truy vấn component cho khung nhìn hoặc luồng được yêu cầu cùng với các truy vấn cho các mục chưa giải quyết đã biết từ mã nguồn hoặc kiểm tra Code Connect. Đặt tên truy vấn toàn khung nhìn theo mục đích và loại container (ví dụ: `billing settings drawer`). Kiểm tra ứng viên mạnh nhất. Nếu nó bao phủ từ hai section được yêu cầu trở lên, chọn nó làm nền tảng; nếu không, tiếp tục mà không dùng mẫu ghép toàn khung nhìn.

**2a-iii — Kiểm tra các màn hình hiện có.** Kiểm tra xem file đích đã có sẵn các màn hình dùng cùng design system hay chưa. Một lần gọi `use_figma` chỉ đọc duy nhất sẽ thống kê toàn bộ một frame sẵn có — các component key, bound variable và text/effect style của nó — trong một lượt duyệt tin cậy. Chạy một lần ở đây và tái sử dụng kết quả cho mục 2b và 2c thay vì duyệt lại frame:

```js
const frame = figma.currentPage.findOne(n => n.name === "Existing Screen");
const components = new Map();
const styles = { text: new Map(), effect: new Map() };
const variableIds = new Set();

// boundVariables and style ids can sit on any scene node, so walk them all.
for (const node of frame?.findAll(() => true) ?? []) {
  if (node.type === "INSTANCE") {
    const mc = node.mainComponent;
    const cs = mc?.parent?.type === "COMPONENT_SET" ? mc.parent : null;
    const key = cs ? cs.key : mc?.key;
    if (key && !components.has(key)) {
      components.set(key, { name: cs ? cs.name : mc.name, key, isSet: !!cs, sampleVariant: mc.name });
    }
  }
  for (const b of Object.values(node.boundVariables ?? {}).flat()) {
    if (b?.id) variableIds.add(b.id);
  }
  for (const [prop, bucket] of [["textStyleId", "text"], ["effectStyleId", "effect"]]) {
    if (prop in node && typeof node[prop] === "string" && node[prop]) {
      const s = await figma.getStyleByIdAsync(node[prop]);
      if (s) styles[bucket].set(s.id, { name: s.name, id: s.id, key: s.key });
    }
  }
}
const vars = await Promise.all([...variableIds].map(id => figma.variables.getVariableByIdAsync(id)));

return {
  components: [...components.values()],
  variables: vars.filter(Boolean).map(v => ({ name: v.name, id: v.id, key: v.key, type: v.resolvedType, remote: v.remote })),
  textStyles: [...styles.text.values()],
  effectStyles: [...styles.effect.values()],
};
```

Đối chiếu `components` với các component chưa giải quyết của bạn; các key từ Code Connect ở 2a-i vẫn giữ quyền ưu tiên chuẩn xác nhất. Đánh dấu các mục mới giải quyết được.

**2a-iv — Chỉ tìm kiếm các phần còn thiếu phục vụ dựng hình.** Sau bước Code Connect, khám phá toàn khung nhìn và kiểm tra màn hình hiện có, hãy tìm kiếm các component và token còn chưa giải quyết mà thiết kế vẫn cần. Gom nhóm các mục truy vấn đơn mục đích độc lập, giữ `includeLibraryKeys` giới hạn trong phạm vi thư viện đã chọn và mang các key chọn được vào bước dựng. Đừng trì hoãn việc dựng hình chỉ để tìm kiếm cạn kiệt mọi vai trò chưa giải quyết.

```
// Step 1: Discover available libraries
get_libraries({ fileKey })
// Returns: {
//   libraries_added_to_file: [...],
//   libraries_available_to_add: [...],
//   libraries_available_to_add_next_offset: number | null
// }

// Step 2: Search within a specific library using its libraryKey
search_design_system({ queries: [{ entity: "component", query: "button" }], fileKey, includeLibraryKeys: ["lk-abc123..."] })
```

Các thư viện tổ chức (org libraries) trong `libraries_available_to_add` được phân trang (20 mục mỗi trang). Khi `libraries_available_to_add_next_offset` khác null, nghĩa là còn thêm thư viện tổ chức — hãy gọi lại `get_libraries` với `offset` bằng giá trị đó để lấy trang tiếp theo. Các Community UI kit chỉ xuất hiện ở trang đầu tiên. Nếu người dùng nêu tên một thư viện cụ thể mà bạn chưa thấy ở trang hiện tại, hãy lật tiếp trang trước khi bỏ cuộc.

Điều này đặc biệt hữu ích khi file có nhiều thư viện và bạn muốn kết quả khoanh vùng (ví dụ chỉ tìm trong "iOS 26" hoặc "Material 3" thay vì nhận kết quả từ mọi thư viện).

**Mỗi truy vấn chỉ mang một ý định (one intent per query).** `search_design_system` không áp dụng ngữ nghĩa OR, vì vậy đừng bao giờ nhồi nhiều từ thay thế hoặc đồng nghĩa vào cùng một chuỗi ("Button IconButton icon" sẽ không khớp gì hữu ích). Dùng tên chính xác trong design system hoặc loại component khi đã biết; nếu không hãy tìm theo vai trò UI của asset, ví dụ "archive action icon" hoặc "primary submit button".
Ánh xạ mọi key đã chọn vào một section hoặc property. Tái sử dụng các thành phần con tổng hợp phù hợp thay vì dựng bản thay thế song song, và giữ nguyên các nested instance trừ khi chỉ là vỏ bọc ví dụ/mẫu (template wrapper) bắt buộc phải detach.

**Đưa các component property vào bản đồ ánh xạ** — bạn cần biết mỗi component phơi bày những TEXT property nào để ghi đè văn bản. Tạo một instance tạm, đọc `componentProperties` của nó (và của các nested instance), sau đó xóa instance tạm đó đi.

Ví dụ bản đồ component kèm thông tin thuộc tính:

```
Component Map:
- Button → key: "abc123", type: COMPONENT_SET
  Properties: { "Label#2:0": TEXT, "Has Icon#4:64": BOOLEAN }
- PricingCard → key: "ghi789", type: COMPONENT_SET
  Properties: { "Device": VARIANT, "Variant": VARIANT }
  Nested "Text Heading" has: { "Text#2104:5": TEXT }
  Nested "Button" has: { "Label#2:0": TEXT }
```

#### 2b: Khám phá variables (màu sắc, khoảng cách, bo góc)

**Kiểm tra các màn hình hiện có trước.** Tái sử dụng `variables` từ danh sách kiểm kê ở bước 2a-iii; nếu bước đó bị bỏ qua, hãy chạy kiểm kê tại đây khi có màn hình sẵn có. Với các variable chưa giải quyết, dùng `search_design_system` với các mục `queries` có `entity` là `"variable"`.

> **CẢNH BÁO: Hai phương pháp khám phá variable khác nhau — tuyệt đối không nhầm lẫn.**
>
> - `use_figma` với `figma.variables.getLocalVariableCollectionsAsync()` — **chỉ trả về các variable cục bộ (local) được định nghĩa trong file hiện tại**. Nếu nó trả về rỗng, điều đó **không** có nghĩa là không có variable nào tồn tại. Các variable từ thư viện từ xa/đã xuất bản hoàn toàn vô hình với API này.
> - `search_design_system` với các mục truy vấn `entity: "variable"` — tìm kiếm các variable thư viện từ xa và đã xuất bản. Giới hạn mọi truy vấn theo các library key đã chọn ở bước 2a-ii bằng `includeLibraryKeys`.
>
> **Không bao giờ kết luận "không có variable nào tồn tại" chỉ dựa vào việc `getLocalVariableCollectionsAsync()` trả về rỗng.** Luôn chạy thêm `search_design_system` với các mục truy vấn variable để kiểm tra variable thư viện trước khi quyết định tự tạo mới.

**Chiến lược truy vấn:** `search_design_system` đối khớp theo **tên variable** (ví dụ "Gray/gray-9", "core/gray/100", "space/400"), không theo danh mục. Đặt nhiều tìm kiếm ngắn, đơn giản vào một lần gọi `queries` thay vì một truy vấn ghép phức tạp. Mọi phần tử trong mảng phải là một object `{ "entity": "variable", "query": "..." }`, tuyệt đối không truyền chuỗi trần:

- **Màu cơ bản (Primitive colors):** `{ "entity": "variable", "query": "gray" }`, `{ "entity": "variable", "query": "red" }`, v.v.
- **Màu ngữ nghĩa (Semantic colors):** `{ "entity": "variable", "query": "background" }`, `{ "entity": "variable", "query": "surface" }`, v.v.
- **Khoảng cách/kích thước:** `{ "entity": "variable", "query": "space" }`, `{ "entity": "variable", "query": "radius" }`, v.v.

Nếu các truy vấn ban đầu trả về rỗng, hãy thử các mảnh từ ngắn hơn hoặc quy ước đặt tên khác — các thư viện đặt tên rất đa dạng ("grey" vs "gray", "spacing" vs "space", "color/bg" vs "background").

Với các variable thư viện (`remote = true`), import chúng theo key bằng `figma.variables.importVariableByKeyAsync(key)`. Với các variable cục bộ, dùng trực tiếp `figma.variables.getVariableByIdAsync(id)`.

Xem [variable-patterns.md](../figma-use/references/variable-patterns.md) để nắm các mẫu binding.

#### 2c: Khám phá styles (text styles, effect styles)

Tái sử dụng `textStyles` và `effectStyles` từ bản kiểm kê ở bước 2a-iii hoặc 2b. Nếu chưa có bản kiểm kê, kiểm tra một màn hình khả dụng bằng cùng script đó. Trước khi hardcode một vai trò fill/stroke, typography hoặc hiệu ứng có thể tái sử dụng chưa giải quyết, hãy phát một truy vấn `search_design_system` tập trung với `entity: "style"`, chẳng hạn "surface", "border", "heading", "body", "shadow" hoặc "elevation". Gom nhóm các mục độc lập, nhưng không tìm kiếm cạn kiệt cho những vai trò đã được bao phủ bởi component hoặc style màn hình hiện có. Tìm kiếm các style vẫn còn thiếu.

Import các style thư viện bằng `figma.importStyleByKeyAsync(key)`, sau đó áp dụng bằng `node.textStyleId = style.id` hoặc `node.effectStyleId = style.id`.

Xem [text-style-patterns.md](../figma-use/references/text-style-patterns.md) và [effect-style-patterns.md](../figma-use/references/effect-style-patterns.md) để biết chi tiết.

### Bước 3: Tạo Wrapper Frame

**KHÔNG dựng các section như những node con cấp trang (top-level) rồi mới chuyển parent sau** — việc di chuyển node giữa các lần gọi `use_figma` bằng `appendChild()` sẽ thất bại âm thầm và tạo ra các frame mồ côi. Hãy tạo một wrapper frame có thể chỉnh sửa trước, rồi dựng từng section trực tiếp bên trong nó.

Import và khởi tạo bất kỳ mẫu ghép toàn khung nhìn (whole-view composite) nào đã chọn vào bên trong wrapper. Tùy biến các thành phần con mà nó đã bao phủ và append các section còn thiếu vào wrapper nằm cạnh nó; tuyệt đối không append node con trực tiếp vào một instance. Đặt wrapper cách xa nội dung hiện có và trả về ID của nó:

```js
// Find clear space
let maxX = 0;
for (const child of figma.currentPage.children) {
  maxX = Math.max(maxX, child.x + child.width);
}

const wrapper = figma.createAutoLayout("VERTICAL");

// --- Size the wrapper based on container type ---
// Full page:       wrapper.resize(1440, 100); wrapper.name = "Homepage";
// Modal/dialog:    wrapper.resize(640, 100);  wrapper.name = "Settings Modal";
// Drawer/sidebar:  wrapper.resize(360, 100);  wrapper.name = "Navigation Drawer";
// Panel:           wrapper.resize(400, 100);  wrapper.name = "Details Panel";
// Adapt width to match the source code's actual dimensions.

wrapper.name = "VIEW_NAME";
wrapper.primaryAxisAlignItems = "CENTER";
wrapper.counterAxisAlignItems = "CENTER";
wrapper.resize(WIDTH, 100);
wrapper.layoutSizingHorizontal = "FIXED";
wrapper.x = maxX + 200;
wrapper.y = 0;

return { success: true, wrapperId: wrapper.id };
```

### Bước 4: Tùy biến các Section đã phủ và Dựng các Section còn thiếu

**Đây là bước quan trọng nhất.** Bắt đầu với mẫu ghép (composite) đã chọn: tùy biến các thành phần con mà nó đã bao phủ và chỉ dựng các section còn thiếu. Làm việc theo các pha dựng hình retry an toàn, gom nhóm các section liên quan khi an toàn. Chỉ tách ở ranh giới ngữ cảnh trang, thao tác ghi khó khôi phục nếu dở dang, hoặc retry có mục tiêu sau một lỗi thực tế — không tách chỉ để tạo điểm kiểm tra kiểm chứng. Ở đầu mỗi script, lấy lại wrapper frame có thể chỉnh sửa theo ID. Append nội dung mới vào frame đó, không bao giờ append vào một component instance.

```js
const createdNodeIds = [];

// Resolve the wrapper and import every design system dependency in parallel.
// Sequential awaits here serialize N independent IPC round-trips at the top
// of every section build; one Promise.all is dramatically faster.
const [wrapper, buttonSet, bgColorVar, spacingVar, shadowStyle] = await Promise.all([
  figma.getNodeByIdAsync("WRAPPER_ID_FROM_STEP_3"),
  figma.importComponentSetByKeyAsync("BUTTON_SET_KEY"),
  figma.variables.importVariableByKeyAsync("BG_COLOR_VAR_KEY"),
  figma.variables.importVariableByKeyAsync("SPACING_VAR_KEY"),
  figma.importStyleByKeyAsync("SHADOW_STYLE_KEY"),
]);
const primaryButton = buttonSet.children.find(c =>
  c.type === "COMPONENT" && c.name.includes("variant=primary")
) || buttonSet.defaultVariant;

// Build section frame with variable bindings (not hardcoded values)
const section = figma.createAutoLayout();
section.name = "Header";
section.setBoundVariable("paddingLeft", spacingVar);
section.setBoundVariable("paddingRight", spacingVar);
const bgPaint = figma.variables.setBoundVariableForPaint(
  { type: 'SOLID', color: { r: 0, g: 0, b: 0 } }, 'color', bgColorVar
);
section.fills = [bgPaint];

// Apply the effect style imported above
section.effectStyleId = shadowStyle.id;

// Create component instances inside the section
const btnInstance = primaryButton.createInstance();
section.appendChild(btnInstance);
createdNodeIds.push(btnInstance.id);

// Append section to wrapper
wrapper.appendChild(section);
section.layoutSizingHorizontal = "FILL"; // AFTER appending

createdNodeIds.push(section.id);
return { success: true, createdNodeIds };
```

Trả về các node ID đã tạo cùng số lượng, tên và kích thước biên liên quan từ mỗi lần gọi — đây là kiểm chứng cấu trúc mặc định của bạn. Chỉ chạy một bước đọc cấu trúc riêng khi thiếu bằng chứng đó hoặc khi một thao tác ghi liên quan làm nó mất hiệu lực. Dành lượt kiểm tra trực quan cho Bước 5.

#### Ghi đè văn bản trên instance bằng `setProperties()`

Các component instance đi kèm văn bản giữ chỗ ("Title", "Heading", "Button"). Hãy dùng các key component property bạn đã khám phá ở Bước 2 để ghi đè chúng bằng `setProperties()` — cách này tin cậy hơn thao tác trực tiếp lên `node.characters`. Xem [component-patterns.md](../figma-use/references/component-patterns.md#overriding-text-in-a-component-instance) để biết mẫu đầy đủ.

Với các nested instance phơi bày các TEXT property riêng, hãy gọi `setProperties()` trên nested instance đó:

```js
// Use the type-indexed criteria for the type filter, then narrow by name.
const nestedHeading = cardInstance
  .findAllWithCriteria({ types: ["INSTANCE"] })
  .find(n => n.name === "Text Heading");
if (nestedHeading) {
  nestedHeading.setProperties({ "Text#2104:5": "Actual heading from source code" });
}
```

Chỉ lùi về gán trực tiếp `node.characters` đối với văn bản KHÔNG được quản lý bởi bất kỳ component property nào.

#### Đọc kỹ giá trị mặc định trong mã nguồn

Khi chuyển đổi các code component sang Figma instance, hãy kiểm tra giá trị prop mặc định trong phần định nghĩa component ở mã nguồn, không chỉ những gì được truyền tường minh. Ví dụ `<Button size="small">Register</Button>` không truyền prop `variant` — hãy kiểm tra định nghĩa component để tìm giá trị mặc định `variant = "primary"`. Chọn sai variant (ví dụ Neutral thay vì Primary) sẽ tạo ra kết quả sai về mặt thị giác nhưng rất dễ bị bỏ sót.

#### Những gì dựng thủ công so với import từ design system

| Dựng thủ công | Import từ design system |
|----------------|--------------------------|
| Wrapper frame | **Components**: buttons, cards, inputs, nav, v.v. |
| Các section container frame | **Variables**: màu sắc (fills, strokes), khoảng cách (padding, gap), bo góc (radii) |
| Lưới bố cục (hàng, cột) | **Text styles**: heading, body, caption, v.v. |
| | **Effect styles**: shadows, blurs, v.v. |

**Không bao giờ hardcode mã màu hex hay khoảng cách pixel** khi có sẵn variable trong design system. Dùng `setBoundVariable` cho spacing/radii và `setBoundVariableForPaint` cho màu sắc. Áp dụng text style bằng `node.textStyleId` và effect style bằng `node.effectStyleId`.

#### Component hóa các phần tử lặp lại và tái sử dụng (bắt buộc)

Component hóa là một phần của quy trình **mặc định**, không phải bước làm thêm tùy chọn. Hãy tạo cấu trúc đã được component hóa ngay trong lượt đầu tiên; không xuất ra một cây phẳng gồm các frame dùng một lần rồi chờ lời nhắc thứ hai kiểu "bây giờ hãy component hóa nó".

- **Các instance từ design system vốn đã được component hóa sẵn** (Bước 2). Hãy ưu tiên chúng.
- **Đối với bất kỳ thứ gì design system chưa có mà bị lặp lại hoặc tương ứng với một component tái sử dụng trong mã nguồn, hãy tạo một local component một lần bằng `figma.createComponent()` rồi đặt các instance**, thay vì dựng tay N frame gần giống hệt nhau. Một component trong mã nguồn tương ứng với một main component trong Figma.

Xem [references/componentization.md](references/componentization.md) để nắm mẫu "dựng một lần - đặt nhiều instance" và code minh họa.

#### Icons: import SVG, tuyệt đối không dựng lại từ các hình khối xoay góc

Icon là **ngoại lệ chính của bảng phân tách dựng-thủ-công vs import ở trên.** Nếu design system cung cấp icon dưới dạng component, hãy tạo instance từ nó (một property `INSTANCE_SWAP` duy nhất, không tạo mỗi icon một variant). Ngược lại — phổ biến nhất là khi **lấy icon từ codebase để đặt hoặc thay thế vào Figma** — hãy import trực tiếp **mã nguồn SVG** của icon thành vector node. Đây là lộ trình chính và mặc định cho icon; không vẽ lại chúng.

1. **Lấy SVG từ codebase.** Đọc mã nguồn của icon — thẻ `<svg>` inline, file `.svg` được import, hoặc mục từ thư viện icon — và truyền nguyên chuỗi SVG đó. Ưu tiên dùng SVG có sẵn của codebase thay vì tự viết tay.
2. **Import bằng `figma.createNodeFromSvg(svgString)`**, hàm trả về một `FrameNode` chứa các đường dẫn vector chỉnh sửa được. Chuỗi SVG **bắt buộc** phải có `viewBox` cộng với `width`/`height` tường minh (ví dụ `<svg width="24" height="24" viewBox="0 0 24 24" ...>`). Nếu thiếu `width`/`height`, nó sẽ lấy kích thước của `viewBox`, thường nhỏ hơn ô chứa — đây là nguyên nhân thường gặp gây lỗi "icon không đúng kích thước".
3. **Chỉnh kích thước khớp với ô chứa.** Các frame tạo bởi `createNodeFromSvg` tự co giãn nội dung khi resize, vì vậy `icon.resize(size, size)` sẽ vừa khít toàn bộ icon (bao gồm cả độ dày stroke) vào khung đích. Hoặc viết `width`/`height` bằng đúng kích thước đích. Khớp theo kích thước icon trong mã nguồn — thường là 16/20/24px.
4. **Tuyệt đối không dựng lại icon từ các hình `line`/`rect`/`ellipse` xoay góc.** Phép xoay đoạn thẳng của Figma hoạt động không ổn định trong ngữ cảnh `use_figma` và tạo ra các icon bị lệch xoay, hỏng hình (dấu mũi tên chevron bị gãy thành cục, đầu mũi tên tách rời khỏi thân). Import SVG vừa đáng tin cậy hơn vừa dễ chỉnh sửa hơn.

```js
// Place / replace an icon from a codebase SVG into a 24px slot
const icon = figma.createNodeFromSvg(
  '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">' +
  '<path d="m9 18 6-6-6-6" stroke="#1A1A1A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>'
);
icon.name = "icon/chevron-right";
icon.resize(24, 24);          // scales the whole icon to the slot
slotFrame.appendChild(icon);
```

**SVG trong codebase thường dùng `currentColor`** (ví dụ `stroke="currentColor"` / `fill="currentColor"`), giá trị mà `createNodeFromSvg` sẽ import thành **màu đen** — nó không kế thừa màu từ phần tử cha. Hãy đặt màu mong muốn sau khi import: thay thế màu tường minh vào chuỗi SVG trước khi import, hoặc bind các fill/stroke vector vừa import vào một color variable của design system bằng `setBoundVariableForPaint` (giống như mọi paint khác). Để biến một SVG đã import thành icon component tái sử dụng (cho `INSTANCE_SWAP`), xem [figma-generate-library → Creating Icon Components](../figma-generate-library/references/component-creation.md) và mẫu [INSTANCE_SWAP pattern](../figma-use/references/component-patterns.md#instance_swap-avoiding-variant-explosion).

### Bước 5: Kiểm chứng toàn bộ Khung nhìn và Chuyển giao Hình ảnh

Trước khi kiểm tra trực quan, hãy dùng `use_figma` để đọc lại wrapper và trả về tổng số lượng node hậu duệ, số lượng cho từng loại node hậu duệ có mặt, cùng với ID, tên, loại node và kích thước của mọi node có fill là hình ảnh. Các con số này là bằng chứng kiểm chứng, không phải ngưỡng đỗ dạng số thuần túy; không suy luận khả năng chỉnh sửa từ ảnh screenshot hay chấp nhận vài node chỉnh sửa được mang tính tượng trưng đè lên một ảnh raster chụp toàn bộ UI. Nếu có bất kỳ ảnh chụp màn hình hoặc bản kết xuất phẳng nào của toàn bộ UI xuất hiện ở đâu đó trong wrapper, hãy xóa nó đi và dựng lại UI theo ngữ nghĩa hoặc báo thất bại; không được tuyên bố hoàn thành.

Sau khi lắp ráp tất cả các section, chụp **một screenshot tổng hợp toàn khung nhìn** của wrapper frame và đối chiếu với nguồn. Nếu ảnh cho thấy lỗi hiển thị đáng kể, hãy áp dụng các bản sửa `use_figma` có mục tiêu — đừng dựng lại toàn bộ khung nhìn — rồi chụp **một** screenshot sau khi sửa. Ảnh chụp đạt yêu cầu gần nhất là bước kiểm tra cuối cùng: không chụp thêm một ảnh "cuối cùng" khi không có thay đổi gì, và không chụp ảnh từng section riêng lẻ.

Trước khi sửa lỗi hiển thị, đối chiếu các key của instance, style và bound-variable trong wrapper với bản đồ ở Bước 2. Mọi asset phù hợp đã chọn phải xuất hiện trong đầu ra; hãy thay thế các phần tử dựng thủ công tương đương và các giá trị thô trước khi kết thúc.

Kiểm tra screenshot tổng hợp để phát hiện:
- **Chữ bị cắt/xén** — line height hoặc kích thước frame cắt mất phần nét dưới, nét trên hoặc cả dòng chữ.
- **Nội dung chồng lấp** — các phần tử xếp đè lên nhau do sai kích thước hoặc thiếu auto-layout.
- Văn bản giữ chỗ vẫn còn hiển thị ("Title", "Heading", "Button").
- Nội dung bị cắt cụt do lỗi cấu hình sizing bố cục.
- Sai variant của component (ví dụ nút Neutral thay vì Primary).
- **Sai font family** — chữ hiển thị bằng một kiểu chữ khác với sản phẩm (ví dụ Inter trong khi sản phẩm dùng SF Pro). Script chạy không báo lỗi nên mắt thường lướt qua khó thấy; hãy khẳng định điều này một cách tường minh (xem "Khẳng định font family chính xác" bên dưới).
- **Khung ảnh trống** — nếu thiếu ảnh, hãy chuyển chúng từ bản chụp `generate_figma_design` trước khi cân nhắc dùng `generate_image` hoặc `generate_vector_illustration` để tạo ảnh giữ chỗ (xem "Chuyển hình ảnh từ bản chụp generate_figma_design" bên dưới).

#### Khẳng định font family chính xác

**Bạn PHẢI khẳng định tường minh rằng văn bản được kết xuất sử dụng đúng font sản phẩm đã xác định ở Bước 1**, và coi mọi sự sai lệch là kiểm chứng thất bại. Không giả định rằng một font nạp thành công nghĩa là đúng font: nạp Inter khi sản phẩm dùng SF Pro là một lỗi ngay cả khi không có thông báo lỗi nào xảy ra. **Nếu bạn có tài liệu tham chiếu nguồn (web app đang chạy, design mock hoặc bản chụp `generate_figma_design`), bạn CŨNG PHẢI đối chiếu các ảnh chụp kết xuất** — một style gần đúng trong cùng font family có thể qua được bước kiểm tra tên family nhưng nhìn thực tế vẫn sai.

Xem [references/discover-product-font.md](references/discover-product-font.md#verify-the-font-after-building) để lấy script đọc kiểm tra lại (script phân tách giữa text đứng độc lập do bạn sửa với text do design system quản lý để bạn gắn cờ báo) và các bước đối chiếu ảnh chụp.

#### Chuyển hình ảnh từ bản chụp `generate_figma_design`

Nếu bạn đã chạy `generate_figma_design` song song, chỉ chuyển các asset hình ảnh nội dung riêng lẻ mà ứng dụng sử dụng vào đầu ra design system của bạn. Tuyệt đối không upload hay chuyển node gốc của bản chụp hoặc bất kỳ ảnh chụp màn hình hay bản kết xuất phẳng nào của toàn bộ UI.

1. Tìm tất cả các image node trong đầu ra bản chụp bằng cách tìm kiếm các fill có `type === "IMAGE"`:
   ```js
   const capture = await figma.getNodeByIdAsync("CAPTURE_NODE_ID");
   const imageNodes = capture.findAll(() => true).flatMap(n => {
     if (!Array.isArray(n.fills)) return [];
     const imageFill = n.fills.find(f => f.type === "IMAGE");
     return imageFill ? [{ name: n.name, id: n.id, imageHash: imageFill.imageHash }] : [];
   });
   return imageNodes;
   ```
2. Khớp từng hình ảnh chụp được với frame tương ứng trong đầu ra `use_figma` của bạn (theo vị trí, tên hoặc thứ tự).
3. Áp dụng image hash vào frame đích:
   ```js
   targetFrame.fills = [{ type: "IMAGE", imageHash: "hash_from_capture", scaleMode: "FILL" }];
   ```
4. Xóa đầu ra bản chụp `generate_figma_design` sau khi toàn bộ hình ảnh đã được chuyển sang.

#### Tạo ảnh và vector giữ chỗ

Tái sử dụng các asset sẵn có nếu khả thi. Nếu không, chọn giữa `generate_image` và `generate_vector_illustration`. Sau đó thông báo cho người dùng rằng credit Figma AI đã được sử dụng.

Nếu Figma AI không khả dụng hoặc đã hết hạn mức credit, hãy hỏi trước khi dùng nhà cung cấp tạo ảnh thay thế. Chỉ upload các ảnh từ nhà cung cấp thay thế này bằng `upload_assets`.

### Bước 6: Cập nhật một Khung nhìn hiện có

Khi cập nhật thay vì dựng mới từ đầu:

1. Dùng `get_metadata` để kiểm tra cấu trúc màn hình hiện tại.
2. Xác định các section cần cập nhật và các section giữ nguyên.
3. Với mỗi section cần thay đổi:
   - Định vị các node hiện có theo ID hoặc tên
   - Hoán đổi (swap) các component instance nếu component trong design system đã thay đổi
   - Cập nhật nội dung văn bản, thuộc tính variant hoặc bố cục khi cần
   - Xóa các section đã lỗi thời
   - Thêm các section mới
4. Tuân theo cùng nhịp bằng chứng và ảnh chụp như Bước 4–5: dựa vào các ID trả về cùng số lượng, tên và kích thước biên liên quan để kiểm chứng cấu trúc, sau đó chụp một screenshot toàn khung nhìn sau khi cập nhật (và chỉ chụp thêm một screenshot sau khi sửa nếu cần một bản sửa hiển thị có mục tiêu).

```js
// Example: Swap a button variant in an existing screen.
// Batch the node lookup and component-set import in parallel — they are
// independent and awaiting them sequentially serializes two IPC round-trips.
const [existingButton, buttonSet] = await Promise.all([
  figma.getNodeByIdAsync("EXISTING_BUTTON_INSTANCE_ID"),
  figma.importComponentSetByKeyAsync("BUTTON_SET_KEY"),
]);
if (existingButton && existingButton.type === "INSTANCE") {
  const newVariant = buttonSet.children.find(c =>
    c.name.includes("variant=primary") && c.name.includes("size=lg")
  ) || buttonSet.defaultVariant;
  existingButton.swapComponent(newVariant);
}
return { success: true, mutatedNodeIds: [existingButton.id] };
```

## Tài liệu tham khảo

Để biết các mẫu API chi tiết và bẫy lỗi, nạp các tài liệu sau từ phần tham khảo của [figma-use](../figma-use/SKILL.md) khi cần:

- [component-patterns.md](../figma-use/references/component-patterns.md) — import theo key, tìm variant, `setProperties`, ghi đè text, làm việc với instance
- [variable-patterns.md](../figma-use/references/variable-patterns.md) — tạo/bind variable, import variable thư viện, scopes, aliasing, khám phá variable sẵn có
- [text-style-patterns.md](../figma-use/references/text-style-patterns.md) — tạo/áp dụng text style, import text style thư viện, type ramps
- [effect-style-patterns.md](../figma-use/references/effect-style-patterns.md) — tạo/áp dụng effect style (đổ bóng), import effect style thư viện
- [gotchas.md](../figma-use/references/gotchas.md) — bẫy lỗi bố cục (tương tác HUG/FILL, `counterAxisAlignItems`, thứ tự sizing), vấn đề paint/màu sắc, reset ngữ cảnh trang

## Khôi phục lỗi

Tuân thủ [figma-use error recovery](../figma-use/references/validation-and-recovery.md#error-recovery-after-failed-use_figma):

- Nếu `safeToRetryWithoutCanvasRead` là `true`, sửa lỗi và thử lại.
- Nếu là `false`, đọc lại canvas, xác định những gì đã thay đổi, sau đó mới sửa tiếp.

Vì skill này vận hành theo các pha dựng hình retry an toàn, lỗi sẽ tự nhiên được khoanh vùng trong pha hiện tại. Nội dung từ các lệnh gọi thành công trước đó vẫn nguyên vẹn.

## Thực hành tốt nhất

- **Luôn tìm kiếm trước khi dựng.** Design system nhiều khả năng đã có sẵn component, variable hoặc style bạn cần. Dựng thủ công và dùng giá trị hardcode chỉ nên là ngoại lệ, không phải quy tắc.
- **Tìm kiếm các phần còn thiếu chưa giải quyết, mỗi truy vấn một ý định.** Thử các từ đồng nghĩa và mảnh từ dưới dạng các mục `{ entity, query }` riêng biệt trong một lần gọi `queries`, tuyệt đối không gộp vào một chuỗi — một "NavigationPill" có thể tìm thấy dưới tên "pill", "nav", "tab" hoặc "chip", nên hãy truyền chúng thành bốn mục component riêng. Với variable, dùng `entity: "variable"` với các truy vấn như "color", "spacing" và "radius". Chỉ làm việc này cho các phần còn thiếu chưa giải quyết và dừng lại ngay khi tìm thấy asset phù hợp.
- **Ưu tiên token của design system hơn giá trị hardcode.** Dùng variable binding cho màu sắc, khoảng cách và bo góc. Dùng text style cho typography. Dùng effect style cho đổ bóng. Điều này giữ cho màn hình luôn liên kết với design system.
- **Ưu tiên component instance hơn dựng thủ công.** Instance luôn liên kết với component nguồn và tự động cập nhật khi design system phát triển.
- **Component hóa theo mặc định.** Dựng các phần tử lặp lại hoặc tái sử dụng thành một component một lần, sau đó đặt các instance. Đừng xuất ra một cây phẳng các frame dùng một lần để rồi cần thêm một lượt "làm cho nó thành component" thứ hai.
- **Làm việc theo các pha dựng hình retry an toàn.** Gom nhóm các section liên quan vào một lần gọi `use_figma` khi script vẫn an toàn để thử lại; chỉ tách ở ranh giới ngữ cảnh trang, thao tác ghi khó khôi phục hoặc retry có mục tiêu sau một lỗi thực tế.
- **Trả về node ID và bằng chứng kiểm chứng ở mọi lệnh gọi.** Trả về các ID đã tạo cùng số lượng, tên và kích thước biên liên quan — đây là kiểm chứng cấu trúc mặc định của bạn, và bạn sẽ cần các ID này để lắp ráp các section cũng như khôi phục lỗi.
- **Kiểm chứng trực quan bằng một screenshot tổng hợp.** Chụp một screenshot toàn khung nhìn sau khi lắp ráp, và tối đa thêm một screenshot nữa chỉ sau khi sửa lỗi hiển thị có mục tiêu; ảnh chụp đạt yêu cầu gần nhất là ảnh cuối cùng.
- **Khẳng định đúng font family, không chỉ nạp thành công.** Một script có thể nạp nhầm font mà không báo lỗi. Sau khi dựng, hãy xác minh văn bản được kết xuất sử dụng đúng font sản phẩm xác định ở Bước 1 (xem Bước 5).
- **Tuân thủ quy ước sẵn có.** Nếu file đã có các màn hình, hãy làm khớp theo cách đặt tên, kích thước và mẫu bố cục của chúng.
