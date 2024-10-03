-- Safely load cmp and lspkind
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  print("Error loading nvim-cmp")
  return
end

local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
  print("Error loading lspkind")
  return
end

-- Setup cmp with lspkind formatting
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50,   -- prevent the popup from showing more than provided characters
      ellipsis_char = '...', -- when popup exceeds maxwidth, show ellipsis
      before = function(entry, vim_item)
        -- Customize vim_item if needed
        return vim_item
      end
    })
  }
}
