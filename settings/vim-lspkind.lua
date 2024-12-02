-- Attempt to load nvim-cmp and lspkind safely
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  vim.notify("Failed to load nvim-cmp", vim.log.levels.ERROR)
  return
end

local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
  vim.notify("Failed to load lspkind", vim.log.levels.ERROR)
  return
end

-- Configure nvim-cmp with lspkind icons and formatting options
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',         -- Show only symbols in completion
      maxwidth = 50,           -- Limit popup width for readability
      ellipsis_char = '...',   -- Display ellipsis if text exceeds maxwidth
      before = function(entry, vim_item)
        -- Optional: Customize item appearance before display
        -- This is a good place to add further customization if needed
        if entry.source.name == 'nvim_lsp' then
          vim_item.kind = lspkind.presets.default[vim_item.kind]  -- Apply LSP kind icons
        end
        return vim_item
      end
    })
  },
  mapping = {
    -- You can add your custom mappings here if needed
    -- Example:
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  },
  sources = {
    { name = 'nvim_lsp' }, -- Add more sources as needed
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji' },
  },
  snippet = {
    expand = function(args)
      -- Add snippet expansion logic, e.g., for luasnip or another snippet engine
    end
  },
  experimental = {
    native_menu = false, -- Disable native menu for better customization
    ghost_text = true,   -- Enable ghost text (suggested text inline in the editor)
  },
})
