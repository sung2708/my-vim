-- Detect the OS for plugin directory
local plug_dir
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    plug_dir = '~/AppData/Local/nvim/plugged'
else
    plug_dir = vim.fn.stdpath('config') .. '/plugged'
end

vim.cmd("call plug#begin('" .. plug_dir .. "')")

-- Theme plugins
vim.cmd [[
    Plug 'Mofiqul/dracula.nvim'
    Plug 'navarasu/onedark.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'scottmckendry/cyberdream.nvim'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'sho-87/kanagawa-paper.nvim'
    Plug 'sainnhe/sonokai'
    Plug 'polirritmico/monokai-nightasty.nvim'
    Plug 'kaiuri/nvim-juliana'
]]

-- File explorer and related plugins
vim.cmd [[
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
]]

-- File search (Telescope)
vim.cmd [[
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
]]

-- Status bar
vim.cmd [[
    Plug 'nvim-lualine/lualine.nvim'
]]

-- Terminal
vim.cmd [[
    Plug 'voldikss/vim-floaterm'
]]

-- Bufferline
vim.cmd [[
    Plug 'akinsho/bufferline.nvim'
]]

-- Treesitter and its text objects
vim.cmd [[
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
]]

-- LSP Config and Installer
vim.cmd [[
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
]]

-- Autocompletion plugins
vim.cmd [[
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'onsails/lspkind-nvim'
]]

-- Indentation guides
vim.cmd [[
    Plug 'lukas-reineke/indent-blankline.nvim'
]]

-- Debugging
vim.cmd [[
    Plug 'mfussenegger/nvim-dap'
    Plug 'theHamsta/nvim-dap-virtual-text'
]]

vim.cmd("call plug#end()")

-- Load Lua configurations from the settings directory
local function load_plugin_configs()
    local files = vim.fn.glob(vim.fn.stdpath('config') .. '/settings/*.lua')
    for _, file in ipairs(vim.split(files, '\n')) do
        vim.cmd('luafile ' .. file)
    end
end
load_plugin_configs()

-- Filetype configuration
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Encoding settings
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- UI settings
vim.opt.number = true
vim.opt.showmode = true
vim.opt.syntax = 'on'
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.termguicolors = true

-- Disable cursorline and cursorcolumn for all buffers handled by bufferline
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "setlocal nocursorline nocursorcolumn"
})

-- Disable cursorline and cursorcolumn in NERDTree
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "if &filetype ==# 'nerdtree' | setlocal cursorline | endif"
})

-- History and shell settings
vim.opt.history = 10
vim.opt.backup = false
vim.opt.shell = 'pwsh'
vim.opt.shellcmdflag = '-command'
vim.opt.shellxquote = ''

-- Indentation and tab settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Display settings
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.hlsearch = true

-- Enable the display of list characters
vim.opt.list = true
vim.opt.listchars = { space = ".", tab = "->" }

-- Automatically check for external changes
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    pattern = "*",
    command = "checktime"
})

-- Enable copying from Neovim to clipboard
vim.opt.clipboard = 'unnamedplus'

-- Auto command to reload init.lua automatically on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "init.lua",
    command = "source <afile> | echo 'init.lua reloaded!'"
})

-- Set a default colorscheme
vim.cmd("colorscheme tokyonight")
