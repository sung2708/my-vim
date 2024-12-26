-- Configure nvim-tree
require('nvim-tree').setup({
  sync_root_with_cwd = true,      -- Sync the root directory with the current working directory
  respect_buf_cwd = true,         -- Respect buffer's cwd
  update_focused_file = {
    enable = true,
    update_cwd = true,            -- Update nvim-tree's root when cwd changes
  },
  git = {
    enable = true,                -- Show Git status in the file tree
    ignore = false,               -- Do not hide Git-ignored files
  },
  renderer = {
    highlight_git = true,         -- Highlight Git status with colors
    icons = {
      show = {
        git = true,               -- Show Git icons
        folder = true,            -- Show folder icons
        file = true,              -- Show file icons
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
    enable = true,                -- Enable diagnostics (LSP/COC integration)
    show_on_dirs = true,          -- Show diagnostics on directories
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,                   -- Width of the nvim-tree window
    side = 'left',                -- Display nvim-tree on the left
    preserve_window_proportions = true,
  },
  actions = {
    open_file = {
      resize_window = true,       -- Automatically resize window when a file is opened
    },
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Keymaps for nvim-tree actions
    local keymaps = {
      ['<CR>'] = api.node.open.edit,
      ['h']   = api.node.navigate.parent_close,
      ['l']   = api.node.open.edit,
      ['a']   = api.fs.create,
      ['r']   = api.fs.rename,
      ['d']   = api.fs.remove,
      ['x']   = api.fs.cut,
      ['p']   = api.fs.paste,
      ['q']   = api.tree.close,
    }

    for key, cmd in pairs(keymaps) do
      vim.keymap.set('n', key, cmd, opts)
    end
  end,
})

-- Automatically open nvim-tree on VimEnter, switch window if arguments or stdin
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Open nvim-tree
    require("nvim-tree.api").tree.open()

    -- Switch to previous window if there are arguments or stdin
    if #vim.fn.argv() > 0 or vim.g.std_in then
      vim.cmd("wincmd p")
    end
  end,
})

-- Keymaps to toggle nvim-tree and locate the current file
local tree_keymaps = {
  ['<leader>e'] = ':NvimTreeToggle<CR>',
  ['<leader>f'] = ':NvimTreeFindFile<CR>',
  ['<leader>n'] = ':NvimTreeFocus<CR>',
}

for key, cmd in pairs(tree_keymaps) do
  vim.keymap.set('n', key, cmd, { noremap = true, silent = true })
end
