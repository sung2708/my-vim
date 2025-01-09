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

-- Load dashboard settings
local ok, dashboard = pcall(require, "dashboard")
if not ok then
  vim.notify("Failed to load dashboard-nvim", vim.log.levels.ERROR)
  return
end

-- Define the sections for the dashboard
local section = {
  header = {
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
  buttons = {
    { icon = '  ', desc = 'Find File        ', key = 'f', action = 'Telescope find_files' },
    { icon = '󱦺  ', desc = 'Recent Files     ', key = 'r', action = 'Telescope oldfiles' },
    { icon = '󰩉  ', desc = 'Find Word        ', key = 'w', action = 'Telescope live_grep' },
    { icon = '  ', desc = 'Open Terminal    ', key = 't', action = 'FloatermNew' },
    { icon = '  ', desc = 'Find in Files    ', key = 's', action = 'Telescope grep_string' },
    { icon = '  ', desc = 'Open Project     ', key = 'p', action = 'Telescope project' },
    { icon = '  ', desc = 'Toggle Theme     ', key = 'c', action = 'lua ToggleTheme()' },
    { icon = '󰈙  ', desc = 'Show Docs        ', key = 'd', action = 'Telescope help_tags' },
  },
  footer = function()
    local system_info = string.format("Neovim v%s | %s", vim.version().major .. '.' .. vim.version().minor, os.date("%Y-%m-%d"))
    local quotes = {
      "Code is like humor. When you have to explain it, it’s bad.",
      "Fix the cause, not the symptom.",
      "Simplicity is the soul of efficiency.",
      "Sharp tools make good work.",
    }
    return { system_info, quotes[math.random(#quotes)] }
  end,
}

-- Configure the dashboard
dashboard.setup({
  theme = 'doom',
  config = {
    header = section.header,
    center = section.buttons,
    footer = section.footer,
  },
  header_pad = 7,   -- Increase top margin to center header
  center_pad = 3,   -- Space between header and buttons
  footer_pad = 2,   -- Space between buttons and footer
  width = 60,       -- Reduce width to center align
  height = 20,      -- Decrease height to keep content in the center
  center_align = true, -- Align sections to center
})

-- Autocmd to handle startup behavior
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local args = vim.fn.argv()
    if #args == 0 then
      vim.cmd("Dashboard")
    end
  end,
})
