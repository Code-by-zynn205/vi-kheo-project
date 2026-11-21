---
name: figma-swiftui
description: "Chuyển đổi hai chiều SwiftUI ↔ Figma. Sử dụng bất cứ khi nào người dùng đề cập đến Swift, SwiftUI, iOS, iPhone hoặc iPad — theo BẤT KỲ chiều nào — chuyển đổi thiết kế Figma sang SwiftUI (design → code), hoặc đẩy các view / màn hình / token SwiftUI ngược lại vào file Figma (code → design). Kích hoạt với các cụm từ như 'implement this Figma design in SwiftUI', 'build this screen in Swift', 'push this SwiftUI view to Figma', 'mirror my Swift code in a Figma file', hoặc bất cứ khi nào một URL Figma xuất hiện cùng các file `.swift` / một `.xcodeproj`. Điều hướng đến tài liệu tham khảo theo từng chiều cụ thể; tải cùng lúc với `figma-use` cho chiều code → design."
disable-model-invocation: false
---

# Figma ↔ SwiftUI

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-swiftui/SKILL.md) (Figma chính thức).

Chuyển đổi giữa thiết kế Figma và mã SwiftUI theo cả hai chiều. File này đóng vai trò điều hướng — hướng dẫn chi tiết nằm trong các tài liệu tham khảo bên dưới.

## Chọn chiều chuyển đổi

| Chiều | Tác nhân kích hoạt | Tài liệu tham khảo |
|---|---|---|
| **Design → code** | Người dùng muốn tạo mã SwiftUI trong dự án iOS từ một file/frame Figma | [references/design-to-code.md](references/design-to-code.md) |
| **Code → design** | Người dùng muốn đẩy các view / màn hình / token SwiftUI vào một file Figma | [references/code-to-design.md](references/code-to-design.md) |

Nếu yêu cầu mơ hồ — có cả URL Figma và các file `.swift` cùng xuất hiện mà không có động từ làm rõ hướng — hãy hỏi người dùng xem muốn chuyển theo chiều nào trước khi tải tài liệu tham khảo.

## Ngữ cảnh dùng chung (áp dụng cho cả hai chiều)

Các điểm sau luôn đúng bất kể chiều chuyển đổi nào; các tài liệu tham khảo theo từng chiều đều mặc định dựa trên những quy tắc này.

1. **`get_design_context` là công cụ đọc dành cho Figma.** Truyền `clientLanguages: "swift"` và `clientFrameworks: "swiftui"` để phản hồi được định hình theo ngữ cảnh Swift. URL → tham số công cụ: `figma.com/design/:fileKey/:fileName?node-id=:nodeId` → dùng `fileKey`, thay `-` bằng `:` trong `nodeId`. Với `figma.com/design/:fileKey/branch/:branchKey/:fileName`, dùng `branchKey` làm `fileKey`.
2. **Mã React+Tailwind trong đầu ra của `get_design_context` chỉ là tham chiếu cấu trúc, không phải nguồn chép nguyên văn.** Nó chỉ mô phỏng gần đúng phần nhìn. Không bao giờ chuyển dịch nguyên xi các chuỗi `position: absolute` / frame theo pixel / `mix-blend-mode` vào SwiftUI hoặc vào Figma — ảnh chụp màn hình là nguồn chân lý ở cả hai chiều.
3. **Màu ngữ nghĩa iOS HIG là token, không phải mã hex.** `var(--backgrounds/primary, …)`, `var(--labels/secondary, …)`, `var(--separators/non-opaque, …)` v.v. ánh xạ sang `Color(.systemBackground)`, `Color.secondary`, `Color(.separator)` trong SwiftUI, và sang các variable trong một collection ngữ nghĩa ở Figma. Giữ nguyên ánh xạ này; bỏ qua giá trị RGBA cứng.
4. **SF Symbols chuyển đổi qua lại bằng tên ở cả hai chiều — không bao giờ dùng codepoint.** Design → code: `get_design_context` thay thế các chuỗi glyph SF Symbol của Figma trở lại thành các thẻ bọc `<SFSymbol>{Image(systemName: "...")}</SFSymbol>` trong phản hồi. Hãy dùng nguyên văn các tên đó. Code → design: gọi `figma.util.getSfSymbolCharacter(name)` bên trong `use_figma` để chuyển tên symbol sang ký tự tương ứng — không bao giờ tự tra cứu codepoint thủ công.
5. **Nhận diện pattern iOS nền tảng, không bám theo tên node / view theo nghĩa đen.** Những pattern giống nhau lặp lại ở cả hai chiều: tiêu đề lớn + dấu chevron quay lại + hành động bên phải = khung `NavigationStack`; hàng dưới cùng gồm các cặp icon+nhãn = `TabView`; các hàng lặp lại có cùng chiều cao kèm thành phần đầu/cuối = `List`. Hãy khớp với các system pattern đó thay vì dựng lại chúng từ các thành phần cơ bản.
6. **Đối với chiều code → design, `use_figma` là API chính.** Luôn tải [`figma-use`](../figma-use/SKILL.md) trước mọi lần gọi `use_figma`. Nếu tác vụ liên quan đến xây dựng một màn hình hoàn chỉnh, hãy tải thêm [`figma-generate-design`](../figma-generate-design/SKILL.md); nếu liên quan đến xây dựng component hoặc design system, hãy tải thêm [`figma-generate-library`](../figma-generate-library/SKILL.md).

## Tài liệu tham khảo

| Tài liệu | Khi nào cần tải |
|---|---|
| [references/design-to-code.md](references/design-to-code.md) | Chuyển đổi một thiết kế / frame Figma sang SwiftUI |
| [references/code-to-design.md](references/code-to-design.md) | Đẩy các view / màn hình / token SwiftUI vào Figma |
