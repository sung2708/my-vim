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
    function(server_name)
        lspconfig[server_name].setup {
            -- Enable additional capabilities for autocompletion
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = function(client, bufnr)
                -- Example key mappings
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local opts = { noremap=true, silent=true }

                -- Key mappings for LSP functions
                buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to definition
                buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)         -- Hover documentation
                buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)  -- Go to implementation
                buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)      -- Find references
                buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)  -- Rename
                buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)  -- Code action
            end,
        }
    end,

    -- Custom setup for specific servers
    ["clangd"] = function()
        lspconfig.clangd.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end,
    ["pyright"] = function()
        lspconfig.pyright.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end,
    ["tsserver"] = function()
        lspconfig.tsserver.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end,
    ["gopls"] = function()
        lspconfig.gopls.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end,
    ["html"] = function()
        lspconfig.html.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end,
    ["cssls"] = function()
        lspconfig.cssls.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end,
    -- Add more custom setups for other servers as needed
}