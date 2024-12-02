-- Configuration for nvim-ts-autotag
local autotag_opts = {
  enable_close = true,  -- Enable auto-closing of tags
  enable_rename = true, -- Enable auto-renaming of tags
  enable_close_on_slash = true -- Enable auto-close on trailing </>
}

-- Define filetypes that require individual overrides
local filetype_overrides = {
  -- Filetypes where both close and rename are enabled
  ["javascript"] = true,
  ["javascriptreact"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
  ["vue"] = true,
  ["svelte"] = true,
  ["php"] = true,
  ["blade"] = true,       -- Laravel Blade engine
  ["ejs"] = true,         -- Embedded JavaScript (EJS)
  ["handlebars"] = true,
  ["djangohtml"] = true,
  
  -- Specific overrides for other filetypes
  ["html"] = { enable_close = true },      -- HTML (only close enabled)
  ["markdown"] = { enable_close = true, enable_rename = false }, -- Markdown doesn't need tag renaming
  ["xml"] = { enable_close = true, enable_rename = true },      -- XML (both enabled)
}

-- Apply the configuration
require('nvim-ts-autotag').setup({
  opts = autotag_opts,        -- Apply default settings to all filetypes
  per_filetype = filetype_overrides  -- Apply per-filetype overrides
})
