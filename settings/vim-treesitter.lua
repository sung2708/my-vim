-- Configure nvim-treesitter for various features
require('nvim-treesitter.configs').setup {
  -- Parsers to install for specific languages
  ensure_installed = {
    "python", "javascript", "typescript", "html", "css", 
    "java", "go", "c", "cpp",
  },

  -- Enable syntax highlighting (disable additional regex highlighting for performance)
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Automatic indentation (disable for Python to prevent issues)
  indent = {
    enable = true,
    disable = { "python" },
  },

  -- Text objects for enhanced code navigation and selection
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
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
    },
  },

  -- Enable code folding using Treesitter
  fold = {
    enable = true,
    disable = { "lua" },
  },

  -- Context-aware comment handling
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
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
