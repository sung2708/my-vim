-- nvim-autopairs setup
-- Automatically manage the pairing of brackets, parentheses, quotes, etc.
local npairs = require("nvim-autopairs")
npairs.setup({
  check_ts = true,  -- Use Treesitter for better context-aware pairing
  fast_wrap = {},   -- Enable fast wrapping functionality with default options
})

-- nvim-autopairs integration with nvim-cmp
-- Ensures that completing a suggestion also closes the corresponding pair if applicable
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- nvim-ts-autotag setup
-- Automatically closes HTML/XML tags in supported filetypes
require('nvim-ts-autotag').setup({
  filetypes = { 
    "html",                -- Standard HTML
    "javascript",          -- For JSX-like syntax
    "javascriptreact",     -- React JSX
    "typescriptreact",     -- React TSX
    "vue",                 -- Vue.js templates
    "svelte",              -- Svelte templates
    "xml",                 -- XML documents
    "php",                 -- PHP files
    "markdown",            -- Markdown files
    "eruby",               -- Embedded Ruby (ERB) files
    "pug",                 -- Pug/Jade templates
    "ejs",                 -- Embedded JavaScript templates (EJS)
    "hbs",                 -- Handlebars (HBS) templates
  },
})
