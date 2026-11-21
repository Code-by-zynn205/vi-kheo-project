---
name: write-spec
description: Viết đặc tả tính năng (feature spec) hoặc PRD từ một phát biểu vấn đề hoặc ý tưởng tính năng. Sử dụng khi chuyển đổi một ý tưởng mơ hồ hoặc yêu cầu người dùng thành tài liệu có cấu trúc, xác định phạm vi tính năng với mục tiêu (goals) và phi mục tiêu (non-goals), định nghĩa chỉ số thành công và tiêu chí nghiệm thu, hoặc chia một yêu cầu lớn thành đặc tả theo từng giai đoạn.
argument-hint: "<tính năng hoặc phát biểu vấn đề>"
---

# Viết đặc tả tính năng / PRD (Write Spec)

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins/blob/main/product-management/skills/write-spec/SKILL.md) (Anthropic).

> Nếu bạn thấy các placeholder lạ hoặc cần kiểm tra các công cụ nào đang được kết nối, hãy xem [CONNECTORS.md](../../CONNECTORS.md).

Viết tài liệu đặc tả tính năng (feature specification) hoặc tài liệu yêu cầu sản phẩm (PRD).

## Cách sử dụng

```
/write-spec $ARGUMENTS
```

## Quy trình làm việc

### 1. Hiểu tính năng

Hỏi người dùng xem họ muốn viết đặc tả cho thứ gì. Chấp nhận mọi dạng đầu vào sau:
- Tên một tính năng ("Hỗ trợ SSO")
- Một phát biểu vấn đề ("Khách hàng doanh nghiệp liên tục yêu cầu xác thực tập trung")
- Một yêu cầu từ người dùng ("Người dùng muốn xuất dữ liệu ra CSV")
- Một ý tưởng mơ hồ ("Chúng ta nên làm gì đó về tình trạng rớt người dùng khi onboarding")

### 2. Thu thập bối cảnh

Hỏi người dùng những thông tin sau. Hãy trò chuyện tự nhiên — đừng dội tất cả câu hỏi cùng một lúc. Hỏi những câu quan trọng nhất trước và lấp đầy khoảng trống dần dần:

- **Vấn đề của người dùng**: Tính năng này giải quyết vấn đề gì? Ai đang gặp phải nó?
- **Người dùng mục tiêu**: Phục vụ phân khúc người dùng nào?
- **Chỉ số thành công**: Làm sao chúng ta biết nó hiệu quả?
- **Ràng buộc**: Ràng buộc kỹ thuật, tiến độ, yêu cầu pháp lý/tuân thủ, các phụ thuộc
- **Tiền lệ**: Việc này đã từng được thử trước đây chưa? Đã có giải pháp nào hiện hữu chưa?

### 3. Kéo bối cảnh từ các công cụ đã kết nối

Nếu **~~project tracker** đã được kết nối:
- Tìm kiếm các ticket, epic hoặc tính năng liên quan
- Kéo về các yêu cầu hoặc tiêu chí nghiệm thu đã có
- Xác định các phụ thuộc vào các đầu việc khác

Nếu **~~knowledge base** đã được kết nối:
- Tìm kiếm các tài liệu nghiên cứu, bản đặc tả cũ hoặc tài liệu thiết kế liên quan
- Kéo về các kết quả nghiên cứu người dùng phù hợp
- Tìm biên bản cuộc họp hoặc nhật ký quyết định liên quan

Nếu **~~design** đã được kết nối:
- Kéo về các bản mockup, wireframe hoặc khám phá thiết kế liên quan
- Tìm kiếm các component trong design system phù hợp với tính năng

Nếu các công cụ này chưa được kết nối, hãy làm việc hoàn toàn dựa trên thông tin người dùng cung cấp. Không yêu cầu người dùng kết nối công cụ — cứ tiếp tục với thông tin hiện có.

### 4. Tạo PRD

Tạo một bản PRD có cấu trúc với các phần sau. Xem **Cấu trúc PRD** bên dưới để biết hướng dẫn chi tiết cho từng phần.

- **Problem Statement (Phát biểu vấn đề)**: Vấn đề của người dùng, ai bị ảnh hưởng và tác động nếu không giải quyết (2-3 câu)
- **Goals (Mục tiêu)**: 3-5 kết quả cụ thể, đo lường được gắn với chỉ số người dùng hoặc kinh doanh
- **Non-Goals (Phi mục tiêu)**: 3-5 thứ nằm ngoài phạm vi một cách tường minh, kèm lý do ngắn gọn cho từng mục
- **User Stories**: Định dạng chuẩn ("Là một [loại người dùng], tôi muốn [khả năng] để [lợi ích]"), nhóm theo persona
- **Requirements (Yêu cầu)**: Phân loại thành Must-Have (P0), Nice-to-Have (P1), và Future Considerations (P2), mỗi mục kèm tiêu chí nghiệm thu
- **Success Metrics (Chỉ số thành công)**: Chỉ số dẫn dắt (leading indicators — thay đổi nhanh) và chỉ số trễ (lagging indicators — thay đổi theo thời gian), kèm mục tiêu cụ thể
- **Open Questions (Câu hỏi mở)**: Các câu hỏi chưa có lời giải được gắn thẻ người cần trả lời (kỹ thuật, thiết kế, pháp lý, dữ liệu)
- **Timeline Considerations (Cân nhắc tiến độ)**: Hạn chót cứng, các phụ thuộc và phân kỳ triển khai

### 5. Rà soát và Lặp lại

Sau khi tạo PRD:
- Hỏi người dùng xem có phần nào cần điều chỉnh không
- Đề nghị mở rộng chi tiết cho từng phần cụ thể nếu cần
- Đề nghị tạo các tài liệu tiếp theo (design brief, phân rã ticket kỹ thuật, bài trình bày cho stakeholder)

## Cấu trúc PRD

### Problem Statement (Phát biểu vấn đề)
- Mô tả vấn đề của người dùng trong 2-3 câu
- Ai gặp vấn đề này và tần suất ra sao
- Chi phí của việc không giải quyết là gì (nỗi đau người dùng, tác động kinh doanh, rủi ro cạnh tranh)
- Đặt nền tảng trên bằng chứng: nghiên cứu người dùng, dữ liệu hỗ trợ, số liệu hoặc phản hồi khách hàng

### Goals (Mục tiêu)
- 3-5 kết quả cụ thể, đo lường được mà tính năng này cần đạt tới
- Mỗi mục tiêu phải trả lời được câu hỏi: "Làm sao chúng ta biết điều này đã thành công?"
- Phân biệt giữa mục tiêu người dùng (điều người dùng nhận được) và mục tiêu kinh doanh (điều công ty nhận được)
- Mục tiêu phải là kết quả đầu ra (outcomes), không phải sản phẩm bàn giao (outputs) ("giảm 50% thời gian đạt giá trị đầu tiên" chứ không phải "xây dựng wizard onboarding")

### Non-Goals (Phi mục tiêu)
- 3-5 thứ mà tính năng này tường minh sẽ KHÔNG làm
- Các khả năng lân cận nằm ngoài phạm vi của phiên bản này
- Với mỗi phi mục tiêu, giải thích ngắn gọn lý do nằm ngoài phạm vi (tác động chưa đủ lớn, quá phức tạp, thuộc sáng kiến riêng, chưa chín muồi)
- Phi mục tiêu giúp ngăn chặn phình phạm vi (scope creep) khi triển khai và thiết lập kỳ vọng đúng với các bên liên quan

### User Stories
Viết user story theo định dạng chuẩn: "Là một [loại người dùng], tôi muốn [khả năng] để [lợi ích]"

Hướng dẫn:
- Loại người dùng phải đủ cụ thể để có ý nghĩa ("quản trị viên doanh nghiệp" chứ không chỉ là "người dùng")
- Khả năng phải mô tả điều họ muốn đạt được, không phải cách thực hiện UI
- Lợi ích phải giải thích "tại sao" — giá trị mang lại là gì
- Bao gồm các trường hợp biên: trạng thái lỗi, trạng thái rỗng, điều kiện biên
- Bao gồm các loại người dùng khác nhau nếu tính năng phục vụ nhiều persona
- Sắp xếp theo độ ưu tiên — các story quan trọng nhất lên trước

Ví dụ:
- "Là một quản trị viên nhóm, tôi muốn cấu hình SSO cho tổ chức của mình để các thành viên có thể đăng nhập bằng tài khoản doanh nghiệp"
- "Là một thành viên nhóm, tôi muốn tự động chuyển hướng tới trang đăng nhập SSO của công ty để không phải nhớ thêm một mật khẩu riêng"
- "Là một quản trị viên nhóm, tôi muốn xem thành viên nào đã đăng nhập qua SSO để kiểm tra quá trình triển khai có hoạt động ổn không"

### Requirements (Yêu cầu)

**Must-Have (P0)**: Tính năng không thể phát hành nếu thiếu các yêu cầu này. Đây là phiên bản khả dụng tối thiểu (MVP). Hãy hỏi: "Nếu cắt bỏ phần này, tính năng có còn giải quyết được vấn đề cốt lõi không?" Nếu không, nó là P0.

**Nice-to-Have (P1)**: Cải thiện đáng kể trải nghiệm nhưng ca sử dụng cốt lõi vẫn chạy được nếu thiếu chúng. Thường trở thành các bản cập nhật nối tiếp nhanh sau khi ra mắt.

**Future Considerations (P2)**: Tường minh nằm ngoài phạm vi v1 nhưng chúng ta muốn thiết kế sao cho dễ hỗ trợ về sau. Ghi nhận những điểm này giúp tránh các quyết định kiến trúc vô tình làm khó cho tương lai.

Với mỗi yêu cầu:
- Viết mô tả rõ ràng, không mơ hồ về hành vi kỳ vọng
- Kèm theo tiêu chí nghiệm thu (xem bên dưới)
- Ghi chú các cân nhắc hoặc ràng buộc kỹ thuật
- Gắn cờ các phụ thuộc vào đội ngũ hoặc hệ thống khác

### Open Questions (Câu hỏi mở)
- Những câu hỏi cần lời giải trước hoặc trong khi triển khai
- Gắn thẻ từng câu với người cần trả lời (kỹ thuật, thiết kế, pháp lý, dữ liệu, stakeholder)
- Phân biệt giữa câu hỏi chặn tiến độ (blocking — phải trả lời trước khi bắt đầu) và không chặn (có thể giải quyết trong lúc triển khai)

### Timeline Considerations (Cân nhắc tiến độ)
- Hạn chót cứng (cam kết hợp đồng, sự kiện, ngày tuân thủ quy định)
- Phụ thuộc vào công việc hoặc lịch phát hành của đội ngũ khác
- Đề xuất chia giai đoạn nếu tính năng quá lớn cho một lần phát hành

## Cách viết User Story

Một user story tốt cần đảm bảo tiêu chí INVEST:
- **Independent (Độc lập)**: Có thể phát triển và bàn giao riêng lẻ
- **Negotiable (Thương lượng được)**: Chi tiết có thể trao đổi, story không phải hợp đồng cứng
- **Valuable (Có giá trị)**: Mang lại giá trị cho người dùng (không chỉ cho đội ngũ nội bộ)
- **Estimable (Ước lượng được)**: Đội ngũ có thể ước lượng sơ bộ công sức
- **Small (Nhỏ gọn)**: Có thể hoàn thành trong một sprint/vòng lặp
- **Testable (Kiểm thử được)**: Có cách rõ ràng để xác minh nó hoạt động

### Các lỗi thường gặp khi viết User Story
- Quá mơ hồ: "Là người dùng, tôi muốn sản phẩm nhanh hơn" — cụ thể là phần nào cần nhanh hơn?
- Áp đặt giải pháp: "Là người dùng, tôi muốn một menu thả xuống" — hãy mô tả nhu cầu, đừng mô tả widget UI
- Không có lợi ích: "Là người dùng, tôi muốn bấm một nút" — tại sao? Làm vậy để đạt được gì?
- Quá lớn: "Là người dùng, tôi muốn quản lý nhóm của mình" — hãy chia nhỏ thành các khả năng cụ thể
- Hướng nội bộ: "Là đội ngũ kỹ thuật, chúng tôi muốn refactor cơ sở dữ liệu" — đây là tác vụ kỹ thuật (task), không phải user story

## Phân loại yêu cầu

### Khung MoSCoW
- **Must have**: Thiếu những thứ này, tính năng không khả dụng. Không thể thương lượng.
- **Should have**: Quan trọng nhưng chưa tới mức sống còn cho đợt ra mắt. Ưu tiên cao cho đợt bổ sung ngay sau đó.
- **Could have**: Đáng có nếu dư thời gian. Cắt bỏ cũng không làm trễ bàn giao.
- **Won't have (lần này)**: Tường minh ngoài phạm vi. Có thể xem xét lại ở các phiên bản sau.

### Mẹo phân loại
- Quyết liệt cắt gọt danh sách P0. Danh sách bắt buộc càng gọn, bạn càng phát hành và học hỏi nhanh.
- Nếu cái gì cũng là P0 thì chẳng có gì là P0 cả. Thách thức mọi mục must-have: "Chúng ta thực sự không thể phát hành nếu thiếu thứ này sao?"
- Các mục P1 nên là những thứ bạn tự tin sẽ làm sớm, không phải danh sách điều ước.
- Các mục P2 là bảo hiểm kiến trúc — chúng định hướng thiết kế dù hiện tại chưa xây dựng.

## Định nghĩa Chỉ số thành công (Success Metrics)

### Chỉ số dẫn dắt (Leading Indicators)
Các chỉ số thay đổi nhanh sau khi ra mắt (vài ngày đến vài tuần):
- **Tỷ lệ chấp nhận (Adoption rate)**: % người dùng đủ điều kiện có dùng thử tính năng
- **Tỷ lệ kích hoạt (Activation rate)**: % người dùng hoàn thành hành động cốt lõi
- **Tỷ lệ hoàn thành tác vụ (Task completion rate)**: % người dùng đạt được mục tiêu thành công
- **Thời gian hoàn thành (Time to complete)**: Quy trình cốt lõi mất bao lâu
- **Tỷ lệ lỗi (Error rate)**: Tần suất người dùng gặp lỗi hoặc ngõ cụt
- **Tần suất sử dụng tính năng (Feature usage frequency)**: Mức độ thường xuyên người dùng quay lại dùng tính năng

### Chỉ số trễ (Lagging Indicators)
Các chỉ số cần thời gian để hình thành (vài tuần đến vài tháng):
- **Tác động giữ chân (Retention impact)**: Tính năng này có cải thiện tỷ lệ giữ chân người dùng không?
- **Tác động doanh thu (Revenue impact)**: Có thúc đẩy nâng cấp gói, mở rộng hay doanh thu mới không?
- **Thay đổi NPS / mức độ hài lòng**: Có cải thiện cảm nhận của người dùng về sản phẩm không?
- **Giảm ticket hỗ trợ**: Có giảm tải cho bộ phận hỗ trợ không?
- **Tỷ lệ thắng cạnh tranh (Competitive win rate)**: Có giúp chốt được nhiều hợp đồng hơn không?

### Thiết lập mục tiêu số (Targets)
- Mục tiêu phải cụ thể: "50% tỷ lệ chấp nhận trong 30 ngày" chứ không phải "tỷ lệ chấp nhận cao"
- Dựa mục tiêu trên các tính năng tương đương, chuẩn ngành hoặc giả thuyết tường minh
- Đặt một ngưỡng "thành công" (success) và một mục tiêu "bứt phá" (stretch)
- Định nghĩa phương pháp đo: dùng công cụ gì, truy vấn gì, khung thời gian nào
- Chỉ rõ thời điểm đánh giá: 1 tuần, 1 tháng, 1 quý sau khi ra mắt

## Tiêu chí nghiệm thu (Acceptance Criteria)

Viết tiêu chí nghiệm thu theo định dạng Given/When/Then hoặc dạng danh sách kiểm tra (checklist):

**Given/When/Then**:
- Given [điều kiện tiên quyết hoặc bối cảnh]
- When [hành động người dùng thực hiện]
- Then [kết quả kỳ vọng]

Ví dụ:
- Given quản trị viên đã cấu hình SSO cho tổ chức của họ
- When một thành viên nhóm truy cập trang đăng nhập
- Then họ tự động được chuyển hướng đến nhà cung cấp SSO của tổ chức

**Định dạng Checklist**:
- [ ] Quản trị viên có thể nhập URL nhà cung cấp SSO trong cài đặt tổ chức
- [ ] Thành viên nhóm thấy nút "Log in with SSO" trên trang đăng nhập
- [ ] Đăng nhập SSO tạo tài khoản mới nếu chưa tồn tại
- [ ] Đăng nhập SSO liên kết với tài khoản sẵn có nếu email trùng khớp
- [ ] Các lần đăng nhập SSO thất bại hiển thị thông báo lỗi rõ ràng

### Mẹo viết Tiêu chí nghiệm thu
- Bao phủ cả luồng chuẩn (happy path), trường hợp lỗi và trường hợp biên
- Cụ thể về hành vi kỳ vọng, không phải chi tiết cài đặt kỹ thuật
- Bao gồm cả những điều KHÔNG được phép xảy ra (negative test cases)
- Mỗi tiêu chí phải có thể kiểm thử độc lập
- Tránh các từ mơ hồ: "nhanh", "thân thiện", "trực quan" — hãy định nghĩa chúng bằng con số/hành vi cụ thể

## Quản lý phạm vi (Scope Management)

### Nhận diện hiện tượng phình phạm vi (Scope Creep)
Scope creep xảy ra khi:
- Các yêu cầu liên tục được thêm vào sau khi bản đặc tả đã được duyệt
- Những bổ sung "nhỏ xíu" tích tụ thành một dự án lớn hơn hẳn
- Đội ngũ làm những tính năng chẳng người dùng nào hỏi ("tiện tay làm luôn...")
- Ngày ra mắt liên tục trượt đi mà không hề có bước điều chỉnh phạm vi chính thức
- Các bên liên quan thêm yêu cầu mà không bớt đi thứ gì

### Ngăn ngừa phình phạm vi
- Viết các phi mục tiêu (non-goals) tường minh trong mọi bản đặc tả
- Yêu cầu mọi bổ sung phạm vi phải đi kèm việc cắt bớt phạm vi khác hoặc gia hạn thời gian
- Tách bạch rõ ràng giữa "v1" và "v2" trong đặc tả
- Rà soát đặc tả đối chiếu với phát biểu vấn đề ban đầu — mọi thứ có phục vụ nó không?
- Giới hạn thời gian tìm hiểu (time-box): "Nếu không tìm ra phương án cho X trong 2 ngày, chúng ta cắt bỏ nó"
- Tạo một "bãi đỗ ý tưởng" (parking lot) cho các ý tưởng hay nhưng chưa thuộc phạm vi hiện tại

## Định dạng đầu ra

Sử dụng markdown với tiêu đề phân cấp rõ ràng. Giữ tài liệu dễ đọc lướt — các bên liên quan bận rộn chỉ cần đọc tiêu đề và chữ in đậm là nắm được ý chính.

## Mẹo thực hành

- Hãy có chính kiến về phạm vi. Một bản đặc tả gọn ghẽ, định nghĩa chặt chẽ tốt hơn nhiều so với một bản lan man, mơ hồ.
- Nếu ý tưởng của người dùng quá lớn cho một bản đặc tả, hãy đề xuất chia thành các giai đoạn và viết đặc tả cho giai đoạn đầu tiên.
- Chỉ số thành công phải cụ thể và đo lường được, không chung chung ("cải thiện trải nghiệm người dùng").
- Phi mục tiêu cũng quan trọng ngang với mục tiêu. Chúng bảo vệ tiến độ khỏi phình phạm vi khi triển khai.
- Câu hỏi mở phải là những câu thực sự còn bỏ ngỏ — đừng đưa vào những câu bạn đã có thể tự trả lời từ bối cảnh.
