lua << EOF
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Cấu hình cho Java LSP server (jdtls)
lspconfig.jdtls.setup{
  capabilities = capabilities
}

-- Cấu hình cho Go LSP server (gopls)
lspconfig.gopls.setup{
  capabilities = capabilities
}

-- Cấu hình cho C/C++ LSP server (clangd)
lspconfig.clangd.setup{
  capabilities = capabilities
}

-- Cấu hình cho JavaScript/TypeScript LSP server (tsserver)
lspconfig.tsserver.setup{
  capabilities = capabilities
}

-- Cấu hình cho HTML LSP server
lspconfig.html.setup{
  capabilities = capabilities
}

-- Cấu hình cho CSS LSP server
lspconfig.cssls.setup{
  capabilities = capabilities
}
EOF

