return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        preview_width = 0.7, -- Preview window width (70% of the space)
                        width = 0.8,         -- Total width (80% of the space)
                        height = 0.7,        -- Total height (70% of the window)
                        prompt_position = "bottom",
                    },
                },
                
            },
        })

        -- Key mappings for Telescope

        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true, noremap = true, desc = "Telescope: Find Files" })
        vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true, noremap = true, desc = "Telescope: Live Grep" })
        vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true, noremap = true, desc = "Telescope: Buffers" })
        vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true, noremap = true, desc = "Telescope: Help Tags" })
    end,
}
