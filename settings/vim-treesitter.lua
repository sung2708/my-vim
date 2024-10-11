require'nvim-treesitter.configs'.setup {
    -- Install parsers for the specified languages and frameworks/view engines
    ensure_installed = {
        "python", "javascript", "typescript", "html", "css", 
        "java", "go", "c", "cpp",
        --"ejs", "hbs", -- Add EJS and HBS parsers if available
        -- Add other frameworks or template engines as needed
    },

    -- Enable Treesitter-based syntax highlighting and disable regex-based highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,  -- Better performance by avoiding regex-based highlighting
    },

    -- Enable automatic indentation
    indent = {
        enable = true,
        disable = { "python" },  -- Disable for Python if indentation issues arise
    },

    -- Text objects configuration for easy navigation and manipulation
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",  -- Around function
                ["if"] = "@function.inner",  -- Inside function
                ["ab"] = "@block.outer",     -- Around block
                ["ib"] = "@block.inner",     -- Inside block
                ["ac"] = "@class.outer",     -- Around class
                ["ic"] = "@class.inner",     -- Inside class
            },
        },
        move = {
            enable = true,
            set_jumps = true,  -- Save jumps for easy navigation
            goto_next_start = {
                ["]f"] = "@function.outer",  -- Next function start
                ["]b"] = "@block.outer",     -- Next block start
            },
            goto_next_end = {
                ["]F"] = "@function.outer",  -- Next function end
                ["]B"] = "@block.outer",     -- Next block end
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",  -- Previous function start
                ["[b"] = "@block.outer",     -- Previous block start
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",  -- Previous function end
                ["[B"] = "@block.outer",     -- Previous block end
            },
        },
    },

    -- Enable code folding based on Treesitter
    fold = {
        enable = true,
        disable = { "lua" },  -- Disable for Lua if needed
        keymaps = {
            toggle = "zM",  -- Toggle folding
            open = "zR",    -- Open all folds
            close = "zM",   -- Close all folds
        },
    },

    -- Enable context-aware comments based on the language
    context_commentstring = {
        enable = true,
        enable_autocmd = false,  -- Disable automatic commands
    },

    -- Incremental selection setup for better code selection
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",      -- Start selection
            node_incremental = "<TAB>",   -- Increment selection to the next node
            node_decremental = "<S-TAB>", -- Decrement selection to the previous node
        },
    },
}