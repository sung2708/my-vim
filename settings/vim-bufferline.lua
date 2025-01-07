-- Enable true color support for better visuals
vim.opt.termguicolors = true

-- Get the current folder name in uppercase for offset text
local current_folder = string.upper(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))

-- Setup Bufferline
require("bufferline").setup {
    options = {
        mode = "buffers", -- Display buffers instead of tabs
        themable = true, -- Allow theme customization
        numbers = function(opts) return string.format("%d", opts.ordinal) end, -- Show ordinal position
        close_command = "bdelete! %d", -- Close buffer
        right_mouse_command = "bdelete! %d", -- Close with right mouse
        left_mouse_command = "buffer %d", -- Switch buffer with left mouse

        -- Indicator and icons
        indicator = { icon = '▎', style = 'hover' },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',

        -- Bufferline appearance
        max_name_length = 18,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp", -- Show LSP diagnostics
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(_, _, diagnostics_dict)
            local result = ""
            for e, n in pairs(diagnostics_dict) do
                local icon = (e == "error" and " ") or (e == "warning" and " ") or " "
                result = result .. n .. icon
            end
            return result
        end,

        -- Offset for file explorers
        offsets = {
            {
                filetype = "NvimTree",
                text = current_folder,
                highlight = "Directory",
                separator = true,
                text_align = "center",
            }
        },

        -- Visual options
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_tab_indicators = true,
        separator_style = "slant",
        always_show_bufferline = true,
        hover = { enabled = true, delay = 200, reveal = {'close'} },
        sort_by = 'insert_after_current',
    }
}

-- Key mappings for Bufferline
local opts = { noremap = true, silent = true }

-- Buffer management
vim.api.nvim_set_keymap('n', '<leader>bn', ':enew<CR>', opts) -- New buffer
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineTogglePin<CR>', opts) -- Pin buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete | BufferLineCyclePrev<CR>', opts) -- Delete buffer and go to previous

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<leader>]', ':BufferLineCycleNext<CR>', opts) -- Next buffer
vim.api.nvim_set_keymap('n', '<leader>[', ':BufferLineCyclePrev<CR>', opts) -- Previous buffer

-- Buffer movement
vim.api.nvim_set_keymap('n', '<leader>bl', ':BufferLineMoveNext<CR>', opts) -- Move buffer right
vim.api.nvim_set_keymap('n', '<leader>bh', ':BufferLineMovePrev<CR>', opts) -- Move buffer left

-- Tab management
vim.api.nvim_set_keymap('n', '<leader>to', ':tabedit %<CR>', opts) -- Open buffer in new tab
vim.api.nvim_set_keymap('n', '<leader>tt', ':tabnew<CR>', opts) -- New empty tab
