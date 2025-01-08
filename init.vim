" ------------------------------------
" General Settings (Load before plugins)
" ------------------------------------
set number                         " Enable line numbers
set relativenumber                 " Enable relative line numbers
set showmode                       " Display current mode
set cursorline                     " Highlight the current line
set cursorcolumn                   " Highlight the current column
set termguicolors                  " Enable 24-bit RGB color in the terminal
set encoding=utf-8                 " Set encoding to UTF-8
set shiftwidth=4                   " Indentation width for autoindents
set tabstop=4                      " Number of spaces per tab
set expandtab                      " Use spaces instead of tabs
set smartindent                    " Automatically indent new lines
set clipboard=unnamedplus          " Enable copying to system clipboard
set scrolloff=10                   " Start scrolling 10 lines before the end
set laststatus=2                   " Always show status line
set nowrap                         " Disable line wrapping
set history=10                     " Set command history limit
set nobackup                       " Disable backup
set incsearch                      " Incremental search
set hlsearch                       " Highlight search results
set ignorecase                     " Ignore case in searches
set smartcase                      " Override ignorecase if search contains capital letters
set splitright                     " Open new split windows to the right

" ------------------------------------
" Auto Commands (Avoid Redundancy)
" ------------------------------------
autocmd FileType 'NvimTree' setlocal cursorline nocursorcolumn
autocmd FileType 'bufferline' setlocal cursorline nocursorcolumn
autocmd BufEnter * if &filetype != 'NvimTree' | setlocal cursorline cursorcolumn | endif

" ------------------------------------
" Plugin Management using vim-plug
" ------------------------------------
let plug_dir = has("win32") || has("win64") ? '~/AppData/Local/nvim/plugged' : stdpath('config') . '/plugged'

call plug#begin(plug_dir)

" Theme plugins
Plug 'Mofiqul/dracula.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'sainnhe/sonokai'
Plug 'kaiuri/nvim-juliana'
Plug 'olivercederborg/poimandres.nvim'
Plug 'EdenEast/nightfox.nvim'

" File explorer and related plugins
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" File search (Telescope)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Status bar
Plug 'nvim-lualine/lualine.nvim'

" Terminal
Plug 'voldikss/vim-floaterm'

" Bufferline
Plug 'akinsho/bufferline.nvim'

" Treesitter and its text objects
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'after': 'nvim-treesitter' }

" LSP Config and Installer
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim', { 'after': 'mason.nvim' }

" Autocompletion plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp', { 'after': 'nvim-cmp' }
Plug 'hrsh7th/cmp-buffer', { 'after': 'nvim-cmp' }
Plug 'hrsh7th/cmp-path', { 'after': 'nvim-cmp' }
Plug 'hrsh7th/cmp-cmdline', { 'after': 'nvim-cmp' }
Plug 'saadparwaiz1/cmp_luasnip', { 'after': 'nvim-cmp' }
Plug 'L3MON4D3/LuaSnip', { 'after': 'nvim-cmp' }
Plug 'rafamadriz/friendly-snippets', { 'after': 'LuaSnip' }
Plug 'onsails/lspkind-nvim', { 'after': 'nvim-cmp' }

" Indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'

" Autopairs
Plug 'windwp/nvim-autopairs', { 'after': 'nvim-cmp' }

" Motion plugins
Plug 'ggandor/leap.nvim'

" Noice plugins
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'

" Notify
Plug 'rcarriga/nvim-notify'

" Transparency
Plug 'tribela/vim-transparent'

" Tag
Plug 'windwp/nvim-ts-autotag'

" Formatter
Plug 'stevearc/conform.nvim'

call plug#end()

" ------------------------------------
" Theme Setup (Load after plugins)
" ------------------------------------
colorscheme catppuccin            " Set default colorscheme to 'catppuccin'

" ------------------------------------
" Key Mappings and Other Settings
" ------------------------------------
" Close buffer without exiting Vim
nnoremap <silent> <leader>bd :bp \| sp \| bn \| bd<CR>

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Map Shift+Tab to accept Copilot suggestions in Insert mode
inoremap <expr> <Right-Tab> copilot#Accept("\<CR>")

" Automatically check for external changes and reload files
autocmd FocusGained,CursorHold * checktime
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None | checktime

" Key mappings for window resizing
nnoremap <M-Right> :vertical resize +1<CR>
nnoremap <M-Left>  :vertical resize -1<CR>
nnoremap <M-Down>  :resize +1<CR>
nnoremap <M-Up>    :resize -1<CR>

" ------------------------------------
" External Configuration Loading
" ------------------------------------
for file in split(glob(stdpath('config') . '/settings/*.lua'), "\n")
    exec 'source' file
endfor
