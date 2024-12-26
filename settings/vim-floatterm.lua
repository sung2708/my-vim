-- Floaterm settings
vim.g.floaterm_direction = 'float'
vim.g.floaterm_float_opts = {
  border = "rounded",  -- Rounded borders for the terminal window
  width = 0.9,         -- Floaterm width as a percentage of the screen
  height = 0.9,        -- Floaterm height as a percentage of the screen
  winblend = 3,        -- Transparency level for Floaterm window
}

-- Helper function for setting key mappings
local function set_keymap(mode, key, cmd, description)
  vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true, desc = description })
end

-- Normal mode key mappings
set_keymap('n', '<leader>t', '<cmd>FloatermNew<CR>', 'Open a new Floaterm')
set_keymap('n', '<leader>g', '<cmd>FloatermToggle<CR>', 'Toggle Floaterm visibility')
set_keymap('n', '<leader>k', '<cmd>FloatermKill<CR>', 'Kill the Floaterm session')

-- Terminal mode key mappings
set_keymap('t', '<leader>g', [[<C-\><C-n>:FloatermToggle<CR>]], 'Toggle Floaterm from terminal mode')
set_keymap('t', '<leader>k', [[<C-\><C-n>:FloatermKill<CR>]], 'Kill Floaterm from terminal mode')
