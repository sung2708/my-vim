lua << EOF
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF

" Phím tắt cho nvim-cmp trong Vimscript
inoremap <silent><expr> <C-Space> lua require'cmp'.complete()
inoremap <silent><expr> <CR>      lua require'cmp'.confirm({ select = true })
inoremap <silent><expr> <C-e>     lua require'cmp'.close()
inoremap <silent><expr> <C-f>     lua require'cmp'.scroll_docs(4)
inoremap <silent><expr> <C-d>     lua require'cmp'.scroll_docs(-4)
