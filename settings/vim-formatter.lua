-- Configure Conform plugin
require('conform').setup({
  -- Specify formatters for each file type
  formatters_by_ft = {
    javascript = { "prettier" },    -- Use Prettier for JavaScript
    typescript = { "prettier" },    -- Use Prettier for TypeScript
    html = { "prettier" },          -- Use Prettier for HTML
    css = { "prettier" },           -- Use Prettier for CSS
    -- Uncomment lines below to enable formatting for additional file types
    -- pug = { "prettier" },
    -- handlebars = { "prettier" },
    -- hbs = { "prettier" },
    -- ejs = { "prettier" },
    cpp = { "clang-format" },       -- Use clang-format for C++
    go = { "gofmt" },               -- Use gofmt for Go
    python = { "black" },           -- Use Black for Python
  },
  
  -- Automatically format files on save
  format_on_save = true,
})

-- Key mapping for manual formatting
vim.api.nvim_set_keymap(
  'n',
  '<leader>cf',
  ':lua require("conform").format({ async = true })<CR>',
  { noremap = true, silent = true, desc = "Manually format the current file" }
)
