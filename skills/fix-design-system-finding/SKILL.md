---
name: fix-design-system-finding
description: Sửa một finding tích hợp design system cụ thể trong màn hình hoặc component Figma, bao gồm thiếu shared component, local override và token chưa được liên kết (unbound tokens).
---

# Sửa một Design-System Finding

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [edenspiekermann/Skills](https://github.com/edenspiekermann/Skills/blob/main/skills/fix-design-system-finding/SKILL.md) (Edenspiekermann).

Sử dụng skill này sau khi `audit-design-system` đã xác định được một vấn đề cụ thể.

Skill này được thiết kế với phạm vi hẹp có chủ đích:
- mỗi lần một finding
- mỗi lần một node vi phạm hoặc một cụm cục bộ
- phạm vi đọc tối thiểu
- phạm vi ghi tối thiểu

Nạp các năng lực sau trước tiên:
- Quyền đọc Figma MCP cho các công cụ kiểm tra thông thường
- Một helper kiểu `figma-use` trước bất kỳ lời gọi ghi `use_figma` nào, khi môi trường của bạn yêu cầu

Hãy sử dụng [apply-design-system](../apply-design-system/SKILL.md) thay thế khi tác vụ là kết nối lại toàn màn hình ở phạm vi rộng hơn, nhiều section cần thay đổi đồng bộ, hoặc người dùng yêu cầu rõ ràng một lượt xử lý toàn bộ frame.

## Đầu vào kỳ vọng

Ưu tiên một trong các dạng sau:
- một finding JSON đơn lẻ từ `audit-design-system`
- toàn bộ JSON rà soát kèm theo finding cụ thể cần xử lý
- một mô tả vấn đề được diễn giải lại kèm URL Figma hoặc `fileKey` và `nodeId`

Nếu finding xuất phát từ `audit-design-system`, trích xuất mục tiêu từ:
- `code_location.absolute_file_path = /figma/<fileKey>/nodes/<nodeId>`

Coi kết quả rà soát như một hợp đồng phạm vi (scope contract). Không tự ý mở rộng từ một finding sang một lượt dọn dẹp toàn bộ màn hình.

## Quy tắc phạm vi

Bám sát finding đã chọn cho đến khi đạt một trong các trạng thái sau:
- `fixed`: vấn đề mục tiêu đã được khắc phục
- `blocked`: việc sửa đòi hỏi tài nguyên library bị thiếu, các component không thể truy cập hoặc các quyết định sản phẩm rộng hơn
- `needs-follow-up`: node mục tiêu đã được cải thiện, nhưng vẫn còn một vấn đề riêng biệt liền kề cần được rà soát độc lập

Nếu người dùng dán nhiều finding, hãy xử lý finding mà họ đã chọn hoặc chọn finding có mức độ ưu tiên cao nhất và thông báo rõ đó là finding đang được sửa ngay lúc này.

## Workflow bắt buộc

### 1. Chuẩn hóa Finding

Trích xuất và phát biểu lại:
- `fileKey`
- `nodeId` vi phạm
- tiêu đề finding
- lý do người rà soát đã gắn cờ mục này

Nếu kết quả rà soát không xác định được một node cụ thể, hãy dừng lại và yêu cầu cung cấp raw finding JSON hoặc một Figma node trực tiếp.

### 2. Chạy kiểm tra tương thích cục bộ khi lựa chọn thay thế còn mơ hồ

Trước khi sao lưu bất kỳ thứ gì hoặc chỉnh sửa trên canvas, hãy xác định xem một bản sửa gọn sạch có thực sự khả thi hay không.

Chạy kiểm tra tương thích cục bộ khi:
- finding ngụ ý cần swap sang DS nhưng không chỉ rõ component chính xác
- có nhiều hơn một library component trông có vẻ khả thi
- hành vi override hoặc kích thước chưa rõ ràng
- người dùng yêu cầu rõ ràng cần nghiên cứu thêm trước khi ghi dữ liệu

Không tiếp tục chuyển sang bước ghi cho đến khi kiểm tra tương thích trả về một trong các trạng thái:
- `safe-to-apply`
- `blocked`
- `needs-human-choice`

Bước kiểm tra tương thích phải trả lời được:
- component hoặc variant chính xác nào là ứng viên hàng đầu
- các override về text, icon, state và size có được hỗ trợ hay không
- thành phần thay thế có thể bảo toàn hợp đồng bố cục (layout contract) của node hay không

Nếu kết quả là `blocked`, hãy dừng lại và báo cáo blocker.

Nếu kết quả là `needs-human-choice`, hãy dừng lại và đặt câu hỏi làm rõ tối thiểu thay vì tự đoán.

### 3. Chỉ thu thập đúng bằng chứng cần thiết

Trước khi ghi, kiểm tra mục tiêu với tập lệnh đọc nhỏ nhất nhưng vẫn đủ hữu ích:
1. `get_screenshot` cho node vi phạm hoặc section bao quanh gần nhất
2. `get_metadata` để lấy ngữ cảnh cấu trúc
3. `get_variable_defs` khi finding đề cập đến token, giá trị thô, màu sắc, khoảng cách hoặc typography
4. `get_code_connect_map` khi finding gợi ý một component đã được map sẵn
5. `search_design_system` chỉ khi bạn vẫn cần định vị primitive thay thế

Không rà soát lại toàn bộ board trừ khi finding chỉ ra rõ ràng một mẫu lặp lại và mẫu lặp lại đó là điều kiện cần để chọn phương án sửa.

### 4. Phân loại phương án sửa

Chọn chính xác một chế độ khắc phục (remediation mode):
- `swap-instance`: thay thế một ad-hoc instance hoặc instance sai bằng đúng library component hoặc variant
- `compose-from-primitives`: dựng lại local custom wrapper từ các thành phần library đã publish
- `bind-tokens`: thay thế các giá trị thô bằng variables hoặc styles
- `align-variant`: chuyển một instance hiện có sang đúng variant hoặc trạng thái thuộc tính
- `blocked`: hiện không có phương án sửa dựa trên library nào hợp lệ

Nếu có nhiều chế độ đều có vẻ khả thi, hãy ưu tiên thay đổi nhỏ nhất đáp ứng được finding ban đầu.

### 5. Chỉ sao lưu khu vực bị ảnh hưởng

Trước khi thực hiện các chỉnh sửa mang tính phá hủy, chỉ nhân bản (duplicate) node vi phạm hoặc local section bao quanh nhỏ nhất.

Đặt tên bản sao lưu rõ ràng, ví dụ:
- `Backup - Fix finding 1`
- `Backup - Custom nav`

Thực hiện việc sao lưu trong một lời gọi ghi riêng biệt và trả về node ID đã tạo.

### 6. Áp dụng bản sửa từng bước

Không dựng lại toàn bộ màn hình.

Thực hiện theo các bước nhỏ:
1. kiểm tra các node ID hiện tại và liên kết component
2. import hoặc xác định vị trí library component hoặc variable cần thiết
3. chỉ thay thế, tổng hợp hoặc gắn lại token (retokenize) cho đúng khu vực mục tiêu
4. trả về toàn bộ các node ID đã tạo mới và thay đổi

Ưu tiên `swapComponent()` khi hàm này bảo toàn được vị trí của node và các override hợp lệ.

Ưu tiên dựng lại bên cạnh bản gốc khi:
- node hiện tại là một local wrapper có cấu trúc tùy biến hỗn hợp
- finding rà soát chỉ vào một bố cục tổng hợp tùy biến (custom composition), không phải một primitive đơn lẻ
- bạn cần đối chiếu trực quan trước khi thay thế bản gốc

Nếu lượt xác thực đầu tiên cho thấy component được khuyến nghị làm hỏng bố cục, khả năng hiển thị text, hành vi icon hoặc hợp đồng chiều rộng (width contract), hãy dừng lại. Báo cáo `blocked` hoặc `needs-follow-up` thay vì tiếp tục ép buộc đưa primitive đó vào vị trí.

### 7. Xác thực Finding, không xác thực toàn màn hình

Sau khi ghi:
1. chụp ảnh screenshot node vừa đổi hoặc section trực tiếp chứa nó
2. xác nhận khiếu nại cụ thể trong bản rà soát không còn đúng nữa
3. xác nhận kết quả đã gắn với library hoặc được bind token khi đó là mục tiêu
4. xác nhận khoảng cách và các text override vẫn hợp lý

Chỉ mở rộng phạm vi xác thực ra ngoài section cục bộ nếu bản sửa có chạm vào một mẫu toàn cục như thanh điều hướng (navigation).

## Heuristic ra quyết định

- Nếu finding nói một primitive đã bị tạo lại dưới dạng frame, hãy thiên về `swap-instance`.
- Nếu finding nói các local wrapper lặp lại nên gộp thành một mẫu dùng chung, hãy sửa một node đại diện trừ khi tác vụ yêu cầu rõ ràng phải áp dụng bản sửa cho toàn bộ các node đồng cấp.
- Nếu finding nói về các giá trị thô nằm cạnh các thành phần đồng cấp đã gắn token, hãy thiên về `bind-tokens`.
- Nếu finding nói về một instance bị chỉnh sửa cục bộ có sai kích thước hoặc trạng thái, hãy thiên về `align-variant`.
- Nếu library thiếu họ component cần thiết hoặc việc import thất bại, hãy đánh dấu `blocked` thay vì tự chế một kết nối giả.
- Nếu một DS component có tồn tại nhưng không thể bảo toàn hợp đồng text/icon/kích thước của node, hãy đánh dấu `blocked` hoặc `needs-human-choice` thay vì ép swap.

## Quy tắc thực thi & viết báo cáo

- Giữ phạm vi ghi bám chặt vào finding đã chọn.
- Không ghi dữ liệu trước khi có kết quả kiểm tra tương thích là `safe-to-apply` khi lựa chọn thay thế còn mơ hồ.
- Không tuyên bố toàn bộ màn hình đã "đạt chuẩn hệ thống" sau khi chỉ sửa một finding.
- Ưu tiên exact component key và variable ID hơn là tên.
- Không tiếp tục dọn dẹp các phần không liên quan chỉ vì bạn tình cờ thấy thêm sai lệch.
- Nếu rõ ràng cần một đợt tái cấu trúc rộng hơn, hãy hoàn thành bản sửa mục tiêu hoặc báo cáo blocker, sau đó khuyến nghị sử dụng `apply-design-system` cho lượt tiếp theo.

## Định dạng bàn giao

Khi kết thúc tác vụ, hãy báo cáo:
- `Finding fixed`: những gì đã thay đổi và trên node nào
- `Validation`: cách bạn xác nhận vấn đề ban đầu đã được giải quyết
- `Blocked` hoặc `Follow-up`: chỉ ghi nếu finding chưa thể giải quyết hoàn toàn

Giữ báo cáo gắn chặt với finding đơn lẻ đó. Tránh đưa ra tóm tắt toàn màn hình trừ khi người dùng yêu cầu.
