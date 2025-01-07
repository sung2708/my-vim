-- Initialize Mason and Mason-LSPConfig for automatic LSP server installation
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright", "bashls", "gopls", "html", "cssls", "lua_ls", "emmet_ls" },
})

-- Import necessary modules for LSP configuration
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Function to define key mappings when LSP attaches to a buffer
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymaps = {
    { 'n', 'gd', vim.lsp.buf.definition, opts },        -- Go to definition
    { 'n', 'K', vim.lsp.buf.hover, opts },              -- Hover for documentation
    { 'n', 'gi', vim.lsp.buf.implementation, opts },    -- Go to implementation
    { 'n', 'gr', vim.lsp.buf.references, opts },        -- Find references
    { 'n', '<leader>rn', vim.lsp.buf.rename, opts },    -- Rename symbol
    { 'n', '<leader>ca', vim.lsp.buf.code_action, opts } -- Show code actions
  }

  -- Set key mappings for each LSP action
  for _, map in ipairs(keymaps) do
    vim.api.nvim_buf_set_keymap(bufnr, map[1], map[2], map[3], map[4])
  end
end

-- Common LSP capabilities with nvim-cmp integration
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Function to set up LSP servers
local function setup_lsp(server_name, custom_config)
  local config = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  if custom_config then
    config = vim.tbl_deep_extend("force", config, custom_config)
  end

  lspconfig[server_name].setup(config)
end

-- Setup handlers for LSP servers
require("mason-lspconfig").setup_handlers({
  -- Default handler for all LSP servers
  function(server_name)
    setup_lsp(server_name)
  end,

  -- Custom configuration for clangd (Ubuntu)
  ["clangd"] = function()
    setup_lsp("clangd", {
      cmd = {
        "clangd",  -- Use clangd from PATH
        "--background-index",
        "--header-insertion=never"
      },
    })
  end,

  -- Specific configuration for pyright
  ["pyright"] = function()
    setup_lsp("pyright")
  end,
})

-- Configure Emmet LSP for web development languages
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "html", "javascript", "typescript", "vue", "scss", "less", "sass", "ejs", "pug", "eruby", "hbs" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,  -- Enable BEM (Block Element Modifier) CSS naming support
      },
    },
  },
})