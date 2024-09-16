-- Cài đặt lspconfig
local lspconfig = require('lspconfig')

-- Thiết lập các server LSP
local servers = {
  pyright = {},
  ts_ls = {},  -- Thay thế tsserver bằng ts_ls
  html = {},
  cssls = {},
  clangd = {},
  gopls = {}
}

for server, config in pairs(servers) do
  if lspconfig[server] then
    lspconfig[server].setup(config)
  else
    print("LSP server " .. server .. " không được hỗ trợ.")
  end
end

-- Keymaps cho LSP
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = 'Go to definition' })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true, desc = 'Show hover documentation' })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true, desc = 'Find references' })
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true, desc = 'Go to implementation' })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true, desc = 'Rename symbol' })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true, desc = 'Code action' })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true, desc = 'Format code' })
