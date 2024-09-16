-- Cấu hình luasnip
require('luasnip').setup({
  history = true, -- Lưu lịch sử snippets để sử dụng lại
  update_events = { "TextChanged", "TextChangedI" }, -- Cập nhật snippets khi thay đổi văn bản
})