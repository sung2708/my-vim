require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = true -- Auto close on trailing </
  },
  -- Override individual filetype configs, these take priority.
  per_filetype = {
    -- HTML: Disable auto close tags
    ["html"] = {
      enable_close = true
    },
    -- Additional file types and view engines
    ["javascript"] = {
      enable_close = true,
      enable_rename = true
    },
    ["javascriptreact"] = {
      enable_close = true,
      enable_rename = true
    },
    ["typescript"] = {
      enable_close = true,
      enable_rename = true
    },
    ["typescriptreact"] = {
      enable_close = true,
      enable_rename = true
    },
    ["vue"] = {
      enable_close = true,
      enable_rename = true
    },
    ["svelte"] = {
      enable_close = true,
      enable_rename = true
    },
    ["php"] = {
      enable_close = true,
      enable_rename = true
    },
    ["blade"] = { -- Laravel Blade engine
      enable_close = true,
      enable_rename = true
    },
    ["ejs"] = { -- Embedded JavaScript (EJS)
      enable_close = true,
      enable_rename = true
    },
    ["xml"] = {
      enable_close = true,
      enable_rename = true
    },
    ["markdown"] = {
      enable_close = true,
      enable_rename = false -- Markdown doesn't usually need renaming tags
    },
    ["handlebars"] = {
      enable_close = true,
      enable_rename = true
    },
    ["djangohtml"] = {
      enable_close = true,
      enable_rename = true
    }
  }
})

