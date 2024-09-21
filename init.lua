-- Plugin installation
local function ensure_packer()
  local fn = vim.fn
  -- Path to install Packer
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  
  -- Check if Packer is already installed
  if fn.empty(fn.glob(install_path)) > 0 then
    -- If not, clone from GitHub
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    print("Installing Packer... Restart Neovim after the installation.")
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Check if Packer needs to be installed
local packer_bootstrap = ensure_packer()

-- Initialize Packer
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'  -- Ensure Packer can manage itself
  
  -- Theme plugins
  use 'Mofiqul/dracula.nvim'     -- Load the Dracula color scheme
  use 'navarasu/onedark.nvim'    -- Load the One Dark color scheme
  use { 'Mofiqul/dracula.nvim'}
  use { 'navarasu/onedark.nvim'}
  use { 'folke/tokyonight.nvim'}
  use { 'catppuccin/nvim', as = 'catppuccin'}
  use { 'scottmckendry/cyberdream.nvim'}
  use { 'rebelot/kanagawa.nvim'}
  use { 'sho-87/kanagawa-paper.nvim'}
  use { 'sainnhe/sonokai'}
  use { 'polirritmico/monokai-nightasty.nvim'}
  use { 'kaiuri/nvim-juliana'}

  -- File explorer
  use 'preservim/nerdtree'       -- File explorer
  use 'Xuyuanp/nerdtree-git-plugin'  -- Git integration for NERDTree
  use 'ryanoasis/vim-devicons'   -- Icons for NERDTree
  use 'unkiwii/vim-nerdtree-sync'
  use {
  'jcharum/vim-nerdtree-syntax-highlight',-- Syntax highlighting for NERDTree nodes
  branch = 'escape-keys'
} 

-- File search
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
} 

-- status bar
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

--Terminal
use 'voldikss/vim-floaterm'

-- Bufferline
use {'akinsho/bufferline.nvim', tag = "*"}

-- Treesitter
use({
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  requires = "nvim-treesitter/nvim-treesitter",
})

-- LSP Config and LSP Installer
use 'neovim/nvim-lspconfig'          -- Neovim LSP configuration
use 'williamboman/mason.nvim'        -- LSP Installer
use 'williamboman/mason-lspconfig.nvim' -- Mason supports lspconfig setup

-- Autocompletion plugins
use 'hrsh7th/nvim-cmp'               -- Autocompletion plugin
use 'hrsh7th/cmp-nvim-lsp'           -- LSP source for nvim-cmp
use 'hrsh7th/cmp-buffer'             -- Buffer source for nvim-cmp
use 'hrsh7th/cmp-path'               -- Filesystem paths source for nvim-cmp
use 'hrsh7th/cmp-cmdline'            -- Autocomplete for command line
use 'saadparwaiz1/cmp_luasnip'       -- Snippets source for nvim-cmp

-- Snippets plugin
use 'L3MON4D3/LuaSnip'               -- Snippet engine
use 'rafamadriz/friendly-snippets'   -- A collection of snippets

-- Optional: Icons cho autocompletion
use 'onsails/lspkind-nvim'           -- Icons cho autocompletion

  -- Indentation guides plugin
  use { 'lukas-reineke/indent-blankline.nvim'}

  -- Debugging plugin
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text' 

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Function to load all Lua configuration files from the settings folder
local function load_plugin_configs()
  -- Get the current working directory
  local current_dir = vim.fn.getcwd()
  local settings_dir = current_dir .. '/settings/'
  
  -- Get all Lua files in the settings directory
  local files = vim.fn.glob(settings_dir .. '*.lua')

  for _, file in ipairs(vim.fn.split(files, '\n')) do
    -- Extract only the filename without path and extension
    local filename = file:match("([^/\\]+)%.lua$")  -- Handle both Unix and Windows paths
    if filename then
      -- Require the configuration file using the relative path
      require('settings.' .. filename)
    end
  end
end

-- Load all plugin configurations
load_plugin_configs()


-- Filetype configuration
vim.cmd("filetype on")                 -- Enable automatic file type detection
vim.cmd("filetype plugin on")          -- Enable plugins for each file type
vim.cmd("filetype indent on")          -- Enable indentation based on file type

-- Encoding settings
vim.opt.encoding = "utf-8"             -- Default encoding for Neovim
vim.opt.fileencoding = "utf-8"         -- Encoding for the current file

-- UI settings
vim.opt.number = true                  -- Display line numbers
vim.opt.cursorline = true              -- Highlight the current line
vim.opt.cursorcolumn = true            -- Highlight the current column
vim.opt.syntax = "on"                  -- Enable syntax highlighting
vim.opt.termguicolors = true           -- Use true colors in the terminal

-- Disable CursorLine and CursorColumn in NERDTree
vim.api.nvim_create_autocmd("FileType", {
    pattern = "nerdtree",
    callback = function()
        vim.opt.cursorline = true
        vim.opt.cursorcolumn = false
    end
})

-- Re-enable CursorLine and CursorColumn when leaving NERDTree
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "nerdtree" then
            vim.opt.cursorline = true
            vim.opt.cursorcolumn = true
        end
    end
})

-- Optional: Set cursor color if you're using a terminal that supports it
vim.cmd("highlight Normal guibg=NONE")  -- Ensure normal background is clear

-- Indentation and tab settings
vim.opt.shiftwidth = 4                 -- Width of each indentation (4 spaces)
vim.opt.tabstop = 4                    -- Width of a tab (4 spaces)
vim.opt.expandtab = true               -- Convert tabs to spaces
vim.opt.smartindent = true             -- Enable smart auto-indenting
vim.opt.autoindent = false             -- Disable auto-indenting

-- Search settings
vim.opt.incsearch = true               -- Incremental search (character by character)
vim.opt.ignorecase = true              -- Case-insensitive search
vim.opt.smartcase = true               -- Case-sensitive search if uppercase letters are used

-- Display settings
vim.opt.scrolloff = 10                 -- Minimum distance from cursor to edge of screen when scrolling
vim.opt.wrap = false                   -- Disable automatic line wrapping
vim.opt.showmode = true                -- Show current mode (insert, normal, etc.)
vim.opt.showcmd = true                 -- Display commands while typing
vim.opt.showmatch = true               -- Highlight matching parentheses
vim.opt.hlsearch = true                -- Highlight search results

-- History and shell settings
vim.opt.history = 10                   -- Remember the last 10 commands
vim.opt.backup = false                 -- Do not create backup files
vim.opt.shell = "pwsh"                 -- Use PowerShell as the shell
vim.opt.shellcmdflag = "-command"      -- Flag to run shell commands
vim.opt.shellxquote = ""               -- Do not add quotes when running shell commands

-- Configure display characters for special components
vim.opt.listchars = {
  space = ".",       -- Character to display for spaces
  tab = "->",        -- Character to display for tabs (2 characters required)
}

-- Automatically check for external changes
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  pattern = "*",
  command = "checktime",
})

vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
  pattern = "*",
  command = "checktime",
})

vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold", "CursorHoldI"}, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" and vim.fn.mode() ~= "r" and vim.fn.mode():sub(1, 1) ~= "!" and vim.fn.mode():sub(1, 1) ~= "t" and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.api.nvim_echo({{"File changed on disk. Buffer reloaded.", "WarningMsg"}}, false, {})
  end,
})

-- Enable copying from Neovim to clipboard
if vim.fn.has('win32') == 1 then
  vim.opt.clipboard = "unnamed"  -- Use default clipboard on Windows
else
  vim.opt.clipboard = "unnamedplus"  -- Use system clipboard on other operating systems
end

-- Display special characters like eol, tab, space, etc.
vim.opt.list = true

-- Auto commands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
  -- Disable automatic comment addition at the start of new lines, preserve formatting when typing
})

-- Themes settings
vim.cmd[[colorscheme onedark]]