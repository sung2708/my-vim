return {
    -- Catppuccin theme: Load immediately on startup (no lazy loading)
    { 
        "catppuccin/nvim", 
        lazy = false, 
        name = "catppuccin", 
        priority = 1000 
    },

    -- Tokyo Night theme: Lazy loading
    {
        "folke/tokyonight.nvim",
        lazy = true, 
        name = "tokyonight",
        priority = 1000,
        opts = {}, 
        event = "VeryLazy" 
    },
}
