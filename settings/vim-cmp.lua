-- Safely load nvim-cmp
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  vim.notify("Error loading nvim-cmp", vim.log.levels.ERROR)
  return
end

-- Safely load LuaSnip
local luasnip_ok, luasnip = pcall(require, 'luasnip')

-- Setup nvim-cmp for autocompletion
cmp.setup({
  snippet = {
    expand = function(args)
      -- Expand snippets only if LuaSnip is successfully loaded
      if luasnip_ok then
        luasnip.lsp_expand(args.body)
      end
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),          -- Trigger completion menu
    ['<C-e>'] = cmp.mapping.abort(),                 -- Abort completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection on Enter
    ['<C-n>'] = cmp.mapping.select_next_item(),      -- Navigate to next item
    ['<C-p>'] = cmp.mapping.select_prev_item(),      -- Navigate to previous item
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP-based completions
    { name = 'luasnip' },   -- Snippets from LuaSnip
  }, {
    { name = 'buffer' },    -- Buffer completions
  }),
  completion = {
    -- Recommended options for better completion behavior
    completeopt = 'menu,menuone,noinsert',
  },
  formatting = {
    -- Customize the appearance of completion items
    format = function(entry, vim_item)
      -- Optionally use lspkind for icons if installed
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
    { name = 'buffer' } -- Use buffer as the source for search completion
  }
})

-- Setup for ':' command-line completion (command mode)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },    -- Path completion (files and directories)
  }, {
    { name = 'cmdline' }  -- Command-line completion
  })
})
