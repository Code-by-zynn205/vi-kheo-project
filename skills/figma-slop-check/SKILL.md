---
name: figma-slop-check
description: "Rà soát độ chỉn chu và chính xác kỹ thuật của một phạm vi Figma được yêu cầu dựa trên chuẩn dự án, số đo và bằng chứng trực quan; phân loại swap/snap/ask trong khi tôn trọng quyền chỉnh sửa hiện có."
license: MIT
compatibility: >-
  Chỉ đọc. Các bước kiểm tra được viết cho các công cụ của figma-console-mcp (figma_execute,
  figma_get_variables, figma_capture_screenshot) với plugin Desktop Bridge đang chạy trong Figma
  Desktop. use_figma của official Figma MCP server cũng chạy Plugin API JavaScript, nhưng skill này
  chưa được kiểm chứng trên đó. Đọc skill figma-canon.
metadata:
  author: Thiago Xikota
  version: "1.2.0"
---

# Độ chỉn chu và chính xác Figma (Figma craft and precision)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [thiagoxikota/figma-maxxing](https://github.com/thiagoxikota/figma-maxxing/blob/main/skills/figma-slop-check/SKILL.md) (Thiago Xikota).

Kiểm toán màn hình/phạm vi được yêu cầu kèm theo bằng chứng. Chỉ sử dụng các tiêu chí thiết kế,
nội dung chữ (copy) và bàn giao phù hợp; một câu trả lời cập nhật trạng thái hay lỗi chính tả tài liệu
không kích hoạt một cuộc kiểm toán toàn bộ canvas. Quá trình rà soát ở chế độ chỉ đọc; việc sửa lại
sản phẩm của chính bạn hoặc một yêu cầu sửa đã được phê duyệt sẽ dùng quyền hạn hiện tại, không cần
xin phép lại cho từng mục.

## Nguồn áp dụng

- Bản đồ dự án/bảng thuật ngữ/DS và trạng thái hiện tại quyết định các giá trị kỳ vọng; quy tắc dữ liệu mẫu và ngôn ngữ địa phương của dự án ghi đè mọi ví dụ chung chung.
- [slop-lens.md](references/slop-lens.md): chồng lấn/mật độ, dư thừa dấu vết quy trình, phô trương thị giác quá mức, lặp lại, nội dung chữ và tiêu chí giao tiếp.
- `references/checks.md`: 11 bước kiểm tra độ chính xác và trích xuất chỉ đọc có giới hạn.
- `references/punch-list.md`: mức độ nghiêm trọng, phân loại `swap`/`snap`/`ask` và các quyết định theo phạm vi.
- `figma-canon` điều hướng chi tiết về API, trạng thái, đặt tên, bàn giao hoặc trường hợp bất thường khi thao tác này cần. Thang điểm số có thể phục vụ một đợt kiểm toán chấm điểm khi được yêu cầu; các điểm chặn cụ thể và bằng chứng quyết định mức độ sẵn sàng, không phải một con dấu 8/10 tự động.

Kiểm tra đúng thuộc tính/mối quan hệ đang xét: liên kết (bindings), style/thang đo, tính toàn vẹn component,
kích thước, bảng thuật ngữ và điểm ảnh thực tế. Tái sử dụng dữ liệu thu thập hợp lệ, làm mới lại khi các thay đổi
trực tiếp hoặc lỗi một phần khiến dữ liệu không chắc chắn. ID node có thể tồn tại bền vững; hãy xác thực tệp/mục tiêu
thay vì khẳng định mọi ID đều chỉ gắn với một phiên.

Với các kết luận trực quan, hãy kiểm tra frame/trạng thái bị ảnh hưởng và các phần tử trọng yếu ở tỷ lệ đủ rõ.
Một ảnh toàn cảnh cả section chứng minh những thứ khác với một ảnh cắt cận cảnh (crop); không có một số lượng
ảnh chụp cố định nào tự chứng minh được tính đầy đủ. Ghi nhận tình trạng cắt bớt dữ liệu, giới hạn variable mode,
nguy cơ ảnh xuất bị cũ và chính xác những gì đã được kiểm tra.

## Phát hiện và hành động

Mỗi phát hiện mang theo nguồn, node/đường dẫn, giá trị tìm thấy/kỳ vọng, mức độ nghiêm trọng và hành động:
**swap** (thay thế tương đương giống hệt), **snap** (khoảng cách có dấu đo được) hoặc
**ask** (một quyết định thiết kế mới). Các thao tác snap đã phê duyệt giữ nguyên khoảng cách của chúng trong
`fixes` của lượt chạy; các quyết định có chủ đích/chấp nhận nợ thiết kế dùng `.figma-slop-check/decisions.json`
kèm phạm vi và lý do. Không âm thầm xóa nợ hay tự bịa ra chuẩn mực.

Một yêu cầu kiểm toán đơn thuần chỉ báo cáo phát hiện mà không tự áp dụng chỉnh sửa. Một bản sửa được cấp quyền
có thể chạy theo lô trong phạm vi đã phê duyệt, vẫn giữ nguyên khóa tệp/preflight và bước đọc lại xác minh.
Lệnh "sửa hết" ("Fix all") không tự quyết định một câu hỏi sản phẩm chưa được chốt. Bằng chứng mới hoặc lỗi hồi quy
là lý do chính đáng để kiểm tra lại; không áp đặt nghi thức chạy hai lượt bắt buộc, nhật ký kiểm tra ẩn hay
nghi thức chia một agent với quạt đa agent (single-agent-versus-fanout). Dừng ngay các lỗi lặp lại để chẩn đoán.

Bước bàn giao bổ sung các tiêu chí đầy đủ tương ứng và có thể tái sử dụng bằng chứng này.
Báo cáo trung thực các điểm chặn, cảnh báo và phạm vi bao phủ; không gửi PR/phản hồi trên Figma
hay xuất bản tạo tác bàn giao chỉ vì một người rà soát đánh dấu là sẵn sàng. Việc ghi bộ nhớ runtime
tuân theo hợp đồng của runtime đó, không thuộc phạm vi skill rà soát này.
