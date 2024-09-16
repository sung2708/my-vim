require('lualine').setup {
  options = {
    icons_enabled = true,                          -- Kích hoạt icon trong lualine
    theme = 'auto',                                -- Tự động chọn theme dựa trên theme hiện tại
    component_separators = { left = '|', right = '|'}, -- Separator giữa các thành phần
    section_separators = { left = '', right = ''}, -- Không dùng separator giữa các sections
    always_divide_middle = true,                   -- Chia đều khoảng trống giữa các phần
  },
  sections = {
    lualine_a = {'mode'},                          -- Hiển thị chế độ làm việc hiện tại (NORMAL, INSERT, v.v.)
    lualine_b = {'branch', 'diff'},                -- Hiển thị nhánh git và các thay đổi
    lualine_c = {'filename'},                      -- Hiển thị tên file hiện tại
    lualine_x = {'filetype'},                      -- Hiển thị loại file (HTML, Lua, v.v.)
    lualine_y = {'progress'},                      -- Hiển thị tiến độ (vị trí trong file)
    lualine_z = {'location'}                       -- Hiển thị dòng và cột hiện tại
  },
  inactive_sections = {
    lualine_c = {'filename'},                      -- Chỉ hiển thị tên file khi không hoạt động
    lualine_x = {'location'},                      -- Hiển thị dòng và cột khi không hoạt động
  },
  extensions = {'nerdtree', 'fugitive'}            -- Hỗ trợ các plugin NERDTree và Fugitive (Git)
}
