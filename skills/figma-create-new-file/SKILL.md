---
name: figma-create-new-file
description: "Luôn sử dụng skill này khi người dùng muốn tạo một file Figma Design, FigJam, hoặc Slides mới. Bạn BẮT BUỘC phải gọi skill này TRƯỚC mỗi lần gọi công cụ `create_new_file`."
disable-model-invocation: false
---

# Tạo file mới trong Figma

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-create-new-file/SKILL.md) (Figma chính thức).

Các bước tạo file Figma Design, FigJam, hoặc Slides mới bằng công cụ MCP `create_new_file`.

## Bước 1: Xác định `planKey` và `editorType`

Sử dụng `planKey` mà người dùng đã cung cấp hoặc chọn cho tác vụ này. Nếu chưa có, hãy gọi `whoami` và kiểm tra các plan được trả về.

- Không có plan nào: thông báo cho người dùng rằng không thể tiếp tục tạo file.
- Một plan: sử dụng `key` của plan đó làm `planKey`.
- Nhiều plan: hiển thị các plan khả dụng, yêu cầu người dùng chọn một plan rồi sử dụng `key` của plan đó làm `planKey`.

Suy luận `editorType` từ loại file được yêu cầu bằng cách chọn từ enum đầu vào được công cụ công bố. Nếu chưa rõ ràng, hãy hỏi người dùng để chỉ định rõ loại file.

## Bước 2: Gọi `create_new_file`

Gọi công cụ `create_new_file` với đầy đủ cả ba tham số bắt buộc:

- `fileName`: Bắt buộc. Chọn một tên ngắn gọn nếu người dùng không cung cấp.
- `planKey`: Bắt buộc. Sử dụng `planKey` đã xác định ở Bước 1.
- `editorType`: Bắt buộc. Sử dụng `editorType` đã chọn ở Bước 1.
- `projectId`: Tùy chọn. Thiết lập tham số này để tạo file trong một project cụ thể.

```json
{
  "fileName": "Quarterly planning",
  "planKey": "team::1234567890",
  "editorType": "design"
}
```

- Sử dụng `file_key` từ phản hồi của công cụ `create_new_file` cho các lần gọi công cụ tiếp theo như `use_figma`.

## Bước 3: (Chỉ dành cho Slides) Xử lý grid trống

Một file Slides mới không chứa slide nào: `figma.getSlideGrid()` trả về `[]`. Trước khi đọc các thuộc tính như theme token từ một slide, hãy gọi `figma.createSlide()` hoặc xử lý trường hợp trống. Lần gọi `createSlide()` đầu tiên sẽ tự động tạo hàng 0 và chèn slide vào.
