-- Configure nvim-treesitter
require('nvim-treesitter.configs').setup {
  -- Install parsers for common languages
  ensure_installed = { "python", "javascript", "typescript", "html", "css", "java", "go", "c", "cpp" },

  -- Syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Indentation settings
  indent = {
    enable = true,
    disable = { "python" },
  },

  -- Text objects for enhanced navigation and selection
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
      goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
    },
  },

  -- Incremental selection keymaps
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
}
