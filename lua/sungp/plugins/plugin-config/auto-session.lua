return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  },
  config = function()
    local auto_session = require("auto-session")
    auto_session.setup({
      enabled = true,
      root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_save = true,
      auto_restore = false,
      auto_create = true,
      auto_restore_last_session = false,
      use_git_branch = false,
      lazy_support = true,
      close_unsupported_windows = true,
      args_allow_single_directory = true,
      continue_restore_on_error = true,
      show_auto_restore_notif = false,
      cwd_change_handling = false,
      lsp_stop_on_restore = false,
      log_level = "error",
      session_lens = {
        load_on_setup = true,
        previewer = false,
        mappings = {},
        session_control = {
          control_dir = vim.fn.stdpath("data") .. "/auto_session/",
          control_filename = "session_control.json",
        },
      },
    })
    -- Key mappings for AutoSession
    vim.keymap.set("n", "<leader>ss", ":SessionSave<CR>", { silent = true, noremap = true, desc = "Save Session" })
    vim.keymap.set("n", "<leader>sl", ":SessionLoad<CR>", { silent = true, noremap = true, desc = "Load Session" })
    vim.keymap.set("n", "<leader>sd", ":SessionDelete<CR>", { silent = true, noremap = true, desc = "Delete Session" })
  end,
}