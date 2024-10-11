require('conform').setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    --pug = { "prettier" },
    --handlebars = { "prettier" },
    --hbs = { "prettier" },
   -- ejs = { "prettier" },
    cpp = { "clang-format" },
    go = { "gofmt" },
    python = { "black" },
  },
  format_on_save = true,
})

-- Key mapping để định dạng thủ công
vim.api.nvim_set_keymap('n', '<leader>cf', ':lua require("conform").format({ async = true })<CR>', { noremap = true, silent = true })

