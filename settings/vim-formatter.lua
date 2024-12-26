-- Configure Conform plugin
require('conform').setup({
  -- Specify formatters for each file type
  formatters_by_ft = {
    javascript = { "prettier" },  -- Prettier for JavaScript
    typescript = { "prettier" },  -- Prettier for TypeScript
    html = { "prettier" },        -- Prettier for HTML
    css = { "prettier" },         -- Prettier for CSS
    cpp = { "clang-format" },     -- clang-format for C++
    go = { "gofmt" },             -- gofmt for Go
    python = { "black" },         -- Black for Python
  },

  -- Automatically format files on save
  format_on_save = true,
})

-- Helper function for key mappings
local function set_keymap(mode, key, cmd, description)
  vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true, desc = description })
end

-- Key mapping for manual formatting
set_keymap('n', '<leader>cf', ':lua require("conform").format({ async = true })<CR>', 'Manually format the current file')
