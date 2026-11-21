---
name: apply-design-system
description: Rà soát thiết kế hiện có và kết nối thiết kế đó với các component của design system.
---

# Kết nối thiết kế với Design System

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [edenspiekermann/Skills](https://github.com/edenspiekermann/Skills/blob/main/skills/apply-design-system/SKILL.md) (Edenspiekermann).

Sử dụng skill này cho một thiết kế Figma hiện có cần tái sử dụng một design system đã publish thay vì các layer bị detach, local wrapper hoặc các component dùng một lần.

Skill này hỗ trợ hai chế độ đầu vào:
- `review-then-apply`: người dùng muốn rà soát tổng thể, nhưng các section vi phạm cụ thể vẫn chưa được xác định
- `apply-known-scope`: người dùng đã biết những section hoặc cụm nào cần được đưa về design system

Nạp các năng lực sau trước tiên:
- Quyền đọc Figma MCP cho các công cụ như `get_metadata`, `get_screenshot` và `search_design_system`
- Một helper kiểu `figma-use` trước bất kỳ lời gọi `use_figma` nào, khi môi trường của bạn yêu cầu
- Một workflow đồng hành xây dựng màn hình (screen-building), khi có sẵn, nếu bạn đang kết nối lại toàn bộ một màn hình hoặc trang

Không sử dụng skill này làm bước tiếp theo mặc định cho một finding đơn lẻ từ `audit-design-system`. Đối với một vấn đề cụ thể, hãy sử dụng [fix-design-system-finding](../fix-design-system-finding/SKILL.md) để giữ phạm vi ghi (write scope) ở mức hẹp.

## Quy tắc cốt lõi

Không coi một section là "đã kết nối" chỉ vì nó chứa một vài button hoặc icon từ design system.

Skill này dành cho việc đối chiếu và đồng bộ trên nhiều section (multi-section reconciliation). Nếu tác vụ có thể hoàn thành bằng cách sửa một node cụ thể đã được rà soát, skill sửa finding hẹp hơn sẽ là lựa chọn tốt hơn.

Phân loại từng section vào đúng một nhóm:
- `already-connected`: bản thân section là một library instance hoặc là một bố cục tổng hợp (composition) được người dùng chấp nhận rõ ràng là đã đạt chuẩn
- `exact-swap`: một component hoặc variant trong library đã publish có thể thay thế trực tiếp cho section đó
- `compose-from-primitives`: không có một library component đơn lẻ nào phù hợp, nhưng section có thể được dựng lại từ các primitive trong library đã publish
- `blocked`: library không cung cấp các component cần thiết, việc import thất bại hoặc section được chủ đích thiết kế riêng (bespoke)

## Workflow bắt buộc

### 1. Xác định phạm vi trước

Trước khi thu thập các ứng viên thay thế, hãy quyết định xem màn hình có cần một lượt audit ban đầu hay không.

Nếu phạm vi chưa được xác định:
1. Chạy [audit-design-system](../audit-design-system/SKILL.md) hoặc thực hiện một lượt audit nội bộ tương đương.
2. Gom kết quả rà soát thành các gói công việc theo kích thước section thay vì xử lý từng micro-finding như một tác vụ viết lại riêng lẻ.
3. Nếu kết quả rà soát chỉ ra một finding hẹp duy nhất, hãy chuyển sang [fix-design-system-finding](../fix-design-system-finding/SKILL.md) thay vì tiếp tục tại đây.

Nếu phạm vi đã được xác định, hãy tiếp tục trực tiếp.

Không bỏ qua bước khám phá component chỉ vì đã có bản rà soát. Bản rà soát chỉ xác định sự sai lệch (drift); skill này vẫn phải chọn ra các primitive và variant thay thế thực tế.

### 2. Chụp và ghi nhận trạng thái hiện tại

Trước khi ghi dữ liệu:
1. Lấy metadata của frame mục tiêu bằng `get_metadata`.
2. Chụp ảnh màn hình bằng `get_screenshot`.
3. Nếu bạn cần `get_design_context` và Figma hỏi câu hỏi về Code Connect, hãy hỏi người dùng đúng theo hướng dẫn của công cụ trước khi tiếp tục.

Với skill này, ưu tiên sử dụng `get_metadata` kết hợp `use_figma` để khám phá cấu trúc. `get_design_context` là tùy chọn trừ khi nó giúp mở khóa ngữ cảnh còn thiếu.

### 3. Sao lưu màn hình mục tiêu

Trước khi thực hiện các chỉnh sửa mang tính phá hủy, hãy nhân bản (duplicate) frame hoặc page và đặt bản sao lưu sang bên phải.

Đặt tên rõ ràng, ví dụ:
- `Backup - Start`
- `Backup - Mobile dashboard`

Thực hiện bước này trong một lời gọi `use_figma` riêng và trả về node ID đã tạo.

### 4. Kiểm kê màn hình hiện có

Kiểm tra frame mục tiêu trước khi tìm kiếm trong library.

Sử dụng `use_figma` để thu thập:
- các instance ở cấp cao nhất (top-level section instances)
- `mainComponent` của từng section
- component đó là local, remote hay bị thiếu (missing)
- các published component lồng bên trong (nested) đang được sử dụng bên trong mỗi local wrapper
- các thuộc tính text và variant đang được expose (nếu có)

Ưu tiên exact key hơn là tên. Tên chỉ mang tính gợi ý.

Mẫu kiểm kê chỉ đọc (read-only inventory) hữu ích:

```js
(async () => {
  try {
    await figma.setCurrentPageAsync(figma.root.children.find(p => p.id === "PAGE_ID"));
    const frame = await figma.getNodeByIdAsync("FRAME_ID");
    const sections = frame.findAll(n => n.type === "INSTANCE").map(inst => {
      const mc = inst.mainComponent;
      const cs = mc?.parent?.type === "COMPONENT_SET" ? mc.parent : null;
      return {
        instanceId: inst.id,
        instanceName: inst.name,
        componentName: mc?.name ?? null,
        componentKey: mc?.key ?? null,
        componentSetName: cs?.name ?? null,
        componentSetKey: cs?.key ?? null,
      };
    });
    figma.closePlugin(JSON.stringify({ createdNodeIds: [], mutatedNodeIds: [], sections }));
  } catch (e) {
    figma.closePluginWithFailure(e.message);
  }
})()
```

### 5. Xây dựng bản đồ Component từ Design System

Ưu tiên các nguồn chính thống theo thứ tự sau:
1. Các màn hình hiện có trong cùng library hoặc workfile vốn đã sử dụng hệ thống
2. Các trang library đã biết được kiểm tra trực tiếp bằng `use_figma`
3. `search_design_system` chỉ dùng làm phương án dự phòng

Khi sử dụng `search_design_system`, hãy lưu ý:
- kết quả có thể bao gồm các team library hoặc community library không liên quan
- các truy vấn rộng hữu ích cho việc khám phá, nhưng không được tin tưởng tuyệt đối nếu chưa xác minh tệp hoặc trang thực tế
- một khi đã biết đúng library, hãy ưu tiên kiểm tra trực tiếp tệp đó thay vì gọi tìm kiếm lặp đi lặp lại

Với mỗi ứng viên, hãy thu thập:
- key của component hoặc component-set
- tên chính xác của variant
- section đó là thay thế một-một (one-to-one swap) hay là một bố cục tổng hợp (composition)
- các key thuộc tính text hoặc thuộc tính nested instance cần thiết cho việc override

Không chọn mặc định một cách mù quáng variant chính hoặc variant mặc định của library.

Trước khi chọn một variant, hãy kiểm tra node gốc để tìm:
- các tín hiệu ngữ nghĩa từ tên, nội dung văn bản (copy) và ngữ cảnh sử dụng
- các tín hiệu trực quan như fills, strokes, effects, corner radius và cách xử lý typography
- các đặc điểm dạng variant đã hiển thị sẵn trên màn hình, chẳng hạn như cách thể hiện button primary so với secondary

Sau đó so sánh các tín hiệu đó với các variant hiện có của component-set và chọn phương án khớp nhất. Nếu đúng họ component (family) nhưng lựa chọn variant còn mơ hồ, hãy nêu rõ điều đó thay vì âm thầm dùng variant mặc định.

### 6. Quyết định chiến lược cho từng Section

Sử dụng các heuristic sau:

- `exact-swap` nếu một library component khớp đủ sát với vai trò và cấu trúc của section đến mức `swapComponent()` hoặc thay thế trực tiếp vẫn bảo toàn được ý đồ thiết kế.
- `compose-from-primitives` nếu section thực chất là một container bọc quanh các thành phần của library như avatar, badge, buttons, metrics hoặc nav items.
- `blocked` nếu design system thiếu tổ hợp (composite) này, library chưa được publish, việc import thất bại hoặc section cần giữ nguyên thiết kế riêng.

Các mẫu phổ biến:
- Các khối tóm tắt ở header (header summary blocks) thường là `compose-from-primitives`, không phải một component đơn lẻ.
- Alerts và metrics thường có ứng viên `exact-swap` rất rõ ràng.
- Thẻ lịch hẹn hoặc thẻ bệnh nhân thường đòi hỏi dựng tổng hợp (composition) trừ khi hệ thống có cung cấp sẵn các domain card đó.
- Thanh điều hướng dưới cùng (bottom nav bars) thường là container tùy biến được xây dựng từ các primitive nav-item.

### 7. Cập nhật từng Section một

Không bao giờ viết lại toàn bộ màn hình trong một script duy nhất.

Đối với từng section:
1. Đọc các node ID hiện tại.
2. Import hoặc xác định vị trí của library component.
3. Đối chiếu variant khớp nhất với section gốc trước khi swap hoặc dựng lại.
4. Phát hiện xem parent có sử dụng auto-layout hay không.
5. Chỉ tạo mới hoặc swap duy nhất section đó.
6. Trả về toàn bộ các node ID đã thay đổi (mutated node IDs).
7. Xác thực bằng `get_screenshot`.

Ưu tiên `swapComponent()` khi node hiện tại đã là một instance thuộc họ tương thích và bạn muốn bảo toàn các override.

Ưu tiên dựng lại bên cạnh bản gốc khi:
- section cũ là một local wrapper bọc quanh nội dung hỗn hợp
- bạn cần đối chiếu trực quan kết quả trước khi thay thế bản gốc
- bạn đang tổng hợp từ nhiều primitive

Khi parent không dùng auto-layout, hãy coi việc thay thế là một thao tác có rủi ro về bố cục (layout-risk operation).

Đối với các parent không có auto-layout:
- bảo toàn `x` và `y` một cách tường minh
- bảo toàn chiều rộng (width) và chiều cao (height) một cách tường minh khi phần thay thế cần chiếm đúng vùng không gian đó
- không giả định rằng instance mới sẽ kế thừa vị trí hoặc kích thước của node cũ
- cảnh báo người dùng rằng các parent đặt vị trí tuyệt đối (absolute-positioned) hoặc dạng group có thể gây xô lệch sau khi swap hoặc dựng lại
- chỉ đề xuất chuyển đổi parent sang auto-layout khi người dùng muốn dọn dẹp cấu trúc, không coi đó là thao tác mặc định

### 8. Xử lý lỗi Import một cách tường minh

Nếu `importComponentSetByKeyAsync()` hoặc `importComponentByKeyAsync()` thất bại hoặc quá thời gian chờ (timeout):
1. Dừng lại.
2. Không tiếp tục thực hiện các chỉnh sửa không liên quan rồi giả vờ như section đã được kết nối.
3. Kiểm tra xem các exact component key đã tồn tại ở nơi khác trong tệp mục tiêu hay chưa.
4. Nếu có thể truy cập tệp library, hãy xác minh exact component key tại đó.
5. Thử import exact component key thay cho component-set key.
6. Nếu việc import vẫn thất bại, hãy đánh dấu section là `blocked` và báo cáo rõ nguyên nhân gây nghẽn.

Coi các trường hợp sau là blocker thực sự:
- published key có tồn tại trong library nhưng quá trình import bị timeout
- `search_design_system` tìm thấy họ component, nhưng tệp mục tiêu không thể import được
- chỉ có thể import các primitive lồng bên trong, không thể import được composite mong muốn

### 9. Xác thực những gì thực sự đã thay đổi

Sau mỗi section:
- chụp ảnh screenshot phần section đã thay đổi, không chỉ toàn bộ frame
- xác nhận văn bản giữ chỗ (placeholder text) không còn
- xác nhận instance thực sự đã liên kết với một library component
- xác nhận khoảng cách (spacing) không bị lỗi hoặc thụt lùi

Ở bước cuối cùng, hãy xác thực cả ảnh chụp toàn màn hình (full screen screenshot).

## Quy tắc thực thi & viết báo cáo

- Làm việc từng bước tăng dần và luôn giữ bản sao lưu.
- Ưu tiên kiểm tra trực tiếp library hơn là kết quả tìm kiếm nhiễu.
- Ưu tiên exact component key hơn là tên.
- Khớp variant theo đúng cách thể hiện trực quan gốc, không chỉ khớp đúng họ component.
- Bảo toàn vị trí và kích thước một cách tường minh khi thay thế nội dung bên trong các parent không dùng auto-layout.
- Sử dụng bằng chứng cụ thể, rõ ràng trong báo cáo: tên node, key, họ component, và trạng thái node cuối cùng là local hay gắn với library.
- Không tuyên bố đã kết nối hoàn toàn khi kết quả vẫn chỉ là một local shell bọc quanh vài node con dùng chung.
- Nếu một section bắt buộc phải giữ thiết kế riêng, hãy nêu rõ điều đó và giải thích lý do.

## Định dạng bàn giao

Khi kết thúc tác vụ, hãy báo cáo theo cấu trúc:
- `Swapped`: các section được thay thế trực tiếp bằng library instance
- `Composed`: các section được dựng lại từ các library primitive
- `Already connected`: các section vốn đã hợp lệ từ trước
- `Blocked`: các section không thể kết nối, kèm theo lý do cụ thể

Nếu mọi thứ đều bị chặn, hãy nói thẳng điều đó và nêu rõ hình thức lỗi cụ thể thay vì đưa ra một bản tóm tắt chung chung.
