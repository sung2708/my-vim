-- Initialize Mason and Mason-LSPConfig for managing and automatically installing LSP servers
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright", "bashls", "gopls", "html", "cssls", "lua_ls", "emmet_ls" },
})

-- Import necessary modules
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Function to define key mappings when an LSP attaches to a buffer
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = {
    { 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts },        -- Go to definition
    { 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts },              -- Hover for documentation
    { 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts },    -- Go to implementation
    { 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts },        -- Find references
    { 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts },    -- Rename symbol
    { 'n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts } -- Show code actions
  }

  for _, map in ipairs(keymap) do
    vim.api.nvim_buf_set_keymap(bufnr, unpack(map))
  end
end

-- Configure common LSP capabilities with nvim-cmp integration
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Default LSP configuration function (for most LSP servers)
local function setup_lsp(server_name)
  lspconfig[server_name].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Setup LSP servers using Mason-LSPConfig handlers
require("mason-lspconfig").setup_handlers({
  -- Default handler for all LSP servers
  function(server_name)
    setup_lsp(server_name)
  end,

  -- Specific settings for clangd (e.g., MinGW driver setup)
  ["clangd"] = function()
    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = {
        "clangd",
        "--background-index",
        "--header-insertion=never",
        "--query-driver=C:/Program Files/mingw64/bin/*"
      },
    })
  end,

  -- Specific settings for pyright
  ["pyright"] = function()
    setup_lsp("pyright")
  end,
})

-- Configure Emmet LSP for web development languages and frameworks
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "ejs", "hbs", "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,  -- Enable BEM (Block Element Modifier) CSS naming support
      },
    },
  }
})