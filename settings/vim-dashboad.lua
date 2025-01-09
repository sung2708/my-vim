-- Function to toggle between themes
function _G.ToggleTheme()
  local current_theme = vim.g.colors_name
  local themes = { 'onedark', 'dracula', 'tokyonight', 'catppuccin', 'sonokai', 'juliana', 'poimandres', 'nightfox' }
  for i, theme in ipairs(themes) do
    if theme == current_theme then
      vim.cmd("colorscheme " .. themes[(i % #themes) + 1])
      return
    end
  end
  vim.cmd("colorscheme onedark") -- Default theme
end

-- Helper to count plugins and generate footer
local function generate_footer()
  -- Determine plugin directory based on OS
  local plug_dir
  if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    plug_dir = vim.fn.expand("~/AppData/Local/nvim/plugged")
  else
    plug_dir = vim.fn.stdpath("config") .. "/plugged"
  end

  -- Count plugins
  local plugin_count = 0
  if vim.fn.isdirectory(plug_dir) == 1 then
    plugin_count = vim.fn.len(vim.fn.glob(plug_dir .. "/*", 0, 1))
  else
    vim.notify("Plugin directory not found: " .. plug_dir, vim.log.levels.WARN)
  end

  -- System info
  local system_info = string.format(
    "Neovim v%s | %s | Plugins loaded: %d",
    vim.version().major .. '.' .. vim.version().minor,
    os.date("%Y-%m-%d"),
    plugin_count
  )

  -- Quotes
  local quotes = {
    "Code is like humor. When you have to explain it, it’s bad.",
    "Fix the cause, not the symptom.",
    "Simplicity is the soul of efficiency.",
    "Sharp tools make good work.",
  }
  local random_quote = quotes[math.random(#quotes)]

  return { system_info, random_quote }
end

-- Dashboard configuration
local ok, dashboard = pcall(require, "dashboard")
if not ok then
  vim.notify("Failed to load dashboard-nvim", vim.log.levels.ERROR)
  return
end

dashboard.setup({
  theme = 'doom',
  config = {
    header = {
      "                                             ",
      "                                             ",
      "                                             ",
      "                                             ",
      "                                             ",
      "                                             ",
      "                                             ",
      "                                             ",
      "                                             ",
      "███████╗██╗   ██╗███╗   ██╗ ██████╗ ██████╗ ",
      "██╔════╝██║   ██║████╗  ██║██╔════╝ ██╔══██╗",
      "███████╗██║   ██║██╔██╗ ██║██║  ███╗██████╔╝",
      "╚════██║██║   ██║██║╚██╗██║██║   ██║██╔═══╝ ",
      "███████║╚██████╔╝██║ ╚████║╚██████╔╝██║     ",
      "╚══════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ",
      "                                             ",
      "         Welcome to SUNGP!          ",
      "                                             ",
    },
    center = {
      { icon = '  ', desc = 'Find File        ', key = 'f', action = 'Telescope find_files' },
      { icon = '󱦺  ', desc = 'Recent Files     ', key = 'r', action = 'Telescope oldfiles' },
      { icon = '󰩉  ', desc = 'Find Word        ', key = 'w', action = 'Telescope live_grep' },
      { icon = '  ', desc = 'Open Terminal    ', key = 't', action = 'FloatermNew' },
      { icon = '  ', desc = 'Find in Files    ', key = 's', action = 'Telescope grep_string' },
      { icon = '  ', desc = 'Open Project     ', key = 'p', action = 'Telescope project' },
      { icon = '  ', desc = 'Toggle Theme     ', key = 'c', action = 'lua ToggleTheme()' },
      { icon = '󰈙  ', desc = 'Show Docs        ', key = 'd', action = 'Telescope help_tags' },
    },
    footer = generate_footer,
  },
  header_pad = 7,
  center_pad = 3,
  footer_pad = 2,
  width = 60,
  height = 20,
  center_align = true,
})

-- Autocmd for startup behavior
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if #vim.fn.argv() == 0 then
      vim.cmd("Dashboard")
    end
  end,
})
