---
name: figma-3d-transforms
disable-model-invocation: false
description: 'Thêm hoặc chỉnh sửa 3D transform — chiều sâu, phối cảnh, xoay trục Z, độ nghiêng, isometric và hiệu ứng parallax mà phép xoay 2D phẳng không thể biểu diễn. Sử dụng bất cứ khi nào yêu cầu chạm tới chiều không gian thứ ba — "make it 3D", "add depth/perspective", "tilt/rotate it back", "z-plane", "isometric", "flip it like a card", "parallax", "vanishing point", "receding into the distance", "make it pop out".'
---

# Thêm / chỉnh sửa 3D transforms

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-3d-transforms/SKILL.md) (Figma chính thức).

Sử dụng skill này khi một yêu cầu cần đến chiều thứ ba và phép xoay 2D thông thường không thể diễn tả được: phối cảnh, chiều sâu, nghiêng theo trục Z, bố cục isometric, lật thẻ, các lớp parallax, "làm nó nổi bật ra khỏi màn hình."

Không dùng skill này cho:
- Phép xoay phẳng trong mặt phẳng → đặt thuộc tính `rotation` 2D của node thay thế; không có gì là 3D ở đó cả.

## Tạo chuyển động cho 3D transform

Một yêu cầu có thể ngầm hiểu là tác vụ motion. Hãy giả định là không phải trừ khi ngữ cảnh cho thấy ngược lại, ngôn từ mô tả tính chất chuyển động ("lật mượt mà", "đung đưa nhẹ"), hoặc trường đang thay đổi đã được gắn keyframe sẵn. Đây là các dấu hiệu định hướng; hãy dùng ngữ cảnh bạn có. Đối với tác vụ motion, hãy thiết lập tư thế (pose) bằng skill này và gắn keyframe bằng `figma-use-motion`; đừng bàn giao các tư thế tĩnh hoặc các frame "trạng thái" thay cho một animation.

Keyframe ghi đè lên các trường 3D tĩnh trong quá trình phát, vì vậy trước khi thay đổi `transform3d` của một node hoặc `scene3d.perspective` của một container, hãy dùng `use_figma` để đọc `manualKeyframeTracks` và `animationStyles` trên node có trường bạn thay đổi. Chỉnh sửa keyframe trên các trường đang được thay đổi; các track khác (ví dụ opacity) không bắt buộc phải tạo chuyển động cho tư thế. Nếu `manualKeyframeTracks` là `undefined`, Motion không khả dụng: hãy thực hiện chỉnh sửa tĩnh, và báo cho người dùng rằng animation không khả dụng nếu yêu cầu cần tới nó.

## Môi trường thực thi

Tải `figma-use` trước khi gọi `use_figma` và tuân thủ các quy tắc về ngữ cảnh file, tạo node, đầu ra và xác minh của nó. Đưa cả hai tên skill vào `skillNames`, thêm tiền tố `resource:` cho mỗi tên khi được tải thông qua tài nguyên MCP. Các công thức dưới đây minh họa hình học Plugin API thô; hãy điều chỉnh việc tạo node theo quy trình mà `figma-use` yêu cầu và áp dụng các tư thế sau khi quy trình đó đã khởi tạo xong các node. Thực thi các ví dụ Plugin API trong file đích bằng `use_figma`.

Các API 3D phụ thuộc vào khả năng hỗ trợ tính năng của người dùng đang gọi. Nếu `transform3d` không khả dụng, hãy dừng lại và giải thích rằng 3D transforms chưa được bật trong phiên này. Không thử lại các API không được hỗ trợ hoặc tự ý thay thế bằng hình minh họa phẳng khi chưa có sự đồng ý của người dùng.

## Ngôn ngữ giao tiếp với người dùng
- Nói bằng thuật ngữ dễ hiểu: "thêm phối cảnh", "nghiêng ra sau", "tạo chiều sâu cho cảnh". Không nêu tên các trường API hay plugin API với người dùng, và không hiển thị nguyên văn thông báo lỗi thô.
- Đưa ra các cập nhật tiến độ ngắn gọn ("Đang thiết lập không gian 3D…", "Đang nghiêng các thẻ…", "Đang kiểm tra kết quả…").
- Với các yêu cầu styling mơ hồ, hãy thực hiện điều chỉnh hợp lý về mặt thẩm mỹ; với phối cảnh mơ hồ, hãy tuân theo các quy tắc quyết định bên dưới.

## Ba trường dữ liệu cốt lõi

| Trường | Nằm trên | Vai trò |
|---|---|---|
| `node.transform3d` | bất kỳ node nào | tư thế 3D riêng của từng phần tử |
| `node.scene3d` | chỉ FRAME / COMPONENT / INSTANCE | không gian 3D dùng chung cho các phần tử con của container |
| `node.transformOrigin` | bất kỳ node nào | điểm tâm xoay mà tư thế xoay quanh |

### transform3d — tư thế riêng của từng phần tử
Cấu trúc khi ghi: `{ type: 'FIXED_ORDER', translateZ, rotateX, rotateY, rotateZ, backfaceVisible?, visible? }`
- `translateZ` và cả ba giá trị `rotate*` đều **bắt buộc** khi ghi; `backfaceVisible` và `visible` là tùy chọn và mặc định là `true`.
- **Không có `perspective` theo từng phần tử** — nó không thuộc cấu trúc này, và truyền nó vào sẽ gây lỗi. Toàn bộ phối cảnh nằm trên container thông qua `scene3d`.
- Góc xoay tính bằng **độ (degrees)**. Các trường kết hợp giống như CSS `transform: translateZ() rotateX() rotateY() rotateZ()`: node được xoay trước (Z, rồi Y, rồi X) và `translateZ` được áp dụng cuối cùng, dọc theo trục Z của **node cha**, không phải hướng mà node đang quay mặt tới. Do đó, xoay kết hợp `translateZ` trên cùng một node sẽ không bao giờ đẩy nó ra theo pháp tuyến đã xoay của nó; để làm điều đó, hãy xoay một wrapper thay thế (xem [công thức carousel](references/carousels.md)).
- **Không có tịnh tiến X hoặc Y** — `transform3d` chỉ dịch chuyển dọc trục Z. Để di chuyển node theo chiều ngang hoặc dọc, hãy đặt vị trí của chính node đó (`node.x` / `node.y`); đừng tìm cách dùng transform. Vì vậy, một cảnh gồm nhiều phần tử con ở các vị trí X/Y khác nhau được xây dựng bằng cách định vị từng node, sau đó áp dụng `transform3d` lên trên để tạo chiều sâu/góc xoay.
- Việc gán `transform3d` **ghi đè toàn bộ object** — bỏ qua `backfaceVisible` hoặc `visible` sẽ đặt lại chúng về `true`. Để thay đổi một trục, hãy đọc giá trị hiện tại, spread nó ra và ghi lại toàn bộ object.
- `{ type: 'NONE' }` xóa bỏ 3D transform.
- Việc ghi được kiểm tra nghiêm ngặt — các khóa thừa sẽ bị từ chối.
- Thao tác đọc có thể trả về `type: 'FREEFORM'` trên các node được import từ CSS / `matrix3d`. FREEFORM là **chỉ đọc**: bạn có thể phát hiện nó nhưng không thể tạo/ghi nó. Hãy ghi một object `FIXED_ORDER` thay thế (nó sẽ ghi đè lên dạng freeform).

### scene3d — không gian 3D dùng chung (chỉ dành cho container)
Cấu trúc khi ghi: `{ perspective, preserve3d, visible? }` trên một FRAME / COMPONENT / INSTANCE.
- `perspective` và `preserve3d` đều **bắt buộc** khi ghi; `visible` là tùy chọn và mặc định là `true`.
- `preserve3d: true` = các phần tử con dùng chung một không gian 3D và có thể chồng lấn theo chiều sâu (giống CSS `preserve-3d`). `preserve3d: false` (mặc định — container phải chủ động bật) = các phần tử con được chiếu phẳng lên mặt phẳng của container.
- Thao tác đọc trả về `null` khi chưa cấu hình — và một cảnh toàn giá trị mặc định cũng đọc về `null`, nên đừng coi `null` là lỗi.
- Ghi `null`/`undefined` sẽ xóa cấu hình. Trên một INSTANCE, điều này tách instance đó ra khỏi cảnh của component gốc.

### transformOrigin — điểm tâm xoay
Cấu trúc khi ghi: `{ x: { unit, value }, y: { unit, value } }`, trong đó `unit` là `'PERCENT'` (50 = tâm giữa) hoặc `'PIXELS'`.
- Mặc định căn giữa (50% / 50%); thao tác đọc trả về giá trị mặc định đó khi chưa đặt. Không có cách nào đặt lại về trạng thái "chưa đặt" qua API.

## Thiết lập phối cảnh

Quyết định trước khi đặt tư thế cho cảnh, theo thứ tự sau:
1. Tôn trọng lựa chọn phép chiếu tường minh: có phối cảnh → khoảng cách dương; trực giao / isometric / "không phối cảnh" → `-1`, ngay cả khi chỉ xoay một trục.
2. Tự động thêm phối cảnh đối với ngôn ngữ hàm ý **không gian vật lý**, **chiều sâu thực**, hoặc **đi sâu vào / nổi bật ra khỏi màn hình**. Không cần hỏi lại.
3. Đồng thời tự động thêm phối cảnh khi **chỉ có một node chỉ nhận phép xoay X hoặc Y**. Nếu không có nó, một node phẳng chỉ bị co ngắn phối cảnh (foreshorten) và hướng chiều sâu rất khó nhận biết.
4. Đối với các yêu cầu 3D mới khác, hãy hỏi ngắn gọn xem có thêm phối cảnh hay không. Cho đến khi được xác nhận, mặc định là **không phối cảnh**; riêng câu "make it 3D" hoặc "make a cube" không mặc nhiên cho phép bật phối cảnh. Nếu được yêu cầu tiếp tục mà chưa có câu trả lời, hãy tiếp tục với chế độ không phối cảnh. Giữ nguyên phép chiếu hiện có khi chỉ chỉnh sửa một cảnh đã thiết lập sẵn trừ khi người dùng yêu cầu thay đổi.

Đối với phối cảnh, hãy bắt đầu ít nhất khoảng 80% kích thước dài nhất của vật thể/cảnh; dùng khoảng cách lớn hơn để tạo hiệu ứng nhẹ nhàng hơn. Khoảng cách quá nhỏ có thể làm hình học bị biến dạng lao mạnh về phía camera. Để không có phối cảnh, hãy dùng `perspective: -1`. Một khối lập phương đầy đủ sáu mặt cần `preserve3d: true`; một khối lập phương isometric ba mặt sử dụng các mặt được tạo tư thế độc lập trong một container phẳng. Xem [công thức khối lập phương](references/cubes.md) cho cả hai cách dựng.

**Phối cảnh luôn nằm trên container.** `scene3d.perspective` là phối cảnh duy nhất mà API cung cấp; bản thân các phần tử chỉ mang góc xoay và `translateZ`. Vì vậy, một vật thể nghiêng đơn lẻ và cả một dãy thẻ xòe quạt đều được xây dựng theo cùng một cách: `scene3d` trên phần tử cha, `transform3d` trên phần tử con. Một điểm tụ dùng chung chính là thứ khiến một nhóm đọc lên như một không gian thống nhất.

### Phần tử cha có màu nền (fill)? Cô lập các phần tử con 3D (mặc định thực hiện điều này)
Bất cứ khi nào các phần tử con xoay 3D nằm bên trong một container có **fill**, KHÔNG đặt chúng trực tiếp vào trong đó. Với `scene3d.preserve3d: true` trên container đó, các phần tử con sẽ dùng chung không gian 3D của nó, khiến phần hình học đã xoay của chúng cắt *xuyên qua* mặt phẳng fill của nó — gây hiện tượng cắt xén (clipping) nhìn thấy được. Hãy cấu trúc cảnh như sau để thay thế:
- Giữ container **cha có fill** ở `scene3d.preserve3d: false`. Nó vẫn mang `perspective` — phối cảnh sẽ chiếu xuống cây con bất kể container có giữ 3D hay không.
- Bọc các phần tử con 3D vào một **frame trung gian** được đặt `scene3d.preserve3d: true`, và đặt các phần tử con đã xoay vào trong wrapper đó.

Wrapper giữ cho các phần tử con có không gian 3D chung và kết xuất phẳng lên nền fill của phần tử cha thay vì giao cắt với nó.

### Không bao giờ đặt `scene3d` perspective và `transform3d` trên cùng một layer
Giữ phối cảnh cao hơn một tầng so với thứ đang được transform: container ngoài cùng giữ `scene3d` (phối cảnh), một **frame trung gian** mang `transform3d`, và các phần tử con thực sự nằm bên trong frame đó. Nếu một node vừa có `scene3d` perspective *vừa* có `transform3d` của riêng nó, phối cảnh sẽ bị nướng (bake) vào các phần tử con *trước khi* chúng được transform — một khối lập phương khi đó sẽ render thành **hình chóp cụt (frustum)**.

## Diễn giải yêu cầu
Các cách diễn đạt phổ biến và transform tương ứng (dấu âm/dương rất quan trọng — đặt ngược dấu sẽ làm vật thể nghiêng sai hướng):
- "nghiêng ra sau" / "ngả ra sau" (cạnh trên lùi xa khỏi người xem) → `rotateX` **dương**. "Nghiêng về trước" / "hướng về phía tôi" → `rotateX` **âm**.
- "xoay sang bên" / "quay ngang" → `rotateY` (xoay quanh trục thẳng đứng).
- "parallax" / "chiều sâu phân lớp" → nhiều phần tử ở các mức `translateZ` khác nhau bên trong cùng một container `scene3d` (không phải một vật thể đơn lẻ). Khoảng cách `translateZ` càng lớn = hiệu ứng parallax càng mạnh.
- Bất cứ thứ gì **xoay bản lề quanh một cạnh hoặc góc** thay vì xoay tại chỗ — "mở như cánh cửa", "mở như trang sách", "xòe ra như cánh hoa", "mở gập", "xoay mở" — đều là công việc của `transformOrigin`. Di chuyển tâm xoay đến bản lề (ví dụ: cánh cửa → `x: 0% / y: 50%` cho cạnh trái; các trang sách → gáy sách chung; cánh hoa/quạt → điểm gốc chung), *sau đó* mới áp dụng góc xoay. Để `transformOrigin` ở giữa sẽ khiến nó xoay quanh tâm, trông giống như quay tròn hơn là mở bản lề.
- Giữ `backfaceVisible` **bật** (mặc định) cho các phần tử nghiêng thông thường. Đặt thành `false` cho các thiết kế có mặt trước/mặt sau riêng biệt hoặc các bề mặt hướng ra ngoài của một khối lập phương đặc (xem công thức khối lập phương); đừng ẩn một tấm thẻ bình thường chỉ vì nó xoay quá 90°.

## Quy trình làm việc
1. Thực hiện mọi thay đổi thiết kế tĩnh (không phải 3D) trước; không tạo hoặc xóa node trừ khi người dùng yêu cầu.
2. Thực hiện theo các quyết định ở mục *Thiết lập phối cảnh*: phối cảnh hay trực giao, sau đó xác định container nào mang `scene3d.perspective`.
3. Áp dụng phép xoay hoặc translateZ phù hợp qua `transform3d`.
4. Chỉ đặt `transformOrigin` nếu tâm xoay cần lệch khỏi chính giữa.
5. Kiểm tra kết quả: đọc lại `node.transform3d` / `node.scene3d` để xác nhận giá trị **và** xuất ảnh để xác nhận tư thế thực sự *trông* đúng — một dấu xoay bị ngược khi đọc lại giá trị vẫn bình thường nhưng lại render ngược chiều.

## Các công thức mẫu

**Một phần tử có chiều sâu** — phối cảnh đặt trên container cha, phép xoay đặt trên phần tử:
```javascript
const container = await figma.getNodeByIdAsync('123:456'); // a FRAME
const node = container.children[0];
container.scene3d = { perspective: 600, preserve3d: true };
node.transform3d = { type: 'FIXED_ORDER', translateZ: 0, rotateX: 0, rotateY: 20, rotateZ: 0 };
```

**Một cảnh đồng nhất / nhiều phần tử dùng chung chiều sâu, khi đã chọn phối cảnh** (một dãy thẻ xòe quạt, một chồng thẻ ở các độ sâu khác nhau) — một container và nhiều phần tử con. Dùng `perspective: -1` nếu phối cảnh chưa được yêu cầu hoặc xác nhận:
```javascript
const container = await figma.getNodeByIdAsync('123:456'); // a FRAME
container.scene3d = { perspective: 800, preserve3d: true };
for (let i = 0; i < container.children.length; i++) {
  const child = container.children[i];
  child.transform3d = { type: 'FIXED_ORDER', translateZ: 10 * i, rotateX: 0, rotateY: 25 * i, rotateZ: 0 };
}
```

**Vòng tròn / 3D carousel** — làm theo [công thức carousel](references/carousels.md). Xoay một khe (slot) preserve-3D trong suốt cho mỗi mục, và chỉ áp dụng `translateZ` lên mục nằm bên trong nó. Giữ phối cảnh trên cảnh nằm phía trên vòng tròn và tuân thủ các quy tắc quyết định phối cảnh ở trên.

**Khối lập phương isometric** — làm theo [công thức isometric ba mặt](references/cubes.md#isometric-cube). Sử dụng chính xác ba node hình vuông với các tư thế 3D riêng của chúng trong một frame/group phẳng, trong suốt. Dùng `perspective: -1` để không có phối cảnh và đặt các góc xoay quan sát trực tiếp lên các mặt.

**Khối lập phương đầy đủ sáu mặt hoặc sắp xếp sáu mặt đã chọn** — làm theo [công thức lắp ghép sáu mặt](references/cubes.md#assemble-six-square-faces). Lắp các mặt vuông góc trong một frame preserve-3D trong suốt, sau đó xoay frame đó để chọn góc nhìn. Bảo toàn đồ họa và các node con cháu của các mặt đã chọn; tên của chúng có thể thay đổi.

**Lật thẻ / hai mặt** — xoay quá 90° và ẩn mặt sau để mặt ngược lại không xuyên thấu qua:
```javascript
frontFace.transform3d = { type: 'FIXED_ORDER', translateZ: 0, rotateX: 0, rotateY: 0, rotateZ: 0, backfaceVisible: false };
backFace.transform3d = { type: 'FIXED_ORDER', translateZ: 0, rotateX: 0, rotateY: 180, rotateZ: 0, backfaceVisible: false };
```

## Các bẫy thường gặp
- **Opacity, blend mode, effects và clipping không render trên chính một preserve-3D frame** (trình chỉnh sửa vô hiệu hóa chúng,
  và API từ chối chúng). Các phần tử con của nó vẫn có thể nhận các thuộc tính này, trừ khi chúng cũng là preserve-3D frame, nhưng khi đó mỗi phần tử con
  tự hòa trộn độc lập, nên các phần tử con chồng lên nhau sẽ nhìn xuyên thấu qua nhau thay vì mờ dần như một khối thống nhất. Để làm mờ
  cả nhóm, hãy đặt các thuộc tính đó lên một phần tử tổ tiên có `preserve3d: false` thay thế, giữ nguyên cấu trúc phân cấp hiện có nếu có thể:
  - Nếu frame giữ phối cảnh có `preserve3d: false` và chỉ chứa nội dung cần làm mờ, hãy áp dụng lên nó, hoặc lên một wrapper bọc quanh nó.
  - Nếu không, hãy bọc riêng phần nội dung cần làm mờ vào một frame trong suốt mới (`fills = []`) tại `x = 0, y = 0` bên trong
    frame giữ phối cảnh, với chiều rộng và chiều cao bằng frame đó, và `scene3d = { ...frame.scene3d, preserve3d: false }`. Frame gốc giữ phối cảnh cho phần còn lại. Điểm tụ sẽ giữ nguyên vị trí nếu frame gốc dùng tâm phối cảnh mặc định ở giữa; tâm tùy chỉnh không thể sao chép qua API. Nếu frame đó dùng auto layout, wrapper cần
    `layoutPositioning = 'ABSOLUTE'`, việc này tách nội dung của nó ra khỏi luồng bố cục, nên chỉ làm cách này khi bố cục không phụ thuộc vào nội dung đó; nếu không hãy áp dụng lên từng phần tử con.
  - Cũng áp dụng lên từng phần tử con nếu nội dung làm mờ phải sắp xếp chiều sâu (depth-sort) cùng với nội dung 3D khác.
- `scene3d` chỉ tồn tại trên FRAME / COMPONENT / INSTANCE — đọc hoặc ghi nó trên các loại node khác không có tác dụng gì.
- Gán `transform3d` hoặc `scene3d` sẽ ghi đè toàn bộ object; hãy spread giá trị hiện tại khi chỉ chỉnh sửa một trường.
- Một phép nghiêng X/Y đơn lẻ không có phối cảnh sẽ chỉ làm co ngắn (foreshorten); hãy áp dụng các quy tắc quyết định phối cảnh, đừng áp dụng máy móc quy tắc "mọi 3D đều cần phối cảnh".
- Góc xoay tính bằng độ (degrees), không phải radian.
- Nếu `node.transform3d` đọc về `undefined`, khả năng 3D transform chưa được bật trong môi trường này. Đừng âm thầm không tạo ra gì — hãy báo cho người dùng rằng 3D transforms không khả dụng ở đây. `scene3d` chỉ tồn tại trên các container FRAME, COMPONENT và INSTANCE; `null` ở đó nghĩa là chưa cấu hình cảnh. Giá trị `undefined` của `scene3d` trên loại node khác không có nghĩa là 3D không khả dụng.
- Clipping / hai vật thể giao cắt hoặc lẹm vào nhau trong một cảnh 3D thường là vấn đề sắp xếp chiều sâu (depth-sorting). `translateZ` quyết định thứ tự chiều sâu, vì vậy hãy nhích `translateZ` của một vật thể ra ngoài (về phía người xem) để nâng nó lên gọn gàng phía trên vật thể kia. (Với trường hợp node con cắt vào *cha có fill* của nó, xem mục "Phần tử cha có màu nền (fill)? Cô lập các phần tử con 3D" ở trên.)
- `visible` nên được bật trong hầu hết các trường hợp, chỉ tắt khi người dùng muốn tạm thời ẩn hiệu ứng `transform3d` hoặc `scene3d` đó một cách tường minh (hiếm gặp).
- Không cần grep tài liệu plugin API để tìm 3D transform — hãy sử dụng skill này; các cấu trúc ở trên đã là toàn bộ bề mặt API.
