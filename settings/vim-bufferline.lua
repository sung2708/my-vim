-- Enable true color support for better visuals
vim.opt.termguicolors = true

-- Get the current folder name in uppercase for offset text
local current_folder = string.upper(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))

-- Setup Bufferline with extensive options
require("bufferline").setup {
    options = {
        mode = "buffers", -- Display buffers instead of tabs
        style_preset = require("bufferline").style_preset.default,
        themable = true, -- Allow theme customization

        -- Display buffer numbers as their ordinal position
        numbers = function(opts) return string.format("%d", opts.ordinal) end,

        -- Commands for closing and switching buffers
        close_command = function(bufnr) return "bdelete! " .. bufnr end,
        right_mouse_command = function(bufnr) return "bdelete! " .. bufnr end,
        left_mouse_command = function(bufnr) return "buffer " .. bufnr end,

        -- Indicator and icons
        indicator = { icon = '▎', style = 'hover' },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',

        -- Bufferline appearance and behavior
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp", -- Show diagnostics from LSP
        diagnostics_update_in_insert = false,
        diagnostics_update_on_event = true,

        -- Custom diagnostics indicator
        diagnostics_indicator = function(count, level, diagnostics_dict)
            local result = " "
            for e, n in pairs(diagnostics_dict) do
                local icon = (e == "error" and " ") or (e == "warning" and " ") or " "
                result = result .. n .. icon
            end
            return result
        end,

        -- Filter to exclude specific buffers
        custom_filter = function(buf_number)
            -- Example: Disable cursorline and cursorcolumn for bufferline filetype
            if vim.bo[buf_number].filetype == "bufferline" then
                vim.wo.cursorline = false
                vim.wo.cursorcolumn = false
            end
            return true
        end,

        -- Offset for file explorers
        offsets = {
            {
                filetype = "nerdtree",
                text = current_folder,
                highlight = "Directory",
                separator = true,
                text_align = "center",
            }
        },

        -- Visual customization
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        duplicates_across_groups = true,
        persist_buffer_sort = true,
        move_wraps_at_ends = false,
        separator_style = "slope",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        auto_toggle_bufferline = true,

        -- Hover settings
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'},
        },

        -- Sorting
        sort_by = 'insert_after_current',
    }
}

-- Key mappings for Bufferline functionality
local opts = { noremap = true, silent = true }

-- Buffer management
vim.api.nvim_set_keymap('n', '<leader>bn', ':enew<CR>', opts) -- Open a new buffer
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineTogglePin<CR>', opts) -- Pin the current buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete | BufferLineCyclePrev<CR>', opts) -- Close buffer and go to the previous one

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<leader>]', ':BufferLineCycleNext<CR>', opts) -- Go to the next buffer
vim.api.nvim_set_keymap('n', '<leader>[', ':BufferLineCyclePrev<CR>', opts) -- Go to the previous buffer

-- Buffer movement
vim.api.nvim_set_keymap('n', '<leader>bl', ':BufferLineMoveNext<CR>', opts) -- Move buffer to the right
vim.api.nvim_set_keymap('n', '<leader>bh', ':BufferLineMovePrev<CR>', opts) -- Move buffer to the left

-- Tab management
vim.api.nvim_set_keymap('n', '<leader>to', ':tabedit %<CR>', opts) -- Open current buffer in a new tab
vim.api.nvim_set_keymap('n', '<leader>tt', ':tabnew<CR>', opts) -- Open an empty new tab