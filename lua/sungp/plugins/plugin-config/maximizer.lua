return {
    "szw/vim-maximizer",  -- Plugin for maximizing and restoring windows
    keys = { "<leader>mm" },
    config = function()
        -- Basic configuration for vim-maximizer
        -- This will maximize or restore the current window when triggered by <leader>mm
        vim.api.nvim_set_keymap('n', '<leader>mm', ':MaximizerToggle<CR>', { noremap = true, silent = true })
    end
}
