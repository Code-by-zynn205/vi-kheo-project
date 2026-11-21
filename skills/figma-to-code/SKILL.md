---
name: figma-to-code
description: |
  Triển khai thiết kế Figma chuẩn từng pixel (pixel-perfect) bằng cách sử dụng Figma MCP để lấy thông số kỹ thuật và Chrome DevTools MCP để xác thực trực quan theo từng vòng lặp. Sử dụng skill này khi người dùng cung cấp một liên kết Figma và muốn có bản triển khai HTML/CSS chính xác. Skill bao gồm các công thức căn chỉnh vị trí chính xác, tinh chỉnh lặp dựa trên diff và đạt độ chính xác pixel từ 98% trở lên.
license: MIT
compatibility: |
  Requires: Figma MCP (Framelink), Chrome DevTools MCP, modern browser.
  Works with HTML, CSS (vanilla or Tailwind), and any frontend framework.
  Compatible with any agent supporting the Agent Skills standard (Cursor, GitHub Copilot, Claude, Amp, Goose, etc.)
metadata:
  author: Countmatters
  version: 1.0.0
  tags: figma, design, pixel-perfect, css, html, frontend
---

# Figma sang Code: Triển khai chuẩn từng Pixel

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [applyagency/figma-to-code-skill](https://github.com/applyagency/figma-to-code-skill/blob/main/SKILL.md) (Apply Agency).

Skill này cho phép triển khai chính xác các thiết kế Figma kèm quy trình xác thực trực quan theo từng vòng lặp.

> **Độc lập với agent (Agent-agnostic)**: Skill này hoạt động với bất kỳ AI coding agent nào hỗ trợ [tiêu chuẩn Agent Skills](https://agentskills.io).

## Điều kiện tiên quyết

- **Figma MCP** (Framelink) - để trích xuất thông số kỹ thuật thiết kế
- **Chrome DevTools MCP** - để chụp ảnh màn hình và đối chiếu trực quan
- Các gói npm **pixelmatch** và **pngjs** (để tạo ảnh so sánh diff)

## Tổng quan Workflow

```
1. Extract Figma specs → 2. Create HTML/CSS → 3. Screenshot → 4. Diff compare → 5. Iterate
```

## Bước 1: Trích xuất dữ liệu thiết kế Figma

Sử dụng Figma MCP để lấy thông số kỹ thuật chính xác:

```
Tool: get_figma_data
Server: user-Framelink MCP for Figma
Arguments:
  fileKey: "<extracted from URL: figma.com/design/<fileKey>/...>"
  nodeId: "<extracted from URL: node-id=<nodeId>>"
```

### Dữ liệu quan trọng cần trích xuất

Từ kết quả trả về, thu thập các giá trị `globalVars.styles` sau:

| Loại dữ liệu | Cần tìm gì |
|--------------|------------|
| **Dimensions** | `dimensions.width`, `dimensions.height` |
| **Position** | `locationRelativeToParent.x`, `locationRelativeToParent.y` |
| **Colors** | các mảng `fill_*` (ví dụ: `['#FDFDFD']`) |
| **Typography** | `fontFamily`, `fontSize`, `fontWeight`, `lineHeight` |
| **Spacing** | `padding`, `gap`, `margin` trong các layout style |
| **Borders** | `borderRadius`, `strokeWeight`, màu `stroke_*` |

### Tải xuống Icon/Hình ảnh

```
Tool: download_figma_images
Server: user-Framelink MCP for Figma
Arguments:
  fileKey: "<fileKey>"
  nodes: [
    { nodeId: "<icon-node-id>", fileName: "icon-name.svg" }
  ]
  localPath: "<absolute-path-to-images-folder>"
```

## Bước 2: Công thức định vị (Positioning Formula)

**Quan trọng**: Tọa độ y của Figma được tính từ ĐỈNH (TOP) của bounding box, nhưng cách render văn bản trong CSS lại bị ảnh hưởng bởi `line-height`.

### Vấn đề lệch do Line-Height

Khi văn bản có `line-height > 1`, khoảng trống thừa sẽ được thêm vào ở phía trên và phía dưới:

```
offset = (line-height - 1) × font-size ÷ 2
```

### Giải pháp: Hai cách tiếp cận

**Phương án A: Bù trừ trong vị trí CSS**
```css
/* Figma says y: 48, font-size: 48px, line-height: 1.2 */
/* offset = (1.2 - 1) × 48 ÷ 2 = 4.8px */
.element {
  top: 43px; /* 48 - 5 (rounded) */
  line-height: 1.2;
}
```

**Phương án B: Sử dụng line-height: 1 (Khuyến nghị)**
```css
/* Use Figma coordinates directly */
.element {
  top: 43px; /* Figma y minus small offset */
  line-height: 1; /* Eliminates extra spacing */
}
```

### Bảng ánh xạ vị trí

| Thuộc tính Figma | Thuộc tính CSS |
|------------------|----------------|
| `locationRelativeToParent.x` | `left` (cho `position: absolute`) |
| `locationRelativeToParent.y` | `top` (điều chỉnh theo line-height) |
| `dimensions.width` | `width` |
| `dimensions.height` | `height` |

## Bước 3: Tạo cấu trúc HTML/CSS

### Thực hành tốt nhất (Best Practices)

1. **Sử dụng absolute positioning** để đặt vị trí chính xác bên trong các card/container
2. **Khớp chính xác các giá trị Figma** cho màu sắc, border-radius, padding, gap
3. **Tải Google Fonts** nếu Figma sử dụng font tùy chỉnh (ví dụ: Urbanist)
4. **Thêm font-smoothing** để hiển thị sắc nét hơn:

```css
body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}
```

### Mẫu cấu trúc CSS

```css
:root {
  /* Colors from Figma fills */
  --color-background: #FDFDFD;
  --color-text: #1E162E;
  --color-border: #DBDBDB;
  
  /* Typography from Figma text styles */
  --font-heading-size: 48px;
  --font-heading-weight: 400;
  --font-label-size: 12px;
  --font-label-weight: 500;
}

.container {
  position: relative;
  width: 318px;  /* From Figma dimensions */
  height: 230px;
  background: var(--color-background);
  border-radius: 8px; /* From Figma borderRadius */
}

.element {
  position: absolute;
  top: 48px;   /* From Figma y coordinate */
  left: 16px;  /* From Figma x coordinate */
}
```

## Bước 4: Đối chiếu trực quan với Chrome DevTools MCP

### Chụp ảnh màn hình bản triển khai

Trước tiên, mở tệp HTML trong Chrome và chụp ảnh màn hình:

```
Tool: new_page
Server: user-chrome-devtools
Arguments:
  url: "file:///path/to/your/index.html"
```

Chờ font tải xong, sau đó:

```
Tool: take_screenshot
Server: user-chrome-devtools
Arguments:
  format: "png"
  filePath: "/path/to/output/screenshot.png"
```

### Chụp ảnh riêng từng phần tử

Nếu bạn chỉ cần chụp một phần tử cụ thể:

```
Tool: take_snapshot
Server: user-chrome-devtools
```

Sau đó sử dụng `uid` lấy từ snapshot:

```
Tool: take_screenshot
Server: user-chrome-devtools
Arguments:
  uid: "<element-uid-from-snapshot>"
  filePath: "/path/to/output/element-screenshot.png"
```

## Bước 5: So sánh sai khác từng pixel (Pixel Diff)

### Sử dụng script Node.js

Tạo một script so sánh (xem `references/compare.js`):

```javascript
import pixelmatch from 'pixelmatch';
import { PNG } from 'pngjs';
import fs from 'fs';

// Load images
const original = PNG.sync.read(fs.readFileSync('original.png'));
const screenshot = PNG.sync.read(fs.readFileSync('screenshot.png'));

// Create diff
const diff = new PNG({ width: original.width, height: original.height });
const numDiffPixels = pixelmatch(
  original.data, screenshot.data, diff.data,
  original.width, original.height,
  { threshold: 0.1 }
);

// Calculate match percentage
const totalPixels = original.width * original.height;
const matchRate = ((totalPixels - numDiffPixels) / totalPixels * 100).toFixed(2);
console.log(`Match rate: ${matchRate}%`);

// Save diff image
fs.writeFileSync('diff.png', PNG.sync.write(diff));
```

### Diễn giải kết quả Diff

| Tỷ lệ khớp | Trạng thái | Hành động |
|------------|------------|-----------|
| 99%+ | Xuất sắc | Hoàn tất - chỉ còn khác biệt khử răng cưa (anti-aliasing) |
| 97-99% | Tốt | Cần tinh chỉnh nhẹ |
| 95-97% | Chấp nhận được | Kiểm tra lại vị trí, font chữ |
| <95% | Cần sửa thêm | Rà soát lại tọa độ, kích thước |

## Bước 6: Tinh chỉnh theo vòng lặp

Dựa trên kết quả diff, các cách khắc phục phổ biến gồm:

### Lỗi vị trí (các phần tử bị lệch)
```css
/* Adjust top/left values by 1-2px */
.element { top: 47px; } /* was 48px */
```

### Khác biệt render font
```css
/* Try different font-smoothing */
.text {
  -webkit-font-smoothing: subpixel-antialiased;
}
```

### Lỗi căn chỉnh với flex-end
```css
/* Use margin-bottom to align to baseline */
.label {
  margin-bottom: 8px; /* Adjust until aligned */
}
```

### Lệch kích thước (xuất @2x)
```css
/* Figma exports at 2x, display at 1x */
.original-image {
  width: 318px;  /* Half of 636px */
  height: 230px; /* Half of 460px */
}
```

## Tra cứu nhanh: Ánh xạ Figma sang CSS

| Thuộc tính Figma | Tương đương trong CSS |
|------------------|-----------------------|
| `fill_*: ['#HEX']` | `background-color: #HEX` hoặc `color: #HEX` |
| `borderRadius: '8px'` | `border-radius: 8px` |
| `strokeWeight: '1px'` | `border-width: 1px` |
| `stroke_*: ['#HEX']` | `border-color: #HEX` |
| `gap: '8px'` | `gap: 8px` (flexbox) |
| `padding: '8px 16px'` | `padding: 8px 16px` |
| `mode: 'row'` | `display: flex; flex-direction: row` |
| `mode: 'column'` | `display: flex; flex-direction: column` |
| `alignItems: 'center'` | `align-items: center` |
| `justifyContent: 'center'` | `justify-content: center` |
| `sizing.horizontal: 'hug'` | `width: fit-content` |
| `sizing.horizontal: 'fill'` | `flex: 1` hoặc `width: 100%` |

## Ví dụ: Workflow hoàn chỉnh

```markdown
User: "Implement this Figma design: https://figma.com/design/abc123/File?node-id=1-234"

1. Extract fileKey (abc123) and nodeId (1-234) from URL
2. Call get_figma_data to get specifications
3. Call download_figma_images for any icons/images
4. Create HTML with absolute positioning using Figma coordinates
5. Apply positioning formula for text elements
6. Open in Chrome via new_page MCP tool
7. Take screenshot with take_screenshot
8. Run pixel diff comparison
9. Iterate: adjust positions, run diff again
10. Repeat until 98%+ match
```

## Xử lý sự cố (Troubleshooting)

### "37% bị quá thấp" - Vấn đề vị trí văn bản
- Kiểm tra giá trị `line-height`
- Sử dụng `line-height: 1` để kiểm soát chính xác
- Trừ phần bù line-height khỏi tọa độ y của Figma

### "Nhãn bị lệch hàng" - Vấn đề căn chỉnh Flex
- Kiểm tra xem phần tử cha có dùng `align-items: flex-end` không
- Thêm `margin-bottom` để đẩy phần tử lên đúng đường cơ sở (baseline)

### "Màu sắc không khớp"
- Đảm bảo bạn đang dùng chính xác mã hex từ Figma
- Kiểm tra xem phần tử có nhiều fill không (sử dụng fill đầu tiên)

### "Kích thước ảnh chụp màn hình không khớp"
- Figma có thể xuất ảnh ở mức 2x (retina)
- Sử dụng `deviceScaleFactor: 2` khi chụp ảnh màn hình
- Hoặc thu nhỏ ảnh gốc về tỷ lệ 1x để so sánh

---

## Cài đặt & Phân phối

### Dành cho cá nhân/nhóm

Đặt thư mục skill này vào một trong các vị trí sau:

```
# Project-level (recommended for team sharing)
your-project/.cursor/skills/figma-to-code/

# Or in project root
your-project/figma-to-code/
```

### Đưa lên GitHub

Để chia sẻ skill này công khai:

1. Tạo một repository GitHub công khai (public)
2. Tổ chức cấu trúc như sau:
   ```
   your-repo/
   └── figma-to-code/
       ├── SKILL.md
       ├── scripts/
       └── references/
   ```
3. Người khác có thể clone hoặc tham chiếu đến repo của bạn

### Khám phá (Discovery)

Các skill đã phát hành có thể được tìm thấy qua:
- Tìm kiếm trên GitHub với từ khóa "agent-skills" hoặc "SKILL.md"
- Các bộ sưu tập cộng đồng như [awesome-agent-skills](https://github.com/skillmatic-ai/awesome-agent-skills)
- Các thư mục skill riêng của từng agent
