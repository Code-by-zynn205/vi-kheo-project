---
name: figma-code-connect
description: Tạo và duy trì các file template Figma Code Connect ánh xạ các Figma component sang đoạn mã nguồn (code snippet). Sử dụng khi người dùng nhắc đến Code Connect, ánh xạ Figma component, chuyển đổi design-to-code, hoặc yêu cầu tạo/cập nhật các file .figma.ts hoặc .figma.js.
disable-model-invocation: false
---

# Code Connect

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-code-connect/SKILL.md) (Figma chính thức).

## Tổng quan

Tạo các file template Code Connect (`.figma.ts`) ánh xạ các Figma component sang các đoạn mã nguồn. Khi nhận được một URL Figma, hãy thực hiện theo các bước dưới đây để tạo template.

> **Bạn CHỈ viết các file template `.figma.ts` — tuyệt đối không viết `.figma.tsx`.** Skill này tạo ra *parserless templates*: một file `.figma.ts` có export mặc định sử dụng tagged template `` figma.code`...` ``. KHÔNG viết file `.figma.tsx` và KHÔNG dùng `figma.connect()` — đó là định dạng Code Connect **dựa trên parser (parser-based)** riêng biệt (được publish theo cách khác) và là **sai sản phẩm đầu ra** đối với skill này; đầu ra viết dưới dạng `.figma.tsx` sẽ bị từ chối thẳng. Nếu một file `.figma.tsx` đã tồn tại cho component đó, hãy giữ nguyên nó và thêm template `.figma.ts` của bạn bên cạnh. Một mô hình đủ năng lực có thể dễ bị cám dỗ chọn mẫu `.figma.tsx` / `figma.connect()` quen thuộc từ trí nhớ — hãy tránh điều đó; ở đây đầu ra đúng **luôn luôn** là `.figma.ts` + `figma.code`.

## Điều kiện tiên quyết

- **Figma MCP server phải được kết nối** — xác minh rằng các Figma MCP tool (ví dụ `get_code_connect_suggestions`) khả dụng trước khi tiến hành. Nếu chưa, hướng dẫn người dùng bật Figma MCP server và khởi động lại MCP client của họ.
- **Component phải được xuất bản (published)** — Code Connect chỉ hoạt động với các component đã xuất bản lên thư viện nhóm (Figma team library). Nếu một component chưa được xuất bản, thông báo cho người dùng và dừng lại.
- **Yêu cầu gói Organization hoặc Enterprise** — Code Connect không khả dụng trên gói Free hoặc Professional.
- **URL phải bao gồm `node-id`** — URL Figma phải chứa tham số truy vấn `node-id`.
- **TypeScript types** — để trình soạn thảo tự động gợi ý và kiểm tra kiểu trong các file `.figma.ts`, `@figma/code-connect/figma-types` phải được thêm vào `types` trong `tsconfig.json`:
  ```json
  {
    "compilerOptions": {
      "types": ["@figma/code-connect/figma-types"]
    }
  }
  ```

## Bước 1: Phân tích URL Figma

Trích xuất `fileKey` và `nodeId` từ URL:

| Định dạng URL | `fileKey` | `nodeId` |
|---|---|---|
| `figma.com/design/:fileKey/:name?node-id=X-Y` | `:fileKey` | `X-Y` → `X:Y` |
| `figma.com/file/:fileKey/:name?node-id=X-Y` | `:fileKey` | `X-Y` → `X:Y` |
| `figma.com/design/:fileKey/branch/:branchKey/:name` | dùng `:branchKey` | từ tham số `node-id` |

Luôn chuyển dấu gạch ngang trong `nodeId` thành dấu hai chấm: `1234-5678` → `1234:5678`.

**Ví dụ minh họa:**

Cho URL: `https://www.figma.com/design/QiEF6w564ggoW8ftcLvdcu/MyDesignSystem?node-id=4185-3778`
- `fileKey` = `QiEF6w564ggoW8ftcLvdcu`
- `nodeId` = `4185-3778` → `4185:3778`

## Bước 2: Khám phá các Component chưa được ánh xạ

Người dùng có thể cung cấp một URL trỏ tới một frame, instance hoặc variant — không nhất thiết phải là một component set hay standalone component. Gọi MCP tool `get_code_connect_suggestions` với:
- `fileKey` — từ Bước 1
- `nodeId` — từ Bước 1 (định dạng dấu hai chấm)
- `excludeMappingPrompt` — `true` (trả về danh sách gọn nhẹ các component chưa ánh xạ)

Tool này xác định các component đã xuất bản trong vùng chọn nhưng chưa có ánh xạ Code Connect.

**Xử lý phản hồi:**

- **"No published components found in this selection"** — node không chứa component nào đã xuất bản. Thông báo cho người dùng rằng họ cần xuất bản component lên team library trong Figma trước, sau đó dừng lại.
- **"All component instances in this selection are already connected to code via Code Connect"** — mọi thứ đều đã được ánh xạ. Thông báo cho người dùng và dừng lại.
- **Phản hồi bình thường kèm danh sách component** — trích xuất `mainComponentNodeId` cho từng component trả về. Dùng các node ID đã phân giải này (không dùng ID gốc từ URL) cho toàn bộ các bước tiếp theo. Nếu nhiều component được trả về (ví dụ người dùng chọn một frame chứa nhiều component instance khác nhau), lặp lại Bước 3–6 cho từng component.

## Bước 3: Lấy các thuộc tính của Component

Gọi MCP tool `get_context_for_code_connect` với:
- `fileKey` — từ Bước 1
- `nodeId` — `mainComponentNodeId` đã phân giải từ Bước 2
- `clientFrameworks` — xác định từ trường `parser` trong `figma.config.json` (ví dụ `"react"` → `["react"]`)
- `clientLanguages` — suy ra từ phần mở rộng file trong dự án (ví dụ dự án TypeScript → `["typescript"]`, JavaScript → `["javascript"]`)

Với nhiều component, gọi tool một lần cho mỗi node ID.

Phản hồi chứa các **property definitions** của Figma component — ghi nhận tên và kiểu của từng property:
- **TEXT** — nội dung văn bản (nhãn, tiêu đề, placeholder)
- **BOOLEAN** — bật/tắt (hiện/ẩn icon, trạng thái disabled)
- **VARIANT** — các tùy chọn enum (size, variant, state)
- **INSTANCE_SWAP** — các nested instance có thể hoán đổi gắn với một component cụ thể (icon, avatar)
- **SLOT** — các vùng nội dung linh hoạt (bố cục tự do, nhiều loại node con); dùng `getSlot()` trong template (không giống với `INSTANCE_SWAP`)

Lưu lại danh sách thuộc tính này — bạn sẽ dùng nó ở Bước 5 để viết template.

## Bước 4: Xác định Code Component

Nếu người dùng chưa chỉ rõ code component nào cần kết nối:

1. Kiểm tra `figma.config.json` để xem `paths` và `importPaths` nhằm tìm nơi đặt các component
2. Tìm kiếm trong codebase một component khớp với tên Figma component. Kiểm tra các thư mục phổ biến (`src/components/`, `components/`, `lib/ui/`, `app/components/`) nếu `figma.config.json` không chỉ định đường dẫn
3. Đọc các file ứng viên và đối chiếu interface `props` của chúng với các Figma property từ Bước 3 — tìm các kiểu variant, tùy chọn size, cờ boolean và slot prop tương ứng
4. Nếu có nhiều ứng viên khớp, chọn ứng viên có interface prop khớp sát nhất và giải thích lý do của bạn cho người dùng
5. Nếu không tìm thấy kết quả khớp, hiển thị 2 ứng viên gần nhất và yêu cầu người dùng xác nhận hoặc cung cấp đường dẫn đúng

**Xác nhận với người dùng** trước khi chuyển sang Bước 5. Trình bày kết quả đối khớp: code component nào bạn đã tìm thấy, nó nằm ở đâu và tại sao nó khớp (tương ứng prop, đặt tên, mục đích).

Đọc `figma.config.json` để lấy các bí danh đường dẫn import (import path aliases) — mục `importPaths` ánh xạ các mẫu glob sang import specifier, và mục `paths` ánh xạ các specifier đó tới các thư mục.

Đọc mã nguồn của code component để hiểu interface `props` của nó — điều này định hướng cách ánh xạ các Figma property sang code prop ở Bước 5.

## Bước 5: Tạo file Template (.figma.ts)

### Vị trí file

Đặt file cạnh các file Code Connect sẵn có. Kiểm tra các mẫu `include` trong `figma.config.json` để xác định đúng thư mục. **Đặt tên file là `ComponentName.figma.ts` — tuyệt đối không đặt `ComponentName.figma.tsx`.** Phần mở rộng `.figma.tsx` là định dạng dựa trên parser; không tạo mới hoặc chỉnh sửa file `.figma.tsx` có sẵn.

### Cấu trúc Template

Mỗi file template tuân theo cấu trúc sau:

```ts
// url=https://www.figma.com/file/{fileKey}/{fileName}?node-id={nodeId}
// source={path to code component from Step 4}
// component={code component name from Step 4}
import figma from 'figma'
const instance = figma.selectedInstance

// Extract properties from the Figma component (see property mapping below)
// ...

export default {
  example: figma.code`<Component ... />`,       // Required: code snippet
  imports: ['import { Component } from "..."'], // Optional: import statements
  id: 'component-name',                         // Required: unique identifier
  metadata: {                                    // Optional
    nestable: true,                              // true = inline in parent, false = show as pill
    props: {}                                    // data accessible to parent templates
  }
}
```

### Ánh xạ thuộc tính (Property mapping)

Sử dụng danh sách thuộc tính từ Bước 3 để trích xuất giá trị. Với mỗi loại thuộc tính Figma, dùng phương thức tương ứng:

| Loại Figma Property | Phương thức Template | Khi nào sử dụng |
|---|---|---|
| TEXT | `instance.getString('Name')` | Nhãn, tiêu đề, văn bản placeholder |
| BOOLEAN | `instance.getBoolean('Name', { true: ..., false: ... })` | Bật/tắt hiển thị, các prop có điều kiện |
| VARIANT | `instance.getEnum('Name', { 'FigmaVal': 'codeVal' })` | Các enum kích thước, biến thể, trạng thái |
| INSTANCE_SWAP | `instance.getInstanceSwap('Name')` | Instance được hoán đổi cho một slot component cố định (sau đó dùng `hasCodeConnect()` / `executeTemplate()`) - không nhầm lẫn với thuộc tính `SLOT` bên dưới |
| SLOT | `instance.getSlot('Name')` | Nội dung slot tự do chỉ khi loại Figma property là **SLOT** |
| (child layer) | `instance.findInstance('LayerName')` | Các instance con có tên nhưng không có component property |
| (text layer) | `instance.findText('LayerName')` → `.textContent` | Nội dung văn bản từ các text layer có tên |

**TEXT** — lấy trực tiếp giá trị chuỗi:
```ts
const label = instance.getString('Label')
```

**VARIANT** — ánh xạ các giá trị enum của Figma sang giá trị trong code:
```ts
const variant = instance.getEnum('Variant', {
  'Primary': 'primary',
  'Secondary': 'secondary',
})

const size = instance.getEnum('Size', {
  'Small': 'sm',
  'Medium': 'md',
  'Large': 'lg',
})
```

**BOOLEAN** — boolean đơn giản hoặc ánh xạ sang các giá trị:
```ts
// Simple boolean
const disabled = instance.getBoolean('Disabled')

// Mapped to code values (e.g. when the code prop is an enum, not a boolean)
const size = instance.getBoolean('Show Label', { true: 'large', false: 'small' })
```

**Ánh xạ các Figma property sang code prop ở những nơi có sự tương ứng hợp lệ.** Các Figma property và code prop không phải lúc nào cũng khớp 1:1 — một số Figma property ánh xạ trực tiếp (theo tên hoặc qua các phương thức API ở trên), số khác không có giá trị tương đương trong code. Nơi nào có ánh xạ thì sử dụng; nơi nào không khớp thì bỏ qua Figma property đó thay vì tự bịa ra một code prop. Tuyệt đối không xuất ra thuộc tính có tên không tồn tại trong interface `Props` của code component.

### Xử lý đầy đủ toàn bộ giá trị Variant (Exhaustive variant handling)

Khi một thuộc tính `VARIANT` có nhiều giá trị khả dĩ, bảng ánh xạ `getEnum` **bắt buộc phải liệt kê mọi giá trị** do `get_context_for_code_connect` trả về. Không bỏ sót giá trị — một giá trị không được ánh xạ sẽ âm thầm trả về `undefined`, tạo ra đầu ra bị lỗi.

```ts
// WRONG — omits 'Warning', which will render as undefined
const status = instance.getEnum('Status', {
  'Success': 'success',
  'Error': 'error',
})

// CORRECT — every value is mapped
const status = instance.getEnum('Status', {
  'Success': 'success',
  'Error': 'error',
  'Warning': 'warning',
  'Info': 'info',
})
```

Khi **hai hoặc nhiều thuộc tính `VARIANT` kết hợp** để tạo ra đầu ra code khác nhau, hãy viết đầy đủ toàn bộ các nhánh điều kiện. Ví dụ: 2 variants × 2 giá trị = 4 nhánh:

```ts
const type = instance.getEnum('Type', { 'Filled': 'filled', 'Outlined': 'outlined' })
const status = instance.getEnum('Status', { 'Success': 'success', 'Error': 'error' })

let colorClass
if (type === 'filled' && status === 'success') {
  colorClass = 'bg-green-500 text-white'
} else if (type === 'filled' && status === 'error') {
  colorClass = 'bg-red-500 text-white'
} else if (type === 'outlined' && status === 'success') {
  colorClass = 'bg-transparent border-green-500'
} else if (type === 'outlined' && status === 'error') {
  colorClass = 'bg-transparent border-red-500'
}
```

Nếu các tổ hợp chỉ tạo ra đầu ra **lặp lại giống nhau** (ví dụ `Size` không làm thay đổi cấu trúc snippet — nó chỉ được truyền thẳng vào như một prop), thì một ánh xạ `getEnum` đơn lẻ cho mỗi variant là đủ — không cần tách nhánh tích chéo.

**INSTANCE_SWAP** — truy cập các component instance có thể hoán đổi:
```ts
const icon = instance.getInstanceSwap('Icon')
let iconCode
if (icon && icon.type === 'INSTANCE') {
  iconCode = icon.executeTemplate().example
}
```

**SLOT** — `getSlot(propName)` chỉ hợp lệ khi Figma component property báo về ở Bước 3 có kiểu là **`SLOT`**. Không dùng `getSlot()` cho các thuộc tính **`INSTANCE_SWAP`** (chúng dùng `getInstanceSwap()`). Slot là các “vùng nội dung” tường minh trong định nghĩa component, không phải các nested instance thông thường.

- **Chữ ký hàm:** `getSlot(propName: string): ResultSection[] | undefined`
```ts
// Figma property "Content" must be type SLOT in component properties
const content = instance.getSlot('Content')

export default {
  example: figma.code`<Card>${content}</Card>`,
  // ...
}
```

### Nội suy biến trong tagged templates

Khi nội suy giá trị vào bên trong tagged templates, hãy bọc đúng cú pháp:
- **Giá trị chuỗi** (`getString`, `getEnum`, `textContent`): bọc trong dấu ngoặc kép → `variant="${variant}"`
- **Giá trị instance/section** (`executeTemplate().example`): bọc trong ngoặc nhọn → `icon={${iconCode}}`
- **Các slot section** (kết quả `getSlot()` — `ResultSection[] | undefined`): nội suy trực tiếp bên trong `` figma.code`...` `` (cùng dạng với các snippet section lồng nhau), ví dụ `` figma.code`<Select>${content}</Select>` `` — không xử lý nó như một chuỗi thuần
- **Các boolean bare prop**: dùng biểu thức điều kiện → `${disabled ? 'disabled' : ''}`

### Tìm các layer hậu duệ

Khi bạn cần truy cập các node con không được phơi bày dưới dạng component property:

| Phương thức | Sử dụng khi |
|---|---|
| `instance.getInstanceSwap('PropName')` | Loại Figma property là **INSTANCE_SWAP** (instance hoán đổi cố định) |
| `instance.getSlot('PropName')` | Loại Figma property là **SLOT** (vùng nội dung tự do) |
| `instance.findInstance('LayerName')` | Bạn biết tên layer con (không có component property) |
| `instance.findText('LayerName')` → `.textContent` | Bạn cần nội dung văn bản từ một text layer có tên |
| `instance.findConnectedInstance('id')` | Bạn biết Code Connect `id` của layer con |
| `instance.findConnectedInstances(fn)` | Bạn cần nhiều layer con đã kết nối khớp với một bộ lọc |
| `instance.findLayers(fn)` | Bạn cần bất kỳ layer nào (text + instances) khớp với một bộ lọc |

### Các nested instance có thể cấu hình

Một component có thể chứa các instance con **không được phơi bày dưới dạng component property** (không có `INSTANCE_SWAP`) nhưng vẫn **cấu hình độc lập được** — chúng có các variant, property hoặc swap slot riêng. Các thành phần này phải được phân giải động, không được hardcode.

1. **Kiểm tra xem layer con đã có template Code Connect chưa** — dùng `get_code_connect_suggestions` hoặc kiểm tra các file `.figma.ts` hiện có trong dự án.
2. **Nếu chưa có template, hãy tạo một template** cho layer con đó để nó kết xuất chính xác cả khi đứng độc lập lẫn khi lồng bên trong.
3. **Tham chiếu layer con từ template cha** bằng `findInstance()` hoặc `findConnectedInstance()`, sau đó gọi `executeTemplate()`.

```ts
// Parent template — the Badge child isn't a prop, but it's configurable
const badge = instance.findInstance('Status Badge')
let badgeCode
if (badge && badge.type === 'INSTANCE') {
  badgeCode = badge.executeTemplate().example
}

export default {
  example: figma.code`<Card>${badgeCode}</Card>`,
  // ...
}
```

Quy tắc này áp dụng cho icon, badge, label và bất kỳ nested instance nào tự cấu hình được — luôn kết nối và kết xuất động chúng, tuyệt đối không hardcode nội dung của chúng.

### Ví dụ component lồng nhau

Đối với các component lồng nhau nhiều cấp hoặc truyền metadata prop giữa các template, xem [advanced-patterns.md](references/advanced-patterns.md).

```ts
const icon = instance.getInstanceSwap('Icon')
let iconSnippet
if (icon && icon.type === 'INSTANCE') {
  iconSnippet = icon.executeTemplate().example
}

export default {
  example: figma.code`<Button ${iconSnippet ? figma.code`icon={${iconSnippet}}` : ''}>${label}</Button>`,
  // ...
}
```

### Các prop có điều kiện

```ts
const variant = instance.getEnum('Variant', { 'Primary': 'primary', 'Secondary': 'secondary' })
const disabled = instance.getBoolean('Disabled')

export default {
  example: figma.code`
    <Button
      variant="${variant}"
      ${disabled ? 'disabled' : ''}
    >
      ${label}
    </Button>
  `,
  // ...
}
```

## Bước 6: Kiểm chứng (Validate)

Đọc lại file `.figma.ts` và rà soát theo các tiêu chí sau:

- **Đúng loại file & định dạng (kiểm tra mục này ĐẦU TIÊN)** — file phải là `ComponentName.figma.ts` (KHÔNG phải `.figma.tsx`), và export mặc định của nó là một parserless template dùng tagged template `` figma.code`...` ``. Nó KHÔNG được dùng `figma.connect()` (định dạng dựa trên parser). Nếu bạn lỡ viết `.figma.tsx` hoặc `figma.connect()`, hãy hủy bỏ và viết lại thành template `.figma.ts` dùng `figma.code`.
- **Độ phủ thuộc tính** — mọi Figma property từ Bước 3 phải được xử lý đầy đủ trong template. Gắn cờ báo bất kỳ thuộc tính nào còn thiếu và hỏi người dùng xem chúng có bị bỏ qua có chủ đích hay không.
- **Code hợp lệ, đúng kiểu** — mọi đoạn code xuất ra phải hợp lệ và đúng kiểu dữ liệu theo interface `Props` của code component. Tuyệt đối không tự bịa thuộc tính component — nếu một Figma property không có code prop tương ứng, hãy bỏ qua thay vì tự chế tên prop mới.
- **Không hardcode thành phần con** — xác minh rằng mọi thuộc tính `INSTANCE_SWAP` và slot component con đều dùng các API động (`getInstanceSwap()`, `findInstance()`, `findConnectedInstance()`, v.v.) kèm `executeTemplate()`. Không slot nào được chứa nội dung component viết cứng.
- **Quy tắc và Bẫy lỗi** — kiểm tra các lỗi phổ biến được liệt kê bên dưới (nối chuỗi kết quả template, bọc thừa `hasCodeConnect()`, thiếu kiểm tra `type === 'INSTANCE'`, v.v.)
- **Bọc cú pháp nội suy** — chuỗi (`getString`, `getEnum`, `textContent`) bọc trong ngoặc kép, giá trị instance/section (`executeTemplate().example`) bọc trong ngoặc nhọn, các slot section (`getSlot`) nội suy dưới dạng snippet section bên trong `` figma.code`...` ``, boolean dùng biểu thức điều kiện.

Nếu có điểm nào chưa chắc chắn, tham khảo [api.md](references/api.md) để xem chi tiết API và [advanced-patterns.md](references/advanced-patterns.md) cho các cấu trúc lồng nhau phức tạp.

## Tài liệu tra cứu nhanh nội tuyến

### Các phương thức `instance.*`

| Phương thức | Chữ ký (Signature) | Trả về |
|---|---|---|
| `getString` | `(propName: string)` | `string` |
| `getBoolean` | `(propName: string, mapping?: { true: any, false: any })` | `boolean \| any` |
| `getEnum` | `(propName: string, mapping: { [figmaVal]: codeVal })` | `any` |
| `getInstanceSwap` | `(propName: string)` | `InstanceHandle \| null` |
| `getSlot` | `(propName: string)` | `ResultSection[] \| undefined` |
| `getPropertyValue` | `(propName: string)` | `string \| boolean` |
| `findInstance` | `(layerName: string, opts?: SelectorOptions)` | `InstanceHandle \| ErrorHandle` |
| `findText` | `(layerName: string, opts?: SelectorOptions)` | `TextHandle \| ErrorHandle` |
| `findConnectedInstance` | `(codeConnectId: string, opts?: SelectorOptions)` | `InstanceHandle \| ErrorHandle` |
| `findConnectedInstances` | `(selector: (node) => boolean, opts?: SelectorOptions)` | `InstanceHandle[]` |
| `findLayers` | `(selector: (node) => boolean, opts?: SelectorOptions)` | `(InstanceHandle \| TextHandle)[]` |

### Các phương thức `InstanceHandle`

| Phương thức | Trả về |
|---|---|
| `hasCodeConnect()` | `boolean` |
| `executeTemplate()` | `{ example: ResultSection[], metadata: Metadata }` |
| `codeConnectId()` | `string \| null` |

### Các thuộc tính `TextHandle`

| Thuộc tính | Kiểu |
|---|---|
| `.textContent` | `string` |
| `.name` | `string` |

### `SelectorOptions`

```ts
{ path?: string[], traverseInstances?: boolean }
```

- `traverseInstances: true` — bắt buộc khi mục tiêu nằm bên trong một nested instance khác. Nếu thiếu tùy chọn này, `findInstance`/`findText` chỉ tìm trong các layer riêng của instance hiện tại và dừng lại ở ranh giới các nested instance.
- `path: string[]` — phân biệt khi nhiều hậu duệ dùng chung tên layer. Liệt kê tên các layer cha phải xuất hiện trên đường dẫn tới mục tiêu.

**Ví dụ:**

```ts
// Layer hierarchy:
//   A > C (instance) > "mychild"
// "mychild" sits inside nested instance C, so plain findInstance returns ErrorHandle.
instance.findInstance('mychild', { traverseInstances: true })

// Layer hierarchy:
//   A > C (instance) > "mychild"
//   A > D (instance) > "mychild"
// Two "mychild" layers exist — use path to pick the one under C.
instance.findInstance('mychild', { traverseInstances: true, path: ['C'] })
```

**Khi nào cần chọc sâu vào một nested instance từ template cha:** chỉ khi chính code component cha (từ Bước 4) nhận layer lồng nhau đó làm giá trị của một prop (ví dụ `<C show={<B />} />` — A truyền tiếp B vào C). Nếu cha chỉ chứa C và C tự kết xuất B ở bên trong, hãy phân giải C bằng `executeTemplate()` và để template riêng của C xử lý B — không lặp lại việc kết xuất B ở cấp cha.

### Cấu trúc Export

```ts
export default {
  example: figma.code`...`,                      // Required: ResultSection[]
  id: 'component-name',                         // Required: string
  imports: ['import { X } from "..."'],          // Optional: string[]
  metadata: { nestable: true, props: {} }        // Optional
}
```

## Quy tắc và Bẫy lỗi

1. **Không bao giờ nối chuỗi kết quả template.** `executeTemplate().example` là một mảng object `ResultSection[]`, không phải chuỗi. Dùng `+` hoặc `.join()` sẽ tạo ra `[object Object]`. Luôn nội suy bên trong tagged templates: `` figma.code`${snippet1}${snippet2}` ``

2. **Không dùng điều kiện chặn `hasCodeConnect()`.** Gọi trực tiếp `executeTemplate()` trên bất kỳ instance nào sau khi kiểm tra `type === 'INSTANCE'`. Runtime tự động xử lý các instance chưa có Code Connect.

   ```ts
   // WRONG — hasCodeConnect() gate drops non-CC instances
   if (icon && icon.type === 'INSTANCE' && icon.hasCodeConnect()) {
     iconCode = icon.executeTemplate().example
   }

   // CORRECT — let the runtime handle all instances
   if (icon && icon.type === 'INSTANCE') {
     iconCode = icon.executeTemplate().example
   }
   ```

3. **Kiểm tra `type === 'INSTANCE'` trước khi gọi `executeTemplate()`.** `findInstance()`, `findConnectedInstance()` và `findText()` trả về một `ErrorHandle` (có giá trị truthy nhưng không phải node thật) khi thất bại — không phải `null`. Luôn thêm bước kiểm tra type để tránh crash: `if (child && child.type === 'INSTANCE') { ... }`

4. **Ưu tiên `getInstanceSwap()` hơn `findInstance()`** khi có sẵn component property cho slot đó. `findInstance('Star Icon')` sẽ hỏng khi icon bị hoán đổi sang tên khác; `getInstanceSwap('Icon')` luôn hoạt động bất kể instance nào đang nằm trong slot.

5. **Chỉ dùng `getSlot()` khi loại Figma property là `SLOT`.** Với các prop `INSTANCE_SWAP`, dùng `getInstanceSwap()` (trả về `InstanceHandle`). `getSlot()` trả về các slot section có cấu trúc, không phải instance — không bao giờ gọi `executeTemplate()` lên giá trị trả về của nó.

6. **Tên property phân biệt hoa thường (case-sensitive)** và phải khớp chính xác với giá trị do `get_context_for_code_connect` trả về.

7. **Xử lý nhiều mảng template đúng cách.** Khi lặp qua các thành phần con, gán từng kết quả vào một biến riêng và nội suy riêng rẽ từng biến — không dùng `.map().join()`:
   ```ts
   // Wrong:
   items.map(n => n.executeTemplate().example).join('\n')

   // Correct — use separate variables:
   const child1 = items[0]?.executeTemplate().example
   const child2 = items[1]?.executeTemplate().example
   export default { example: figma.code`${child1}${child2}` }
   ```

8. **Không bao giờ hardcode nội dung của slot hoặc children.** Luôn phân giải động các instance con — dùng `getInstanceSwap()` cho các thuộc tính `INSTANCE_SWAP`, `findInstance()`/`findConnectedInstance()` cho con trực tiếp — và kết xuất chúng qua `executeTemplate()`. Không bao giờ tự dựng JSX từ tên layer (ví dụ `<StarIcon />`) hoặc đoán đường dẫn import. Nếu một instance chưa có Code Connect, hãy bỏ qua nó — không thêm giá trị dự phòng viết cứng.

   ```ts
   // WRONG — hardcodes the icon from its layer name
   example: figma.code`<Button icon={<StarIcon />}>Submit</Button>`

   // CORRECT — resolves dynamically, works for any swapped icon
   const icon = instance.findInstance('Icon')
   let iconCode
   if (icon && icon.type === 'INSTANCE') {
     iconCode = icon.executeTemplate().example
   }
   example: figma.code`<Button${iconCode ? figma.code` icon={${iconCode}}` : ''}>...</Button>`
   ```

9. **Cố gắng biểu diễn mọi Figma property thông qua một code prop.** Interface `Props` của code component (từ Bước 4) là danh sách tên thuộc tính chuẩn xác duy nhất. Với mỗi Figma property, tìm cách phù hợp nhất để biểu diễn nó bằng các phương thức API ở Bước 5 — khớp tên trực tiếp, biến đổi giá trị hoặc bất kỳ cách nào tương thích. Nếu hoàn toàn không có code prop nào khớp, hãy bỏ qua nó — đừng tự bịa tên prop.

## Ví dụ hoàn chỉnh từ đầu đến cuối

Cho URL: `https://figma.com/design/abc123/MyFile?node-id=42-100`

**Bước 1:** Phân tích URL.
- `fileKey` = `abc123`
- `nodeId` = `42-100` → `42:100`

**Bước 2:** Gọi `get_code_connect_suggestions` với `fileKey: "abc123"`, `nodeId: "42:100"`, `excludeMappingPrompt: true`.
Phản hồi trả về một component với `mainComponentNodeId: "42:100"`. Nếu phản hồi rỗng, dừng lại và thông báo cho người dùng. Nếu nhiều component được trả về, lặp lại Bước 3–6 cho từng component.

**Bước 3:** Gọi `get_context_for_code_connect` với `fileKey: "abc123"`, `nodeId: "42:100"` (từ Bước 2), `clientFrameworks: ["react"]`, `clientLanguages: ["typescript"]`.

Phản hồi bao gồm các thuộc tính:
- Label (TEXT)
- Variant (VARIANT): Primary, Secondary
- Size (VARIANT): Small, Medium, Large
- Disabled (BOOLEAN)
- Has Icon (BOOLEAN)
- Icon (INSTANCE_SWAP)

**Bước 4:** Tìm kiếm codebase → tìm thấy component `Button`. Đọc mã nguồn của nó để xác nhận các prop: `variant`, `size`, `disabled`, `icon`, `children`. Đường dẫn import: `"primitives"`.

**Bước 5:** Tạo `src/figma/primitives/Button.figma.ts`:

```ts
// url=https://figma.com/design/abc123/MyFile?node-id=42-100
// source=src/components/Button.tsx
// component=Button
import figma from 'figma'
const instance = figma.selectedInstance

const label = instance.getString('Label')
const variant = instance.getEnum('Variant', {
  'Primary': 'primary',
  'Secondary': 'secondary',
})
const size = instance.getEnum('Size', {
  'Small': 'sm',
  'Medium': 'md',
  'Large': 'lg',
})
const disabled = instance.getBoolean('Disabled')
const hasIcon = instance.getBoolean('Has Icon')
const icon = hasIcon ? instance.getInstanceSwap('Icon') : null
let iconCode
if (icon && icon.type === 'INSTANCE') {
  iconCode = icon.executeTemplate().example
}

export default {
  example: figma.code`
    <Button
      variant="${variant}"
      size="${size}"
      ${disabled ? 'disabled' : ''}
      ${iconCode ? figma.code`icon={${iconCode}}` : ''}
    >
      ${label}
    </Button>
  `,
  imports: ['import { Button } from "primitives"'],
  id: 'button',
  metadata: { nestable: true }
}
```

**Bước 6:** Đọc lại file để xác minh cú pháp.

## Tài liệu tham khảo bổ sung

Đối với các mẫu nâng cao (component lồng nhiều cấp, lọc bằng `findConnectedInstances`, truyền metadata prop giữa template cha/con):

- [api.md](references/api.md) — Tài liệu tham khảo đầy đủ API Code Connect
- [advanced-patterns.md](references/advanced-patterns.md) — Lồng cấp nâng cao, metadata props và các mẫu truy vấn hậu duệ
