local cmp = require('cmp')

-- Setup nvim-cmp for completion
cmp.setup({
  snippet = {
    -- Use luasnip to expand snippets
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Expand snippets with luasnip
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),          -- Scroll documentation up
    ['<C-f>'] = cmp.mapping.scroll_docs(4),           -- Scroll documentation down
    ['<C-Space>'] = cmp.mapping.complete(),            -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(),                   -- Abort completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection on Enter
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP completion source
    { name = 'luasnip' },   -- Snippets source
  }, {
    { name = 'buffer' },    -- Buffer completion source
  })
})

-- Setup for '/' command-line completion (search mode)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' } -- Use buffer source for '/'
  }
})

-- Setup for ':' command-line completion
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },    -- Path completion source
  }, {
    { name = 'cmdline' }  -- Command-line completion source
  })
})