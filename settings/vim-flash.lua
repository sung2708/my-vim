-- Flash plugin setup
require('flash').setup({
  -- Define modes for jump behaviors
  modes = {
    -- Character mode: jump to specific characters
    char = {
      jump_labels = true,   -- Show labels for quick navigation
      multi_window = true,  -- Enable jumping across all windows
      highlight = {
        backdrop = true,    -- Dim non-target areas for focus
      },
    },
    -- Word mode: jump to specific words
    word = {
      jump_labels = true,   -- Show labels for each word
    },
  },
  -- Search configuration
  search = {
    mode = "fuzzy",          -- Fuzzy matching for flexible search
    incremental = true,      -- Update results as you type
  },
})

-- Key mappings for Flash plugin
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Jump to a character
keymap('n', 's', ":lua require('flash').jump()<CR>", vim.tbl_extend("force", opts, { desc = "Jump to a character using Flash" }))

-- Jump by word
keymap('n', 'w', ":lua require('flash').jump({ search = { mode = 'word' } })<CR>", vim.tbl_extend("force", opts, { desc = "Jump by word using Flash" }))

-- Jump across the entire file
keymap('n', 'f', ":lua require('flash').jump({ search = { mode = 'all' } })<CR>", vim.tbl_extend("force", opts, { desc = "Jump through the entire file using Flash" }))

-- Disable search highlighting
keymap('n', '<leader>nh', ":nohlsearch<CR>", vim.tbl_extend("force", opts, { desc = "Disable search highlighting" }))
