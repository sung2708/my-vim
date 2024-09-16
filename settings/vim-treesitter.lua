-- Cấu hình nvim-treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = "all", -- Hoặc chỉ định danh sách ngôn ngữ cụ thể
  sync_install = false, -- Cài đặt không đồng bộ
  highlight = {
    enable = true, -- Kích hoạt làm nổi bật cú pháp
    disable = {}, -- Các ngôn ngữ không cần làm nổi bật
    additional_vim_regex_highlighting = false, -- Không cần làm nổi bật regex thêm
  },
  indent = {
    enable = true, -- Kích hoạt tự động thụt lề
    disable = {}, -- Các ngôn ngữ không cần thụt lề tự động
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = "@argument",
        ["ia"] = "@argument.inner",
        ["al"] = "@loop",
        ["il"] = "@loop.inner",
        -- Thêm các keymaps khác nếu cần
      },
    },
  },
})
