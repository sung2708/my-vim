-- LSPKind Setup for Icons in LSP
require('lspkind').init({
  mode = 'symbol_text',  -- Display symbols as text with icons
  preset = 'default',    -- Use the default preset for symbols
  symbol_map = {
    Text = "",          -- Text symbol
    Method = "",        -- Method symbol
    Function = "",      -- Function symbol
    Constructor = "",   -- Constructor symbol
    Field = "",         -- Field symbol
    Variable = "",      -- Variable symbol
    Class = "",         -- Class symbol
    Interface = "",     -- Interface symbol
    Module = "",        -- Module symbol
    Property = "",      -- Property symbol
    Unit = "",          -- Unit symbol
    Value = "",         -- Value symbol
    Enum = "",          -- Enum symbol
    Keyword = "",       -- Keyword symbol
    Snippet = "<>",       -- Snippet symbol
    Color = "",         -- Color symbol
    File = "",          -- File symbol
    Reference = "",     -- Reference symbol
    Folder = "",        -- Folder symbol
    EnumMember = "",    -- Enum Member symbol
    Constant = "",      -- Constant symbol
    Struct = "",        -- Struct symbol
    Event = "",         -- Event symbol
    Operator = "",      -- Operator symbol
    TypeParameter = ""  -- Type Parameter symbol
  },
})
