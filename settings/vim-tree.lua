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

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, api = pcall(require, "nvim-tree.api")
    if ok then
      api.tree.open()
      if #vim.fn.argv() > 0 or vim.fn.has("stdin") == 1 then vim.cmd("wincmd p") end
    else
      vim.notify("Failed to load nvim-tree", vim.log.levels.ERROR)
    end
  end,
})

-- Keymaps to toggle nvim-tree and locate the current file
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
