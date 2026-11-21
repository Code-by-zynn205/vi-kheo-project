---
name: figma-click-flow
description: "Vẽ hoặc làm mới lớp phủ luồng bấm (click-flow overlay) tĩnh trên các màn hình Figma đã dàn trang từ prototype reactions hoặc các cặp tường minh, dùng công thức SVG có sẵn và các mục tiêu đã kiểm chứng."
license: MIT
compatibility: >-
  Ghi vào tệp Figma Design thông qua figma-console-mcp (figma_execute, plugin Desktop Bridge
  trong Figma Desktop) hoặc thông qua official Figma MCP server (use_figma, Full seat, chưa được
  repo này kiểm chứng; công thức có bảo vệ figma.loadAllPagesAsync vì Figma liệt kê API này
  chưa được triển khai ở đó). Yêu cầu có các skill figma-canon và figma-preflight.
metadata:
  author: Thiago Xikota
  version: "1.2.0"
---

# Lớp phủ luồng bấm (Click-flow overlay)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [thiagoxikota/figma-maxxing](https://github.com/thiagoxikota/figma-maxxing/blob/main/skills/figma-click-flow/SKILL.md) (Thiago Xikota).

Vẽ một lớp phủ tĩnh lên một section đã dàn trang sẵn: chấm gốc (origin dots), đoạn gấp khúc
bo góc (rounded elbows) và mũi tên mở tại điểm đích. Lớp phủ này dùng để tài liệu hóa luồng;
nó không tạo màn hình sản phẩm, không nối dây cho prototype bị thiếu và không cấp quyền cho các điểm đích mới.

Đầu vào: `sectionId` và chế độ (`from-prototype`, `explicit` hoặc heuristic `auto-layout`);
các cặp tường minh có dạng `{from,to}`, không có trường `label`. Tái sử dụng các mục tiêu đã biết
và được cấp quyền. Nếu không tìm thấy cặp nào, hãy báo cáo khoảng trống thay vì vẽ một kết quả
thành công rỗng. Chế độ heuristic theo vị trí liền kề cần có xác nhận trực quan và không được
âm thầm biến thứ tự hàng thành một quyết định sản phẩm.

Sử dụng `figma-preflight`, khóa tệp (file lock) và đường dẫn ghi khả dụng. Figma Design
không hỗ trợ `createConnector` hoặc nhân bản các node `CONNECTOR` có sẵn; hãy dùng
`references/draw-overlay.js` của skill này, tham số hóa nó mà không viết lại logic tọa độ
dễ vỡ bên trong. Đường dẫn `use_figma` chính thức chưa được repo này kiểm chứng; hãy tuân thủ
hướng dẫn runtime hiện tại của nó và kiểm chứng mọi kết quả.

[overlay-details.md](references/overlay-details.md) lưu giữ cấu hình, hình học, tọa độ
trang/section, ngữ nghĩa từng chế độ, các cặp bị loại bỏ, công thức chụp ảnh và dọn dẹp.
Đọc các mục áp dụng khi vẽ hoặc chẩn đoán. Công thức sẽ thay thế lớp phủ có tên trước đó,
vì vậy phạm vi/quyền sở hữu của mục tiêu đó phải chính xác. Nếu gặp timeout hoặc lỗi ghi một phần,
phải đọc lại trạng thái trước khi chạy lại.

Kiểm chứng các điểm gốc nằm trên đúng control thực tế, điểm đích, các điểm giao cắt,
vị trí cục bộ trong section, số lượng và hình học hiển thị ở tỷ lệ phóng đủ rõ. Dùng cơ chế
chụp ảnh qua plugin khi khả dụng và tôn trọng hạn mức REST. Giữ màu nhấn/quy chuẩn dự án
thay vì ép dùng màu đỏ mặc định. Tách một đồ thị dày đặc khi cần để dễ đọc, không tách theo một
ngưỡng số lượng tùy tiện cho cả tác vụ. Báo cáo danh sách ID và các cặp bị loại bỏ/chưa chắc chắn.
