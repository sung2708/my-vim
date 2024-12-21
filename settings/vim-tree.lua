-- Configure nvim-tree
require('nvim-tree').setup({
  sync_root_with_cwd = true,       -- Sync the root directory with the current working directory
  respect_buf_cwd = true,          -- Respect buffer's cwd
  update_focused_file = {          -- Automatically update focus to the current file
    enable = true,
    update_cwd = true,             -- Update nvim-tree's root when cwd changes
  },
  git = {
    enable = true,                 -- Show Git status in the file tree
    ignore = false,                -- Do not hide Git-ignored files
  },
  renderer = {
    highlight_git = true,          -- Highlight Git status with colors
    icons = {
      show = {
        git = true,                -- Show Git icons
        folder = true,             -- Show folder icons
        file = true,               -- Show file icons
      },
      glyphs = {
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,                 -- Enable diagnostics (LSP/COC integration)
    show_on_dirs = true,           -- Show diagnostics on directories
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,                    -- Width of the nvim-tree window
    side = 'left',                 -- Display nvim-tree on the left
    preserve_window_proportions = true,
  },
  actions = {
    open_file = {
      resize_window = true,        -- Automatically resize window when a file is opened
    },
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Keymaps for nvim-tree actions
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts) -- Open file or folder
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts) -- Close folder
    vim.keymap.set('n', 'l', api.node.open.edit, opts) -- Open folder/file
    vim.keymap.set('n', 'a', api.fs.create, opts) -- Create new file/folder
    vim.keymap.set('n', 'r', api.fs.rename, opts) -- Rename file/folder
    vim.keymap.set('n', 'd', api.fs.remove, opts) -- Delete file/folder
    vim.keymap.set('n', 'x', api.fs.cut, opts) -- Cut file/folder
    vim.keymap.set('n', 'p', api.fs.paste, opts) -- Paste file/folder
    vim.keymap.set('n', 'q', api.tree.close, opts) -- Close nvim-tree
  end,
})

-- Automatically open nvim-tree on VimEnter, switch window if arguments or stdin
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Open nvim-tree
    require("nvim-tree.api").tree.open()

    -- If there are arguments or stdin, switch to previous window
    if #vim.fn.argv() > 0 or vim.g.std_in then
      vim.cmd("wincmd p") -- Switch to previous window
    end
  end,
})

-- Keymaps to toggle nvim-tree and locate the current file
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })