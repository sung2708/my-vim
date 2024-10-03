require("mason").setup()

-- Setup Mason-LSPConfig to manage LSP servers
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright", "bashls", "gopls", "html", "cssls", "lua_ls" },  -- Added lua_ls to the list of servers
})

-- Import LSPConfig
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Define a function to set up key mappings for LSP
local function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  -- Key mappings for LSP functions
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)       -- Go to definition
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)            -- Hover documentation
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)  -- Go to implementation
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)      -- Find references
  buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)  -- Rename
  buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Code action
end

-- Common capabilities for all servers
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Setup handlers for Mason-LSPConfig
require("mason-lspconfig").setup_handlers({
  -- Default handler for all servers
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,

  -- Custom setup for clangd
["clangd"] = function()
  lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
      "clangd",
      "--background-index",
      "--header-insertion=never",                  -- Optional: Disable automatic header insertion
      "--query-driver=C:/Program Files/mingw64/bin/*" -- Ensure clangd uses MinGW binaries
    },
  })
end,

  -- Custom setup for pyright
  ["pyright"] = function()
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,

  -- Add setups for other servers
  ["bashls"] = function()
    lspconfig.bashls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
  -- (Continue with the rest of your servers)
})