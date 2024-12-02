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
    additional_vim_regex_highlighting = false,  -- Disable regex-based highlighting
  },

  -- Automatic indentation (disable for Python to prevent issues)
  indent = {
    enable = true,
    disable = { "python" },  -- Disable automatic indentation for Python
  },

  -- Text objects for enhanced code navigation and selection
  textobjects = {
    select = {
      enable = true,
      lookahead = true,  -- Enable lookahead for smarter selection
      keymaps = {
        ["af"] = "@function.outer",  -- Select around function
        ["if"] = "@function.inner",  -- Select inside function
        ["ac"] = "@class.outer",     -- Select around class
        ["ic"] = "@class.inner",     -- Select inside class
      },
    },
    move = {
      enable = true,
      set_jumps = true,  -- Set jumps for back and forth navigation
      goto_next_start = {
        ["]f"] = "@function.outer",  -- Move to next function start
        ["]c"] = "@class.outer",     -- Move to next class start
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",  -- Move to previous function start
        ["[c"] = "@class.outer",     -- Move to previous class start
      },
    },
  },

  -- Enable code folding using Treesitter (disable for Lua if needed)
  fold = {
    enable = true,
    disable = { "lua" },  -- Disable folding for Lua
  },

  -- Context-aware comment handling
  context_commentstring = {
    enable = true,
    enable_autocmd = false,  -- Disable autocommands for comment context
  },

  -- Incremental selection keymaps
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",      -- Start selection
      node_incremental = "<TAB>",   -- Expand selection
      node_decremental = "<S-TAB>", -- Shrink selection
    },
  },
}
