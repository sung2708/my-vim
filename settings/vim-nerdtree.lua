-- NERDTree key mappings
local opts = { noremap = true, silent = true, desc = "NERDTree" }

vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', opts) -- Focus NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', opts) -- Open NERDTree
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', opts) -- Toggle NERDTree
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', opts) -- search file in NERDTree
vim.api.nvim_set_keymap('n', '<leader>r', ':NERDTreeRefreshRoot<CR>', opts) -- Refresh NERDTree Root


-- Configure arrows for NERDTree
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

-- Enable highlighting for the current file in NERDTree
vim.g.nerdtree_sync_cursorline = 1

-- Automatically open NERDTree or move cursor based on arguments
-- Create an autocommand to set a variable when reading from stdin
vim.api.nvim_create_autocmd("StdinReadPre", {
  pattern = "*",
  callback = function()
    vim.g.std_in = 1 -- Set global variable for stdin
  end,
})

-- Create an autocommand for VimEnter to open NERDTree
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("NERDTree") -- Open NERDTree
    if #vim.fn.argv() > 0 or vim.g.std_in then -- Check if there are arguments or stdin
      vim.cmd("wincmd p") -- Switch to the previous window
    end
  end,
})

-- Git status indicator mapping
vim.g.NERDTreeGitStatusIndicatorMapCustom = {
    Modified  = '✹',
    Staged    = '✚',
    Untracked = '✭',
    Renamed   = '➜',
    Unmerged  = '═',
    Deleted   = '✖',
    Dirty     = '✗',
    Ignored   = '☒',
    Clean     = '✔︎',
    Unknown   = '?',
}