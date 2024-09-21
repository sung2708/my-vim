vim.g.floaterm_direction = 'float'        -- Floating terminal
vim.g.floaterm_float_opts = {
  border = "rounded",                     -- Border style
  width = 0.9,                            -- Width of the floating window
  height = 0.9,                           -- Height of the floating window
  winblend = 3,                           -- Transparency level
}

-- Key mappings
local opts = { noremap = true, silent = true }

local opts = { noremap = true, silent = true }

-- Open new floaterm with <leader>t
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>FloatermNew<CR>', opts)
-- Toggle floaterm with <leader>g
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>FloatermToggle<CR>', opts)
-- Kill floaterm with <leader>k
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>FloatermKill<CR>', opts)
