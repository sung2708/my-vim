-- Define the NotifyBackground highlight group with a specific background color
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#1c1c1c" })  -- Change #1c1c1c to your desired color

-- Require Notify and set up options
require("notify").setup({
  -- Specify the background color of the notification
  background_colour = "#1c1c1c",  -- Using the same color defined above
  
  -- Options for displaying the notification
  stages = "fade_in_slide_out",   -- Animation style for displaying notifications
  timeout = 2000,                 -- Duration before the notification disappears (in milliseconds)
  max_width = 50,                 -- Maximum width of the notification
  max_height = 10,                -- Maximum height of the notification
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  time_formats = {
    notification = "%T",           -- Format for notification time
    notification_history = "%FT%T" -- Format for notification history time
  }
})

-- Redirect Notify messages to Noice
vim.notify = require("notify")

-- Show greeting message when entering Neovim
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.notify("Welcome to Neovim!", "info") -- Display greeting message
  end,
})
