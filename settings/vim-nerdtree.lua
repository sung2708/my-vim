-- Key mappings for NERDTree
local opts = { noremap = true, silent = true, desc = "NERDTree" }

-- Cấu hình các phím tắt NERDTree
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', opts) -- Focus NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', opts) -- Open NERDTree
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', opts) -- Toggle NERDTree visibility
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', opts) -- Find file in NERDTree
vim.api.nvim_set_keymap('n', '<leader>r', ':NERDTreeRefreshRoot<CR>', opts) -- Refresh NERDTree root
vim.api.nvim_set_keymap('n', '<leader>cs', ':close<CR>', opts) -- Close NERDTree

-- Configure NERDTree arrows and sync cursor line
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'
vim.g.nerdtree_sync_cursorline = 1  -- Highlight current file in NERDTree

-- Function to open the selected file in a vertical split
function NERDTreeOpenInSplit()
    vim.cmd("wincmd l") -- Move to the buffer
    vim.cmd("vsplit")   -- Open a vertical split
    vim.cmd("NERDTreeFind") -- Locate the file in NERDTree
end

-- Autocommands for NERDTree behavior
vim.api.nvim_create_autocmd("StdinReadPre", {
  pattern = "*",
  callback = function()
    vim.g.std_in = 1 -- Set global variable for stdin
  end,
})

-- Automatically open NERDTree on VimEnter, switch window if arguments or stdin
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("NERDTree")
    if #vim.fn.argv() > 0 or vim.g.std_in then
      vim.cmd("wincmd p") -- Switch to previous window
    end
  end,
})

-- Git status indicator mapping (customized)
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
