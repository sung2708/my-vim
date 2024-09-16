-- Cài đặt lspkind
require('lspkind').init({
  -- Các tùy chọn cấu hình
  mode = 'symbol', -- Thay thế các tùy chọn lỗi thời bằng `mode`
  preset = 'default',
  symbol_map = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "識",
    Variable = "",
    Class = "ﴯ",
    Interface = "ﰮ",
    Module = "",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "﬌",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "🗲",
    Operator = "",
    TypeParameter = "",
  },
})
