-- Define the background color for the Notify notifications
local notify_bg_color = "#1c1c1c"

-- Set the custom highlight group for Notify background color
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = notify_bg_color })

-- Require and set up the Notify plugin
require("notify").setup({
  -- General configuration
  background_colour = notify_bg_color,  -- Reusing the color variable
  stages = "fade_in_slide_out",          -- Animation style for notifications
  timeout = 200,                         -- Duration for which the notification will be visible
  max_width = 50,                        -- Max width of the notification
  max_height = 10,                       -- Max height of the notification

  -- Icons for different notification levels
  icons = {
    DEBUG = "",   -- Debug icon
    ERROR = "",   -- Error icon
    INFO = "",    -- Info icon
    TRACE = "✎",   -- Trace icon
    WARN = "",    -- Warning icon
  },

  -- Time format for notifications
  time_formats = {
    notification = "%T",           -- Time format for regular notifications
    notification_history = "%FT%T" -- Time format for notification history
  }
})

-- Redirect vim.notify to Notify for displaying notifications
vim.notify = require("notify")

-- Automatically display a greeting message when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.notify("Welcome to Neovim!", "info")  -- Display greeting message
  end,
})

-- Keymaps for useful commands (optional, if you wish to map the notifications commands)
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>lua vim.notify('This is a test notification', 'info')<CR>", opts)
