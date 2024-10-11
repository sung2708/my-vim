-- Setup nvim-autopairs for automatic pairing of brackets, parentheses, quotes, etc.
local npairs = require("nvim-autopairs")
npairs.setup({
  check_ts = true,  -- Enable Treesitter integration for more intelligent pairing
  fast_wrap = {},   -- Enable fast wrapping functionality
})

-- Integration with nvim-cmp to automatically insert pairs after confirming a completion
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Setup nvim-ts-autotag for automatic closing of HTML tags in specified filetypes
require('nvim-ts-autotag').setup({
  filetypes = { 
    "html", 
    "javascript", 
    "javascriptreact", 
    "typescriptreact", 
    "vue", 
    "svelte", 
    "xml", 
    "php", 
    "markdown", 
    "eruby",  -- Add view engines like ERB
    "pug",    -- Add Pug for template files
    "ejs",    -- Add EJS for Express.js templates
    "hbs",    -- Add Handlebars for HBS files
  },
})