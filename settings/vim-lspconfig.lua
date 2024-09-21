-- Setup Mason package manager
require("mason").setup()

-- Setup Mason-LSPConfig to manage LSP servers
require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "pyright", "ts_ls", "gopls", "html", "cssls" },
})

-- Import LSPConfig
local lspconfig = require('lspconfig')

-- Setup handlers for Mason-LSPConfig
require("mason-lspconfig").setup_handlers {
    -- Default handler for all LSP servers
    function (server_name)
        lspconfig[server_name].setup {
            -- Enable additional capabilities for autocompletion
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = function(client, bufnr)
                -- Additional on_attach function if needed
                -- Setup key mappings or other configurations here
            end,
        }
    end
}
