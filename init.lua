--     _______. __    __  .__   __.   _______ .______  
--    /       ||  |  |  | |  \ |  |  /  _____||   _  \ 
--   |   (----`|  |  |  | |   \|  | |  |  __  |  |_)  |
--    \   \    |  |  |  | |  . `  | |  | |_ | |   ___/ 
--.----)   |   |  `--'  | |  |\   | |  |__| | |  |     
--|_______/     \______/  |__| \__|  \______| | _|     

-- Plugin installation
local function ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  
  if fn.empty(fn.glob(install_path)) > 0 then
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

local packer_bootstrap = ensure_packer()

-- Initialize Packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Ensure Packer can manage itself

  -- Theme plugins
  use { 'Mofiqul/dracula.nvim', event = 'VimEnter' }
  use { 'navarasu/onedark.nvim', event = 'VimEnter' }
  use { 'folke/tokyonight.nvim', event = 'VimEnter' }
  use { 'catppuccin/nvim', as = 'catppuccin', event = 'VimEnter' }
  use { 'scottmckendry/cyberdream.nvim', event = 'VimEnter' }
  use { 'rebelot/kanagawa.nvim', event = 'VimEnter' }
  use { 'sho-87/kanagawa-paper.nvim', event = 'VimEnter' }
  use { 'sainnhe/sonokai', event = 'VimEnter' }
  use { 'polirritmico/monokai-nightasty.nvim', event = 'VimEnter' }
  use { 'kaiuri/nvim-juliana', event = 'VimEnter' }

  -- File explorer
  use { 'preservim/nerdtree', cmd = 'NERDTreeToggle' }
  use { 'Xuyuanp/nerdtree-git-plugin', after = 'nerdtree' }
  use { 'ryanoasis/vim-devicons', after = 'nerdtree' }
  use { 'unkiwii/vim-nerdtree-sync', after = 'nerdtree' }
  use { 'jcharum/vim-nerdtree-syntax-highlight', branch = 'escape-keys', after = 'nerdtree' }

  -- File search
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} }, cmd = 'Telescope' }

  -- Status bar
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }, event = 'BufWinEnter' }

  -- Terminal
  use { 'voldikss/vim-floaterm', cmd = 'FloatermToggle' }

  -- Bufferline
  use { 'akinsho/bufferline.nvim', tag = "*", event = 'BufWinEnter' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }

  -- LSP Config and LSP Installer
  use { 'neovim/nvim-lspconfig', event = 'BufRead' }
  use { 'williamboman/mason.nvim', cmd = 'Mason' }
  use { 'williamboman/mason-lspconfig.nvim', after = 'mason.nvim' }

  -- Autocompletion plugins
  use { 'hrsh7th/nvim-cmp', event = 'InsertEnter' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }

  -- Snippets plugin
  use { 'L3MON4D3/LuaSnip', event = 'InsertEnter' }
  use { 'rafamadriz/friendly-snippets', after = 'LuaSnip' }

  -- Optional: Icons for autocompletion
  use { 'onsails/lspkind-nvim', after = 'nvim-cmp' }

  -- Indentation guides plugin
  use { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' }

  -- Debugging plugin
  use { 'mfussenegger/nvim-dap', event = 'BufRead' }
  use { 'theHamsta/nvim-dap-virtual-text', after = 'nvim-dap' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Function to load all Lua configuration files from the settings folder
local function load_plugin_configs()
  local current_dir = vim.fn.getcwd()
  local settings_dir = current_dir .. '/settings/'
  local files = vim.fn.glob(settings_dir .. '*.lua')

  for _, file in ipairs(vim.fn.split(files, '\n')) do
    local filename = file:match("([^/\\]+)%.lua$")
    if filename then
      require('settings.' .. filename)
    end
  end
end

-- Load all plugin configurations
load_plugin_configs()

-- Filetype configuration
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Encoding settings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- UI settings
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.syntax = "on"
vim.opt.termguicolors = true

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
vim.cmd("highlight Normal guibg=NONE")

-- Indentation and tab settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = false

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Display settings
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.hlsearch = true

-- History and shell settings
vim.opt.history = 10
vim.opt.backup = false
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-command"
vim.opt.shellxquote = ""

-- Configure display characters for special components
vim.opt.listchars = {
  space = ".",
  tab = "->",
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
  vim.opt.clipboard = "unnamed"
else
  vim.opt.clipboard = "unnamedplus"
end

-- Display special characters like eol, tab, space, etc.
vim.opt.list = true

-- Auto commands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

-- Themes settings
-- Set a default colorscheme
local default_colorscheme = "dracula"

-- Function to set colorscheme
local function set_colorscheme(scheme)
    vim.cmd("colorscheme " .. scheme)
end

-- Set the default colorscheme on startup
set_colorscheme(default_colorscheme)

-- Define a command to change colorscheme and update default
vim.api.nvim_create_user_command("Colorscheme", function(opts)
    local new_scheme = opts.args
    if new_scheme and new_scheme ~= "" then
        set_colorscheme(new_scheme)
        default_colorscheme = new_scheme  -- Update the default colorscheme
    else
        print("Please provide a colorscheme name.")
    end
end, { nargs = 1 })
