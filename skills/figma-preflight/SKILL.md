---
name: figma-preflight
description: "Cổng kiểm tra trước khi ghi (preflight) chỉ đọc cho một thao tác ghi Figma đã được cấp quyền: đúng mục tiêu trực tiếp, ngữ cảnh DS/API áp dụng, trạng thái và khóa một người ghi (single-writer lock); đồng thời hỗ trợ kiểm toán đồ thị luồng khi có yêu cầu."
license: MIT
compatibility: >-
  Cổng kiểm tra cho các thao tác ghi qua figma-console-mcp (figma_execute, plugin Desktop Bridge
  trong Figma Desktop) hoặc qua official Figma MCP server (use_figma, Full seat, chưa được repo này
  kiểm chứng). Script khóa tệp cần Python 3 (chỉ dùng thư viện chuẩn). Đọc skill figma-canon.
  Script thu thập bằng chứng cục bộ tùy chọn của figma-bridge-doctor chỉ hỗ trợ macOS.
metadata:
  author: Thiago Xikota
  version: "1.2.0"
---

# Kiểm tra tiền ghi Figma (Figma preflight)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [thiagoxikota/figma-maxxing](https://github.com/thiagoxikota/figma-maxxing/blob/main/skills/figma-preflight/SKILL.md) (Thiago Xikota).

Cổng kiểm tra chỉ đọc trước khi thực hiện một **thao tác ghi canvas đã được cấp quyền**.
Nó trả về các điều kiện tiên quyết rõ ràng hoặc các khoảng trống cụ thể và tuyệt đối không làm biến đổi canvas.
Việc kiểm tra chỉ đọc không cần xin phép ghi. Việc vượt qua cổng hoặc chiếm được khóa không phải là sự đồng thuận
của người dùng; hãy áp dụng quyền hạn đã có sẵn trong tác vụ mà không hỏi lại.

## Điều kiện tiên quyết cho phạm vi bị ảnh hưởng

- Kết nối trực tiếp và đúng tệp: `figma_get_status` của figma-console kèm phép thăm dò và ghép nối đúng, hoặc đường dẫn định danh + metadata hiện có của official MCP. Kết quả kiểm tra tiến trình/port cục bộ đơn thuần không thể chứng minh ghép nối.
- ID/vùng chọn mục tiêu chính xác và cấu trúc mới nhất. Chỉ làm rõ sự mơ hồ khi nó ảnh hưởng tới mục tiêu; metadata hợp lệ đã có trong ngữ cảnh có thể được tái sử dụng.
- Các thao tác ghi có style phải phân giải được variables/styles liên quan; giao diện mới phải tìm kiếm components/icons và tài sản ứng dụng hiện có trước khi tự vẽ hình học mới. Báo cáo nợ DS không liên quan thay vì biến một chỉnh sửa cục bộ thành cuộc dọn dẹp toàn tệp.
- Đọc chi tiết chuẩn/API áp dụng cho thao tác này. Lập kế hoạch cho các trạng thái sản phẩm và kết quả luồng mà thao tác thực sự tác động tới; không cần đọc trọn gói mọi tài liệu hay ép số lượt rà soát tinh thần bắt buộc.
- Giữ khóa tệp (file lock) bằng `scripts/figma_lock.py` của skill này, kèm định danh agent/task tường minh. Bất biến một người ghi (single writer) trên cùng một tệp luôn phải giữ nguyên. Xung đột khóa, thiếu/hỏng script khóa hoặc không rõ chủ sở hữu sẽ giữ nguyên trạng thái chặn ghi. Không bao giờ giải phóng khóa của tác vụ khác, tự ý ghi đè với lý do "nằm trên trang rời nhau", hoặc dùng ảnh chụp tiến trình trống làm lý do vượt rào.

[gate-checks.md](references/gate-checks.md) giải thích các lựa chọn công cụ thay thế, mục tiêu, variables, tái sử dụng và trạng thái khi một bước kiểm tra cần chi tiết.
[file-lock.md](references/file-lock.md) tài liệu hóa CLI khóa TTL hiện có và quy tắc giải phóng khóa. Chỉ giải phóng đúng khóa agent/task của bạn trong khối cleanup/finally.
Một ngoại lệ rõ ràng từ người dùng phải nêu đích danh điều gì được miễn trừ; nó không miễn trừ toàn bộ mọi cổng, không sửa được lỗi thiếu quyền truy cập và không cấp quyền giải phóng khóa của tác vụ khác theo kiểu suy diễn tương tự.

## Thực thi và bằng chứng

Khi gặp lỗi một phần hoặc timeout, phải đọc lại canvas trước khi thử lại. Kiểm chứng thuộc tính thực sự đã thay đổi,
không dựa vào một đại lượng thay thế không đổi; bảo toàn phần việc hiện có và che chắn các node null/chỉnh sửa trực tiếp đồng thời.
[write-verification.md](references/write-verification.md) chứa các trường hợp Plugin API dễ gãy. Không tự bịa ra sự hỗ trợ cho một công cụ/API.

Màn hình mới hoặc yêu cầu kiểm toán đồ thị sử dụng [flow-audit.md](references/flow-audit.md): điểm vào, điểm đích, cạnh mồ côi/chết/gãy và sai lệch ngữ nghĩa.
Một lượt kiểm toán không bao giờ tự tạo màn hình bị thiếu hay tự nối lại một luồng hợp lệ chỉ dựa trên suy đoán.
Báo cáo ngắn gọn mục tiêu, trạng thái đạt/thiếu và bằng chứng; một thao tác ghi nhỏ không đòi hỏi bảng đóng dấu nghi thức tám dòng hay lặp lại xác nhận người dùng.
