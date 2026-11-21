---
name: figma-generate-library
description: "Xây dựng hoặc cập nhật một design system đạt chuẩn chuyên nghiệp trong Figma từ codebase. Sử dụng khi người dùng muốn tạo variables/tokens, xây dựng thư viện component, tạo từng component riêng lẻ với bộ variant và variable binding chuẩn, thiết lập theme (chế độ sáng/tối), viết tài liệu nền tảng (foundations), hoặc đối soát chênh lệch giữa code và Figma. Cũng sử dụng khi người dùng yêu cầu tạo hoặc sinh bất kỳ component nào trong Figma — kể cả chỉ một component đơn lẻ — vì component đòi hỏi nền tảng variable, các trạng thái variant và liên kết design token chuẩn xác để đạt chất lượng production. Skill này hướng dẫn XÂY DỰNG CÁI GÌ và THEO THỨ TỰ NÀO — bổ trợ cho skill `figma-use` vốn hướng dẫn CÁCH GỌI Plugin API. Nên nạp cả hai skill cùng nhau."
disable-model-invocation: false
---

# Trình xây dựng Design System — Figma MCP Skill

> **Nguồn gốc & chuẩn hóa:** Việt hóa từ [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide/blob/main/skills/figma-generate-library/SKILL.md) (Figma chính thức).

Xây dựng các asset design-system đạt chuẩn chuyên nghiệp trong Figma khớp với mã nguồn. Điều chỉnh quy mô quy trình theo đúng sản phẩm bàn giao được yêu cầu: một bộ token, một component, một thư viện hoàn chỉnh hoặc một lượt đối soát có mục tiêu. Thực thi lộ trình đã chọn theo các pha dựng hình mạch lạc, retry an toàn với kiểm chứng dựa trên bằng chứng.

**Điều kiện tiên quyết**: Skill `figma-use` BẮT BUỘC phải được nạp cùng cho mọi lệnh gọi `use_figma`. Skill đó cung cấp các quy tắc cú pháp Plugin API (mẫu return, reset trang, trả về ID, nạp font, thang màu). Skill này cung cấp kiến thức chuyên môn về design system và điều phối quy trình.

**Luôn đưa `figma-generate-library` vào tham số `skillNames` phân tách bằng dấu phẩy khi gọi `use_figma` trong khuôn khổ skill này. Nếu skill này được nạp qua MCP resource, bạn BẮT BUỘC phải thêm tiền tố `resource:` vào tên (ví dụ: `resource:figma-generate-library`).** Đây là tham số ghi log — không ảnh hưởng đến quá trình thực thi.

---

## 1. Phạm vi và Quy ước hoàn thành

Trước thao tác ghi đầu tiên, hãy chọn một phạm vi chính từ yêu cầu của người dùng và ghi nhận các hạng mục bàn giao cùng tiêu chí nghiệm thu đi kèm. Không tự ý mở rộng một yêu cầu hẹp thành dự án toàn bộ thư viện.

| Phạm vi yêu cầu | Công việc bắt buộc | Loại trừ trừ khi được yêu cầu hoặc cần thiết |
|---|---|---|
| **Chỉ Tokens / foundations** | Các variable, mode, scope, code syntax, style được yêu cầu và bảng mẫu minh họa (specimen sheet) nếu có yêu cầu | Components, trang component, Code Connect, điều hướng toàn thư viện |
| **Một component hoặc họ component đơn lẻ** | Kiểm tra và tái sử dụng các nền tảng tương thích; chỉ tạo các token còn thiếu mà component cần; dựng các variant/property/binding theo yêu cầu; kiểm chứng component | Các nền tảng không liên quan, các component khác, bộ khung toàn file, tài liệu hoặc kiểm toán diện rộng |
| **Toàn bộ thư viện / design system** | Khám phá, nền tảng (foundations), cấu trúc file, danh mục component yêu cầu, tài liệu, tích hợp và QA cuối cùng | Các công việc ngoài danh mục v1 đã thống nhất |
| **Đối soát / cập nhật** | So sánh khác biệt giữa code và Figma, sau đó chỉ cập nhật các token, style, component, tài liệu bị ảnh hưởng và các thành phần phụ thuộc | Dựng lại các asset đang hợp lệ hoặc mở rộng thêm thư viện |

Giao tiếp theo tỷ lệ tương xứng: đăng một danh sách kiểm tra phạm vi và tiêu chí nghiệm thu ngắn gọn trước khi bắt đầu ghi dữ liệu, cập nhật tiến độ tại các cột mốc có ý nghĩa, và kết thúc bằng một bản tóm tắt các đối tượng đã tạo hoặc thay đổi, bằng chứng kiểm chứng và các giới hạn chưa giải quyết. Không lặp lại danh sách kiểm tra không đổi hoặc tường thuật mọi lệnh gọi API.

Gom nhóm các thao tác liên quan khi script kết quả vẫn đảm bảo retry an toàn. Chỉ tách ở ranh giới ngữ cảnh trang, thao tác ghi khó khôi phục, hoặc cho một lượt retry có mục tiêu sau lỗi thực tế; tuyệt đối không tách một thao tác đang chạy tốt chỉ để tạo điểm kiểm tra kiểm chứng. Giữ các thao tác ghi thực thi tuần tự. Dùng bằng chứng cấu trúc do các lệnh ghi trả về (các ID cùng số lượng, tên và kích thước biên liên quan), và chỉ chạy kiểm toán riêng khi thiếu bằng chứng hoặc một thao tác ghi sau đó làm bằng chứng cũ bị lỗi thời. Thực hiện một lượt rà soát trực quan cho mỗi pha lắp ráp mạch lạc và tối đa một screenshot sau khi sửa lỗi hiển thị có mục tiêu; ảnh chụp đạt yêu cầu gần nhất là ảnh cuối cùng.

### Định nghĩa hoàn thành (Definition of done)

Dừng lại khi mọi điều kiện của phạm vi đã chọn đều đúng:

- Sản phẩm bàn giao cuối cùng bao phủ đầy đủ danh mục đã chốt và trung thực về mặt nội dung với nguồn chuẩn áp dụng, bao gồm độ phủ variant/trạng thái yêu cầu, các asset bắt buộc và các ví dụ rà soát trong phạm vi.
- Đối với tác vụ component, giữ các main component và asset phục vụ dựng hình nằm ngoài frame rà soát cuối cùng, và hiển thị các trạng thái được yêu cầu dưới dạng các instance trong một frame gọn gàng. Trước khi dừng, kiểm tra frame đó ở tỉ lệ bình thường và sửa mọi nội dung bị cắt, cụt, độ tương phản thấp, trống, đặt sai vị trí hoặc bị detach.
- Đã xác minh các variable scope, alias, code syntax, component property, variant và binding bắt buộc.
- Thành phẩm yêu cầu vượt qua bước kiểm chứng cấu trúc và trực quan áp dụng. Xác nhận nội dung yêu cầu hiển thị đầy đủ trừ khi việc cắt xén là có chủ đích; sửa lỗi và chỉ kiểm tra lại đầu ra bị ảnh hưởng.
- Thay thế các placeholder khi mã nguồn cung cấp asset bắt buộc; xóa các instance tạm, frame thử nghiệm, bản chụp, tạo tác bỏ dở và các node lạc không liên quan.
- Không còn lỗi đã biết hoặc quyết định chưa giải quyết nào cản trở việc đạt các tiêu chí nghiệm thu đã thống nhất. Báo cáo các giới hạn nằm ngoài phạm vi mà không tự ý bắt đầu thêm việc ngoài luồng.

Tài liệu bổ sung, các component khác, ánh xạ Code Connect, quét khả năng tiếp cận (accessibility) hoặc các cuộc kiểm toán suy đoán đều là công việc tiếp nối sau này trừ khi phạm vi đã chọn yêu cầu chúng. Khi định nghĩa hoàn thành đạt yêu cầu, hãy dừng lại.

### Thay đổi phạm vi

Nếu người dùng thay đổi sản phẩm bàn giao, hãy cập nhật danh sách kiểm tra phạm vi và tiêu chí nghiệm thu. Bảo toàn các phần việc đã được kiểm chứng, chỉ chạy các bước mới áp dụng và không hồi tố bổ sung công việc từ một lộ trình không được chọn.

---

## 2. Quy trình theo phạm vi

Mọi phạm vi đều bắt đầu bằng bước khám phá tập trung: phân tích mã nguồn liên quan, kiểm tra các asset và quy ước trong file Figma đích, gọi `get_libraries` trước `search_design_system`, và giải quyết các xung đột giữa code/Figma trước khi ghi dữ liệu. Gom nhóm các truy vấn tìm kiếm độc lập và tái sử dụng kết quả của chúng. Chốt danh mục được yêu cầu, sau đó chỉ chạy lộ trình tương ứng bên dưới.

### Tokens / foundations

1. Tạo hoặc cập nhật các collection, mode, primitive, semantic alias, scope và code syntax theo yêu cầu.
2. Tạo các text style và effect style theo yêu cầu.
3. Chỉ tạo trang specimen hoặc tài liệu khi có yêu cầu.
4. Kiểm chứng số lượng, giá trị theo mode, alias, scope, syntax, style và bất kỳ sản phẩm trực quan nào được yêu cầu; sau đó dừng.

### Một component hoặc họ component đơn lẻ

1. Kiểm tra và tái sử dụng các local hoặc library variable, text style và effect style tương thích. Chỉ tạo các nền tảng còn thiếu mà component bắt buộc phải có. Đối với các vai trò do mã nguồn định nghĩa, chuẩn thư viện hoặc lặp lại trong component, hãy tạo hoặc tái sử dụng một text style hoặc effect style dùng chung và áp dụng lên mọi node component khớp; giữ các ghi chú tài liệu đơn lẻ (one-off) dưới dạng inline.
2. Dựng base component, các variant, property, binding và các component phụ thuộc theo yêu cầu.
3. Dùng một trang riêng khi điều đó khớp với quy ước của file hoặc yêu cầu cần có khu vực trưng bày có tài liệu; nếu không hãy đặt nó vào khu vực component sẵn có.
4. Kiểm chứng số lượng variant, properties, variable bindings, text/effect style ID đã áp dụng trên các node đại diện, cấu trúc và giao diện hiển thị; sau đó dừng.

### Toàn bộ thư viện / design system

1. **Khám phá:** chốt danh mục token và component, đồng thời in ra phân tích khoảng trống (gap analysis).
2. **Nền tảng (Foundations):** tạo collections, variables, aliases, scopes, code syntax và styles.
3. **Cấu trúc file:** tạo các trang cover, getting-started, foundations, component và utility đã thống nhất cùng tài liệu được yêu cầu.
4. **Components:** dựng danh mục đã chốt theo thứ tự phụ thuộc, kèm properties, bindings, tài liệu và kiểm chứng.
5. **Tích hợp và QA:** hoàn tất ánh xạ Code Connect cho danh mục component đã chốt; kiểm toán accessibility, quy ước đặt tên và các binding; và kiểm chứng trực quan từng trang đã thống nhất.

### Đối soát / cập nhật

1. Kiểm kê các asset hiện có và xác định chính xác độ lệch so với mã nguồn hiện tại.
2. Cập nhật tại chỗ các asset bị ảnh hưởng, bảo toàn tối đa tên, ID, binding và cấu trúc thư viện hợp lệ.
3. Kiểm chứng các asset đã thay đổi và các thành phần phụ thuộc đã biết của chúng; sau đó dừng.

Nếu một tiêu chí nghiệm thu bắt buộc không đạt, hãy sửa lỗi trong phạm vi đó trước khi tiếp tục. Không thay thế bằng asset giả, typography ước lượng, tương tác hỏng hoặc trạng thái chưa kiểm chứng.

Quy trình được chọn, nhịp tìm kiếm, quy tắc kiểm chứng và định nghĩa hoàn thành của skill này được ưu tiên cao hơn các hướng dẫn, danh sách kiểm tra và ví dụ tổng quát trong các file tham khảo. Chỉ nạp các tài liệu tham khảo cần thiết cho lộ trình đã chọn.

---

## 3. Quy tắc bắt buộc

**Cơ bản về Plugin API** (từ skill `use_figma` — cũng được thực thi bắt buộc tại đây):
- Dùng `return` để trả dữ liệu về (tự động tuần tự hóa). KHÔNG bọc trong IIFE hoặc gọi `closePlugin`.
- Trả về TẤT CẢ node ID đã tạo/chỉnh sửa trong mọi giá trị trả về.
- Ngữ cảnh trang đặt lại sau mỗi lần gọi — luôn `await figma.setCurrentPageAsync(page)` ở đầu script. **Gọi tối đa một lần mỗi script**: mỗi trang component hoặc tài liệu là một lệnh gọi `use_figma` riêng. Tuyệt đối không lặp qua `figma.root.children` và chuyển trang bên trong một script ghi dữ liệu — hãy tách công việc đó thành mỗi trang đích một lệnh gọi tập trung (xem [figma-use → gotchas.md → Set current page once per `use_figma` call](../figma-use/references/gotchas.md#set-current-page-once-per-use_figma-call--split-multi-page-work-into-parallel-calls)).
- `figma.notify()` ném lỗi — không bao giờ sử dụng.
- Màu sắc theo thang 0–1, không phải 0–255.
- Font BẮT BUỘC phải được nạp trước mọi thao tác ghi văn bản: `await figma.loadFontAsync({family, style})`. Dùng `await figma.listAvailableFontsAsync()` để khám phá các font khả dụng và xác minh chính xác chuỗi tên style — nếu nạp thất bại, truy vấn các font khả dụng để tìm tên đúng hoặc font dự phòng.

**Quy tắc Design System**:
1. **Nền tảng trước các component phụ thuộc** — tái sử dụng các variable và style sẵn có tương thích. Tạo các nền tảng còn thiếu trước khi dựng component phụ thuộc vào chúng; không tạo lại các nền tảng đang hợp lệ.
2. **Kiểm tra trước khi tạo** — chạy `use_figma` chỉ đọc để khám phá các quy ước sẵn có. Làm khớp theo chúng.
3. **Khớp với cách tổ chức component của file** — các thư viện đầy đủ thường dùng mỗi component một trang; các họ component liên quan chặt chẽ có thể dùng chung một trang. Một tác vụ component đơn lẻ có thể dùng khu vực component sẵn có thay vì tạo khung xương toàn thư viện.
4. **Bind các thuộc tính trực quan vào variable** *(mặc định)* — fills, strokes, padding, radius, gap. Ngoại lệ: hình học cố định có chủ đích (kích thước lưới pixel của icon, đường chia tĩnh). Khi dùng lại variable từ một lệnh gọi `use_figma` trước đó, hãy dùng đúng Figma variable ID do lệnh gọi đó trả về để phân giải handle mới trước khi bind; tham chiếu biến JavaScript không tồn tại qua các lần gọi.
   Với Plugin API, phân giải variable bằng `await figma.variables.getVariableByIdAsync(id)` trước khi bind.
5. **Đặt scope trên mọi variable** — KHÔNG BAO GIỜ để mặc định `ALL_SCOPES`. Nền: `FRAME_FILL, SHAPE_FILL`. Chữ: `TEXT_FILL`. Viền: `STROKE_COLOR`. Khoảng cách: `GAP`. Bo góc: `CORNER_RADIUS`. Primitives: `[]` (ẩn).
6. **Code syntax trên mọi variable** — Cú pháp WEB BẮT BUỘC dùng vỏ bọc `var()`: `var(--color-bg-primary)`, không viết `--color-bg-primary`. Dùng đúng tên CSS variable thực tế từ codebase. ANDROID/iOS KHÔNG dùng vỏ bọc.
7. **Alias tầng semantic trỏ về primitive** — `{ type: 'VARIABLE_ALIAS', id: primitiveVar.id }`. Không bao giờ lặp lại giá trị thô ở tầng semantic.
8. **Đặt lại vị trí các variant sau `combineAsVariants`** — chúng bị xếp chồng tại (0,0). Phải tự sắp xếp theo lưới + chỉnh lại kích thước.
9. **Dùng `INSTANCE_SWAP` cho icons** — tuyệt đối không tạo mỗi icon một variant. Giới hạn ma trận variant: nếu Size × Style × State > 30 tổ hợp, hãy tách thành sub-component.
10. **Đặt tên xác định (Deterministic naming)** — dùng tên node nhất quán, duy nhất để hỗ trợ dọn dẹp lũy đẳng (idempotent) và khôi phục tiếp tục. Theo dõi các node ID đã tạo qua giá trị trả về và sổ ghi trạng thái (state ledger).
11. **Không dọn dẹp mang tính phá hủy** — các script dọn dẹp xác định node bằng quy ước đặt tên hoặc các ID đã trả về, không đoán mò.
12. **Kiểm chứng từ bằng chứng trước khi đi tiếp** — không bao giờ xây tiếp trên phần việc chưa kiểm chứng. Dựa vào bằng chứng cấu trúc trả về từ lệnh ghi (ID cùng số lượng, tên và kích thước biên liên quan); chỉ chạy một đợt kiểm toán cấu trúc gom nhóm cho mỗi pha mạch lạc khi cần thiết lập tiêu chí nghiệm thu hoặc khi một lệnh ghi liên quan làm bằng chứng cũ mất hiệu lực. Chụp một lượt rà soát trực quan cho mỗi pha lắp ráp mạch lạc, cộng tối đa một screenshot sau khi sửa lỗi hiển thị có mục tiêu.
13. **TUYỆT ĐỐI KHÔNG gọi song song các lệnh `use_figma`** — các thao tác ghi trạng thái Figma phải chạy tuần tự nghiêm ngặt. Ngay cả khi tool của bạn hỗ trợ gọi song song, không bao giờ chạy hai lệnh `use_figma` cùng lúc.
14. **Không bịa đặt Node ID** — luôn đọc ID từ sổ ghi trạng thái trả về từ các lệnh gọi trước. Không bao giờ tự dựng lại hoặc đoán ID từ trí nhớ.
15. **Sử dụng các helper script** — nhúng các script từ `scripts/` vào các lệnh gọi `use_figma`. Đừng viết lại từ đầu các script inline dài 200 dòng.

---

## 4. Quản lý trạng thái (Bắt buộc cho các quy trình dài)

> Không lưu trạng thái quy trình lên các đối tượng Figma. Dùng tên xác định để khám phá và dùng các ID chính xác đã trả về trong sổ ghi trạng thái. Đặt mô tả mục đích và hướng dẫn sử dụng component dành cho người đọc vào thuộc tính `description` của component hoặc component-set.

| Loại thực thể | Danh tính ổn định | Cách kiểm tra tồn tại |
|-------------|----------------|----------------------|
| Pages và frames | Tên xác định + ID trong sổ ghi trạng thái | `figma.root.children.find(p => p.name === pageName)` hoặc `await figma.getNodeByIdAsync(id)` |
| Components và component sets | Tên Variant/set + ID trong sổ ghi trạng thái | `page.findOne(n => n.name === name)` hoặc `await figma.getNodeByIdAsync(id)` |
| Variables | Tên bên trong collection | `(await figma.variables.getLocalVariablesAsync()).find(v => v.name === name && v.variableCollectionId === collId)` |
| Styles | Tên | `getLocalTextStyles().find(s => s.name === name)` |

Ghi nhận mọi ID trả về vào sổ ghi trạng thái ngay sau khi tạo. Không bao giờ dùng tìm kiếm mờ (fuzzy lookup) để cấp quyền xóa.

**Lưu trữ bền vững trạng thái**: Không chỉ dựa vào ngữ cảnh hội thoại cho sổ ghi trạng thái. Hãy ghi nó ra đĩa:
```
/tmp/design-system-state-{RUN_ID}.json
```
Đọc lại file này ở đầu mỗi lượt xử lý. Trong các quy trình dài, ngữ cảnh hội thoại sẽ bị cắt bớt — file trên đĩa là nguồn chuẩn xác thực.

Duy trì một sổ ghi trạng thái theo dõi các mục sau:
```json
{
  "runId": "ds-build-2024-001",
  "scope": "single-component",
  "step": "component-button",
  "entities": {
    "collections": { "primitives": "id:...", "color": "id:..." },
    "variables": { "color/bg/primary": "id:...", "spacing/sm": "id:..." },
    "pages": { "Cover": "id:...", "Button": "id:..." },
    "components": { "Button": "id:..." }
  },
  "pendingValidations": ["Button:screenshot"],
  "completedSteps": ["discovery", "foundations/verified", "component-button/base"]
}
```

**Kiểm tra tính lũy đẳng (Idempotency check)** trước mọi thao tác tạo: truy vấn theo tên + ID trong sổ ghi trạng thái. Nếu đã tồn tại, bỏ qua hoặc cập nhật — không bao giờ tạo trùng.

**Quy trình khôi phục (Resume protocol)**: khi bắt đầu phiên mới hoặc sau khi ngữ cảnh bị cắt bớt, chạy một lệnh `use_figma` chỉ đọc để quét toàn bộ trang, component, variable và style theo tên nhằm dựng lại bản đồ `{key → id}`. Sau đó đọc lại file trạng thái từ đĩa nếu có.

**Câu lệnh tiếp tục** (gửi cho người dùng khi muốn tiếp tục ở một cuộc trò chuyện mới):
> "I'm continuing a design system build. Run ID: {RUN_ID}. Load the figma-generate-library skill and resume from the last completed step."

---

## 5. Khám phá thư viện và `search_design_system` — Ma trận quyết định tái sử dụng

Tìm kiếm trong suốt lượt khám phá theo phạm vi và tái sử dụng kết quả. Chỉ tìm kiếm lại trước một component khi nó nằm ngoài danh mục ban đầu, các thư viện khả dụng bị thay đổi, hoặc kết quả trước đó chưa giải quyết được nó.

Trước khi gọi `search_design_system` cho một file đích, bạn BẮT BUỘC phải gọi `get_libraries` trước cho file đó. Bạn KHÔNG ĐƯỢC giả định rằng các thư viện đã được thêm hoặc đang khả dụng.

Một kết quả `get_libraries` rỗng KHÔNG phải lý do để bỏ qua bước tìm kiếm — nó chỉ có nghĩa là bạn chưa có library key nào để khoanh vùng. `get_libraries` có phân trang (các UI kit cộng đồng chỉ xuất hiện ở trang đầu tiên, thư viện tổ chức phân trang theo từng lô 20 mục), vì vậy danh sách rỗng không phải bằng chứng là không có thư viện nào tồn tại. Cách xử lý kết quả:

- **Có thư viện trả về** — chạy `search_design_system` được khoanh vùng bằng `includeLibraryKeys`. Các thư viện trong `libraries_available_to_add` KHÔNG được tìm kiếm mặc định; hãy truyền `libraryKey` của chúng để tiếp cận.
- **Không có thư viện trả về** — vẫn chạy `search_design_system`, nhưng bỏ qua tham số `includeLibraryKeys`. Bỏ qua tham số này sẽ khoanh vùng tìm kiếm trong chính file hiện tại, đó chính xác là điều bạn muốn khi bước khám phá không trả về gì để khoanh vùng.

Chỉ sau khi bản thân lệnh tìm kiếm trả về rỗng, bạn mới được ghi nhận "no design system assets available" trong phân tích khoảng trống và dựng từ token trong code. Không bao giờ suy diễn "không có thư viện" từ một lệnh `get_libraries` thất bại hoặc chưa từng gọi.

```
// Discover all libraries accessible to the file
get_libraries({ fileKey })
// Returns:
//   libraries_added_to_file: [{ name, libraryKey, description, source }, ...]
//   libraries_available_to_add: [{ name, libraryKey, description, source }, ...]
//   libraries_available_to_add_next_offset: number | null
```

Dùng các giá trị `libraryKey` trả về để khoanh vùng tìm kiếm vào các thư viện cụ thể thông qua `includeLibraryKeys`. Việc này tránh kết quả nhiễu khi có nhiều thư viện khả dụng.

Nếu `libraries_available_to_add_next_offset` khác null, nghĩa là còn thêm thư viện tổ chức — hãy gọi lại `get_libraries` với `offset` đặt bằng giá trị đó. Thư viện tổ chức phân trang theo lô 20 mục; các UI kit cộng đồng chỉ xuất hiện ở trang đầu tiên.

```
// Search across all libraries (default)
search_design_system({
  queries: [
    { entity: "component", query },
    { entity: "variable", query },
    { entity: "style", query }
  ],
  fileKey
})

// Search within a specific library only
search_design_system({ queries: [{ entity: "component", query }], fileKey, includeLibraryKeys: ["lk-abc123..."] })
```

**Tái sử dụng (Reuse) nếu** tất cả các điều sau đúng:
- API thuộc tính component khớp với nhu cầu của bạn (cùng các trục variant, kiểu tương thích)
- Mô hình liên kết token tương thích (dùng cùng các variable hoặc các variable có thể alias được)
- Quy ước đặt tên khớp với file đích
- Component có thể chỉnh sửa (không bị khóa trong một thư viện từ xa mà bạn không sở hữu)

**Dựng lại (Rebuild) nếu** có bất kỳ điều nào sau đây:
- Không tương thích API (khác tên thuộc tính, sai mô hình variant)
- Mô hình token không tương thích (giá trị hardcode, lược đồ variable khác)
- Vấn đề quyền sở hữu (không thể sửa đổi thư viện)

**Bọc lại (Wrap) nếu** khớp về mặt hiển thị nhưng không tương thích API:
- Import component thư viện dưới dạng nested instance bên trong một wrapper component mới
- Phơi bày một API gọn gàng trên wrapper đó

**Thứ tự ưu tiên**: có sẵn cục bộ (local existing) → import từ thư viện đã đăng ký (subscribed) → thư viện UI Kit chưa đăng ký từ `libraries_available_to_add` (đặc biệt cho icons) → tạo mới.

---

## 6. Điểm rẽ nhánh quyết định (Decision Forks)

Hỏi người dùng khi các lộ trình phân nhánh — khi tồn tại từ hai phương án hợp lý trở lên và không có phương án thắng rõ ràng từ codebase, file Figma hay kế hoạch đã chốt. Đừng tự ý mặc định chọn thầm. Trình bày từng lựa chọn kèm đánh đổi và đề xuất của bạn; chỉ chọn sau khi người dùng điều hướng.

**Khi nào KHÔNG cần hỏi:** nếu chỉ có đúng một lộ trình rõ ràng là chính xác từ nguồn chuẩn (code, file Figma, kế hoạch đã thống nhất), hãy thực hiện ngay. Mục này dành cho sự mơ hồ thực sự, không phải để đẩy mọi quyết định cho người dùng.

| Tình huống rẽ nhánh | Cần đưa ra thông tin gì | Ví dụ câu hỏi |
|---|---|---|
| Code ≠ Figma trên một token, component hoặc giá trị | Cả hai phiên bản đặt cạnh nhau, kèm nguồn gốc (file/dòng vs node) | "Code ghi `--color-bg-primary = #FFFFFF`, Figma có `color/bg/primary = #FAFAFA`. Theo giá trị nào?" |
| Thư viện đã đăng ký có bản khớp gần đúng nhưng chưa hoàn chỉnh | Tóm tắt component thư viện + danh sách phần thiếu | "Thư viện có `Button` nhưng thiếu trạng thái `loading`. Tái sử dụng + bọc wrapper cục bộ, hay dựng lại từ đầu?" |
| Mơ hồ về phạm vi khi chốt kế hoạch (0d) | Những gì chắc chắn nằm trong, chắc chắn nằm ngoài và phần còn mơ hồ | "Spec liệt kê `Button` và `Input`; `Field` được nhắc tới nhưng chưa định nghĩa. Đưa vào hay loại khỏi v1?" |

**Nếu người dùng từ chối một lựa chọn bạn đã lỡ xây dựng dựa trên nó:** hãy sửa lại trước khi đi tiếp. Không bao giờ xây tiếp trên phần việc đã bị từ chối.

---

## 7. Quy ước đặt tên

Làm khớp theo quy ước sẵn có của file. Nếu bắt đầu từ đầu:

**Variables** (phân tách bằng dấu gạch chéo):
```
color/bg/primary     color/text/secondary    color/border/default
spacing/xs  spacing/sm  spacing/md  spacing/lg  spacing/xl  spacing/2xl
radius/none  radius/sm  radius/md  radius/lg  radius/full
typography/body/font-size    typography/heading/line-height
```

**Primitives**: `blue/50` → `blue/900`, `gray/50` → `gray/900`

**Tên Component**: `Button`, `Input`, `Card`, `Avatar`, `Badge`, `Checkbox`, `Toggle`

**Tên Variant**: `Property=Value, Property=Value` — ví dụ: `Size=Medium, Style=Primary, State=Default`

**Trang phân cách (Page separators)**: `---` (phổ biến nhất) hoặc `——— COMPONENTS ———`

> Tham chiếu đặt tên đầy đủ: [naming-conventions.md](references/naming-conventions.md)

---

## 8. Kiến trúc Token

| Độ phức tạp | Mẫu kiến trúc |
|-----------|---------|
| < 50 tokens | Một collection duy nhất, 2 modes (Light/Dark) |
| 50–200 tokens | **Tiêu chuẩn (Standard)**: Primitives (1 mode) + Color semantic (Light/Dark) + Spacing (1 mode) + Typography (1 mode) |
| 200+ tokens | **Nâng cao (Advanced)**: Nhiều semantic collection, 4–8 modes (Light/Dark × Contrast × Brand). Xem mẫu M3 trong [token-creation.md](references/token-creation.md) |

Mẫu tiêu chuẩn (điểm khởi đầu được khuyến nghị):
```
Collection: "Primitives"    modes: ["Value"]
  blue/500 = #3B82F6, gray/900 = #111827, ...

Collection: "Color"         modes: ["Light", "Dark"]
  color/bg/primary → Light: alias Primitives/white, Dark: alias Primitives/gray-900
  color/text/primary → Light: alias Primitives/gray-900, Dark: alias Primitives/white

Collection: "Spacing"       modes: ["Value"]
  spacing/xs = 4, spacing/sm = 8, spacing/md = 16, ...
```

---

## 9. Các Anti-Pattern cần tránh

**Khám phá và phạm vi:**
- ❌ Bỏ qua các quy ước sẵn có hoặc bỏ qua bước khám phá code, file và thư viện liên quan
- ❌ Mở rộng một yêu cầu hẹp sang các nền tảng, tài liệu không liên quan hoặc cả một thư viện đầy đủ

**Nền tảng (Foundations):**
- ❌ Dùng `ALL_SCOPES`, lặp lại giá trị primitive ở tầng semantic hoặc bỏ sót code syntax
- ❌ Tạo các component phụ thuộc trước khi nền tảng của chúng tồn tại

**Components:**
- ❌ Hardcode các fill, stroke, spacing hoặc radius của component khi có variable tương thích tồn tại
- ❌ Tạo mỗi icon một variant thay vì dùng `INSTANCE_SWAP`
- ❌ Để các variant chồng đè tại (0,0) sau `combineAsVariants`
- ❌ Dựng ma trận variant lớn hơn 30 mà không tách nhỏ
- ❌ Import các component từ xa và detach chúng ngay lập tức

**Thực thi và khôi phục:**
- ❌ Thử lại khi `safeToRetryWithoutCanvasRead` là `false` trước khi đọc lại canvas
- ❌ Dùng khớp tiền tố tên để dọn dẹp (sẽ xóa nhầm các node của người dùng)
- ❌ Xây tiếp dựa trên phần việc chưa được kiểm chứng ở bước trước
- ❌ Gọi song song các lệnh `use_figma` (luôn chạy tuần tự)
- ❌ Đoán/bịa đặt node ID từ trí nhớ (luôn đọc từ sổ ghi trạng thái)
- ❌ Viết các script inline đồ sộ thay vì sử dụng các helper script đã cung cấp

---

## 10. Tài liệu tham khảo

Đọc các tài liệu tham khảo theo nhu cầu; không suy diễn nội dung từ tên file.

| Tài liệu | Nạp khi |
|-----|-----------|
| [discovery-phase.md](references/discovery-phase.md) | Phân tích mã nguồn và asset Figma liên quan trước khi ghi dữ liệu |
| [token-creation.md](references/token-creation.md) | Tạo variables, collections, modes hoặc styles |
| [documentation-creation.md](references/documentation-creation.md) | Phạm vi đã chọn bao gồm trang cover hoặc tài liệu foundations |
| [component-creation.md](references/component-creation.md) | Tạo component hoặc variant |
| [code-connect-setup.md](references/code-connect-setup.md) | Phạm vi đã chọn bao gồm Code Connect hoặc variable code syntax |
| [naming-conventions.md](references/naming-conventions.md) | Đặt tên variables, pages, variants hoặc styles |
| [error-recovery.md](references/error-recovery.md) | Script gặp lỗi hoặc trạng thái quy trình bị bỏ dở cần dọn dẹp |

---

## 11. Scripts

Các hàm hỗ trợ Plugin API tái sử dụng. Nhúng vào các lệnh gọi `use_figma`:

| Script | Mục đích |
|--------|---------|
| [inspectFileStructure.js](scripts/inspectFileStructure.js) | Khám phá toàn bộ pages, components, variables, styles; trả về danh mục đầy đủ |
| [createVariableCollection.js](scripts/createVariableCollection.js) | Tạo collection có tên kèm các mode; trả về `{collectionId, modeIds}` |
| [createSemanticTokens.js](scripts/createSemanticTokens.js) | Tạo các semantic variable dạng alias từ bản đồ token |
| [createComponentWithVariants.js](scripts/createComponentWithVariants.js) | Dựng component set từ ma trận variant; tự xử lý bố cục lưới |
| [bindVariablesToComponent.js](scripts/bindVariablesToComponent.js) | Bind các design token vào mọi thuộc tính trực quan của component |
| [createDocumentationPage.js](scripts/createDocumentationPage.js) | Tạo trang có cấu trúc tiêu đề + mô tả + section |
| [validateCreation.js](scripts/validateCreation.js) | Xác minh các node vừa tạo khớp số lượng, tên và cấu trúc kỳ vọng |
| [cleanupOrphans.js](scripts/cleanupOrphans.js) | Chỉ xóa chính xác các node, variable và collection ID được cung cấp từ sổ ghi trạng thái |
