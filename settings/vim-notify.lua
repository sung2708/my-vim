-- Require Notify and set up options
require("notify").setup({
  -- Specify the background color of the notification
  background_colour = "NotifyBackground",

  -- Options for displaying the notification
  stages = "fade_in_slide_out", -- Animation for displaying notifications
  timeout = 2000, -- Duration before the notification disappears (in ms)
  max_width = 50, -- Maximum width of the notification
  max_height = 10, -- Maximum height of the notification
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
   time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
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
