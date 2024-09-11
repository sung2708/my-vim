" /   _____/ __ __   ____     ____  \______   \
"\_____  \ |  |  \ /    \   / ___\  |     ___/
" /        \|  |  /|   |  \ / /_/  > |    |    
"/_______  /|____/ |___|  / \___  /  |____|    
"        \/             \/ /_____/             


"lua print("nvim has been started . . .")

" list plugin					       
" using vim-plug (https://github.com/junegunn/vim-plug)  
call plug#begin('~/vimfiles/plugged')

" Theme
Plug 'navarasu/onedark.nvim'                   " One dark theme
Plug 'dracula/vim', { 'as': 'dracula' }         " Dracula theme
Plug 'ghifarit53/tokyonight-vim'                " Tokyo night theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }  "catppuccino theme

" Folder
Plug 'preservim/nerdtree'			            " File brower
Plug 'Xuyuanp/nerdtree-git-plugin'		        " Git status
"Plug 'tiaerdtree-syntax-highlight'  		    " Syntax highlight

" Icon
Plug 'ryanoasis/vim-devicons'

" File search
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal
Plug 'voldikss/vim-floaterm'
" Code intellisense

Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/nvim-compe'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'       " Cầu nối giữa nvim-cmp và LSP
Plug 'hrsh7th/cmp-buffer'         " Gợi ý từ buffer
Plug 'hrsh7th/cmp-path'           " Gợi ý đường dẫn
Plug 'hrsh7th/cmp-cmdline'        " Gợi ý cho dòng lệnh
Plug 'hrsh7th/vim-vsnip'          " Plugin snippet
Plug 'hrsh7th/cmp-vsnip'          " Cầu nối giữa nvim-cmp và vsnip

" Notification
Plug 'rcarriga/nvim-notify'


call plug#end()

" General setting
"Set number
set number   

set encoding=UTF-8

" Set pwsh default terminal
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
" set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Set theme 
colorscheme dracula
"colorscheme onedark
"colorscheme tokyonight
"colorscheme catppuccin


"let $PATH = "C:/Program Files/Git/bin"

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o



" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor
