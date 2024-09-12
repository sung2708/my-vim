-- Print a message when Neovim starts
print("nvim has been started . . .")

-- Detect platform and set plug directory accordingly
-- Detect platform and set plug directory accordingly
local is_win = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1

-- Set the plug directory for Windows
if is_win then
    -- Use the correct path format for Windows
    vim.g.plug_dir = vim.fn.expand('~/AppData/Local/nvim/plugged')
else
    -- Use the correct path format for Unix-like systems
    vim.g.plug_dir = vim.fn.expand('~/.vim/plugged')
end

-- Initialize vim-plug
vim.cmd('call plug#begin(vim.g.plug_dir)')

-- Theme plugins
vim.cmd('Plug \'navarasu/onedark.nvim\'')
vim.cmd('Plug \'dracula/vim\', { \'as\': \'dracula\' }')
vim.cmd('Plug \'ghifarit53/tokyonight-vim\'')
vim.cmd('Plug \'catppuccin/nvim\', { \'as\': \'catppuccin\' }')

-- Folder plugin
vim.cmd('Plug \'preservim/nerdtree\'')
vim.cmd('Plug \'Xuyuanp/nerdtree-git-plugin\'')

-- Icon plugin
vim.cmd('Plug \'ryanoasis/vim-devicons\'')

-- File search plugins
vim.cmd('Plug \'nvim-lua/plenary.nvim\'')
vim.cmd('Plug \'nvim-telescope/telescope.nvim\', { \'branch\': \'0.1.x\' }')

-- Status bar plugins
vim.cmd('Plug \'vim-airline/vim-airline\'')
vim.cmd('Plug \'vim-airline/vim-airline-themes\'')

-- Terminal plugin
vim.cmd('Plug \'voldikss/vim-floaterm\'')

-- Code intellisense plugin
vim.cmd('Plug \'neovim/nvim-lspconfig\'')

-- Completion plugins
vim.cmd('Plug \'hrsh7th/nvim-cmp\'')
vim.cmd('Plug \'hrsh7th/cmp-nvim-lsp\'')
vim.cmd('Plug \'hrsh7th/cmp-buffer\'')
vim.cmd('Plug \'hrsh7th/cmp-path\'')
vim.cmd('Plug \'hrsh7th/cmp-cmdline\'')
vim.cmd('Plug \'hrsh7th/vim-vsnip\'')
vim.cmd('Plug \'hrsh7th/cmp-vsnip\'')

-- Notification plugin
vim.cmd('Plug \'rcarriga/nvim-notify\'')

-- End of plugin setup
vim.cmd('call plug#end()')

-- General settings
vim.opt.number = true
vim.opt.encoding = "UTF-8"

-- Set pwsh as default terminal
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-command"
vim.opt.shellquote = "\""
vim.opt.shellxquote = ""

-- Disable compatibility with vi
vim.opt.compatible = false

-- Enable filetype detection
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.cmd('syntax on')

-- Cursor settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Indentation settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Disable backup
vim.opt.backup = false

-- Scrolling settings
vim.opt.scrolloff = 10

-- Disable line wrapping
vim.opt.wrap = false

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Command line settings
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.history = 1000
vim.opt.wildmenu = true

-- Set theme
vim.cmd('colorscheme dracula')
-- vim.cmd('colorscheme onedark')
-- vim.cmd('colorscheme tokyonight')
-- vim.cmd('colorscheme catppuccin')

-- Disable automatic comments on newline
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

-- Source additional settings from files in 'settings' directory
local function source_settings()
  local config_path = vim.fn.stdpath('config') .. '/settings/'
  local setting_files = vim.fn.globpath(config_path, '*.lua', true, true)

  for _, setting_file in ipairs(setting_files) do
    vim.cmd('source ' .. setting_file)
  end
end

source_settings()

