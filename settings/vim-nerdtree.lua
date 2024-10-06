-- NERDTree key mappings
local opts = { noremap = true, silent = true, desc = "NERDTree" }

vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', opts) -- Focus NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', opts) -- Open NERDTree
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', opts) -- Toggle NERDTree
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', opts) -- Search file in NERDTree
vim.api.nvim_set_keymap('n', '<leader>r', ':NERDTreeRefreshRoot<CR>', opts) -- Refresh NERDTree Root
vim.api.nvim_set_keymap('n', '<leader>cs', ':close<CR>', opts) -- Close NERDTree

-- Configure arrows for NERDTree
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

-- Enable highlighting for the current file in NERDTree
vim.g.nerdtree_sync_cursorline = 1

-- Function to open the selected file in a vertical split
function NERDTreeOpenInSplit()
    -- Close NERDTree if it's focused, and open the file in a vertical split
    vim.cmd("wincmd l") -- Move to the buffer
    vim.cmd("vsplit") -- Open a vertical split
    vim.cmd("NERDTreeFind") -- Open the file in the split
end

-- Create a keymap for opening the selected file in a vertical split
vim.cmd([[
    autocmd FileType nerdtree nnoremap <silent> <leader>os :lua NERDTreeOpenInSplit()<CR>
]])

-- Automatically open NERDTree or move cursor based on arguments
vim.api.nvim_create_autocmd("StdinReadPre", {
  pattern = "*",
  callback = function()
    vim.g.std_in = 1 -- Set global variable for stdin
  end,
})

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
