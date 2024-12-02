-- Safely require Noice and handle errors
local ok, noice = pcall(require, "noice")
if not ok then
  vim.notify("Failed to load Noice", vim.log.levels.ERROR)
  return
end

-- Define common options for key mappings
local opts = { noremap = true, silent = true }

-- Define key mappings for useful Noice functions
local function set_keymap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Noice Configuration
noice.setup({
  -- Cmdline Configuration
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {
      position = { row = 10, col = 0.5 },  -- Vertically centered cmdline
    },
    format = {
      -- Format for various cmdline types with colors
      cmdline = { pattern = "^:", icon = ">", lang = "vim", color = "LightGreen" },
      search_down = { kind = "search", pattern = "^/", icon = "↓", lang = "regex", color = "LightBlue" },
      search_up = { kind = "search", pattern = "^%?", icon = "↑", lang = "regex", color = "LightRed" },
      filter = { pattern = "^:%s*!", icon = "!", lang = "bash", color = "Yellow" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "🌙", lang = "lua", color = "Purple" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "?", lang = "help", color = "Aqua" },
      input = { view = "cmdline_input", icon = "✏️", color = "Orange" },
    },
  },

  -- Messages Configuration
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_history = "messages",
    view_search = "virtualtext",
    format = {
      error = { icon = "❌", color = "Red" },  -- Red for errors
      warning = { icon = "⚠️", color = "Yellow" },  -- Yellow for warnings
      info = { icon = "ℹ️", color = "Blue" },  -- Blue for informational messages
    }
  },

  -- Popupmenu Configuration
  popupmenu = {
    enabled = true,
    backend = "nui",
    kind_icons = {
      Text = "📝", Method = "🔧", Function = "🔍", Constructor = "🏗️", Field = "🌿",
      Variable = "📦", Class = "📚", Interface = "📖", Module = "📦", Property = "🌼",
      Unit = "⚙️", Value = "💰", Enum = "🔢", Keyword = "🔑", Snippet = "✂️",
      Color = "🎨", File = "📄", Reference = "🔗", Folder = "📁", EnumMember = "🔢",
      Constant = "🔒", Struct = "🏗️", Event = "🎉", Operator = "➕", TypeParameter = "📋",
    },
  },

  -- LSP Configuration
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
    },
    signature = {
      enabled = true,
      auto_open = { enabled = true, trigger = true, luasnip = true, throttle = 50 },
    },
    message = {
      enabled = true,
      view = "notify",
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

  -- Markdown Rendering Configuration
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help,  -- Link Vim help tags
      ["%[.-%]%((%S-)%)"] = require("noice.util").open,  -- Open markdown links
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

  -- Health Checker Configuration
  health = {
    checker = true,  -- Enable health checks
  },

  -- Presets to disable specific features
  presets = {
    bottom_search = false,  -- Disable bottom search cmdline
    command_palette = false,  -- Disable command palette mode
    long_message_to_split = false,  -- Disable splitting long messages
    inc_rename = false,  -- Disable inc-rename.nvim support
    lsp_doc_border = false,  -- Disable LSP doc border
  },

  -- Throttle UI updates
  throttle = 1000 / 30,
})

-- Set key mappings for Noice commands
set_keymap("n", "<leader>nh", "<cmd>Noice history<CR>")
set_keymap("n", "<leader>nl", "<cmd>Noice last<CR>")
set_keymap("n", "<leader>ne", "<cmd>Noice errors<CR>")
set_keymap("n", "<leader>na", "<cmd>Noice all<CR>")
