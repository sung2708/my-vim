local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Use LuaSnip for snippets
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),          -- Trigger completion menu
    ['<C-e>'] = cmp.mapping.abort(),                 -- Close the completion menu
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm the selected item
    ['<Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- Add mappings for navigating with Up and Down keys
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }), -- Navigate to the next item
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),   -- Navigate to the previous item
  },
  sources = {
    { name = 'nvim_lsp' },   -- LSP completions
    { name = 'luasnip' },    -- Snippet completions
    { name = 'buffer' },     -- Buffer completions
    { name = 'path' },       -- Path completions
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
    }),
  },
})