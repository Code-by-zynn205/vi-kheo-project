---
name: figma-handoff-gate
description: "Kiểm toán bàn giao (handoff) Figma về mức độ đầy đủ hành động/trạng thái, chú thích dễ đọc, khả năng sử dụng cho người nhận và bằng chứng hợp lệ. Rà soát chỉ đọc và sửa lỗi đã được phê duyệt vẫn tách bạch; không áp đặt nghi thức đóng vai rà soát cố định."
license: MIT
compatibility: >-
  Chỉ đọc cho tới khi bản sửa được phê duyệt. Các đoạn mã phát hiện được viết bằng Plugin API JavaScript
  cho figma_execute (figma-console-mcp, plugin Desktop Bridge trong Figma Desktop). use_figma của
  official Figma MCP server cũng chạy Plugin API JavaScript, nhưng cổng kiểm tra này chưa được kiểm chứng
  trên đó. Đọc skill figma-canon; các bản sửa đã phê duyệt phải đi qua figma-preflight.
metadata:
  author: Thiago Xikota
  version: "1.2.0"
---

# Mức độ sẵn sàng bàn giao Figma (Figma handoff readiness)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [thiagoxikota/figma-maxxing](https://github.com/thiagoxikota/figma-maxxing/blob/main/skills/figma-handoff-gate/SKILL.md) (Thiago Xikota).

Kiểm toán phần bàn giao bị ảnh hưởng theo đúng nhu cầu cụ thể của lập trình viên/người nhận.
Quá trình này ở chế độ chỉ đọc trừ khi việc chỉnh sửa đã được cấp quyền sẵn. Áp dụng
quyền hạn đó trong đúng phạm vi mà không hỏi lại theo từng phát hiện; một quyết định mới
về sản phẩm/DS hoặc thao tác gửi ra bên ngoài cần có sự cho phép riêng.

Ưu tiên sử dụng quy tắc bàn giao/ngôn ngữ địa phương/dữ liệu mẫu của dự án trước tiên. Các tiêu chí
kỹ thuật nằm trong [handoff-checks.md](references/handoff-checks.md): khoảng cách và độ thoáng nhãn,
kích thước/tương phản/mật độ chú thích, đếm màn hình trung thực, trạng thái component, bản địa hóa,
quy ước trình bày chữ, độ đầy đủ của trạng thái/tác nhân/hành động nghịch đảo, canvas bàn giao sạch
dấu vết quy trình và bằng chứng ở đúng tỷ lệ sử dụng. Chỉ tải các mục cần thiết cho đợt bàn giao;
một đợt kiểm toán phát hành đầy đủ sẽ bao phủ toàn bộ tiêu chí áp dụng.

Mọi hành động trên một màn hình đều cần có kết quả được thiết kế rõ: đích đến, trợ giúp/thông tin,
cặp nghịch đảo (inverse pairs), tác nhân bị ảnh hưởng, xác nhận hành động phá hủy và trạng thái sau khi thực hiện.
Phần việc chưa hoàn thiện hoặc ngoài phạm vi được nêu rõ ràng phải báo cáo đúng như vậy, tuyệt đối không
tuyên bố là một luồng hoàn chỉnh. Khả năng đi tới trong prototype và điểm bắt đầu phải đủ chứng minh
cho tuyên bố "clickable" (bấm chạy được). Ảnh chụp toàn cảnh không chứng minh được chi tiết một biểu tượng nhỏ hay chữ nhỏ.

Có thể tái sử dụng bằng chứng về độ chỉn chu/chính xác từ `figma-slop-check`; không bắt buộc phải chạy
một lượt tách biệt, đóng dấu bốn vai trò, tuân theo thứ tự cố định hay có người rà soát ngoài cho mọi thay đổi.
Kiểm tra trực tiếp tạo tác thực tế và luồng của người nhận, không dựa trên một bản mô phỏng viết tay về việc
model nghĩ điều gì có thể xảy ra. Chỉ chạy lại các kiểm tra bị mất hiệu lực bởi một chỉnh sửa sau đó,
thay vì khởi động lại các cổng không liên quan.

Báo cáo riêng các điểm chặn (blockers) với các cảnh báo không chặn (nonblocking warnings), kèm mục tiêu và bằng chứng.
Một cảnh báo đơn lẻ không tự biến thành điểm chặn phát hành; một kết quả bắt buộc bị thiếu hoặc một trạng thái
trọng yếu chưa được kiểm chứng không thể ngụy trang thành PASS. Kết quả từ người rà soát không tự cấp quyền sửa/trả lời.
Các bản sửa đã phê duyệt phải dùng preflight/lock, đọc lại thuộc tính và kèm bằng chứng trực quan phù hợp.
Giữ nhật ký quy trình/gói rà soát ở nơi riêng tư, không đặt trên canvas bàn giao; bộ nhớ runtime được quản lý theo quy chế riêng.
