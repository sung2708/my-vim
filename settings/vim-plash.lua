local flash = require("flash")

-- Cấu hình cơ bản cho Flash
flash.setup({
  -- Thời gian hiển thị Flash, tính bằng mili giây
  timeout = 1000,  -- Thay đổi tùy theo sở thích cá nhân

  -- Hiệu ứng Flash (mặc định là fade)
  styles = {
    jump = "flash_jump",          -- Hiệu ứng cho nhảy đến vị trí
    treesitter = "flash_treesitter", -- Hiệu ứng cho Treesitter tìm kiếm
    remote = "flash_remote",        -- Hiệu ứng cho tìm kiếm từ xa
    search = "flash_search",        -- Hiệu ứng cho tìm kiếm chung
  },

  -- Cấu hình khác có thể tùy chỉnh thêm
  -- ...
})

-- Cấu hình các phím tắt cơ bản cho Flash
vim.api.nvim_set_keymap("n", "s", [[:lua require("flash").jump()<CR>]], { noremap = true, silent = true, desc = "Flash: Nhảy đến vị trí" })
vim.api.nvim_set_keymap("n", "S", [[:lua require("flash").treesitter()<CR>]], { noremap = true, silent = true, desc = "Flash: Treesitter" })
vim.api.nvim_set_keymap("o", "r", [[:lua require("flash").remote()<CR>]], { noremap = true, silent = true, desc = "Flash: Tìm kiếm từ xa" })
vim.api.nvim_set_keymap("o", "R", [[:lua require("flash").treesitter_search()<CR>]], { noremap = true, silent = true, desc = "Flash: Tìm kiếm Treesitter" })
vim.api.nvim_set_keymap("c", "<c-s>", [[:lua require("flash").toggle()<CR>]], { noremap = true, silent = true, desc = "Flash: Bật/Tắt tìm kiếm" })
