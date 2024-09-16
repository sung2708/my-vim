-- Cấu hình nvim-treesitter-textobjects
require('nvim-treesitter.configs').setup({
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Nhìn trước để cải thiện chọn các đối tượng
      keymaps = {
        ["aa"] = "@parameter.outer", -- Chọn đối tượng parameter.outer
        ["ia"] = "@parameter.inner", -- Chọn đối tượng parameter.inner
        ["af"] = "@function.outer", -- Chọn đối tượng function.outer
        ["if"] = "@function.inner", -- Chọn đối tượng function.inner
        ["ac"] = "@class.outer", -- Chọn đối tượng class.outer
        ["ic"] = "@class.inner", -- Chọn đối tượng class.inner
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Thiết lập điểm nhảy cho các thao tác di chuyển
      goto_next_start = {
        ["]m"] = "@function.outer", -- Di chuyển đến đối tượng function.outer tiếp theo
        ["]c"] = "@class.outer", -- Di chuyển đến đối tượng class.outer tiếp theo
      },
      goto_next_end = {
        ["]M"] = "@function.outer", -- Di chuyển đến cuối đối tượng function.outer tiếp theo
        ["]C"] = "@class.outer", -- Di chuyển đến cuối đối tượng class.outer tiếp theo
      },
      goto_previous_start = {
        ["[m"] = "@function.outer", -- Di chuyển đến đối tượng function.outer trước đó
        ["[c"] = "@class.outer", -- Di chuyển đến đối tượng class.outer trước đó
      },
      goto_previous_end = {
        ["[M"] = "@function.outer", -- Di chuyển đến cuối đối tượng function.outer trước đó
        ["[C"] = "@class.outer", -- Di chuyển đến cuối đối tượng class.outer trước đó
      },
    },
  },
})
