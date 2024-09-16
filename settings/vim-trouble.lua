-- Cấu hình Noice
require('noice').setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline
    opts = {},
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = { view = "cmdline_input", icon = "󰥻 " },
    },
  },
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_history = "messages",
    view_search = "virtualtext",
  },
  popupmenu = {
    enabled = true,
    backend = "nui",
    kind_icons = {},
  },
  redirect = {
    view = "popup",
    filter = { event = "msg_show" },
  },
  commands = {
    history = {
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
    last = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
      filter_opts = { count = 1 },
    },
    errors = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
    all = {
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {},
    },
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30,
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false,
    },
    hover = {
      enabled = true,
      silent = false,
      view = nil,
      opts = {},
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
      view = nil,
      opts = {},
    },
    message = {
      enabled = true,
      view = "notify",
      opts = {},
    },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help,
      ["%[.-%]%((%S-)%)"] = require("noice.util").open,
    },
    highlights = {
      ["|%S-|"] = "@text.reference",
      ["@%S+"] = "@parameter",
      ["^%s*(Parameters:)"] = "@text.title",
      ["^%s*(Return:)"] = "@text.title",
      ["^%s*(See also:)"] = "@text.title",
      ["{%S-}"] = "@parameter",
    },
  },
  health = {
    checker = true,
  },
  presets = {
    bottom_search = false,
    command_palette = false,
    long_message_to_split = false,
    inc_rename = false,
    lsp_doc_border = false,
  },
  throttle = 1000 / 30,
  views = {},
  routes = {},
  status = {},
  format = {},
})

-- Cấu hình Trouble
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { noremap = true, silent = true, desc = "Diagnostics (Trouble)" })
vim.api.nvim_set_keymap('n', '<leader>xX', '<cmd>TroubleToggle buffer<cr>', { noremap = true, silent = true, desc = "Buffer Diagnostics (Trouble)" })
vim.api.nvim_set_keymap('n', '<leader>cs', '<cmd>TroubleToggle quickfix<cr>', { noremap = true, silent = true, desc = "Symbols (Trouble)" })
vim.api.nvim_set_keymap('n', '<leader>cl', '<cmd>TroubleToggle lsp<cr>', { noremap = true, silent = true, desc = "LSP Definitions / references / ... (Trouble)" })
vim.api.nvim_set_keymap('n', '<leader>xL', '<cmd>TroubleToggle loclist<cr>', { noremap = true, silent = true, desc = "Location List (Trouble)" })
vim.api.nvim_set_keymap('n', '<leader>xQ', '<cmd>TroubleToggle qflist<cr>', { noremap = true, silent = true, desc = "Quickfix List (Trouble)" })