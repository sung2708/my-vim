-- Load the nvim-web-devicons plugin
local status_ok, devicons = pcall(require, 'nvim-web-devicons')
if not status_ok then
  return
end

-- Setup nvim-web-devicons with color icons enabled
devicons.setup {
  color_icons = true,  -- Ensure color icons are enabled
  default = true,
  strict = true,
}

-- Set up vim-nerdtree-syntax-highlight with necessary configurations
vim.g.NERDTreeHighlightFolders = 1 -- Enable folder icon highlighting
vim.g.NERDTreeHighlightFoldersFullName = 1 -- Highlight the full folder name

-- Disable unnecessary highlights for performance
vim.g.NERDTreeDisableFileExtensionHighlight = 1
vim.g.NERDTreeDisableExactMatchHighlight = 1
vim.g.NERDTreeDisablePatternMatchHighlight = 1

-- Define a broader color palette for file types and frameworks
local colors = {
  beige = "F5C06F",
  blue = "689FB6",
  git_orange = "F54D27",
  rspec_red = "FE405F",
  cpp_green = "5CB85C",
  go_blue = "00ADD8",
  lua_blue = "000080",
  vimscript_green = "019833",
  python_primary = "306998",  -- Primary color for Python
  python_secondary = "FFD43B", -- Secondary color for Python
  js_yellow = "F7DF1E",
  nodejs_green = "8CC84B",
  html_red = "E34C26",
  css_blue = "264DE4",
  react_blue = "61DAFB",
  vue_green = "41B883",
  django_green = "092E20",
  flask_black = "000000",
}

-- Highlight specific file extensions or matches for various languages and frameworks
vim.g.NERDTreeExtensionHighlightColor = {
  lua = colors.lua_blue,
  vim = colors.vimscript_green,
  c = colors.cpp_green,
  cpp = colors.cpp_green,
  go = colors.go_blue,
  py = colors.python_primary,          -- Primary color for Python
  js = colors.js_yellow,                -- JavaScript
  html = colors.html_red,               -- HTML
  css = colors.css_blue,                -- CSS
}

-- Custom highlighting for Python files to show two colors
vim.g.NERDTreePatternMatchHighlightColor = {
  ["^.*%.py$"] = colors.python_primary,  -- Primary color for Python files
  ["^.*%.py%.backup$"] = colors.python_secondary, -- Secondary color for backup Python files
}

-- Highlight exact matches for specific files (like .gitignore)
vim.g.NERDTreeExactMatchHighlightColor = {
  [".gitignore"] = colors.git_orange,
}

-- Frameworks (you can add more frameworks similarly)
vim.g.NERDTreePatternMatchHighlightColor = {
  [".*_spec%.rb$"] = colors.rspec_red, -- RSpec for Ruby
  ["node_modules"] = colors.nodejs_green, -- Node.js specific folder
  ["react"] = colors.react_blue,         -- React framework
  ["vue"] = colors.vue_green,            -- Vue.js framework
  ["django"] = colors.django_green,      -- Django framework for Python
  ["flask"] = colors.flask_black,        -- Flask framework for Python
}

-- Custom folder and file icon colors
vim.g.WebDevIconsDefaultFolderSymbolColor = colors.beige
vim.g.WebDevIconsDefaultFileSymbolColor = colors.blue

-- Optional: Disable cursorline in NERDTree for performance
vim.g.NERDTreeHighlightCursorline = 0