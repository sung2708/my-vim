-- Initialize Mason and Mason-LSPConfig for managing LSP servers
require("mason").setup()
require("mason-lspconfig").setup()

-- Import necessary modules for LSP configuration
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Function to define key mappings when LSP attaches to a buffer
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymaps = {
    { 'n', 'gd', vim.lsp.buf.definition },        -- Go to definition
    { 'n', 'K', vim.lsp.buf.hover },              -- Hover for documentation
    { 'n', 'gi', vim.lsp.buf.implementation },    -- Go to implementation
    { 'n', 'gr', vim.lsp.buf.references },        -- Find references
    { 'n', '<leader>rn', vim.lsp.buf.rename },    -- Rename symbol
    { 'n', '<leader>ca', vim.lsp.buf.code_action } -- Show code actions
  }

  -- Set key mappings for each LSP action
  for _, map in ipairs(keymaps) do
    vim.api.nvim_buf_set_keymap(bufnr, map[1], map[2], string.format(":lua %s()<CR>", map[3]), opts)
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

  -- Custom configuration for clangd (C++ files)
require('lspconfig').clangd.setup({
  cmd = {
    "clangd",  -- Ensure clangd is in your PATH
    "--background-index",
    "--header-insertion=never"
  },
  on_attach = on_attach,
  capabilities = capabilities,
})
})
