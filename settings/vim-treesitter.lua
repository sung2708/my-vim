require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "java",
    "go",
    "c",
    "cpp",
    -- Add more languages if needed
  },

  highlight = {
    enable = true,              -- Enable syntax highlighting
    additional_vim_regex_highlighting = false, -- Disable Vim's regex-based highlighting
  },

  indent = {
    enable = true,              -- Enable automatic indentation
    disable = { "python" },     -- Disable indentation for specific languages (e.g., Python)
  },

  textobjects = {
    select = {
      enable = true,           -- Enable text object selection
      lookahead = true,        -- Automatically jump to the next text object
      keymaps = {
        ["af"] = "@function.outer", -- Select the entire function
        ["if"] = "@function.inner", -- Select the inner part of a function
        ["ab"] = "@block.outer",    -- Select the entire block
        ["ib"] = "@block.inner",    -- Select the inner part of a block
        ["ic"] = "@class.inner",    -- Select the inner part of a class
        ["ac"] = "@class.outer",    -- Select the entire class
      },
    },

    move = {
      enable = true,           -- Enable text object movements
      set_jumps = true,        -- Save jump locations in the jumplist
      goto_next_start = {
        ["]f"] = "@function.outer", -- Move to the start of the next function
        ["]b"] = "@block.outer",    -- Move to the start of the next block
      },
      goto_next_end = {
        ["]F"] = "@function.outer", -- Move to the end of the next function
        ["]B"] = "@block.outer",    -- Move to the end of the next block
      },
      goto_previous_start = {
        ["[f"] = "@function.outer", -- Move to the start of the previous function
        ["[b"] = "@block.outer",    -- Move to the start of the previous block
      },
      goto_previous_end = {
        ["[F"] = "@function.outer", -- Move to the end of the previous function
        ["[B"] = "@block.outer",    -- Move to the end of the previous block
      },
    },
  },

  fold = {
    enable = true,              -- Enable code folding
    disable = { "lua" },        -- Disable folding for specific languages
    keymaps = {
      toggle = "zM",            -- Key to toggle folding
      open = "zR",              -- Key to open all folds
      close = "zM",             -- Key to close all folds
    },
  },

  context_commentstring = {
    enable = true,              -- Enable context-aware comment strings
    enable_autocmd = false,     -- Disable automatic command to update comment strings
  },

  incremental_selection = {
    enable = true,              -- Enable incremental selection
    keymaps = {
      init_selection = "<CR>",  -- Initialize selection
      node_incremental = "<TAB>", -- Increment selection to the next node
      node_decremental = "<S-TAB>", -- Decrement selection to the previous node
    },
  }
}