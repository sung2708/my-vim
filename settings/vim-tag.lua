-- Default configuration options for nvim-ts-autotag
local autotag_opts = {
  enable_close = true,          -- Enable auto-closing of tags
  enable_rename = true,         -- Enable auto-renaming of tags
  enable_close_on_slash = true, -- Enable auto-close on trailing </>
}

-- Per-filetype overrides for specific configurations
local filetype_overrides = {
  -- Filetypes with both close and rename enabled
  javascript = autotag_opts,
  javascriptreact = autotag_opts,
  typescript = autotag_opts,
  typescriptreact = autotag_opts,
  vue = autotag_opts,
  svelte = autotag_opts,
  php = autotag_opts,
  blade = autotag_opts,        -- Laravel Blade engine
  ejs = autotag_opts,          -- Embedded JavaScript (EJS)
  handlebars = autotag_opts,
  djangohtml = autotag_opts,

  -- Specific overrides for other filetypes
  html = { enable_close = true },  -- HTML (only close enabled)
  markdown = { enable_close = true, enable_rename = false }, -- Markdown doesn't need tag renaming
  xml = autotag_opts,              -- XML (both enabled)
}

-- Apply the configuration
require('nvim-ts-autotag').setup({
  opts = autotag_opts,          -- Apply default settings to all filetypes
  per_filetype = filetype_overrides  -- Apply per-filetype overrides
})
