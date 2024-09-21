vim.opt.termguicolors = true
local current_folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")  -- Get the current folder name

current_folder = string.upper(current_folder)  -- Convert folder name to uppercase

require("bufferline").setup {
    options = {
        mode = "buffers",  -- Set to "tabs" to only show tabpages instead
        style_preset = require("bufferline").style_preset.default,  -- or bufferline.style_preset.minimal
        themable = true,  -- Allows highlight groups to be overridden
        numbers = function(opts)  -- Display buffer ordinal number
            return string.format("%d", opts.ordinal)
        end,
        close_command = function(bufnr) return "bdelete! " .. bufnr end,
        right_mouse_command = function(bufnr) return "bdelete! " .. bufnr end,
        left_mouse_command = function(bufnr) return "buffer " .. bufnr end,
        middle_mouse_command = nil,
        indicator = {
            icon = '▎',  -- This should be omitted if indicator style is not 'icon'
            style = 'icon'  -- Options: 'icon', 'underline', 'none'
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        name_formatter = function(buf)  -- Customize the buffer label here if needed
            return buf.name
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",  -- Options: false, "nvim_lsp", "coc"
        diagnostics_update_in_insert = false,  -- Only applies to coc
        diagnostics_update_on_event = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                          or (e == "warning" and " " or " ")
                s = s .. n .. sym
            end
            return s
        end,
        custom_filter = function(buf_number, buf_numbers)
            return true  -- Add filtering logic if needed
        end,
        offsets = {
            {
                filetype = "nerdtree",
                text = current_folder,  -- Use the current folder name
                highlight = "Directory",
                separator = true,  -- Use a "true" to enable the default separator
                text_align = "center"  -- Align text to the center
            }
        },
        color_icons = true,  -- Whether or not to add the filetype icon highlights
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        duplicates_across_groups = true,
        persist_buffer_sort = true,
        move_wraps_at_ends = false,
        separator_style = "slope",  -- Options: "slant", "slope", "thick", "thin", or a table with custom separators
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        auto_toggle_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_after_current'  -- Options: 'insert_after_current', 'insert_at_end', 'extension', 'directory', 'tabs', etc.
    }
}