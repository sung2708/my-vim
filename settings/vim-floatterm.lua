-- Floaterm configuration
vim.g.floaterm_direction = 'float'
vim.g.floaterm_float_opts = {
    border = "rounded",
    width = 0.9,
    height = 0.9,
    winblend = 3,
}

-- Key mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>FloatermNew<CR>', opts)  -- Open new floaterm
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>FloatermToggle<CR>', opts) -- Toggle floaterm
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>FloatermKill<CR>', opts)   -- Kill floaterm

-- Key mappings for terminal mode
vim.api.nvim_set_keymap('t', '<leader>g', [[<C-\><C-n>:FloatermToggle<CR>]], opts) -- Toggle floaterm in terminal
vim.api.nvim_set_keymap('t', '<leader>k', [[<C-\><C-n>:FloatermKill<CR>]], opts)