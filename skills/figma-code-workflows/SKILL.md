---
name: figma-code-workflows
description: Import hoặc tải lên HTML cục bộ hay các file dự án vào Figma, lựa chọn giữa các Design frame chỉnh sửa được, Code Layer chạy được hoặc Code độc lập (còn gọi là Make), và sửa chữa các bản xem trước đã import. Chỉ sử dụng khi người dùng nêu rõ tên các Design layer chỉnh sửa được, một Code Layer chạy được, hoặc một file Code/Make độc lập, hoặc cung cấp Figma file key/link làm đích import. Các yêu cầu tạo code hoặc code-component chung chung cần làm rõ định dạng đầu ra trước khi dùng quy trình này.
disable-model-invocation: false
---

# Import một dự án vào Figma

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-code-workflows/SKILL.md) (Figma chính thức).

Chỉ sử dụng quy trình này cho một đầu ra Figma được yêu cầu rõ ràng (Code/Make độc lập, Code Layer chạy được, hoặc các Design layer chỉnh sửa được), hoặc khi có một Figma file key/link được cung cấp làm đích đến. Các yêu cầu chung chung như “tạo một dự án code” hoặc “tạo một code component”, hay chỉ nhắc riêng tên Figma Code/Make, không xác định cụ thể đầu ra đó. Nếu ý định về đầu ra chưa rõ ràng, hãy hỏi xem người dùng muốn mã nguồn cục bộ hay một đầu ra trên Figma, rồi chờ câu trả lời trước khi bắt đầu quy trình này.

Bảo toàn nguyên vẹn dự án của người dùng. Sử dụng mô tả và schema hiện tại của từng tool để biết điều kiện tiên quyết và tham số.

Cập nhật cho người dùng ở các giai đoạn chính: chuẩn bị và kiểm chứng dự án, tải gói nén (archive) lên, và hoàn tất quá trình import trong Figma. Báo cáo các lượt import đang chờ, công việc khôi phục và các điểm tắc nghẽn ngay khi chúng xảy ra; không mô tả một giai đoạn chưa được xác nhận là đã hoàn thành.

## 1. Chọn đầu ra và đích đến

Xác định đầu ra dự định của người dùng, sau đó nạp skill phù hợp theo bảng dưới đây. Nếu đầu ra chưa rõ ràng, hãy hỏi người dùng trước khi tiếp tục.

| Đầu vào | Đầu ra người dùng yêu cầu | Hành động tiếp theo |
| --- | --- | --- |
| Ứng dụng đang chạy hoặc HTML tĩnh | Chưa chỉ định — chỉ bảo đưa/import vào Figma | Hỏi **"Editable design layers or a code layer?" và kết thúc lượt trả lời của bạn.** Chờ câu trả lời. |
| Ứng dụng đang chạy | Các Design layer chỉnh sửa được | Nạp `figma-generate-design`, sau đó gọi `generate_figma_design` vào một file Design. |
| HTML tĩnh | Các Design layer chỉnh sửa được | Gọi `html_to_figma` vào một file Design. |
| Ứng dụng đang chạy | Code Layer chạy được hoặc Code/Make độc lập | Tiếp tục với skill này và gọi `send_code_to_figma`. |
| HTML tĩnh | Code Layer chạy được hoặc Code/Make độc lập | Tiếp tục với skill này và gọi `send_code_to_figma`. |

Một dự án HTML có các nút bấm hoạt động vẫn còn mơ hồ khi người dùng chưa chọn loại đầu ra. Một liên kết Design chỉ xác định đích đến, không xác định loại đầu ra.

Trước khi chọn đích đến có thể chạy được (runnable destination), hãy gọi `whoami`. Chỉ chọn hoặc import vào một Design Code Layer khi `whoami.code_layers_enabled` là `true`; nếu không, hãy dùng Code/Make độc lập, hoặc giải thích giới hạn đó và hỏi trước khi đổi một đích Design đã được cung cấp tường minh.

Tôn trọng yêu cầu code-layer hoặc standalone tường minh trước khi áp dụng quy tắc ước lượng theo số lượng màn hình. Đối với mã nguồn chạy được kèm một liên kết Design, dùng Code Layer. Đối với liên kết Code độc lập, dùng standalone. Khi không có đích đến hoặc chưa có lựa chọn code-layer/standalone tường minh, hãy ước lượng số màn hình: ít hơn 10 hoặc không rõ → Code Layer; từ 10 trở lên → standalone. Tuyệt đối không hỏi người dùng chọn giữa Code Layer hay standalone, hoặc yêu cầu người dùng tự đếm màn hình. Các đích đến và liên kết tường minh được ưu tiên áp dụng sau khi đã chọn loại đầu ra.

Sử dụng URL file được cung cấp. Nếu cần tạo file mới, dùng `create_new_file` với loại đích đã chọn và gói (plan) mà người dùng chọn.

Tạo một file Design khi có yêu cầu code layer mà chưa có đích đến nào được cung cấp.

Giữ cố định lựa chọn đầu ra đã được xác nhận; không hỏi lại người dùng sau khi đã tạo file.

Đối với các Design layer chỉnh sửa được, tuân thủ hướng dẫn của tool đã chọn: `generate_figma_design` chụp lại trang đang được kết xuất của ứng dụng đang chạy; `html_to_figma` chuyển đổi một tài liệu HTML tĩnh tự chứa (self-contained). Kiểm tra các layer kết quả và chia sẻ liên kết Design. Chỉ tiếp tục các bước bên dưới đối với đầu ra mã nguồn chạy được (runnable code).

## 2. Tuân thủ phản hồi import

Gọi `send_code_to_figma` với nguồn cục bộ và đích đến đã chọn theo schema hiện tại của tool. Làm theo đúng hướng dẫn chuẩn bị và đóng gói archive được trả về; bảo toàn ứng dụng và kiểm chứng cục bộ trước khi tải lên khi được yêu cầu.

Làm theo chính xác hướng dẫn và giá trị `nextStep` trả về trong từng phản hồi cho các bước chuẩn bị, kiểm chứng, tải lên, các lượt import đang chờ và khôi phục thiết lập. Hoàn tất các điều kiện tiên quyết được trả về trước khi đi tiếp và truyền nguyên vẹn đầy đủ các tham số tiếp nối. Không tự bịa ra một bước khôi phục còn thiếu. Khi không có `nextStep`, hãy làm theo hướng dẫn trong phản hồi và mô tả hiện tại của tool.

Kết thúc bằng liên kết file/layer trả về và chỉ báo cáo các kết quả import và xem trước đã được xác nhận bởi kết quả thực tế.
