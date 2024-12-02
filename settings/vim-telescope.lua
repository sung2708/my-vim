-- Telescope setup with default layout configurations
require('telescope').setup {
  defaults = {
    layout_config = {
      horizontal = {  -- Horizontal layout configuration
        preview_width = 0.7,  -- Preview window width (70% of the space)
        width = 0.8,          -- Total width (80% of the space)
        height = 0.7,         -- Total height (70% of the window)
      },
      prompt_position = "top",  -- Position the prompt at the top
    },
  },
}

-- Local options for key mappings (non-recursive, silent)
local opts = { noremap = true, silent = true }

-- General Telescope key mappings with layout configuration
local function telescope_with_layout(func, description)
  vim.keymap.set('n', '<leader>'..func[1], function()
    -- Call Telescope function with consistent layout width
    require('telescope.builtin')[func[2]]({
      layout_config = { width = 0.8 },  -- Ensure consistent width across all mappings
    })
  end, vim.tbl_extend('force', opts, { desc = description }))
end

-- Define key mappings for Telescope commands with layout configuration
telescope_with_layout({'ff', 'find_files'}, 'Telescope find files')
telescope_with_layout({'fg', 'live_grep'}, 'Telescope live grep')
telescope_with_layout({'fb', 'buffers'}, 'Telescope buffers')
telescope_with_layout({'fh', 'help_tags'}, 'Telescope help tags')
