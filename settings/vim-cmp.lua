local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  vim.notify("Error loading nvim-cmp", vim.log.levels.ERROR)
  return
end

-- Safe loading of luasnip for snippet support
local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then
  vim.notify("Error loading luasnip", vim.log.levels.ERROR)
end

-- Setup nvim-cmp for completion
cmp.setup({
  snippet = {
    expand = function(args)
      if luasnip_ok then
        luasnip.lsp_expand(args.body) -- Expand snippets with luasnip
      end
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),          -- Scroll documentation up
    ['<C-f>'] = cmp.mapping.scroll_docs(4),           -- Scroll documentation down
    ['<C-Space>'] = cmp.mapping.complete(),            -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(),                   -- Abort completion
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true }) -- Confirm selection on Enter
      else
        fallback()  -- If no completion menu, fallback to regular Enter
      end
    end),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- Next completion item
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- Previous completion item
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP completion source
    { name = 'luasnip' },   -- Snippets source
  }, {
    { name = 'buffer' },    -- Buffer completion source
  }),
  completion = {
    completeopt = 'menu,menuone,noinsert', -- Recommended completion options
  },
  formatting = {
    format = function(entry, vim_item)
      -- Customize display with lspkind (if installed)
      local lspkind_ok, lspkind = pcall(require, 'lspkind')
      if lspkind_ok then
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind
      end
      return vim_item
    end,
  }
})

-- Setup for '/' command-line completion (search mode)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Setup for ':' command-line completion
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'path' },   -- Path completion source
    { name = 'cmdline' } -- Command-line completion source
  }
})
