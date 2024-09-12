-- Cấu hình nvim-cmp

vim.api.nvim_set_keymap('i', '<C-Space>', 'cmp.complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', 'cmp.confirm({ select = true })', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'cmp.close()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-f>', 'cmp.scroll_docs(3)', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-d>', 'cmp.scroll_docs(-5)', { noremap = true, silent = true, expr = true })

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      -- Sử dụng 'vsnip' để mở rộng snippet, nếu dùng engine khác thay đổi dòng này
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-f>'] = cmp.mapping.scroll_docs(3),
    ['<C-d>'] = cmp.mapping.scroll_docs(-5),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP completion
    { name = 'vsnip' },     -- Snippet completion
  }, {
    { name = 'buffer' },    -- Buffer completion
    { name = 'path' },      -- Path completion
  })
})

-- Cấu hình cho command-line
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})



