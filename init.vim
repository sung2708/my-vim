" Optimize settings
set synmaxcol=3000                " Prevent breaking syntax highlight for long strings
set lazyredraw
au BufNewFile,BufRead *.json set foldmethod=indent  " Change foldmethod for specific filetype

" Specify the directory for plugins
if has('win32') || has('win64')
    let s:plug_dir = '~/AppData/Local/nvim/plugged'
else
    let s:plug_dir = stdpath('config') . '/plugged'
endif

call plug#begin(s:plug_dir)

" Theme plugins
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

" File explorer and related plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" File search (Telescope)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" Terminal
Plug 'voldikss/vim-floaterm'

" Bufferline
Plug 'akinsho/bufferline.nvim'

" Treesitter and its text objects
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" LSP Config and Installer
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'

" Indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'

call plug#end()

" Load Lua configurations from the settings directory
function! LoadPluginConfigs()
    let files = glob(stdpath('config') . '/settings/*.lua')
    for file in split(files, '\n')
        execute 'luafile' file
    endfor
endfunction
call LoadPluginConfigs()

" Filetype configuration
filetype on
filetype plugin on
filetype indent on

" Encoding settings
set encoding=utf-8
set fileencoding=utf-8

" UI settings
set number
set showmode
syntax on
set termguicolors

" Disable cursorline and cursorcolumn in bufferline
augroup BufferlineSettings
    autocmd!
    autocmd FileType bufferline setlocal nocursorline nocursorcolumn
augroup END

" History and shell settings
set history=10
set nobackup
set shell=pwsh
set shellcmdflag=-command
set shellxquote=

" Indentation and tab settings
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent

" Search settings
set incsearch
set ignorecase
set smartcase

" Display settings
set scrolloff=10
set nowrap
set hlsearch
set listchars=space:.,tab:->

" Automatically check for external changes
augroup check_time
    autocmd!
    autocmd CursorHold,CursorHoldI * checktime
augroup END

" Enable copying from Neovim to clipboard
set clipboard=unnamedplus

" Set a default colorscheme
colorscheme tokyonight

" Auto command to reload vimrc automatically on save
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | redraw!
augroup END
