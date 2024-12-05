-- Require Noice and set up options
require("noice").setup({
  -- Command-line configuration
  cmdline = {
    enabled = true, -- Enable Noice cmdline UI
    view = "cmdline_popup", -- Set the view to cmdline_popup (floating popup)
    opts = {
      position = { row = 10, col = 0.5 }, -- Center cmdline vertically
    },
    format = {
      cmdline = { pattern = "^:", icon = ">", lang = "vim" }, -- Default command-line mode
      search_down = { kind = "search", pattern = "^/", icon = "↓", lang = "regex" }, -- Search down with /
      search_up = { kind = "search", pattern = "^%?", icon = "↑", lang = "regex" }, -- Search up with ?
      filter = { pattern = "^:%s*!", icon = "!", lang = "bash" }, -- Shell commands with !
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "🌙", lang = "lua" }, -- Lua execution
      help = { pattern = "^:%s*he?l?p?%s+", icon = "?", lang = "help" }, -- Help commands
      input = { view = "cmdline_input", icon = "✏️" }, -- For input() method
    },
  },

  -- Message configuration
  messages = {
    enabled = true, -- Enable Noice message UI
    view = "notify", -- Default view for messages (using Notify.nvim)
    view_error = "notify", -- View for errors
    view_warn = "notify", -- View for warnings
    view_history = "messages", -- View for :messages
    view_search = "virtualtext", -- View for search count messages (virtual text)
  },

  -- Popup menu configuration
  popupmenu = {
    enabled = true, -- Enable Noice popup menu UI
    backend = "nui", -- Use "nui" backend for cmdline completions
    kind_icons = { -- Set custom icons for completion items
      Text = "📝",
      Method = "🔧",
      Function = "🔍",
      Constructor = "🏗️",
      Field = "🌿",
      Variable = "📦",
      Class = "📚",
      Interface = "📖",
      Module = "📦",
      Property = "🌼",
      Unit = "⚙️",
      Value = "💰",
      Enum = "🔢",
      Keyword = "🔑",
      Snippet = "✂️",
      Color = "🎨",
      File = "📄",
      Reference = "🔗",
      Folder = "📁",
      EnumMember = "🔢",
      Constant = "🔒",
      Struct = "🏗️",
      Event = "🎉",
      Operator = "➕",
      TypeParameter = "📋",
    },
  },

  -- Command redirection configuration
  redirect = {
    view = "popup", -- Redirect command output to a popup view
    filter = { event = "msg_show" }, -- Filter messages to show
  },

  -- Custom commands
  commands = {
    history = { -- View message history
      view = "split", -- Show history in a split view
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" }, { error = true }, { warning = true }, { event = "msg_show", kind = { "" } }, { event = "lsp", kind = "message" }
        },
      },
    },
    last = { -- View last message
      view = "popup", opts = { enter = true, format = "details" },
      filter = { any = { { event = "notify" }, { error = true }, { warning = true }, { event = "msg_show", kind = { "" } }, { event = "lsp", kind = "message" } } },
      filter_opts = { count = 1 },
    },
    errors = { -- View only error messages
      view = "popup", opts = { enter = true, format = "details" },
      filter = { error = true }, filter_opts = { reverse = true },
    },
    all = { -- View all messages
      view = "split", opts = { enter = true, format = "details" },
      filter = {},
    },
  },

  -- Notify configuration for routing notifications to nvim-notify
  notify = {
    enabled = true, -- Enable Noice as a notification system
    view = "notify", -- Use notify view for notifications
  },

  -- LSP configuration
  lsp = {
    progress = {
      enabled = true, -- Enable LSP progress reporting
      format = "lsp_progress", -- Format for progress messages
      format_done = "lsp_progress_done", -- Format for completed progress messages
      throttle = 1000 / 30, -- Throttle updates to ~30 per second
      view = "mini", -- Use mini view for LSP progress
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false, -- Don't override LSP markdown formatting
      ["vim.lsp.util.stylize_markdown"] = false, -- Keep original LSP markdown stylization
      ["cmp.entry.get_documentation"] = false, -- Don't override completion documentation
    },
    hover = {
      enabled = true, -- Enable hover support
      silent = false, -- Show a message if hover is not available
      view = nil, -- Use default hover view if nil
      opts = {}, -- Additional options for hover
    },
    signature = {
      enabled = true, -- Enable LSP signature help
      auto_open = {
        enabled = true, -- Automatically open signature help
        trigger = true, -- Trigger on signature help characters
        luasnip = true, -- Open on Luasnip insert node jumps
        throttle = 50, -- Debounce signature help requests by 50ms
      },
      view = nil, -- Use default signature view
      opts = {}, -- Additional options for signature help
    },
    message = {
      enabled = true, -- Enable LSP messages
      view = "notify", -- View for LSP messages
      opts = {},
    },
    documentation = {
      view = "hover", -- View for hover and signature help documentation
      opts = { -- Options for documentation view
        lang = "markdown", replace = true, render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },

  -- Markdown rendering settings for Noice
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help, -- Link Vim help tags
      ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- Link markdown links
    },
    highlights = {
      ["|%S-|"] = "@text.reference", -- Highlight text references
      ["@%S+"] = "@parameter", -- Highlight parameters
      ["^%s*(Parameters:)"] = "@text.title", -- Highlight title "Parameters"
      ["^%s*(Return:)"] = "@text.title", -- Highlight title "Return"
      ["^%s*(See also:)"] = "@text.title", -- Highlight title "See also"
      ["{%S-}"] = "@parameter", -- Highlight inline parameters
    },
  },

  -- Enable health checker
  health = {
    checker = true, -- Enable health checks
  },

  -- Presets for common Noice configurations
  presets = {
    bottom_search = false, -- Disable bottom search cmdline
    command_palette = false, -- Disable command palette mode
    long_message_to_split = false, -- Disable splitting long messages into a split window
    inc_rename = false, -- Disable inc-rename.nvim support
    lsp_doc_border = false, -- Disable border for LSP hover and signature help
  },

  throttle = 1000 / 30, -- Throttle UI updates (lower frequency)
  views = {}, -- Custom views
  routes = {}, -- Custom routes
  status = {}, -- Statusline components
  format = {}, -- Formatting options
})

-- Keymaps cho các chức năng hữu ích
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>nh", "<cmd>Noice history<CR>", opts) -- show history
vim.api.nvim_set_keymap("n", "<leader>nl", "<cmd>Noice last<CR>", opts) -- show last message
vim.api.nvim_set_keymap("n", "<leader>ne", "<cmd>Noice errors<CR>", opts) -- show errors
vim.api.nvim_set_keymap("n", "<leader>na", "<cmd>Noice all<CR>", opts) -- show all messages