-- Enable true color support
vim.opt.termguicolors = true

-- Get the current folder name and convert it to uppercase
local current_folder = string.upper(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))

-- Setup Bufferline with extended options
require("bufferline").setup {
    options = {
        mode = "buffers",
        style_preset = require("bufferline").style_preset.default,
        themable = true,

        numbers = function(opts) return string.format("%d", opts.ordinal) end,

        close_command = function(bufnr) return "bdelete! " .. bufnr end,
        right_mouse_command = function(bufnr) return "bdelete! " .. bufnr end,
        left_mouse_command = function(bufnr) return "buffer " .. bufnr end,

        indicator = {
            icon = '▎',
            style = 'underline',
        },

        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,

        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_update_on_event = true,
        diagnostics_indicator = function(count, level, diagnostics_dict)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = (e == "error" and " ") or (e == "warning" and " ") or " "
                s = s .. n .. sym
            end
            return s
        end,

        custom_filter = function(buf_number)
            if vim.bo[buf_number].filetype == "bufferline" then
                vim.wo.cursorline = false
                vim.wo.cursorcolumn = false
            end
            return true
        end,

        offsets = {
            {
                filetype = "nerdtree",
                text = current_folder,
                highlight = "Directory",
                separator = true,
                text_align = "center",
            }
        },

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

        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'},
        },

        sort_by = 'insert_after_current',
    }
}

-- Key mappings for Bufferline
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>bn', ':enew<CR>', opts) -- Open a new buffer
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineTogglePin<CR>', opts) -- Pin buffer
vim.api.nvim_set_keymap('n', '<leader>]', ':BufferLineCycleNext<CR>', opts) -- Go to next buffer
vim.api.nvim_set_keymap('n', '<leader>[', ':BufferLineCyclePrev<CR>', opts) -- Go to previous buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete | BufferLineCyclePrev<CR>', opts) -- Close buffer safely
vim.api.nvim_set_keymap('n', '<leader>bl', ':BufferLineMoveNext<CR>', opts) -- Move buffer to the right
vim.api.nvim_set_keymap('n', '<leader>bh', ':BufferLineMovePrev<CR>', opts) -- Move buffer to the left

-- Key mapping to open a file in a new tab while keeping the current buffer open
vim.api.nvim_set_keymap('n', '<leader>to', ':tabedit %<CR>', opts) -- Open current buffer in a new tab
vim.api.nvim_set_keymap('n', '<leader>tt', ':tabnew<CR>', opts) -- Open an empty new tab