---
name: figma-use-motion
description: "Ngữ cảnh motion / animation cho công cụ MCP `use_figma` — tạo chuyển động cho các node Figma thông qua keyframe thủ công, animation style, easing và thời lượng timeline. Tải cùng lúc với figma-use bất cứ khi nào tác vụ liên quan đến việc thêm, chỉnh sửa hoặc kiểm tra animation trên một node. Cũng bao gồm thao tác với custom animation style."
disable-model-invocation: false
---

# use_figma — Skill Figma Plugin API cho Motion

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-use-motion/SKILL.md) (Figma chính thức).

Ngữ cảnh motion cho công cụ MCP `use_figma`. [figma-use](../figma-use/SKILL.md) bao phủ các quy tắc nền tảng của Plugin API — hãy tải cả hai cùng nhau.

**Luôn truyền `skillNames: "figma-use-motion"` (phân tách bằng dấu phẩy cùng với `figma-use`) khi gọi `use_figma` cho công việc motion.** Chỉ phục vụ mục đích ghi log.

## Kiểm soát khả dụng Runtime

Các Motion API có thể chưa được bật cho người dùng đang gọi. Khi không khả dụng, mọi thuộc tính và hàm hỗ trợ motion được nhắc đến trong skill này sẽ ném lỗi `"<name>" is not a supported API`.

**Thoát nhanh khi gặp lỗi đó.** Không thử lại; hãy báo cho người dùng rằng motion chưa được bật cho tài khoản của họ và dừng lại. Nếu không bạn sẽ lãng phí lượt gọi và gây nhầm lẫn cho người dùng với các lỗi lặp đi lặp lại giống nhau.

Custom animation style có thể không được bật ngay cả khi các Motion API khác hoạt động. Xem [motion-custom-styles.md](references/motion-custom-styles.md) để biết cách kiểm tra khả dụng và hướng dẫn phương án dự phòng.

Các keyframe 3D yêu cầu cả Motion API và 3D Transform API đều phải được bật. Đối với nghiêng 3D chuyển động, lật thẻ, chiều sâu hoặc phối cảnh, và cho phép xoay ngả ra sau, chúi về trước, hướng về phía hoặc ra xa người xem (3D `TRANSFORM_3D_ROTATION_X` / `_Y`, không phải `ROTATION` 2D phẳng), hãy tải [3d-transforms.md](references/3d-transforms.md) và skill `figma-3d-transforms` khi khả dụng. Thiết lập cảnh tĩnh trước; chuyển động 2D thông thường không yêu cầu quyền truy cập 3D.

Khám phá `TextStagger` thông qua `figma.motion.figmaAnimationStyles()` trước khi áp dụng nó. Nếu không có, hãy giải thích rằng text motion không khả dụng trong phiên này; không vượt rào cơ chế khám phá hoặc âm thầm thay thế bằng motion cho toàn bộ layer.

## Khi nào sử dụng skill này

Tải skill này bất cứ khi nào một tác vụ `use_figma` liên quan đến:

- Thêm, chỉnh sửa hoặc xóa keyframe trên một node (`manualKeyframeTracks`, `applyManualKeyframeTrack`, `removeManualKeyframeTrack`).
- Tạo chuyển động cho màu fill hoặc stroke theo thời gian.
- Áp dụng, chỉnh sửa hoặc xóa animation style (`applyAnimationStyle`, `removeAnimationStyle`, `animationStyles`).
- Khám phá, tạo mới, chỉnh sửa, sắp xếp, áp dụng hoặc xóa **local custom animation styles** — các style chuyển động có tên tái sử dụng được lưu trong file (`figma.getLocalCustomAnimationStylesAsync`, `figma.createCustomAnimationStyle`).
- Tạo animation cho ký tự, từ, dòng hoặc đoạn văn trong văn bản có thể chỉnh sửa, bao gồm hiệu ứng gõ chữ (typewriter) và chỉnh sửa các style bên trong một text animation. Tải [text-animation.md](references/text-animation.md) trước khi viết code.
- Đọc hoặc ghi thời lượng timeline thông qua `node.timelines` / `node.setTimelineDuration(id, seconds)`.
- Chọn easing cho bất kỳ tác vụ nào kể trên.

Công việc thiết kế tĩnh (tạo hình khối, component, variable, bố cục) chỉ đi qua [figma-use](../figma-use/SKILL.md) — skill này chỉ dành riêng cho chiều thời gian.

## Bề mặt Motion API được cung cấp

- `node.manualKeyframeTracks` — đọc/ghi các keyframe thủ công (bao gồm track fill, stroke và effect).
- `node.applyManualKeyframeTrack(field, track)` / `node.removeManualKeyframeTrack(field)` — thêm, thay thế hoặc xóa một track keyframe thủ công mà không cần ghi đè toàn bộ object.
- `node.animationStyles` — đọc/ghi metadata của animation-style được áp dụng cho một node.
- `node.applyAnimationStyle(styleId, presetData?)` / `node.removeAnimationStyle(id)` — áp dụng một style đã khám phá và xóa một instance style đã áp dụng bằng `id` được trả về/đọc lại.
- `node.timelines` — danh sách timeline chỉ đọc của top-level frame chứa node, với thời lượng tính bằng giây.
- `node.setTimelineDuration(id, durationSeconds)` — ghi thời lượng timeline của top-level frame chứa node.
- `node.animations` — dữ liệu keyframe đã phân giải ở chế độ chỉ đọc (hiện tại chỉ hỗ trợ manual track — xem [motion-patterns.md](references/motion-patterns.md)).
- `figma.motion.figmaAnimationStyles()` — danh sách chỉ đọc các định nghĩa animation style chính thức của Figma.
- Nhiều API khác phục vụ làm việc với custom animation style, xem [motion-custom-styles.md](references/motion-custom-styles.md)

Việc tự viết mã nguồn cho module preset `"figma:motion"` tùy chỉnh nằm ngoài phạm vi hỗ trợ. Việc cấu hình các style Position, Rotation, Scale, Opacity và Blur bên trong một `TextStagger` đã khám phá thì được hỗ trợ; đây là các thuộc tính của một preset gốc, không phải mã nguồn preset mới. Nếu yêu cầu đòi hỏi tạo mới một module preset, hãy giải thích giới hạn đó; không tự bịa ra.

## Tài liệu tham khảo

Tải các tài liệu sau khi cần dựa trên nội dung tác vụ:

| Tài liệu | Khi nào cần tải | Nội dung bao gồm |
|-----|-------------|----------------|
| [motion-patterns.md](references/motion-patterns.md) | Thêm/chỉnh sửa animation chuyển động | Keyframe thủ công, fill/stroke chuyển động, áp dụng animation style, thời lượng timeline |
| [3d-transforms.md](references/3d-transforms.md) | Tạo chuyển động nghiêng 3D, lật, chiều sâu hoặc phối cảnh | Tính khả dụng 3D riêng biệt, thiết lập cảnh tĩnh, các trường keyframe bị giới hạn |
| [motion-custom-styles.md](references/motion-custom-styles.md) | Mọi thao tác với motion style có tên tái sử dụng | Khám phá, tạo mới, chỉnh sửa, sắp xếp, áp dụng, xóa và xác minh local custom animation styles |
| [text-animation.md](references/text-animation.md) | Tạo/chỉnh sửa hiệu ứng hiện chữ, kiểu máy đánh chữ hoặc chữ chạy so le | `TextStagger` gốc, nhóm/thứ tự, các text style kết hợp, timing, chỉnh sửa/xóa, bảo toàn văn bản có thể sửa |
| [motion-easing.md](references/motion-easing.md) | Thiết lập easing cho animation | Các đối tượng easing keyframe, custom cubic/spring, `HOLD`, áp dụng easing bên trong animation style |

## Kiểm chứng animation

`get_screenshot` chỉ hiển thị **trạng thái nghỉ** của timeline, không bao giờ hiển thị chuyển động. Để kiểm tra chuyển động, hãy dùng `export_video` và trích xuất khung hình — nhưng thao tác này render phía server nên **chậm và tốn tài nguyên (~10 giây đến vài phút)**, vì vậy hãy tận dụng tối đa mỗi lần render.

**Lập kế hoạch trước khi render — chi phí tỷ lệ thuận với số pixel × số khung hình, nên hãy giữ cả hai không lớn hơn mức khung hình cần thiết:**

1. **Chọn các thời điểm trước.** Bạn chỉ cần một khung hình cho mỗi *giai đoạn* (ví dụ: mỗi bước stagger, hoặc bắt đầu / giữa / ổn định), không cần phát mượt mà — thường là 4–6 khung hình. Số lượng này quyết định `fps` của bạn.
2. **Chọn kích thước vừa đủ để đọc.** Bắt đầu ở mức nhỏ — `constraint: { type: 'WIDTH', value: 320 }`, `quality: "low"` — nhưng văn bản và chi tiết nhỏ sẽ bị mờ ở mức đó, nên hãy tăng `WIDTH` (768+) khi bạn cần đánh giá chi tiết tinh vi. Bỏ qua `constraint` = kích thước đầy đủ (1x; server giới hạn tối đa 10x / 4096px).
3. **Đặt `fps` vừa đủ cao để bắt trúng các khung hình đó:** `fps: 5` bao phủ một vài điểm; 10 là giới hạn trên. Cao hơn chỉ làm phình to quá trình render.

**Cơ chế:** `export_video` chỉ hoạt động trên một **top-level frame** có các node con mang animation (truyền frame đó vào, không truyền node con cháu bạn đã gắn keyframe). Công cụ trả về một `jobId` với `status: "processing"` — gọi lại với `{ fileKey, jobId }` để kiểm tra tiến độ. Sau đó trích xuất khung hình cục bộ bằng `ffmpeg -ss <t> -i anim.mp4 -frames:v 1 frame_<t>.png` — việc trích xuất là miễn phí, nên một khi đã trả chi phí render, hãy khai thác mọi khung hình mang lại thông tin thay vì export lại. Nếu không có công cụ trích xuất khung hình như `ffmpeg`, hãy bỏ qua bước export và suy luận trực tiếp trên các keyframe.

**Lặp lại cho đến khi chuẩn xác.** Bản export là công cụ chẩn đoán, không phải thủ tục xác nhận cho xong: nếu các khung hình bị sai (sai thứ tự, lệch timing, thiếu phần tử, mask che mất toàn bộ ảnh ghép), hãy sửa keyframe/style và export lại. Đọc *tất cả* các khung hình và gộp mọi bản sửa lỗi vào một lượt trước khi render lại — mỗi lần render đều có chi phí thực tế, vì vậy hãy làm cho mỗi lần render thật đáng giá thay vì export lại sau từng thay đổi nhỏ.

Bỏ qua hoàn toàn bước export cho các thay đổi nhỏ hoặc hiển nhiên.

## Danh sách kiểm tra tiền điều kiện

Ngoài [danh sách kiểm tra tiền điều kiện của figma-use](../figma-use/SKILL.md#8-pre-flight-checklist), hãy xác minh:

- [ ] Easing sử dụng đúng dạng công khai `{ type: 'EASE_OUT', easingFunctionCubicBezier?: …, easingFunctionSpring?: … }` — không dùng tên scenegraph nội bộ như `OUT_CUBIC`.
- [ ] Ease-in-out sử dụng chính xác enum công khai `EASE_IN_AND_OUT` (hoặc `EASE_IN_AND_OUT_BACK`); không bao giờ xuất alias không hợp lệ `EASE_IN_OUT`.
- [ ] Node được tạo animation không phải là top-level frame (con trực tiếp của trang). Hãy tạo animation cho các node con cháu thay thế.
- [ ] Giá trị timeline tính bằng giây trong Plugin API công khai. Mở rộng qua `setTimelineDuration`; không bao giờ rút ngắn trừ khi người dùng yêu cầu.
- [ ] Chuyển động bên trong văn bản sử dụng `TextStagger` đã khám phá trên text node hiện có. Bảo toàn ký tự, định dạng, ngắt dòng và các animation không liên quan; `duration` của nó là tổng khoảng thời gian stagger, không phải thời gian cho mỗi ký tự.
- [ ] Các trường keyframe transform sử dụng tên công khai (`TRANSLATION_X`, `TRANSLATION_Y`, `ROTATION`, `SCALE_X`, `SCALE_Y`, `SCALE_XY`), không dùng tên scenegraph nội bộ `MOTION_*`.
- [ ] Các trường keyframe thủ công lấy từ danh sách cho phép công khai trong [motion-patterns.md](references/motion-patterns.md#animatable-fields); các trường scenegraph được sinh/nội bộ cố tình ném lỗi.
- [ ] Trả về ID của các node đã thay đổi (theo Quy tắc 15 của `figma-use`).
- [ ] Khi tính đúng đắn của motion chưa hiển nhiên và có sẵn công cụ trích xuất khung hình (`ffmpeg`), hãy xác minh qua `export_video` + lấy mẫu khung hình — render kích thước nhỏ, `fps` thấp, lặp lại cho đến khi đúng (xem mục Kiểm chứng animation ở trên). `get_screenshot` chỉ hiển thị trạng thái nghỉ.
