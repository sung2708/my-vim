-- Thiết lập phím tắt cho NERDTree
vim.keymap.set('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true, desc = "Focus NERDTree" })
vim.keymap.set('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true, desc = "Open NERDTree" })
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NERDTree" })
vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true, desc = "Find File in NERDTree" })


-- Cấu hình mũi tên cho NERDTree
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

-- Cấu hình biểu tượng trạng thái Git cho NERDTree
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
  Unknown   = '?'
}

-- Bật highlight cho file hiện tại
vim.g.nerdtree_sync_cursorline = 1

-- Ngăn chặn các buffer khác thay thế NERDTree
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.winnr() == vim.fn.winnr('h') and vim.fn.bufname('#'):match('NERD_tree_\\d+') and vim.fn.bufname('%'):match('NERD_tree_\\d+') == nil and vim.fn.winnr('$') > 1 then
      local buf = vim.fn.bufnr()
      vim.cmd('buffer#')
      vim.cmd('normal! <C-W>w')
      vim.cmd('buffer' .. buf)
    end
  end
})

-- Mở NERDTree trên mỗi tab mới
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype ~= 'quickfix' and vim.fn.getcmdwintype() == '' then
      vim.cmd('silent NERDTreeMirror')
    end
  end
})
