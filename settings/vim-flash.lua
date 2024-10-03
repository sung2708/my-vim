require('flash').setup({
  -- Define modes for jumping
  modes = {
    -- Configuration for character mode
    char = {
      jump_labels = true,  -- Show labels when jumping
      multi_window = true, -- Allow jumping across multiple windows
      highlight = {        -- Customize highlights
        backdrop = true,   -- Dim areas outside of the jump target
      },
    },
    -- Configuration for word mode
    word = {
      jump_labels = true,  -- Show labels for each word
    },
  },
  -- Search behavior configuration
  search = {
    mode = "fuzzy",  -- Use fuzzy search mode
    incremental = true,  -- Show results as you type
  },
})

-- Key mappings to use Flash
-- Jump to a character with 's'
vim.api.nvim_set_keymap('n', 's', ":lua require('flash').jump()<CR>", { noremap = true, silent = true })

-- Jump by word with 'w'
vim.api.nvim_set_keymap('n', 'w', ":lua require('flash').jump({search = {mode = 'word'}})<CR>", { noremap = true, silent = true })

-- Jump through the entire file with 'f'
vim.api.nvim_set_keymap('n', 'f', ":lua require('flash').jump({search = {mode = 'all'}})<CR>", { noremap = true, silent = true })

-- Disable search highlighting with '<leader>nh'
vim.api.nvim_set_keymap('n', '<leader>nh', ":nohlsearch<CR>", { noremap = true, silent = true })
