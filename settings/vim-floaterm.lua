-- Cài đặt floaterm
vim.g.floaterm_open_mapping = '<c-\\>'
vim.g.floaterm_shade_filetypes = {}
vim.g.floaterm_shade_terminals = 1
vim.g.floaterm_shading_factor = 2
vim.g.floaterm_start_in_insert = 1
vim.g.floaterm_terminal_mappings = 1
vim.g.floaterm_persist_size = 1
vim.g.floaterm_direction = 'float'
vim.g.floaterm_float_opts = {
  border = "rounded",
  width = 0.9,
  height = 0.9,
  winblend = 3,
  highlights = {
    border = "Normal",
    background = "Normal",
  },
}

-- Cài đặt phím tắt cho floaterm
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>FloatermNew<cr>', { noremap = true, silent = true, desc = 'Mở terminal mới' })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>FloatermToggle<cr>', { noremap = true, silent = true, desc = 'Toggle terminal' })
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>FloatermKill<cr>', { noremap = true, silent = true, desc = 'Kill terminal' })
