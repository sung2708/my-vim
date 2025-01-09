-- Configure nvim-tree
require('nvim-tree').setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = { enable = true, update_cwd = true },
  git = { enable = true, ignore = false },
  renderer = {
    highlight_git = true,
    icons = {
      show = { git = true, folder = true, file = true },
      glyphs = {
        git = {
          unstaged = "✗", staged = "✓", unmerged = "",
          renamed = "➜", untracked = "★", deleted = "", ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = { hint = "", info = "", warning = "", error = "" },
  },
  view = { width = 30, side = 'left', preserve_window_proportions = true },
  actions = { open_file = { resize_window = true } },
  on_attach = function(bufnr)
    local api, opts = require('nvim-tree.api'), { noremap = true, silent = true, buffer = bufnr }
    local keymaps = {
      ['<CR>'] = api.node.open.edit, ['h'] = api.node.navigate.parent_close,
      ['l'] = api.node.open.edit, ['a'] = api.fs.create, ['r'] = api.fs.rename,
      ['d'] = api.fs.remove, ['x'] = api.fs.cut, ['p'] = api.fs.paste, ['q'] = api.tree.close,
    }
    for k, cmd in pairs(keymaps) do vim.keymap.set('n', k, cmd, opts) end
  end,
})

-- Autocmd to handle startup behavior
-- Autocmd to handle startup behavior
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local args = vim.fn.argv()
    local api = require("nvim-tree.api")

    if #args == 0 then
      -- No arguments (no files): Open dashboard
      local ok, dashboard = pcall(require, "dashboard")
      if ok then
        dashboard.setup({
          -- Dashboard-specific settings (customize as needed)
          theme = 'hyper',
          config = {
            header = {
              "Welcome to Neovim!",
              "Configure your workflow 🚀"
            },
            -- Add more sections or buttons as needed
          },
        })
        vim.cmd("Dashboard")  -- Open the dashboard
      else
        vim.notify("Failed to load dashboard-nvim", vim.log.levels.ERROR)
      end
    else
      -- Arguments (files) provided: Open nvim-tree
      api.tree.open()  -- Open the file tree
      vim.cmd("wincmd p")  -- Focus the previous window (to switch to nvim-tree)
    end
  end,
})

-- Keymaps to toggle nvim-tree and locate the current file
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
