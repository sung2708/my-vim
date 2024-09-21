-- Import nvim-cmp and lspkind
local cmp = require('cmp')
local lspkind = require('lspkind')

-- Configure nvim-cmp formatting using lspkind
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- Display icon and type in suggestions
      maxwidth = 50,   -- Limit the width of the suggestion text
    })
  }
}
