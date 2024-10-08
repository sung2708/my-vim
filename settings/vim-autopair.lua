-- Setup nvim-autopairs
local npairs = require("nvim-autopairs")
npairs.setup({
  check_ts = true,      -- Enable Treesitter integration
  fast_wrap = {},
})

-- Integration with nvim-cmp for auto-completion
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Setup nvim-ts-autotag for automatic HTML tag closing
require('nvim-ts-autotag').setup({
  filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte", "xml", "php", "markdown" },  -- Add more filetypes if needed
})
