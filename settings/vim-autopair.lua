-- Cấu hình cho nvim-autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt", "vim" },  -- Không kích hoạt cho các file loại này
  enable_check_bracket_line = true,  -- Kiểm tra dấu ngoặc trong cùng một dòng
  check_ts = true,  -- Kiểm tra Tree-sitter để thêm cặp ngoặc
})

-- Nếu bạn sử dụng nvim-cmp để hoàn thành tự động, tích hợp với nvim-autopairs
local npairs = require('nvim-autopairs')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())