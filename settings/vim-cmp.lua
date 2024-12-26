local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup({
  -- Configure snippets
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
    end,
  },

  -- Configure mappings
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),               -- Trigger completion menu
    ['<C-e>'] = cmp.mapping.abort(),                      -- Close completion menu
    ['<CR>'] = cmp.mapping.confirm({ select = true }),    -- Confirm the selected item

    -- Handle Tab and Shift-Tab for navigation/snippets
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback() -- Default behavior
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback() -- Default behavior
      end
    end, { 'i', 's' }),

    -- Navigate with Up and Down keys
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
  }),

  -- Configure completion sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },   -- LSP completions
    { name = 'luasnip' },    -- Snippet completions
    { name = 'buffer' },     -- Buffer completions
    { name = 'path' },       -- Path completions
  }),

  -- Configure formatting
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- Display symbol and text
      maxwidth = 50,        -- Limit width for better readability
    }),
  },
})
