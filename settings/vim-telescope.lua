local builtin = require('telescope.builtin')

-- Set Telescope defaults
require('telescope').setup {
  defaults = {
    layout_config = {
      horizontal = {  -- Configure horizontal layout
        preview_width = 0.7,  -- Preview window width (70% of the horizontal space)
        width = 0.8,          -- Total width for Telescope (90% of the window)
        height = 0.7,         -- Optional: total height (90% of the window)
      },
      prompt_position = "top",  -- Position the prompt at the top
    },
  },
}

-- Key mappings for Telescope
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    layout_config = {
      width = 0.8,  -- Total width for the find files selection (90%)
    },
  })
end, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({
    layout_config = {
      width = 0.8,  -- Total width for the live grep selection (90%)
    },
  })
end, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers({
    layout_config = {
      width = 0.8,  -- Total width for the buffers selection (90%)
    },
  })
end, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>fh', function()
  builtin.help_tags({
    layout_config = {
      width = 0.8,  -- Total width for the help tags selection (90%)
    },
  })
end, { desc = 'Telescope help tags' })
