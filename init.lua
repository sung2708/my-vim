-- Xác định thư mục cài đặt plugin dựa trên hệ điều hành
local is_win = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1
vim.g.plug_dir = is_win and vim.fn.expand('plugged') or vim.fn.expand('~/.local/share/nvim/plugged')

-- Khởi tạo vim-plug để quản lý plugin
vim.cmd('call plug#begin("' .. vim.g.plug_dir .. '")')

-- Danh sách các plugin
local plug = vim.fn['plug#']

-- Theme plugins
plug('navarasu/onedark.nvim')              -- One Dark theme
plug('dracula/vim', { as = 'dracula' })    -- Dracula theme
plug('ghifarit53/tokyonight-vim')          -- Tokyo Night theme
plug('catppuccin/nvim', { as = 'catppuccin' }) -- Catppuccin theme

-- Các plugin khác
plug('preservim/nerdtree')                 -- Quản lý thư mục dạng tree
plug('Xuyuanp/nerdtree-git-plugin')        -- Tích hợp Git với NERDTree
plug('nvim-tree/nvim-web-devicons')        -- Biểu tượng tệp tin

plug('nvim-lua/plenary.nvim')              -- Thư viện Lua cần thiết cho nhiều plugin
plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' }) -- Tìm kiếm file và nội dung

plug('nvim-lualine/lualine.nvim')          -- Hiển thị status bar ở dưới cùng

plug('voldikss/vim-floaterm')              -- Terminal nổi trong Neovim

plug('neovim/nvim-lspconfig')              -- Cấu hình LSP cho nhiều ngôn ngữ
plug('hrsh7th/nvim-cmp')                   -- Plugin hoàn thành mã
plug('hrsh7th/cmp-nvim-lsp')               -- Tích hợp hoàn thành mã từ LSP
plug('L3MON4D3/LuaSnip')                   -- Snippet plugin
plug('saadparwaiz1/cmp_luasnip')           -- Hoàn thành mã dựa trên snippets
plug('onsails/lspkind-nvim')

plug('rcarriga/nvim-notify')               -- Plugin hiển thị thông báo
plug('folke/noice.nvim')                   -- Cải thiện hiển thị thông báo, lệnh
plug('MunifTanjim/nui.nvim')               -- Thư viện UI cho noice.nvim

plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) -- Plugin cú pháp cây
plug('nvim-treesitter/nvim-treesitter-textobjects')

plug('glepnir/dashboard-nvim')             -- Giao diện Dashboard khi mở Neovim

plug('windwp/nvim-autopairs')              -- Plugin tự động đóng ngoặc, dấu ngoặc kép

plug('akinsho/bufferline.nvim', { branch = 'main' }) -- Quản lý buffer theo tabs

plug('folke/flash.nvim')                   -- Plugin tìm kiếm nhanh

-- Kết thúc cấu hình plugin
vim.cmd('call plug#end()')

-- Thiết lập theme sau khi cài đặt các plugin
vim.cmd('colorscheme dracula')  -- Chọn giao diện dracula

-- Các cài đặt chung cho Neovim
vim.opt.number = true                      -- Hiển thị số dòng
vim.opt.encoding = "UTF-8"                 -- Thiết lập mã hóa UTF-8
vim.opt.shell = "pwsh"                     -- Thiết lập PowerShell làm shell mặc định
vim.opt.shellcmdflag = "-command"          -- Lệnh shell flag cho PowerShell
vim.opt.shellquote = "\""                  -- Thiết lập cách báo dấu nháy cho lệnh shell
vim.opt.shellxquote = ""                   -- Không sử dụng dấu nháy cho shell lệnh bổ sung

vim.opt.compatible = false                 -- Vô hiệu hoá chế độ tương thích với vi
vim.opt.cursorline = true                  -- Làm nổi bật dòng chứa con trỏ
vim.opt.cursorcolumn = true                -- Làm nổi bật cột chứa con trỏ
vim.opt.shiftwidth = 4                     -- Kích thước thụt dòng
vim.opt.tabstop = 4                        -- Kích thước tab là 4 ký tự
vim.opt.expandtab = true                   -- Thay thế tab bằng khoảng trắng
vim.opt.backup = false                     -- Tắt tạo file backup

-- Cài đặt cuộn trang
vim.opt.scrolloff = 10                     -- Giữ 10 dòng trên và dưới con trỏ khi cuộn trang

-- Cài đặt tìm kiếm
vim.opt.wrap = false                       -- Vô hiệu hoá tự động ngắt dòng
vim.opt.incsearch = true                   -- Tìm kiếm theo từng ký tự nhập
vim.opt.ignorecase = true                  -- Tìm kiếm không phân biệt chữ hoa/thường
vim.opt.smartcase = true                   -- Phân biệt chữ hoa/thường khi có chữ hoa trong từ khóa

-- Cài đặt hiển thị dòng lệnh và bộ nhớ lệnh
vim.opt.showcmd = true                     -- Hiển thị lệnh đang nhập
vim.opt.showmode = true                    -- Hiển thị chế độ hiện tại (insert, normal, ...)
vim.opt.showmatch = true                   -- Hiển thị cặp ngoặc khi đặt con trỏ
vim.opt.history = 1000                     -- Lưu lịch sử 1000 lệnh
vim.opt.wildmenu = true                    -- Hiển thị menu khi gõ lệnh không hoàn chỉnh
vim.opt.termguicolors = true               -- Bật màu sắc giao diện 24-bit

-- Vô hiệu hoá tự động thêm comment khi xuống dòng mới
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

-- Vô hiệu hoá nhà cung cấp perl không cần thiết
vim.g.loaded_perl_provider = 0

-- Nguồn các tệp Lua bổ sung từ thư mục 'settings'
local config_path = vim.fn.stdpath('config') .. '/settings/'
for _, setting_file in ipairs(vim.fn.globpath(config_path, '*.lua', true, true)) do
  vim.cmd('source ' .. setting_file)
end
