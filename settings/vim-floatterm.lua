-- Floaterm settings
vim.g.floaterm_direction = 'float'
vim.g.floaterm_float_opts = {
    border = "rounded",  -- Rounded borders for the terminal window
    width = 0.9,         -- Floaterm width as a percentage of the screen
    height = 0.9,        -- Floaterm height as a percentage of the screen
    winblend = 3,        -- Transparency level for Floaterm window
}

-- Key mapping options
local opts = { noremap = true, silent = true }

-- Normal mode key mappings
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>FloatermNew<CR>', opts)    -- Open a new Floaterm
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>FloatermToggle<CR>', opts) -- Toggle Floaterm visibility
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>FloatermKill<CR>', opts)   -- Kill the Floaterm session

-- Terminal mode key mappings
vim.api.nvim_set_keymap('t', '<leader>g', [[<C-\><C-n>:FloatermToggle<CR>]], opts) -- Toggle Floaterm from terminal mode
vim.api.nvim_set_keymap('t', '<leader>k', [[<C-\><C-n>:FloatermKill<CR>]], opts)   -- Kill Floaterm from terminal mode
