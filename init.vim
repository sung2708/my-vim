"
" _________                        __________ 
" /   _____/ __ __   ____     ____  \______   \
"\_____  \ |  |  \ /    \   / ___\  |     ___/
" /        \|  |  /|   |  \ / /_/  > |    |    
"/_______  /|____/ |___|  / \___  /  |____|    
"        \/             \/ /_____/             


lua print("nvim has been started . . .")

" list plugin					       
" using vim-plug (https://github.com/junegunn/vim-plug)  
call plug#begin('~/vimfiles/plugged')

" Theme
Plug 'navarasu/onedark.nvim'                   "One dark theme

" Folder
Plug 'preservim/nerdtree'			"File brower
Plug 'Xuyuanp/nerdtree-git-plugin'		"Git status
Plug 'tiaerdtree-syntax-highlight'  		"Syntax highlight

" Icon
Plug 'ryanoasis/vim-devicons'

" File search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal
Plug 'voldikss/vim-floaterm'

" Code intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" General setting
set number   "number in line
set encoding=UTF-8

set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
" Set theme 
colorscheme onedark

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor
