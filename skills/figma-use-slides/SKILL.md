---
name: figma-use-slides
description: "Skill này hỗ trợ các agent sử dụng công cụ MCP use_figma của Figma trong ngữ cảnh Slides. Có thể dùng song song với figma-use vốn chứa ngữ cảnh nền tảng cho việc sử dụng công cụ use_figma."
disable-model-invocation: false
---

# use_figma — Skill Figma Plugin API cho Slides

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-use-slides/SKILL.md) (Figma chính thức).

Skill này chứa ngữ cảnh đặc thù cho Slides của công cụ MCP `use_figma`. Skill [figma-use](../figma-use/SKILL.md) cung cấp ngữ cảnh nền tảng cho việc thực thi plugin API qua MCP cũng như toàn bộ Figma plugin API cho các trường hợp nâng cao hơn không được mô tả tại đây.

**Luôn đưa `figma-use-slides` vào tham số `skillNames` phân tách bằng dấu phẩy khi gọi `use_figma` cho các thao tác Slides. Nếu skill này được tải thông qua tài nguyên MCP, bạn BẮT BUỘC phải thêm tiền tố `resource:` vào tên (ví dụ `resource:figma-use-slides`).** Đây là tham số ghi log dùng để theo dõi mức độ sử dụng skill — nó không ảnh hưởng đến quá trình thực thi.

## Quy tắc tối quan trọng (Đặc thù Slides)

1. **Các file Slides mới tạo có sẵn một theme sáng mặc định.** Khi một file Slides được tạo thông qua `create_new_file`, một theme sáng mặc định sẽ tự động được khởi tạo. Theme này chỉ là khung cấu trúc — bạn nên ghi đè các biến màu và text style của theme bằng định hướng thiết kế riêng cho bộ slide (deck) đang xây dựng. Đừng phụ thuộc hay bị ảnh hưởng bởi các token của theme sáng mặc định.
2. **BẮT BUỘC gọi `appendChild` TRƯỚC khi đặt `x`/`y` — cho mọi node, ở mọi cấp độ lồng nhau.** Các node mới tạo bị âm thầm gán cha tự động vào ngữ cảnh slide tại tọa độ tuyệt đối `(240, 240)` (`GRID_PADDING` của slide grid). Việc ghi `x`/`y` trước `appendChild` khiến giá trị bị lưu theo gốc tọa độ ẩn đó; node sau đó sẽ rơi vào vị trí `(intended − 240, intended − 240)` khi bạn gắn node cha thực sự. Lỗi này xảy ra **chập chờn không ổn định** — một số frame trong cùng script có thể thoát lỗi, nên một lần test chạy ổn không chứng minh bạn an toàn. **Dấu hiệu nhận biết:** nếu bất kỳ node nào bị lệch `(−240, −240)` so với vị trí bạn đã đặt, mã của bạn đã gán `x`/`y` trước lệnh `appendChild` cuối cùng. KHÔNG tìm cách bù trừ bằng cách cộng thêm 240 ngược lại — điều đó tạo ra kết quả tệ hơn khi chạy lại. Hãy sửa đúng thứ tự thao tác. Xem [slide-gotchas.md](references/slide-gotchas.md#position-after-appendchild-critical) để lấy mẫu hàm hỗ trợ giúp không thể làm sai thứ tự này.
3. **`SLIDE_GRID` và `SLIDE_ROW` là các node mờ đục (opaque)** — không truy cập `.fills`, `.effects` hoặc các thuộc tính bố cục trên chúng. Chỉ các node `SLIDE` (kiểu `'SLIDE'`) mới kế thừa `BaseFrameMixin`. **Ngoại lệ:** `SLIDE_ROW.name` CÓ THỂ gán giá trị — đó là cách các plugin đổi tên các phần (section) slide (ví dụ `slideRow.name = "Intro"`). Xem [slide-lifecycle.md](references/slide-lifecycle.md).
4. **`get_metadata` KHÔNG hoạt động trên các file Slides.** Hãy dùng các script chỉ đọc của `use_figma` để kiểm tra. Trả về vị trí các node đã tạo trong đầu ra `closePlugin()` và xác minh không có bounding box nào chồng chéo nhau.
5. **KHÔNG gọi `figma.createPage()` trong Slides.** Lệnh này ném lỗi `TypeError: figma.createPage no such property 'createPage' on the figma global object` — `createPage()` là API chỉ dành cho file Design (`figma.com/design/...`); URL của Slides là `figma.com/slides/...`. Thay vào đó, hãy dùng slide grid (`SLIDE_GRID` / `SLIDE_ROW` / `SLIDE`) để sắp xếp cấu trúc deck — xem [slide-lifecycle.md](references/slide-lifecycle.md) và [slide-grid.md](references/slide-grid.md).
6. **Không bao giờ xóa các slide hiện có để dựng lại.** Khi được yêu cầu cải thiện, thiết kế lại hoặc đổi phong cách một deck, hãy chỉnh sửa trực tiếp trên các slide hiện có. Chỉ xóa slide khi người dùng yêu cầu rõ ràng "làm lại từ đầu" hoặc "xóa hết làm lại".

## Tư duy thiết kế

Không phải mọi tác vụ đều cần độ sâu tư duy thiết kế giống nhau. Trước khi làm bất cứ điều gì, hãy xác định bạn đang ở chế độ nào:

- **Chỉnh sửa nội dung/thuộc tính** — đổi văn bản, đổi một màu, cập nhật số liệu, sửa căn chỉnh, đổi kích thước phần tử. Bỏ qua tư duy thiết kế. Chỉ cần thực hiện thay đổi và khớp với những gì đã có sẵn.
- **Bổ sung cấu trúc** — thêm slide, làm lại bố cục một section, đổi bảng màu của deck, đưa vào một yếu tố thị giác mới. Điều này bao gồm các yêu cầu "cải thiện", "thiết kế lại" hoặc "đổi phong cách" một deck — đó là các chỉnh sửa tại chỗ trên những gì đã có, không phải một deck mới. Tư duy thiết kế vẫn áp dụng, nhưng ở chế độ *kế thừa*: deck hiện tại chính là ngôn ngữ thiết kế của bạn. Hãy kiểm tra nó, bám sát bảng màu, kiểu chữ, thói quen dàn trang và họa tiết đặc trưng của nó. Mở rộng cá tính hiện có của deck thay vì phát minh lại từ đầu.
- **Tạo deck mới** — xây dựng một deck từ đầu hoặc từ một file trống. Áp dụng đầy đủ tư duy thiết kế như mô tả bên dưới.

Đối với bổ sung cấu trúc trên các deck hiện có: hãy chạy các script kiểm tra (bên dưới) và chụp ảnh màn hình trước khi thực hiện thay đổi. Câu trả lời cho "câu chuyện màu sắc là gì?" và "xử lý chữ thế nào?" đều đã nằm sẵn trong file — việc của bạn là đọc chúng và giữ nhất quán. Các nguyên tắc thiết kế trong [slide-design.md](references/slide-design.md) mô tả những gì bạn đang *khớp theo*, không phải những gì bạn tự *chọn mới*.

### Quy trình thiết kế deck mới

Trước khi viết bất kỳ mã Plugin API nào cho một deck mới, hãy quyết định *cảm giác* mà nó cần mang lại. Người dùng Figma có kỳ vọng thị giác rất cao — một deck trông như bước ra từ trình tạo template đại trà sẽ bị lạc lõng một cách đáng tiếc.

1. **Đọc kỹ đề bài.** Deck này truyền đạt điều gì và cho ai? Một bài thuyết trình gọi vốn (investor pitch), một buổi hồi cứu nhóm (retrospective), một lễ ra mắt sản phẩm và một buổi đào sâu kỹ thuật đều đòi hỏi cách xử lý thị giác khác nhau. Thiết kế phải gắn chặt không thể tách rời khỏi nội dung.
2. **Kiểm tra ngôn ngữ thiết kế có sẵn.** Trước khi tự nghĩ ra bất cứ thứ gì, hãy nhìn vào những gì người dùng đã đưa cho bạn. Hướng dẫn thương hiệu trong prompt — bảng màu, thông số kiểu chữ, quy tắc logo, mô tả giọng điệu — là những quyết định thiết kế đã được chốt. Một liên kết đến file Figma tham chiếu là một ngôn ngữ thiết kế mà bạn cần nghiên cứu kỹ, chứ không phải liếc qua. Đầu vào của người dùng càng cụ thể, bạn càng nên ít tự phát minh. Khi người dùng cung cấp tài liệu tham chiếu, vai trò của bạn chuyển từ *nhà thiết kế* sang *người diễn giải*: trích xuất ngôn ngữ thiết kế và áp dụng trung thành cho nội dung mới.
3. **Đưa ra lập trường rõ ràng — trên phần còn lại.** Nếu người dùng cung cấp đầy đủ bộ nhận diện thương hiệu, phạm vi sáng tạo của bạn nằm ở bố cục, nhịp điệu và sắp xếp không gian — chứ không phải ở màu sắc hay kiểu chữ. Nếu họ đưa một slide tham chiếu duy nhất để lấy cảm hứng, bạn có nhiều không gian hơn nhưng vẫn nên phản chiếu tinh thần của nó. Nếu họ không đưa gì cả, thì bạn làm chủ mọi quyết định — chọn một câu chuyện màu sắc, một cách xử lý kiểu chữ, một cách tổ chức không gian và theo đuổi nhất quán xuyên suốt mọi slide. Một deck có góc nhìn rõ ràng (kể cả khi tối giản, trầm tĩnh) luôn dễ đọc hơn một deck chọn phương án an toàn ở mọi quyết định. Phạm vi của việc "đưa ra lập trường" tỷ lệ nghịch với lượng thông tin người dùng đã cung cấp.
4. **Tạo dấu ấn riêng.** Mọi deck xuất sắc đều có ít nhất một yếu tố khiến bạn nhận ra ngay cả khi tách khỏi ngữ cảnh: một bảng màu đặc trưng, một nhịp điệu bố cục bất ngờ, một ngôn ngữ hình khối lặp lại. Khi làm việc từ hướng dẫn thương hiệu, dấu ấn riêng phải *bắt nguồn từ* ngôn ngữ thương hiệu đó — khuếch đại một điểm đã sẵn có thay vì thêm thứ gì xa lạ. Khi thiết kế từ đầu, hãy chốt dấu ấn riêng là gì trước khi bắt đầu dựng.

### Đọc file tham chiếu

Khi người dùng cung cấp liên kết đến một file Figma để tham chiếu, hãy nghiên cứu nó trước khi thiết kế bất cứ thứ gì. Những gì bạn trích xuất phụ thuộc vào loại file:

- **File Slides**: `get_metadata` không hoạt động trên file Slides. Dùng `get_screenshot` để chụp từng slide làm tham chiếu trực quan, và dùng `use_figma` với `fileKey` của file tham chiếu để chạy các script chỉ đọc nhằm trích xuất theme variable, bảng màu, lựa chọn font và mẫu bố cục.
- **File Design**: `get_design_context` cung cấp dữ liệu thiết kế toàn diện — màu sắc, kiểu chữ, cấu trúc bố cục. `get_screenshot` cung cấp tham chiếu trực quan. Hãy dùng cả hai.

Những điểm cần tìm trong một file tham chiếu: bảng màu (tông màu nào chủ đạo, màu nhấn là gì, nền tối/sáng được dùng ra sao), lựa chọn kiểu chữ (họ font, độ đậm, cách phân cấp), thói quen không gian (nội dung neo ở đâu, lượng khoảng trắng, các phần tử có tràn lề không) và bất kỳ họa tiết lặp lại nào (hình khối, kiểu đường nét, chi tiết trang trí). Đây là những quyết định bạn kế thừa — mọi thứ còn lại là của bạn.

Mức độ bám sát file tham chiếu phụ thuộc vào yêu cầu của người dùng. "Làm cho giống thế này" nghĩa là sao chép nguyên ngôn ngữ thiết kế với nội dung mới. "Dùng cái này để lấy cảm hứng" nghĩa là phản chiếu tinh thần nhưng biến hóa theo cách của bạn. "Đây là deck thương hiệu của chúng tôi" nghĩa là trích xuất hệ thống thương hiệu và áp dụng nhất quán. Khi còn phân vân, hãy bám sát tài liệu tham chiếu hơn — người dùng sẽ dễ dàng bảo bạn tách ra sáng tạo hơn là bảo bạn gỡ bỏ những lựa chọn tự bịa gây xung đột với thương hiệu của họ.

Tải [slide-design.md](references/slide-design.md) để xem hướng dẫn cụ thể về màu sắc, kiểu chữ, mẫu bố cục, phối hợp không gian và những điều cần tránh. Khi bạn có file tham chiếu hoặc hướng dẫn thương hiệu, hãy coi các nguyên tắc trong `slide-design.md` là mặc định cho những quyết định mà người dùng *không* đưa ra — chứ không phải để ghi đè những quyết định họ đã chọn.

## Quy trình xây dựng Deck

Khi xây dựng một deck mới từ 5 slide trở lên, hãy dùng quy trình hai giai đoạn này. Nó thay thế cho quy trình tăng dần tổng quát trong [figma-use](../figma-use/SKILL.md) Mục 6 riêng cho việc dựng deck — các nguyên tắc vẫn áp dụng, nhưng nhịp độ thực hiện thay đổi.

### Giai đoạn 1 — Thiết kế & Lập kế hoạch

Hoàn tất quy trình tư duy thiết kế ở trên (đọc đề bài, kiểm tra ngôn ngữ thiết kế, đưa ra lập trường, tạo dấu ấn riêng), sau đó **trước khi viết bất kỳ mã `use_figma` nào**, hãy lập kế hoạch slide bao quát toàn bộ deck:

1. **Kế hoạch từng slide.** Đối với mỗi slide: mục đích/nội dung, cách tiếp cận bố cục được mô tả theo không gian (ví dụ: "tiêu đề neo ở góc trên bên trái, thẻ thông số chiếm một phần ba bên phải, hình tròn trang trí tràn qua cạnh trên bên phải") và cách xử lý nền (tối/sáng/gradient). KHÔNG tính toán tọa độ pixel trong lúc lập kế hoạch — hãy mô tả bố cục bằng thuật ngữ không gian. Việc tính toán tọa độ diễn ra trong lúc sinh mã.
2. **Hằng số dùng chung.** Khai báo các họ font và style bạn sẽ dùng, bảng màu dưới dạng các vai trò đặt tên (`primary`, `accent`, `bgDark`, `surface`, `textPrimary`, `textMuted`, v.v.), và họa tiết lặp lại hoặc yếu tố dấu ấn riêng.
3. **Kiểm tra độ đa dạng bố cục.** Đọc lướt qua kế hoạch các slide theo trình tự. Nếu mô tả bố cục nghe bị lặp lại — "hai cột, hai cột, lưới, hai cột" — hãy sắp xếp lại trước khi dựng. Đây là thời điểm ít tốn kém nhất để đa dạng hóa. Xem [slide-design.md](references/slide-design.md) để biết các phản mẫu cần tránh.
4. **Phần mở đầu mã (Code preamble).** Viết sẵn phần mở đầu tái sử dụng mà bạn sẽ dán ở đầu mỗi script dựng slide: một đối tượng bảng màu `const C = { ... }`, một khối tải font `Promise.all([...])`, và các hàm hỗ trợ `addFrame`/`addText`/`addRect` từ [slide-gotchas.md](references/slide-gotchas.md#position-after-appendchild-critical).

### Giai đoạn 2 — Dựng slide

Thực thi kế hoạch theo các lô lớn (large batches). Mục tiêu là giảm thiểu số chu kỳ suy-nghĩ-rồi-dựng — chứ không phải giảm thiểu số phần tử trong mỗi script.

- **3–5 slide cho mỗi lần gọi `use_figma`.** Các slide có cấu trúc tương đồng (ví dụ một loạt slide tính năng sản phẩm) có thể đi chung trong một lô. Mỗi slide là một cây con cô lập — không tồn tại sự phụ thuộc chéo giữa các slide, nên các lô lớn rất an toàn.
- **KHÔNG lập lại kế hoạch giữa các lô.** Thiết kế đã được chốt ở Giai đoạn 1. Nếu một lô chạy thành công và vượt qua bước kiểm tra, hãy chuyển ngay sang lô tiếp theo. Chỉ lập lại kế hoạch nếu một lô thất bại hoặc gây ra lỗi thị giác đòi hỏi phải thay đổi hướng tiếp cận.
- **Dán phần mở đầu mã** (màu sắc, font chữ, hàm hỗ trợ) ở đầu mỗi script dựng slide. Sao chép nguyên văn từ Giai đoạn 1 — không suy diễn lại.
- **Kiểm tra mọi lô** bằng script kiểm tra xác định (deterministic batch validation script) từ [slide-gotchas.md](references/slide-gotchas.md#batch-validation-script). Script này kiểm tra các phần tử chồng chéo, văn bản bị cắt và các node nằm ngoài biên chỉ trong ~3 giây. Nếu kiểm tra đạt, tiếp tục mà không cần chụp ảnh màn hình. Nếu thất bại, chụp ảnh màn hình các slide bị ảnh hưởng và sửa trước khi tiếp tục.
- **Chỉ chụp ảnh màn hình tại các mốc kiểm tra** — sau lô đầu tiên (xác thực hệ thống thị giác: màu sắc, kiểu chữ, định hướng thiết kế), và sau lô cuối cùng (chất lượng tổng thể). Chụp ảnh 1–2 slide đại diện mỗi mốc bằng `await slide.screenshot()` nội tuyến, không gọi `get_screenshot` tách rời.
- **Trả về toàn bộ ID các node đã tạo** từ mỗi script dựng slide, như mọi khi.

## Sections (Phân khu)

Một section là một hàng ngang trong slide grid — mỗi hàng là một section. Tên hiển thị trong trình chỉnh sửa (cạnh hàng) và trong Presenter View (giúp diễn giả nhảy giữa các nhóm). Đây là công cụ tổ chức dành cho người chỉnh sửa deck — người dùng làm chủ vị trí ngắt đoạn, không phải bạn.

### Khi được yêu cầu sắp xếp một deck
"Sắp xếp deck này" là yêu cầu mơ hồ — có thể là gom nhóm, đổi thứ tự, loại bỏ trùng lặp hoặc tái cấu trúc. Hãy đọc deck trước khi dùng `AskUserQuestion`.

**Mặc định: đề xuất, đừng hỏi ngay.** Hầu hết các deck đều có manh mối — slide mở đầu đóng khung, các use case đánh số, các cặp *Before / After* lặp lại, slide chuyển tiếp ("Then X enters the chat"), slide *Thank you*. Khi có manh mối, hãy chọn một cách chia section và đưa nó vào một thông báo xác nhận. Các quyết định có giới hạn bên trong đề xuất (gộp một hàng *Use Cases* hay tách ba hàng, slide chuyển tiếp nằm ở đâu) đều có thể đảo ngược — hãy chọn một phương án và tiếp tục.

**Dự phòng: hỏi khi thiếu manh mối.** Nếu các slide xếp theo thứ tự tùy tiện hoặc không có trục mạch lạc, hãy hỏi xem các đoạn nào đi cùng nhau và đặt tên là gì. Đừng chia ba đều tăm tắp để thay thế cho việc đọc nội dung.

### Đặt tên + phân phạm vi
Tên nên ngắn gọn (1–3 từ), cụ thể (*Demo* hay hơn *Show & tell*) và nhất quán trong cùng một deck. Hai đến năm section là mức phổ biến; nhiều hơn chỉ áp dụng cho deck dài hoặc lặp cấu trúc. Tên không phải là tiêu đề slide — chúng giúp tìm kiếm một nhóm, không phải mô tả nội dung của nó.

### Đổi tên một section

`getSlideGrid()` trả về `SlideNode[][]` — các mảng bên trong là mảng JS thuần chứa các slide, KHÔNG phải các node `SLIDE_ROW`. Gán `.name` lên các mảng đó sẽ âm thầm không có tác dụng. Để đổi tên một section, hãy duyệt cây node và gán `.name` lên `SLIDE_ROW` thực tế:

```js
const slideGrid = figma.currentPage.children.find(c => c.type === "SLIDE_GRID");
slideGrid.children[0].name = "Intro";
```

## Speaker Notes (Ghi chú diễn giả)

Speaker notes là người bạn đồng hành riêng tư của diễn giả cho mỗi slide. Chúng xuất hiện trong Presenter View (chỉ diễn giả nhìn thấy, khán giả không thấy) và đóng vai trò kịch bản, bảng nhắc ý hoặc tài liệu tham khảo các luận điểm khi thuyết trình trực tiếp.

### Khi nào viết speaker notes

- **Khi được yêu cầu**: Nếu người dùng yêu cầu speaker notes, ghi chú diễn giả, luận điểm hoặc kịch bản cho deck, hãy viết ghi chú cho mọi slide có nội dung thực chất (bỏ qua các slide phân tách section hoặc slide chỉ mang tính trang trí trừ khi có điều cần nói).
- **Deck sẵn sàng thuyết trình**: Nếu người dùng yêu cầu rõ ràng một deck sẵn sàng để trình bày trực tiếp, speaker notes rất hữu ích. Hãy thêm chúng khi cần giúp diễn giả nắm bắt nhịp độ, câu chuyển ý hoặc ngữ cảnh không hiển thị trên slide.
- **Slide thưa chữ hoặc thiên về hình ảnh**: Nếu một slide xoay quanh biểu đồ, hình ảnh, phép ẩn dụ hoặc câu hỏi gợi mở, ghi chú có thể giải thích điều diễn giả nên nói. Dùng ảnh chụp màn hình hoặc `node.screenshot()` cho các slide nhiều ảnh, nhiều biểu đồ hoặc ít chữ khi ngữ cảnh thị giác quan trọng, nhưng đừng mặc định chụp mọi slide — ảnh tiêu tốn ngân sách ngữ cảnh.
- **Không tự ý thêm ghi chú khi không được yêu cầu**: Với các chỉnh sửa slide thông thường, tinh chỉnh bố cục hoặc cập nhật deck hiện có, không điền speaker notes trừ khi người dùng yêu cầu. Thêm ghi chú làm thay đổi luồng thuyết trình và có thể khiến chủ sở hữu deck bất ngờ.

### Ghi chú diễn giả tốt trông như thế nào

Speaker notes là dành cho *diễn giả*, không phải khán giả. Chúng nên tạo cảm giác như một đồng nghiệp tin cậy ghé tai nhắc nhỏ "đây là điều bạn cần nói". Ghi chú tốt sẽ:

- **Bổ trợ cho slide, không lặp lại slide.** Nếu slide ghi "Doanh thu tăng 40%", ghi chú không nên ghi "Doanh thu tăng 40%". Chúng nên nói *tại sao* nó tăng, khán giả cần đọng lại điều gì, hoặc câu hỏi nào thường phát sinh từ con số này.
- **Ngắn gọn và dễ đọc lướt.** Diễn giả liếc xuống giữa chừng câu nói cần tìm đúng vị trí ngay lập tức. Hãy dùng các gạch đầu dòng ngắn, không dùng đoạn văn dày đặc. Mỗi ý chỉ nên chứa một thông điệp.
- **Bao gồm câu chuyển tiếp.** Ghi chú hay nhất cho diễn giả biết cách *di chuyển* giữa các slide: "Sau khi tiếng vỗ tay lắng xuống..." hoặc "Ý này nối tiếp điểm trước — hãy nhắc lại con số 40%."
- **Mang theo ngữ cảnh mà slide không thể chứa.** Nguồn dữ liệu ("Nguồn: số liệu nội bộ Q4 FY25, chưa công bố"), lưu ý ngoại lệ ("Bỏ qua slide này nếu có CFO trong phòng"), mốc thời gian ("Đây là điểm nửa chặng — bạn nên đang ở phút thứ ~10"), và các câu hỏi dự đoán trước ("Họ sẽ hỏi về biên lợi nhuận — xem slide phụ lục 14").
- **Khớp với sắc thái bài thuyết trình.** Ghi chú cho bài gọi vốn nhà đầu tư cần chính xác và được tập dượt kỹ. Ghi chú cho buổi hồi cứu nhóm thì tự nhiên và linh hoạt. Ghi chú cho bài phát biểu chính (keynote) có thể kèm chỉ dẫn sân khấu. Hãy khớp giọng điệu với bối cảnh.

### Những điều cần tránh trong speaker notes

- **Kịch bản dài dòng đầy đủ**: Ghi chú dạng bức tường chữ khuyến khích việc đọc thuộc lòng từng chữ, tạo nên một buổi thuyết trình tồi. Nếu người dùng yêu cầu rõ ràng một kịch bản, hãy viết nó, nhưng mặc định là các gạch đầu dòng.
- **Định dạng dành cho khán giả**: Ghi chú không hiển thị với khán giả. Đừng tối ưu chúng cho khả năng đọc của người không phải diễn giả.
- **Dư thừa với slide**: Nếu slide đã tự giải thích rõ ("Cảm ơn" kèm thông tin liên hệ), không cần ghi chú. Để trống ghi chú của một slide là hoàn toàn bình thường.

### Định dạng

`slide.speakerNotes` nhận một chuỗi markdown. Ưu tiên danh sách gạch đầu dòng làm cấu trúc chính; in đậm hữu ích để nhấn mạnh các cụm từ khóa mà diễn giả không nên bỏ qua. Xem [slide-properties.md](references/slide-properties.md#supported-formatting) để biết danh sách đầy đủ các cú pháp markdown được hỗ trợ (danh sách, in đậm, in nghiêng, gạch ngang) và không được hỗ trợ (tiêu đề `#`, khối code, code nội tuyến, liên kết).

## Kiểm tra nội dung file Slides

Hiện chưa có công cụ đọc chuyên biệt cho các file Slides. Hãy sử dụng `use_figma` với các script chỉ đọc để kiểm tra, và `get_screenshot` / `await node.screenshot()` để lấy ngữ cảnh thị giác.

- **Kiểm tra trước khi tạo.** Trước khi tạo bất cứ thứ gì, hãy chạy một lệnh `use_figma` chỉ đọc để khám phá những gì đã tồn tại — các slide, văn bản, component, quy ước đặt tên. Mẫu "Kiểm tra trước" trong [figma-use](../figma-use/SKILL.md) Mục 6 cũng áp dụng tại đây.
- **`get_metadata` KHÔNG hoạt động trên các file Slides** — nó chỉ hỗ trợ loại trình chỉnh sửa `figma` (Design).
- **Đầu ra `console.log()` KHÔNG được trả về** — chỉ giá trị `return` mới được trả về. Luôn `return` dữ liệu bạn cần.
- **Dùng `get_screenshot` để lấy ngữ cảnh thị giác** — truyền một `nodeId` hợp lệ để lấy ảnh chụp màn hình. Bạn cũng có thể dùng `await node.screenshot()` nội tuyến bên trong các script `use_figma`.

### Các script kiểm tra nhanh

**Liệt kê tất cả slide trong deck:**
```js
const grid = figma.getSlideGrid();
return grid.map((row, rowIdx) =>
  row.map((slide, colIdx) => ({
    id: slide.id,
    name: slide.name,
    row: rowIdx,
    col: colIdx,
    isSkipped: slide.isSkippedSlide,
    speakerNotes: slide.speakerNotes,
  }))
);
```

**Lấy nội dung văn bản từ một slide cụ thể:**
```js
const slide = figma.getNodeById("TARGET_SLIDE_ID");
// findAllWithCriteria uses an indexed type lookup — much faster than
// findAll(n => n.type === 'TEXT') on slides with many shapes/images.
const textNodes = slide.findAllWithCriteria({ types: ["TEXT"] });
const fontsToLoad = new Set();
for (const t of textNodes) {
  if (t.fontName !== figma.mixed) {
    fontsToLoad.add(JSON.stringify(t.fontName));
  } else {
    const segments = t.getStyledTextSegments(["fontName"]);
    for (const seg of segments) fontsToLoad.add(JSON.stringify(seg.fontName));
  }
}
for (const f of fontsToLoad) {
  await figma.loadFontAsync(JSON.parse(f));
}
return textNodes.map(t => ({
  id: t.id,
  name: t.name,
  characters: t.characters,
  x: t.x,
  y: t.y,
  width: t.width,
  height: t.height,
}));
```

## Tài liệu tham khảo

Chỉ tải những tài liệu tham khảo mà tác vụ của bạn cần:

- [slide-gotchas](references/slide-gotchas.md) — Các bẫy đặc thù cho Slides (độ lệch tọa độ, các loại node mờ đục, giải pháp thay thế kiểm tra hợp lệ)
- [slide-lifecycle](references/slide-lifecycle.md) — Tạo mới, nhân bản, xóa và sắp xếp lại slide và slide row
- [slide-grid](references/slide-grid.md) — Làm việc với bố cục slide grid (`getSlideGrid`, `setSlideGrid`)
- [slide-content](references/slide-content.md) — Xây dựng nội dung bên trong slide (văn bản, hình khối, auto-layout — SlideNode kế thừa BaseFrameMixin)
- [slide-properties](references/slide-properties.md) — Các thuộc tính đặc thù của slide (`speakerNotes`, `isSkippedSlide`, `focusedSlide`, `focusedNode`, `slideThemeId`, `InteractiveSlideElementNode`)
- [slide-design](references/slide-design.md) — Nguyên tắc thiết kế cho các deck hấp dẫn, đa dạng về mặt thị giác (chiến lược màu sắc, kiểu chữ, sự đa dạng bố cục, phối hợp không gian, các phản mẫu cần tránh)
