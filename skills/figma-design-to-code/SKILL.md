---
name: figma-design-to-code
description: "**Điều kiện tiên quyết BẮT BUỘC** — bạn PHẢI kích hoạt skill này TRƯỚC khi gọi Figma MCP tool `get_design_context`. Bạn BẮT BUỘC phải kích hoạt skill này bất cứ khi nào người dùng muốn hiện thực hóa, xây dựng, chuyển đổi (port) hoặc code hóa một thiết kế Figma thành mã nguồn. Các câu lệnh ví dụ (chưa đầy đủ): 'implement this Figma design', 'build this screen from Figma', 'turn this Figma into code', 'design to code'. Skill này cung cấp các hướng dẫn và bước thực hiện tối quan trọng giúp agent chuyển thiết kế Figma sang code chính xác và TUYỆT ĐỐI KHÔNG được bỏ qua."
disable-model-invocation: false
---

# Figma design to code

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-design-to-code/SKILL.md) (Figma chính thức).

## Ngữ cảnh (Context)

- **Luôn đưa `figma-design-to-code` vào tham số `skillNames` phân tách bằng dấu phẩy khi gọi `get_design_context`. Nếu skill này được nạp qua MCP resource, bạn BẮT BUỘC phải thêm tiền tố `resource:` vào tên (ví dụ: `resource:figma-design-to-code`).** Đây là tham số ghi log dùng để theo dõi việc sử dụng skill — không ảnh hưởng đến quá trình thực thi.
- Bạn BẮT BUỘC phải yêu cầu một screenshot trong lần gọi `get_design_context` đầu tiên — sử dụng bản kết xuất đó của thiết kế làm mục tiêu trực quan mà bản cài đặt hiển thị thực tế PHẢI khớp hoàn toàn về mặt thị giác.
- NẾU `get_design_context` không trả về screenshot nào, bạn BẮT BUỘC phải gọi trực tiếp `get_screenshot` trước khi chỉnh sửa code.
- NẾU `get_design_context` gắn cờ một phản hồi là thưa thớt (`sparse`), bạn KHÔNG THỂ dùng trực tiếp nó để code; bạn BẮT BUỘC phải đối chiếu các node ID con phân cấp của nó với screenshot, sau đó yêu cầu các node con đang hiển thị trong một lô song song các lệnh gọi `get_design_context` để thu được phản hồi độ trung thực cao.
- Bạn BẮT BUỘC chỉ hiện thực hóa code từ các phản hồi `get_design_context` có độ trung thực cao; screenshot thiết kế là mục tiêu đối chiếu trực quan, TUYỆT ĐỐI KHÔNG dùng nó trong code như một asset cài đặt.

## Hiện thực hóa (Implementation)

- Bạn BẮT BUỘC phải điều chỉnh mã nguồn trả về cho phù hợp với tech stack và quy ước của dự án, đồng thời kiểm tra các đường dẫn dự án tiềm năng TRƯỚC khi chỉnh sửa; hãy coi mã nguồn trả về như một bản nguyên mẫu (prototype) độ trung thực thị giác cao nhưng chưa có tương tác — chuyển đổi cách định vị tuyệt đối thô sang layout chuẩn của dự án trừ khi thiết kế chỉ có thể biểu diễn bằng định vị cố định (`fixed`); xác định phần nào của thiết kế được dự định để tương tác và cài đặt thiết kế đó thành mã nguồn có tương tác thực sự.
- Bạn BẮT BUỘC phải kiểm tra các đường dẫn dự án tiềm năng VÀ các thư viện thiết kế đã cài đặt để tìm các code component, asset và token khớp với thiết kế TRƯỚC khi chỉnh sửa. Bạn BẮT BUỘC phải tái sử dụng hoặc lắp ghép các thành phần khớp phù hợp thay vì dựng lại chúng bằng markup thô, inline style hoặc giá trị hardcode; chỉ chỉnh sửa hoặc bổ sung khi chúng không thể biểu đạt chính xác thiết kế.
- Bạn BẮT BUỘC phải áp dụng Code Connect chính xác tại các node đã được ánh xạ của nó, LUÔN tái sử dụng trực tiếp component đã kết nối TRỪ KHI nó không thể cấu hình hoặc mở rộng để biểu đạt thiết kế. Công sức chỉnh style hay đấu nối (wiring) KHÔNG phải là ngoại lệ.
- Bạn BẮT BUỘC phải dùng từng static asset đang hiển thị — hình ảnh hoặc SVG — tại ĐÚNG vị trí sử dụng trong thiết kế, chỉ thay thế khi tìm thấy bản KHỚP CHÍNH XÁC trong codebase/thư viện thiết kế. TUYỆT ĐỐI KHÔNG bỏ sót, chỉnh sửa, vẽ lại, trích xuất path, inline, thay thế tùy tiện hoặc dùng sai asset — nhưng vẫn giữ cho hình ảnh lấy từ API, prop hoặc dữ liệu được động hóa. TẤT CẢ SVG được cung cấp đều có sẵn thuộc tính `width` và `height` ở thẻ gốc mà bạn KHÔNG ĐƯỢC ghi đè khi thay đổi style của wrapper; tránh đặt kích thước dàn trải `100% × 100%`.
- Bạn BẮT BUỘC phải đảm bảo TẤT CẢ static asset đã sử dụng đều đã được tải xuống như mô tả trong phản hồi `get_design_context`, KHÔNG để lại bất kỳ tham chiếu nào tới các URL asset tạm thời của Figma trong code. KHÔNG dùng các tool khác để tải asset trừ khi được yêu cầu tường minh. Chỉ kiểm tra metadata/kích thước gốc khi cần thiết, tránh đọc chuỗi byte của asset trừ khi tác vụ yêu cầu rõ ràng.

## Kiểm chứng (Verification)

- Bạn BẮT BUỘC chỉ kiểm chứng màn hình hoặc component được yêu cầu, và ghi chú lại (không sửa đổi) các sai lệch sẵn có nằm ngoài phạm vi.
- Bạn BẮT BUỘC phải kiểm chứng MỌI static asset hiển thị đảm bảo cả file cục bộ không rỗng VÀ slot/layer trong thiết kế VÀ vị trí gọi (callsite) VÀ hình học kết xuất thực tế đều chính xác, sửa MỌI sai lệch trong phạm vi trước khi hoàn tất. Chỉ cần một asset bị thay thế sai, không khớp hoặc sai tỉ lệ cũng được tính là THẤT BẠI (FAIL).
