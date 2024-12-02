-- Load the nvim-web-devicons plugin
local status_ok, devicons = pcall(require, 'nvim-web-devicons')
if not status_ok then
  return
end

-- Setup nvim-web-devicons with color icons enabled
devicons.setup {
  color_icons = true, -- Enable color icons
  default = true,     -- Use default icons for unspecified file types
  strict = true,      -- Ensure accurate file type detection
}

-- Configure vim-nerdtree-syntax-highlight
vim.g.NERDTreeHighlightFolders = 1           -- Enable folder icon highlighting
vim.g.NERDTreeHighlightFoldersFullName = 1   -- Highlight the full folder name
vim.g.NERDTreeDisableFileExtensionHighlight = 1 -- Disable unnecessary highlights
vim.g.NERDTreeDisableExactMatchHighlight = 1
vim.g.NERDTreeDisablePatternMatchHighlight = 1

-- Define an extended color palette for icons
local colors = {
  beige = "#F5C06F",
  blue = "#689FB6",
  git_orange = "#F54D27",
  rspec_red = "#FE405F",
  cpp_green = "#5CB85C",
  go_blue = "#00ADD8",
  lua_blue = "#000080",
  vimscript_green = "#019833",
  python_primary = "#306998",  -- Python main color
  python_secondary = "#FFD43B", -- Python secondary
  js_yellow = "#F7DF1E",
  nodejs_green = "#8CC84B",
  html_red = "#E34C26",
  css_blue = "#264DE4",
  react_blue = "#61DAFB",
  vue_green = "#41B883",
  django_green = "#092E20",
  flask_black = "#000000",
  rust_orange = "#DEA584", -- Rust
  java_red = "#B07219",    -- Java
  php_purple = "#8993BE",  -- PHP
  ruby_red = "#701516",    -- Ruby
  docker_blue = "#2496ED"  -- Docker
}

-- Assign colors to file extensions
vim.g.NERDTreeExtensionHighlightColor = {
  lua = colors.lua_blue,
  vim = colors.vimscript_green,
  c = colors.cpp_green,
  cpp = colors.cpp_green,
  go = colors.go_blue,
  py = colors.python_primary,
  js = colors.js_yellow,
  html = colors.html_red,
  css = colors.css_blue,
  rs = colors.rust_orange,   -- Rust
  java = colors.java_red,    -- Java
  php = colors.php_purple,   -- PHP
  rb = colors.ruby_red       -- Ruby
}

-- Assign colors for specific patterns and frameworks
vim.g.NERDTreePatternMatchHighlightColor = {
  ["^.*%.py$"] = colors.python_primary,
  ["^.*%.py%.backup$"] = colors.python_secondary,
  [".*_spec%.rb$"] = colors.rspec_red,       -- RSpec for Ruby
  ["node_modules"] = colors.nodejs_green,   -- Node.js specific folder
  ["react"] = colors.react_blue,            -- React framework
  ["vue"] = colors.vue_green,               -- Vue.js framework
  ["django"] = colors.django_green,         -- Django framework
  ["flask"] = colors.flask_black,           -- Flask framework
  ["Dockerfile"] = colors.docker_blue       -- Dockerfile
}

-- Highlight specific filenames
vim.g.NERDTreeExactMatchHighlightColor = {
  [".gitignore"] = colors.git_orange,       -- .gitignore files
  ["README.md"] = colors.blue,             -- README files
  ["Makefile"] = colors.python_secondary   -- Makefile
}

-- Custom default colors for folder and file icons
vim.g.WebDevIconsDefaultFolderSymbolColor = colors.beige
vim.g.WebDevIconsDefaultFileSymbolColor = colors.blue

-- Optional: Disable cursorline in NERDTree for better performance
vim.g.NERDTreeHighlightCursorline = 0
