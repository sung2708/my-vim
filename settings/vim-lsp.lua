-- Cấu hình LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Cấu hình cho các LSP server
lspconfig.jdtls.setup{
  capabilities = capabilities
}

lspconfig.gopls.setup{
  capabilities = capabilities
}

lspconfig.clangd.setup{
  capabilities = capabilities
}

lspconfig.tsserver.setup{
  capabilities = capabilities
}

lspconfig.html.setup{
  capabilities = capabilities
}

lspconfig.cssls.setup{
  capabilities = capabilities
}

