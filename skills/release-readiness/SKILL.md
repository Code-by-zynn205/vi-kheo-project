---
name: release-readiness
argument-hint: "[những gì sắp phát hành, tới ai và mức độ có thể hoàn tác]"
description: "Kiểm tra bản phát hành có an toàn để triển khai không: kiểm thử, rollout, giám sát, rollback, hỗ trợ. Sử dụng khi bản build sắp ra mắt và bạn cần biết điều gì có thể gây sự cố, cũng như cách hoàn tác."
intent: >-
  Một quy trình kiểm tra mức độ sẵn sàng vừa vặn (right-sized) cho việc phát hành kỹ thuật (triển khai code, cập nhật firmware, thay đổi cấu hình), tách biệt với buổi ra mắt kinh doanh (business launch). Xác nhận những gì thay đổi, cách kiểm thử, cách rollout, cách theo dõi, cách hoàn tác (rollback) và ai sẵn sàng hỗ trợ, cùng quyết định go / hold dựa trên các tiêu chí đã thống nhất trước khi nhìn vào trạng thái thực tế. Quy mô kiểm tra tỷ lệ thuận với phạm vi ảnh hưởng (blast radius) và khả năng hoàn tác.
type: component
theme: pm-artifacts
best_for:
  - "Quyết định go hoặc hold cho một bản phát hành dựa trên tiêu chí thống nhất từ trước"
  - "Chuẩn bị sẵn rollback, giám sát và hỗ trợ trước khi phát hành, không phải sau khi xảy ra sự cố"
  - "Điều chỉnh mức độ kiểm tra tương xứng với chi phí rủi ro và khả năng hoàn tác"
  - "Tách biệt phát hành kỹ thuật (technical release) khỏi ra mắt kinh doanh (business launch)"
scenarios:
  - "Thứ Năm này chúng ta phát hành. Cần xác nhận những gì trước khi bấm nút go?"
  - "Bản phát hành là thay đổi công cụ tính giá có chạm vào thanh toán (billing). Cần cẩn trọng đến mức nào?"
  - "Cập nhật firmware cho 2.000 thiết bị ngoài thực địa. 'Sẵn sàng' nghĩa là gì?"
  - "Viết tiêu chí go/hold cho một thay đổi UI ít rủi ro"
estimated_time: "20-30 phút"
---

# Sẵn sàng phát hành (Release Readiness)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/release-readiness/SKILL.md) (deanpeters/Product-Manager-Skills).

## Mục đích

Quyết định xem một bản phát hành có **an toàn để triển khai** hay không, với mức độ kiểm tra tương xứng với cái giá phải trả nếu xảy ra lỗi. Đầu ra là một bản ghi sẵn sàng ngắn gọn: những gì thay đổi, đã kiểm thử thế nào, rollout ra sao, theo dõi thế nào, hoàn tác bằng cách nào, ai sẽ hỗ trợ, và quyết định **go / hold** dựa trên các tiêu chí mà đội ngũ đã thống nhất *trước khi* xem trạng thái.

Câu cần ghi nhớ trong đầu: **trước khi phát hành, hãy biết cách hoàn tác nó.** Một bản phát hành không thể đảo ngược đòi hỏi tiêu chuẩn khắt khe hơn nhiều so với một bản phát hành có thể hoàn tác trong một phút.

Đây là bước kiểm tra phát hành **kỹ thuật**. Việc ra mắt **kinh doanh** (sales, support, marketing, đối tác) nằm ở [`launch-plan`](../launch-plan/SKILL.md). Một tính năng có thể được phát hành âm thầm nhiều lần trước khi ra mắt chính thức, và một đợt ra mắt kinh doanh có thể dựa trên một bản phát hành.

## Đầu vào

**Hiệu quả nhất với:** Những gì sắp phát hành, chạm tới đối tượng nào và mức độ có thể hoàn tác (reversibility).

**Cũng hữu ích:** Kết quả kiểm thử, kế hoạch rollout, hệ thống giám sát đang có, phương thức rollback và ai đang trực (on-call) hoặc phụ trách hỗ trợ.

Mọi thứ được cung cấp kèm khi gọi skill (văn bản sau tên skill, phần dán bối cảnh, hoặc dòng `ARGUMENTS:` đính kèm) đều được tính là câu trả lời đã cung cấp. Hãy sử dụng chúng và bỏ qua những phần đã được đề cập; đừng hỏi lại.

**Đến tay trắng? Cũng hoàn toàn ổn.** Skill sẽ hỏi thứ gì sắp phát hành và mức độ nghiêm trọng nếu lỗi xảy ra, chọn một cấp độ kiểm tra và xây dựng bản kiểm tra từ câu trả lời của bạn. Bất kỳ thông tin nào chưa rõ đều trở thành ô trống có nhãn (`[NEEDS SOURCE]`), tuyệt đối không mặc định là đã xong.

**Ví dụ gọi skill:**
- `Release: a change to how overage is billed. Reaches all paying accounts. Rollback is a flag.`
- `Firmware 2.1 to 2,000 field units over the air. No physical rollback once flashed.`

---

## Khái niệm cốt lõi

### Điều chỉnh quy mô kiểm tra cho vừa vặn (Thang cấp độ)

**Không phải bản phát hành nào cũng cần mức độ cẩn trọng giống nhau.** Hãy chọn một cấp độ, giải thích lý do trong một dòng và để đội ngũ điều chỉnh nếu cần:

| | **Cấp độ 1: Nhẹ (Light)** | **Cấp độ 2: Tiêu chuẩn (Standard)** | **Cấp độ 3: Chặt chẽ (Heavy)** |
|---|---|---|---|
| Bản phát hành điển hình | Nhỏ, hoàn tác dễ, phạm vi hẹp (chỉnh câu chữ, UI nhỏ, công cụ nội bộ) | Tính năng thông thường hoặc bản sửa lỗi cho khách hàng thực | Thanh toán (billing), bảo mật, di chuyển dữ liệu (data migration), firmware hoặc phần cứng ngoài thực địa, lĩnh vực chịu quản lý chặt |
| Mức độ kiểm tra | Đã kiểm thử, rõ cách rollback, có một người chịu trách nhiệm | + rollout theo giai đoạn, có giám sát, đã phổ biến cho đội hỗ trợ | + quyết định go/hold chính thức, đã diễn tập rollback, có người điều phối sự cố, sẵn sàng truyền thông |
| Cảm nhận đầu ra | Vài dòng ngắn gọn | Bản ghi một trang | Hồ sơ đầy đủ có ký xác nhận |

**Cấp độ 2 là mặc định. Không bao giờ mặc định là Cấp độ 3.** Nghi thức nặng nề cho một thay đổi câu chữ sẽ dạy đội ngũ rằng kiểm tra sẵn sàng chỉ là thủ tục hình thức, và họ sẽ bỏ qua nó vào đúng ngày thực sự quan trọng. Nếu đội ngũ chọn mức nhẹ hơn, hãy nêu rõ những gì đang được chấp nhận bỏ qua.

### Phạm vi ảnh hưởng (Blast Radius) và Khả năng hoàn tác quyết định Cấp độ

Hai câu hỏi quyết định: **nó chạm tới bao nhiêu người (hoặc thiết bị)**, và **có thể hoàn tác nhanh và sạch đến mức nào**? Một feature flag trên 1% tài khoản rất rẻ để hoàn tác. Một đợt migration cơ sở dữ liệu hay nạp firmware qua mạng (OTA) không thể quay lại bản cũ về mặt vật lý thì không. Phạm vi ảnh hưởng rộng cộng với việc khó hoàn tác chính là Cấp độ 3.

### Bảy hạng mục kiểm tra (The Seven Checks)

1. **Những gì thay đổi.** Mô tả rõ ràng bằng ngôn ngữ đơn giản, và những gì *không* thay đổi (để không ai tự suy diễn).
2. **Cách thức kiểm thử.** Đã kiểm thử những gì, trên môi trường nào, và những gì *chưa* được kiểm thử.
3. **Rollout.** Triển khai theo từng giai đoạn (một tỷ lệ nhỏ trước, rồi mới mở rộng) thay vì bung toàn bộ cùng lúc, kèm tiêu chí để chuyển sang giai đoạn tiếp theo.
4. **Giám sát (Monitoring).** Các tín hiệu cho biết bản phát hành đang chạy tốt hay lỗi (lỗi hệ thống, độ trễ, lượng ticket hỗ trợ, tỷ lệ thất bại), ai là người theo dõi và theo dõi trong bao lâu.
5. **Hoàn tác (Rollback).** Cách thức chính xác để hoàn tác, mất bao lâu và đã thử nghiệm thực tế chưa. "Chúng tôi sẽ revert lại" không phải là một kế hoạch rollback.
6. **Hỗ trợ và truyền thông.** Ai đã sẵn sàng tiếp nhận cuộc gọi/yêu cầu, họ đã biết những gì và khách hàng sẽ được thông báo gì nếu có sự cố.
7. **Phụ thuộc và thời điểm.** Các hệ thống hoặc đội ngũ khác bị ảnh hưởng, và lý do phát hành vào lúc này (tránh chiều thứ Sáu hoặc tuần cao điểm của khách hàng).

### Tiêu chí Go / Hold phải được thống nhất trước

Hãy quyết định trước khi biết trạng thái thực tế xem điều gì là bắt buộc phải đạt (must-pass: test xanh, đã diễn tập rollback) và điều gì chỉ cần theo dõi (watch-only). Một quyết định go/hold đưa ra *sau khi* nhìn vào bức tranh nửa nạc nửa mỡ rất dễ bị thuyết phục thành "go". Hold (tạm hoãn) là một kết quả hoàn toàn hợp lệ và ít tốn kém hơn nhiều so với một bản phát hành lỗi.

### Không chỉ dành cho phần mềm

Đối với firmware, phần cứng hoặc thay đổi dịch vụ, bảy hạng mục kiểm tra vẫn giữ nguyên, bổ sung các chi tiết vật lý: lô thiết bị nào, phiên bản firmware nào, có cơ chế rollback tại thực địa hay không, chứng nhận (certification) có bị ảnh hưởng không và ai xử lý những thiết bị bị lỗi giữa chừng khi đang cập nhật.

### Nguồn chuẩn điều phối (Facilitation Source of Truth)

Sử dụng [`workshop-facilitation`](../workshop-facilitation/SKILL.md) làm giao thức tương tác khi chạy quy trình này dưới dạng hội thoại.

**Chế độ bắt đầu mặc định:** Guided · được cấu hình trong `pm-skills.config.yaml` (mặc định toàn thư viện hoặc ghi đè theo từng skill); lựa chọn của chính người dùng trong phiên luôn được ưu tiên. Ở lượt đầu tiên, hãy đưa ra cả ba chế độ, sau đó mở ngay theo chế độ mặc định mà không chờ chọn: Guided đặt câu hỏi đầu tiên, Context dump mời dán bối cảnh, Best guess yêu cầu tối thiểu một câu và phác thảo với mọi giả định được gắn nhãn.

### Các phản mẫu (Những gì khung này KHÔNG phải)
- **Không phải đợt ra mắt kinh doanh.** Xem [`launch-plan`](../launch-plan/SKILL.md).
- **Không phải buổi review code hay kế hoạch QA.** Nó kiểm tra xem việc kiểm thử và rollback có tồn tại hay không, không hướng dẫn cách viết test.
- **Không phải cổng kiểm soát do PM độc quyền.** Chủ sở hữu bản phát hành (release owner) là người quyết định; skill này giúp các tiêu chí trở nên minh bạch.
- **Không mặc định nặng nề.** Cấp độ Nhẹ (Light) là một lựa chọn hoàn toàn chính đáng.

---

## Áp dụng

Sử dụng [`template.md`](template.md) làm khung dàn ý.

**Quy ước đầu ra.** Thành phẩm (artifact) lên trước: cấp độ và lý do, bảy hạng mục kiểm tra, tiêu chí go/hold cùng kết quả, và các đầu mục còn mở. Nhận xét ngắn gọn đặt ở phía sau. Mọi hạng mục chưa xác nhận phải ghi `[NEEDS SOURCE]` hoặc "chưa xác nhận", tuyệt đối không tự cho là đã xong.

**Nếu PM mang sẵn một kế hoạch tới, hãy phản biện trước.** Cấp độ có hợp lý với phạm vi ảnh hưởng và khả năng hoàn tác không? Đã có phương án rollback được thử nghiệm chưa? Hệ thống giám sát đã gắn với các tín hiệu cụ thể và người theo dõi chưa? Rollout có chia giai đoạn kèm tiêu chí không? Tiêu chí go/hold có được viết trước khi xem trạng thái không? Chỉ ra các lỗ hổng trước; đề xuất viết lại sau cùng.

### Bước 1: Mô tả bản phát hành
Những gì thay đổi, những gì không thay đổi, chạm tới ai/cái gì và khả năng hoàn tác ra sao.

### Bước 2: Thiết lập cấp độ
Đề xuất Light, Standard hoặc Heavy dựa trên phạm vi ảnh hưởng và khả năng hoàn tác; nêu lý do; tôn trọng nếu người dùng muốn chọn mức khác và ghi rõ những gì một mức nhẹ hơn đang bỏ qua.

### Bước 3: Đi qua Bảy hạng mục kiểm tra
Với từng mục, ghi nhận trạng thái và đánh dấu bất kỳ điểm nào chưa được xác nhận. Hỏi kỹ về rollback: đã thử chạy thật lần nào chưa?

### Bước 4: Thiết lập Tiêu chí Go / Hold
Xác định các mục bắt buộc (must-pass) và theo dõi (watch) kèm ngưỡng cụ thể, thống nhất trước khi đọc trạng thái.

### Bước 5: Ra quyết định và Bàn giao lại
Nêu rõ go, hold, hoặc go có điều kiện, cùng các đầu mục còn mở và người phụ trách. Tóm tắt ngắn (đã cung cấp, suy luận, chưa rõ), sau đó là danh sách các phương án đánh số, phương án có nhiều bằng chứng ủng hộ nhất đứng đầu và gắn nhãn `(Recommended)`: hoãn (hold) cho đến khi diễn tập xong rollback; phát hành trước cho một tỷ lệ nhỏ; phát hành theo kế hoạch với người theo dõi cụ thể trong 48 giờ; hoặc dời lịch khỏi khung giờ cao điểm.

---

## Ví dụ

Xem [`examples/sample.md`](examples/sample.md) (thay đổi thanh toán Fieldlight, SaaS, Cấp độ 3) và [`examples/sample-industrial.md`](examples/sample-industrial.md) (cập nhật firmware Northfield, công nghiệp, Cấp độ 3, kết thúc bằng quyết định hold).

---

## Các cạm bẫy thường gặp

### Cạm bẫy 1: "Chúng tôi chỉ cần Revert lại thôi"
**Triệu chứng:** Rollback chỉ là một ý định chung chung.
**Hệ quả:** Lần đầu tiên thử thực hiện rollback lại rơi đúng vào lúc đang xảy ra sự cố.
**Cách khắc phục:** Nêu rõ phương thức, thời gian thực hiện và xác nhận xem đã từng diễn tập chưa.

### Cạm bẫy 2: Bung toàn bộ cùng lúc
**Triệu chứng:** Rollout 100% ngay trong ngày đầu tiên.
**Hệ quả:** Bất kỳ lỗi nào cũng ảnh hưởng tới toàn bộ khách hàng.
**Cách khắc phục:** Chia giai đoạn kèm tiêu chí rõ ràng để mở rộng tiếp.

### Cạm bẫy 3: Không có ai theo dõi
**Triệu chứng:** Có hệ thống giám sát; nhưng không phân công ai nhìn vào nó.
**Hệ quả:** Khách hàng là người phát hiện ra lỗi đầu tiên.
**Cách khắc phục:** Nêu rõ các tín hiệu cần xem, người theo dõi và thời lượng theo dõi.

### Cạm bẫy 4: Viết tiêu chí sau khi đã nhìn trạng thái
**Triệu chứng:** "Nhìn chung đều xanh rồi, triển khai thôi."
**Hệ quả:** Các rủi ro thực sự bị hợp lý hóa cho qua.
**Cách khắc phục:** Thống nhất tiêu chí must-pass và watch trước tiên.

### Cạm bẫy 5: Mặc định cấp độ nặng nề
**Triệu chứng:** Một thay đổi câu chữ cũng phải qua quy trình ký duyệt đầy đủ.
**Hệ quả:** Đội ngũ học cách né tránh quy trình.
**Cách khắc phục:** Điều chỉnh quy mô kiểm tra theo phạm vi ảnh hưởng và khả năng hoàn tác.

### Cạm bẫy 6: Phát hành vào thời điểm tệ nhất
**Triệu chứng:** Chiều thứ Sáu hoặc tuần cao điểm của khách hàng.
**Hệ quả:** Phản ứng chậm trễ đúng lúc cần xử lý nhanh nhất.
**Cách khắc phục:** Nêu rõ lý do phát hành vào lúc này và chọn khung thời gian đội ngũ có thể phản ứng kịp thời.

---

## Tài liệu tham khảo

### Các file của Skill
- [`template.md`](template.md): bảy hạng mục kiểm tra, tiêu chí go/hold và các đầu mục còn mở
- [`examples/sample.md`](examples/sample.md), [`examples/sample-industrial.md`](examples/sample-industrial.md)

### Các Skill liên quan
- [`launch-plan`](../launch-plan/SKILL.md): kế hoạch ra mắt kinh doanh xoay quanh bản phát hành
- [`sprint-planning`](../sprint-planning/SKILL.md): bước đầu vào phía trên; những gì đã cam kết trong sprint
- [`eol-readiness-advisor`](../eol-readiness-advisor/SKILL.md): cùng kỷ luật go/no-go khi ngừng hỗ trợ sản phẩm (end of life)
- [`launch-metrics`](../launch-metrics/SKILL.md): những chỉ số cần theo dõi sau khi ra mắt
- [`workshop-facilitation`](../workshop-facilitation/SKILL.md): giao thức tương tác

### Khung tham chiếu bên ngoài
- **Staged rollouts, feature flags và rollback:** thực hành chuẩn trong kỹ thuật phát hành phần mềm (release engineering).
- **Production readiness reviews:** thực hành phổ biến trong kỹ thuật độ tin cậy hệ thống (ví dụ *Site Reliability Engineering*, Google).

### Nguồn gốc
Chắt lọc từ kinh nghiệm thực chiến chuẩn bị các bản phát hành sản phẩm phần mềm và phần cứng kết nối.
