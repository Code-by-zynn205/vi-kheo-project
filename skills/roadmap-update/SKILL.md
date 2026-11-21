---
name: roadmap-update
description: Cập nhật, tạo mới hoặc sắp xếp lại thứ tự ưu tiên cho lộ trình sản phẩm (roadmap). Sử dụng khi thêm một sáng kiến mới và cần quyết định dời mục nào để nhường chỗ, thay đổi ưu tiên khi có thông tin mới, dời mốc thời gian do một phụ thuộc bị trễ, hoặc xây dựng bảng Now/Next/Later từ đầu.
argument-hint: "<mô tả cập nhật>"
---

# Cập nhật lộ trình sản phẩm (Roadmap Update)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/product-management/skills/roadmap-update/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra các công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Cập nhật, tạo mới hoặc sắp xếp lại thứ tự ưu tiên cho lộ trình sản phẩm.

## Cách sử dụng

```
/roadmap-update $ARGUMENTS
```

## Quy trình làm việc

### 1. Nắm bắt trạng thái hiện tại

Nếu **~~project tracker** đã được kết nối:
- Kéo danh sách các hạng mục lộ trình hiện tại kèm trạng thái, người phụ trách và mốc thời gian
- Xác định các hạng mục đang quá hạn, có rủi ro (at risk) hoặc vừa hoàn thành
- Làm nổi bật bất kỳ hạng mục nào chưa rõ người chịu trách nhiệm hoặc thiếu ngày dự kiến

Nếu chưa kết nối công cụ quản lý dự án:
- Đề nghị người dùng mô tả lộ trình hiện tại hoặc dán/tải lên
- Chấp nhận mọi định dạng: danh sách, bảng, bảng tính, ảnh chụp màn hình hoặc mô tả bằng văn bản

### 2. Xác định thao tác cần làm

Hỏi xem người dùng muốn thực hiện việc gì:

**Thêm hạng mục (Add item)**: Tính năng, sáng kiến hoặc đầu việc mới vào lộ trình
- Thu thập: tên, mô tả, độ ưu tiên, công sức ước tính, khung thời gian mục tiêu, người phụ trách, các phụ thuộc
- Đề xuất vị trí phù hợp dựa trên mức độ ưu tiên và năng lực đội ngũ hiện tại

**Cập nhật trạng thái (Update status)**: Thay đổi trạng thái các hạng mục hiện có
- Các lựa chọn: not started (chưa bắt đầu), in progress (đang làm), at risk (có rủi ro), blocked (bị chặn), completed (hoàn thành), cut (cắt bỏ)
- Với "at risk" hoặc "blocked": hỏi rõ yếu tố gây chặn và kế hoạch giảm thiểu rủi ro

**Sắp xếp lại ưu tiên (Reprioritize)**: Thay đổi thứ tự hoặc độ ưu tiên các hạng mục
- Hỏi điều gì đã thay đổi (thông tin mới, đổi chiến lược, thay đổi nhân lực, phản hồi khách hàng)
- Áp dụng khung ưu tiên nếu hữu ích — xem **Các khung sắp xếp ưu tiên** bên dưới (RICE, MoSCoW, ICE và ma trận Value-vs-Effort)
- Trình bày so sánh trước/sau (before/after)

**Dời mốc thời gian (Move timeline)**: Dịch chuyển ngày thực hiện của các hạng mục
- Hỏi lý do (thay đổi phạm vi, trễ từ phía phụ thuộc, giới hạn nguồn lực)
- Xác định các tác động dây chuyền lên những hạng mục phụ thuộc phía sau
- Gắn cờ các hạng mục bị trượt qua hạn chót cứng

**Tạo lộ trình mới (Create new roadmap)**: Xây dựng lộ trình từ đầu
- Hỏi về khung thời gian (quý, nửa năm, cả năm)
- Hỏi về định dạng mong muốn (Now/Next/Later, cột theo quý, gắn với OKR) — xem **Các khung lộ trình** bên dưới
- Thu thập danh sách các sáng kiến cần đưa vào

### 3. Tạo bản tóm tắt lộ trình

Xuất ra góc nhìn lộ trình gồm các phần:

#### Tổng quan trạng thái (Status Overview)
Tóm tắt nhanh: X hạng mục đang thực hiện, Y hoàn thành trong kỳ này, Z đang có rủi ro.

#### Các hạng mục lộ trình (Roadmap Items)
Với mỗi hạng mục, hiển thị:
- Tên và mô tả một dòng
- Nhãn trạng thái (on track / at risk / blocked / completed / not started)
- Khung thời gian hoặc ngày mục tiêu
- Người phụ trách (Owner)
- Các phụ thuộc chính

Nhóm các hạng mục theo:
- Khung thời gian (Now / Next / Later) hoặc theo quý, tùy định dạng đã chọn
- Hoặc theo chủ đề/mục tiêu (theme/goal) nếu người dùng thích

#### Rủi ro và Phụ thuộc (Risks and Dependencies)
- Các hạng mục đang bị chặn hoặc có rủi ro, kèm chi tiết
- Phụ thuộc liên phòng ban và trạng thái của chúng
- Các hạng mục đang tiến sát hạn chót cứng

#### Thay đổi trong lần cập nhật này (Changes This Update)
Nếu đây là bản cập nhật cho lộ trình sẵn có, tóm tắt những gì đã thay đổi:
- Các hạng mục được thêm, bỏ hoặc đổi ưu tiên
- Các điều chỉnh mốc thời gian
- Các thay đổi trạng thái

### 4. Bước tiếp theo

Sau khi tạo xong lộ trình:
- Đề nghị định dạng lại cho đối tượng cụ thể (tóm tắt cho ban điều hành, chi tiết cho kỹ thuật, phiên bản hướng ra khách hàng)
- Đề nghị soạn thảo thông báo truyền đạt về các thay đổi lộ trình
- Nếu đã kết nối công cụ quản lý dự án, đề nghị cập nhật trạng thái các ticket tương ứng

## Các khung lộ trình (Roadmap Frameworks)

### Now / Next / Later
Định dạng lộ trình đơn giản nhất và thường hiệu quả nhất:

- **Now** (sprint/tháng hiện tại): Công việc đã cam kết. Độ chắc chắn cao về phạm vi và mốc thời gian. Đây là những thứ đội ngũ đang trực tiếp xây dựng.
- **Next** (1-3 tháng tới): Công việc đã lên kế hoạch. Khá chắc chắn về việc làm gì, ít chắc chắn hơn về thời điểm chính xác. Đã chốt phạm vi và ưu tiên nhưng chưa bắt đầu.
- **Later** (3-6+ tháng): Định hướng. Đây là các ván cược chiến lược và cơ hội ta dự định theo đuổi, nhưng phạm vi và thời gian còn linh hoạt.

Khi nào dùng: Hầu hết các đội ngũ, trong hầu hết thời gian. Đặc biệt tốt khi truyền thông ra bên ngoài hoặc lên lãnh đạo vì tránh tạo ảo giác chính xác giả tạo về ngày tháng.

### Chủ đề theo Quý (Quarterly Themes)
Tổ chức lộ trình xoay quanh 2-3 chủ đề mỗi quý:

- Mỗi chủ đề đại diện cho một mảng đầu tư chiến lược (ví dụ: "Sẵn sàng cho Enterprise", "Cải thiện kích hoạt người dùng", "Khả năng mở rộng nền tảng")
- Dưới mỗi chủ đề, liệt kê các sáng kiến cụ thể dự kiến thực hiện
- Các chủ đề phải ánh xạ tới OKR của công ty hoặc đội ngũ
- Định dạng này giúp giải thích dễ dàng TẠI SAO bạn đang xây dựng những gì bạn đang xây dựng

Khi nào dùng: Khi cần thể hiện sự gắn kết chiến lược. Rất tốt cho các buổi họp lập kế hoạch và báo cáo ban điều hành.

### Lộ trình gắn OKR (OKR-Aligned Roadmap)
Ánh xạ trực tiếp các hạng mục lộ trình vào Mục tiêu (Objectives) và Kết quả then chốt (Key Results):

- Bắt đầu từ bộ OKR của đội ngũ trong kỳ
- Dưới mỗi Key Result, liệt kê các sáng kiến sẽ tác động lên chỉ số đó
- Ghi rõ mức tác động kỳ vọng của từng sáng kiến lên Key Result
- Cách này tạo ra trách nhiệm giải trình rõ ràng giữa thứ bạn xây dựng và thứ bạn đo lường

Khi nào dùng: Các tổ chức vận hành theo OKR. Hiệu quả để đảm bảo mọi sáng kiến đều có lý do "tại sao" gắn với kết quả đo lường được.

### Chế độ xem Dòng thời gian / Gantt (Timeline / Gantt View)
Góc nhìn theo lịch với các hạng mục đặt trên trục thời gian:

- Hiển thị ngày bắt đầu, ngày kết thúc và thời lượng
- Trực quan hóa các luồng chạy song song và trình tự nối tiếp
- Tốt để phát hiện xung đột nguồn lực
- Thể hiện sự phụ thuộc giữa các hạng mục

Khi nào dùng: Lập kế hoạch thực thi cùng đội kỹ thuật. Phát hiện xung đột lịch trình. KHÔNG tốt để truyền thông ra bên ngoài (tạo kỳ vọng sai lầm về độ chính xác ngày phát hành).

## Các khung sắp xếp ưu tiên (Prioritization Frameworks)

### Điểm RICE (RICE Score)
Chấm điểm từng sáng kiến theo bốn tiêu chí, sau đó tính RICE = (Reach x Impact x Confidence) / Effort

- **Reach (Độ phủ)**: Bao nhiêu người dùng/khách hàng sẽ bị ảnh hưởng trong một khoảng thời gian nhất định? Dùng con số cụ thể (ví dụ: "500 người dùng mỗi quý").
- **Impact (Tác động)**: Mức độ cải thiện cho mỗi người tiếp cận được? Chấm theo thang: 3 = rất lớn (massive), 2 = cao (high), 1 = trung bình (medium), 0.5 = thấp (low), 0.25 = tối thiểu (minimal).
- **Confidence (Độ tự tin)**: Mức độ chắc chắn về ước lượng Reach và Impact? 100% = tự tin cao (có dữ liệu chống lưng), 80% = trung bình (có một số bằng chứng), 50% = thấp (cảm tính).
- **Effort (Công sức)**: Bao nhiêu người-tháng (person-months)? Tính cả kỹ thuật, thiết kế và các bộ phận liên quan khác.

Khi nào dùng: Khi bạn cần một bảng xếp hạng định lượng, bảo vệ được bằng số liệu. Tốt để so sánh một backlog lớn. Kém hiệu quả hơn với các ván cược chiến lược khó ước lượng tác động.

### MoSCoW
Phân loại hạng mục thành Must have, Should have, Could have, Won't have:

- **Must have**: Lộ trình coi như thất bại nếu thiếu nhóm này. Cam kết không thể thương lượng.
- **Should have**: Quan trọng và được kỳ vọng, nhưng việc bàn giao vẫn khả thi nếu thiếu chúng.
- **Could have**: Đáng có nhưng rõ ràng ở mức ưu tiên thấp hơn. Chỉ đưa vào nếu còn dư năng lực.
- **Won't have**: Tường minh nằm ngoài phạm vi trong kỳ này. Quan trọng là phải liệt kê ra để minh bạch.

Khi nào dùng: Khoanh phạm vi một bản phát hành hoặc một quý. Đàm phán với các bên liên quan về những gì vừa vặn trong kỳ. Tốt để thúc đẩy các cuộc đối thoại đánh đổi ưu tiên.

### Điểm ICE (ICE Score)
Đơn giản hơn RICE. Chấm mỗi hạng mục từ 1-10 trên ba chiều:

- **Impact (Tác động)**: Thứ này sẽ kéo chỉ số mục tiêu lên bao nhiêu?
- **Confidence (Độ tự tin)**: Ta tự tin đến đâu vào ước lượng tác động đó?
- **Ease (Độ dễ)**: Triển khai dễ đến mức nào? (Nghịch đảo của công sức — điểm càng cao càng dễ làm)

ICE Score = Impact x Confidence x Ease

Khi nào dùng: Sắp xếp ưu tiên nhanh cho backlog tính năng. Phù hợp với sản phẩm giai đoạn đầu hoặc khi bạn chưa đủ dữ liệu cho RICE.

### Ma trận Giá trị vs Công sức (Value vs Effort Matrix)
Đặt các sáng kiến lên ma trận 2x2:

- **Giá trị cao, Công sức thấp** (Quick wins - Thắng nhanh): Làm nhóm này trước tiên.
- **Giá trị cao, Công sức cao** (Big bets - Cược lớn): Lên kế hoạch cẩn thận. Xứng đáng đầu tư nhưng cần khoanh phạm vi kỹ.
- **Giá trị thấp, Công sức thấp** (Fill-ins - Lấp chỗ trống): Làm khi còn dư công suất.
- **Giá trị thấp, Công sức cao** (Money pits - Hố đốt tiền): Không làm. Xóa khỏi backlog.

Khi nào dùng: Sắp xếp ưu tiên trực quan trong các buổi lập kế hoạch nhóm. Rất tốt để xây dựng nhận thức chung về các sự đánh đổi.

## Lập bản đồ phụ thuộc (Dependency Mapping)

### Xác định các loại phụ thuộc
Tìm kiếm phụ thuộc ở các nhóm sau:

- **Phụ thuộc kỹ thuật**: Tính năng B đòi hỏi hạ tầng từ Tính năng A
- **Phụ thuộc đội ngũ**: Tính năng cần phần việc từ đội khác (thiết kế, nền tảng, dữ liệu)
- **Phụ thuộc bên ngoài**: Đang chờ nhà cung cấp, đối tác hoặc tích hợp bên thứ ba
- **Phụ thuộc tri thức**: Cần kết quả nghiên cứu hoặc điều tra kỹ thuật trước khi bắt đầu
- **Phụ thuộc tuần tự**: Phải phát hành Tính năng A trước khi bắt đầu Tính năng B (dùng chung code, luồng người dùng)

### Quản lý phụ thuộc
- Liệt kê tường minh mọi phụ thuộc trên lộ trình
- Gán người chịu trách nhiệm cho từng phụ thuộc (ai có trách nhiệm tháo gỡ nó)
- Đặt mốc "cần trước ngày" (need by): hạng mục phụ thuộc cần việc này xong chậm nhất khi nào
- Dự trù vùng đệm (buffer) quanh các phụ thuộc — đây là những điểm rủi ro cao nhất trên mọi lộ trình
- Gắn cờ sớm các phụ thuộc vượt qua ranh giới đội ngũ — những mục này đòi hỏi sự điều phối
- Có kế hoạch dự phòng (contingency plan): sẽ làm gì nếu phụ thuộc bị trễ?

### Giảm thiểu phụ thuộc
- Có thể xây dựng một phiên bản đơn giản hơn để né phụ thuộc không?
- Có thể chạy song song bằng cách dùng interface contract hoặc dữ liệu giả lập (mock) không?
- Có thể sắp xếp lại trình tự để đẩy phần phụ thuộc lên làm sớm hơn không?
- Có thể tự nhận phần việc đó vào trong đội để bỏ khâu phối hợp chéo không?

## Lập kế hoạch năng lực (Capacity Planning)

### Ước lượng năng lực
- Bắt đầu từ số lượng kỹ sư và khoảng thời gian
- Trừ đi các khoản chi phí vận hành đã biết: họp hành, lịch trực (on-call), phỏng vấn tuyển dụng, ngày lễ, nghỉ phép (PTO)
- Quy tắc kinh nghiệm phổ biến: kỹ sư dành 60-70% thời gian cho công việc tính năng theo kế hoạch
- Tính thêm thời gian làm quen (ramp time) cho thành viên mới

### Phân bổ năng lực
Tỷ lệ phân bổ lành mạnh cho đa số đội ngũ sản phẩm:

- **70% tính năng theo kế hoạch**: Các hạng mục lộ trình thúc đẩy mục tiêu chiến lược
- **20% sức khỏe kỹ thuật**: Nợ kỹ thuật (tech debt), độ tin cậy, hiệu năng, trải nghiệm lập trình viên
- **10% phát sinh ngoài kế hoạch**: Vùng đệm cho sự cố khẩn cấp, quick wins và yêu cầu từ các đội khác

Điều chỉnh tỷ lệ theo bối cảnh đội ngũ:
- Sản phẩm mới: nhiều tính năng hơn, ít nợ kỹ thuật hơn
- Sản phẩm trưởng thành: đầu tư nhiều hơn cho nợ kỹ thuật và độ tin cậy
- Sau sự cố nghiêm trọng: ưu tiên độ tin cậy, giảm tính năng mới
- Tăng trưởng nóng: ưu tiên khả năng mở rộng (scalability) và hiệu năng

### Năng lực vs Tham vọng
- Nếu cam kết lộ trình vượt quá năng lực, bắt buộc phải có thứ nhường chỗ
- Đừng giải quyết bài toán thiếu năng lực bằng cách giả vờ mọi người có thể làm nhiều hơn — hãy giải quyết bằng cách cắt giảm phạm vi
- Khi thêm bất cứ thứ gì vào lộ trình, luôn hỏi: "Thứ gì sẽ đi ra?"
- Thà cam kết ít việc hơn và bàn giao chắc chắn còn hơn ôm đồm quá sức rồi gây thất vọng

## Truyền thông về các thay đổi lộ trình

### Khi lộ trình thay đổi
Các tác nhân phổ biến làm đổi lộ trình:
- Ưu tiên chiến lược mới từ ban lãnh đạo
- Phản hồi khách hàng hoặc nghiên cứu làm thay đổi thứ tự ưu tiên
- Khám phá kỹ thuật mới làm thay đổi ước lượng công sức
- Trễ phụ thuộc từ một đội ngũ khác
- Biến động nhân sự (đội ngũ phình to hoặc thu hẹp, nhân sự chủ chốt nghỉ việc)
- Động thái từ đối thủ đòi hỏi phải phản ứng

### Cách truyền đạt sự thay đổi
1. **Thừa nhận sự thay đổi**: Thẳng thắn về việc cái gì thay đổi và tại sao
2. **Giải thích lý do**: Thông tin mới nào đã dẫn tới quyết định này?
3. **Chỉ rõ sự đánh đổi**: Thứ gì đã bị hạ ưu tiên để nhường chỗ? Hoặc thứ gì bị dời lịch?
4. **Trình bày kế hoạch mới**: Bản lộ trình cập nhật đã phản ánh các thay đổi
5. **Ghi nhận tác động**: Ai bị ảnh hưởng và ảnh hưởng ra sao? Các bên liên quan đang kỳ vọng vào những mục bị hạ ưu tiên cần được nghe thông báo trực tiếp.

### Tránh hiệu ứng "giật cục lộ trình" (Roadmap Whiplash)
- Đừng sửa lộ trình chỉ vì một mẩu thông tin mới. Hãy đặt ngưỡng đủ lớn cho việc thay đổi.
- Gom các đợt cập nhật lộ trình theo nhịp tự nhiên (hàng tháng, hàng quý) trừ khi có việc thực sự khẩn cấp.
- Phân biệt giữa "thay đổi lộ trình" (tái ưu tiên chiến lược) và "điều chỉnh phạm vi" (tinh chỉnh bình thường khi thực thi).
- Theo dõi tần suất thay đổi lộ trình. Thay đổi quá thường xuyên có thể là dấu hiệu của chiến lược thiếu rõ ràng, chứ không phải sự linh hoạt nhạy bén.

## Định dạng đầu ra

Sử dụng định dạng rõ ràng, dễ đọc lướt. Bảng biểu hoạt động rất tốt cho danh sách hạng mục lộ trình. Sử dụng nhãn trạng thái bằng văn bản: **Done**, **On Track**, **At Risk**, **Blocked**, **Not Started**.

## Mẹo thực hành

- Lộ trình là công cụ truyền thông, không phải kế hoạch dự án chi tiết. Giữ ở đúng độ cao — các chủ đề và kết quả, không phải danh sách task nhỏ lẻ.
- Khi sắp xếp lại ưu tiên, luôn hỏi điều gì đã thay đổi. Đổi ưu tiên phải xuất phát từ thông tin mới, không phải cảm hứng nhất thời.
- Gắn cờ sớm các vấn đề về năng lực. Nếu lộ trình chứa nhiều việc hơn khả năng xử lý của đội ngũ, hãy nói thẳng.
- Phụ thuộc là rủi ro lớn nhất đối với lộ trình. Hãy làm lộ chúng một cách tường minh.
- Nếu người dùng yêu cầu thêm một hạng mục, luôn hỏi xem thứ gì sẽ bị gỡ xuống hoặc dời đi. Lộ trình là bài toán tổng bằng không đối với năng lực đội ngũ.
