---
name: figma-generative-plugins
description: "**Điều kiện tiên quyết BẮT BUỘC** — tải skill này trước khi gọi `create_generative_plugin` hoặc `update_generative_plugin`. Sử dụng khi người dùng yêu cầu tạo, viết, chỉnh sửa, sửa lỗi hoặc mở rộng một generative Figma plugin có thể tái sử dụng."
disable-model-invocation: false
---

# Tạo và cập nhật generative Figma plugin

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-generative-plugins/SKILL.md) (Figma chính thức).

Tải skill này trước mỗi lần gọi `create_generative_plugin` hoặc `update_generative_plugin`. Trong ngôn ngữ giao tiếp với người dùng, hãy gọi kết quả là “plugin”. Từ “generative” chỉ dùng để phân biệt công cụ thư viện tài khoản này với các hệ thống plugin khác.

## Kiểm tra tiền điều kiện

Trước khi viết code, hãy xác nhận yêu cầu phù hợp với bề mặt này:

- Plugin chạy trong trình chỉnh sửa Figma Design.
- Mọi plugin đều phải cung cấp UI hoạt động được cho luồng công việc cốt lõi của nó. Ngay cả một plugin không có đầu vào cấu hình vẫn cần một hành động chính rõ ràng cùng phản hồi trạng thái hoặc xác thực hữu ích.
- Không bao giờ nhúng API key, OAuth token, signed URL hoặc các thông tin bí mật khác. Mã nguồn plugin có thể được đọc bởi những người có quyền truy cập vào nó. Đối với các tích hợp cần xác thực, hãy dừng lại và đề xuất một tập dữ liệu tĩnh, một endpoint công khai không cần xác thực, hoặc một kiến trúc khác.

## Quy trình tạo mới

1. Xác định luồng công việc được yêu cầu và các điều khiển hữu ích của nó. Chỉ đặt một câu hỏi ngắn gọn nếu các đầu vào bắt buộc hoặc hành vi thực sự mơ hồ.
2. Xác định `planKey`. Tái sử dụng giá trị do người dùng cung cấp; nếu không có, hãy gọi `whoami`. Tự động dùng plan hợp lệ duy nhất, hoặc yêu cầu người dùng chọn khi có nhiều plan khác biệt đáng kể.
3. Gọi `create_generative_plugin` một lần với tên, mô tả ngắn gọn và `planKey`. Thao tác này tạo ra một khung mẫu (scaffold) vẽ hình vuông có thể chạy được, chứ không phải plugin hoàn chỉnh cuối cùng được yêu cầu.
4. Gọi `get_generative_plugin` với `id` trả về, sau đó đọc toàn bộ các source URI. Bước này giúp nắm rõ manifest của khung mẫu, hợp đồng thông điệp UI và entrypoint TypeScript hiện tại.
5. Thay thế khung mẫu bằng các file hoàn chỉnh được viết cho hành vi và UI theo yêu cầu.
6. Gọi `update_generative_plugin` với `id` trả về, mảng `files` chứa nội dung thay thế hoàn chỉnh cho `code.ts` và (khi UI thay đổi) `ui.html`, cùng với một `commitMessage` cụ thể. Sử dụng `metadata` khi thay đổi tên hoặc mô tả.

Không bao giờ dừng lại sau `create_generative_plugin`: bản khởi tạo ban đầu phải được thay thế bằng trải nghiệm đúng như yêu cầu.

## Quy trình cập nhật

1. Xác định plugin. Nếu cần, hãy gọi `list_generative_plugins`, sau đó gọi `get_generative_plugin`.
2. Đọc toàn bộ các source URI do công cụ get trả về trước khi chỉnh sửa. Coi các file đó là nguồn chân lý hiện tại.
3. Giữ nguyên UI, các điều khiển, hành vi relaunch, kiểm tra hợp lệ và các thành phần tương tác hiển thị cho người dùng hiện có trừ khi người dùng yêu cầu thay đổi chúng.
4. Gọi `update_generative_plugin` với nội dung thay thế hoàn chỉnh cho từng file hiện có đã thay đổi. Dùng `{ path: "code.ts", content: "..." }` cho entrypoint và `{ path: "ui.html", content: "..." }` cho UI. Các file không được chỉ định sẽ được giữ nguyên.

## Ghi chú phiên bản

Đối với mỗi lần gọi `update_generative_plugin`, hãy kiểm tra input schema được công bố của công cụ và bao gồm từng trường dưới đây khi trường đó được hỗ trợ:

- `versionDescription`: Một dòng tóm tắt ngắn gọn, không bỏ trống về các thay đổi được bàn giao, tập trung vào kết quả người dùng nhìn thấy được.
- `versionDetail`: Một hoặc hai câu không bỏ trống giải thích chi tiết triển khai chính. Giữ mức độ chi tiết tương xứng với thay đổi, bám sát công việc đã thực hiện và tránh lặp lại phần tóm tắt.

Nếu một trong hai trường không có trong schema được công bố, hãy bỏ qua trường đó và tiếp tục cập nhật. Luôn bao gồm `commitMessage` bắt buộc. Không gửi placeholder rỗng hoặc khẳng định công việc chưa được thực hiện.

## Quy tắc viết mã nguồn

- Trước khi viết các file thay thế, hãy đọc [Plugin source authoring](references/authoring.md). Tài liệu này bao gồm hợp đồng thay thế file, vòng đời UI/message, các điều khiển PropsKit, tính tương thích dynamic-page, font chữ, hành vi relaunch, tác vụ giới hạn (bounded work), hình học và các lỗi thường gặp của Plugin API.
- Giữ cho hành động chính của plugin thật rõ ràng và làm cho các trạng thái vùng chọn hoặc đầu vào không hợp lệ dễ hiểu.
- `update_generative_plugin` có thể thay thế các file `code.ts` và `ui.html` hiện có, nhưng không thể thay thế `manifest.json` hoặc tạo file mới. Giữ `figma.showUI(__html__, ...)` trong `code.ts` và thay thế `ui.html` khi luồng công việc yêu cầu cần các điều khiển khác.
- Tránh các thay đổi mang tính phá hủy trên canvas trừ khi đó là mục đích rõ ràng của plugin và UI thể hiện rõ điều đó.
- Không đóng plugin trước khi các tác vụ bất đồng bộ và thông điệp UI hoàn tất.
- Coi kết quả `update_generative_plugin` không có lỗi là thành công. Ghi nhận phiên bản trả về nếu có; một phản hồi thành công có thể lược bỏ trường này.
- Khi có lỗi build, hãy dùng kết quả trình biên dịch trả về để thực hiện chỉnh sửa nhỏ nhất trong mã nguồn và thử lại một lần. Nếu vẫn thất bại, hãy hiển thị lỗi thay vì viết lại plugin nhiều lần.

## Hoàn tất

Báo cáo tên plugin và id, kèm theo phiên bản trả về nếu có cùng mô tả ngắn về UI và hành động chính của nó. Tạo và đính kèm một URL có thể nhấp để mở một file Design mới với plugin chưa xuất bản đã sẵn sàng dùng thử, sử dụng chính xác plugin id làm `try-tool-resource-content-id`:

`https://www.figma.com/file/new?try-tool-resource-content-id=<id>&try-tool-resource-type=gen_tool&type=design&mode=design`

Sau khi cung cấp liên kết file mới, hãy hỏi xem người dùng có muốn mở plugin trong một file Figma Design hiện có hay không. Nếu có, hãy tái sử dụng URL file đã được cung cấp hoặc hỏi xin URL, sau đó thêm các tham số truy vấn `try-tool-resource-content-id` và `try-tool-resource-type` tương tự vào URL đó. Không bao giờ tự đoán URL file.
