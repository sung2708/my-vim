require'nvim-treesitter.configs'.setup {
    -- Specify the languages to install parsers for
    ensure_installed = {
        "python", "javascript", "typescript", "html", "css",
        "java", "go", "c", "cpp"
        -- Add more languages as needed
    },

    -- Enable syntax highlighting and disable Vim regex-based highlighting
    highlight = {
        enable = true,                              -- Enable treesitter-based highlighting
        additional_vim_regex_highlighting = false,  -- Disable regex-based highlighting for better performance
    },

    -- Enable automatic indentation (with exceptions)
    indent = {
        enable = true,                              -- Enable treesitter-based indentation
        disable = { "python" },                     -- Python indentation can be tricky, disable if needed
    },

    -- Configure text objects for better code manipulation
    textobjects = {
        select = {
            enable = true,                          -- Enable text object selection
            lookahead = true,                       -- Move to the next object automatically
            keymaps = {
                ["af"] = "@function.outer",         -- Select around the function
                ["if"] = "@function.inner",         -- Select inside the function
                ["ab"] = "@block.outer",            -- Select around the block
                ["ib"] = "@block.inner",            -- Select inside the block
                ["ac"] = "@class.outer",            -- Select around the class
                ["ic"] = "@class.inner",            -- Select inside the class
            },
        },
        move = {
            enable = true,                          -- Enable movement between text objects
            set_jumps = true,                       -- Save jumps to jumplist for easy navigation
            goto_next_start = {
                ["]f"] = "@function.outer",         -- Move to the start of the next function
                ["]b"] = "@block.outer",            -- Move to the start of the next block
            },
            goto_next_end = {
                ["]F"] = "@function.outer",         -- Move to the end of the next function
                ["]B"] = "@block.outer",            -- Move to the end of the next block
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",         -- Move to the start of the previous function
                ["[b"] = "@block.outer",            -- Move to the start of the previous block
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",         -- Move to the end of the previous function
                ["[B"] = "@block.outer",            -- Move to the end of the previous block
            },
        },
    },

    -- Enable code folding based on syntax
    fold = {
        enable = true,                              -- Enable code folding
        disable = { "lua" },                        -- Disable folding for specific languages (like Lua if needed)
        keymaps = {
            toggle = "zM",                          -- Toggle folding
            open = "zR",                            -- Open all folds
            close = "zM",                           -- Close all folds
        },
    },

    -- Enable context-based comment strings for different languages
    context_commentstring = {
        enable = true,                              -- Context-aware comments
        enable_autocmd = false,                     -- Disable automatic commands
    },

    -- Enable incremental selection for more flexible code selection
    incremental_selection = {
        enable = true,                              -- Enable incremental selection
        keymaps = {
            init_selection = "<CR>",                -- Initialize the selection
            node_incremental = "<TAB>",             -- Move to the next node incrementally
            node_decremental = "<S-TAB>",           -- Move to the previous node incrementally
        },
    },
}