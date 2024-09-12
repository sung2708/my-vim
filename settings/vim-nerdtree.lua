-- Thiết lập phím tắt cho NERDTree
vim.api.nvim_set_keymap('n', '<C-\\>', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-F5>', ':NERDTreeRefreshRoot<CR>', { noremap = true, silent = true })

-- Cấu hình mũi tên cho NERDTree
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

-- Tự động mở NERDTree khi vào Vim và quay lại cửa sổ trước đó
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "NERDTree | wincmd p"
})

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

-- Thay đổi thư mục làm việc hiện tại trên Windows khi thay đổi buffer
if vim.fn.has('win32') == 1 then
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "lcd %:p:h"
  })
end
