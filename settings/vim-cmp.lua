-- vim-cmp.lua

-- Đảm bảo rằng tất cả các module đều được nạp
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

-- Cấu hình nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Sử dụng luasnip để mở rộng snippet
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Xác nhận lựa chọn
    ['<C-e>'] = cmp.mapping.abort(), -- Hủy bỏ hoàn thành
  }),
  sources = {
    { name = 'nvim_lsp' },  -- LSP source
    { name = 'luasnip' },   -- Snippet source
    { name = 'buffer' },    -- Buffer source
    { name = 'path' },      -- Path source
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- Hiển thị văn bản và biểu tượng
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        path = "[Path]",
      })
    })
  },
})

-- Cấu hình khả năng của LSP
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Cấu hình các máy chủ LSP
local servers = { 'pyright', 'tsserver', 'html', 'cssls', 'clangd', 'gopls' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end