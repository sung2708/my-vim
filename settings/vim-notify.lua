require('notify').setup({
  -- Hiệu ứng thông báo
  stages = 'fade_in_slide_out',   -- Sử dụng hiệu ứng fade in và slide out

  -- Thời gian thông báo tồn tại (ms)
  timeout = 2000,                 -- Thay đổi thời gian hiển thị thông báo

  -- Màu sắc
  background_colour = '#282c34',  -- Màu nền của thông báo
  text_colour = '#abb2bf',        -- Màu chữ của thông báo

  -- Kích thước và vị trí thông báo
  max_width = 60,                 -- Chiều rộng tối đa của thông báo (dùng px)
  max_height = 10,                -- Chiều cao tối đa của thông báo (dùng dòng)
  layout = "center",              -- Vị trí thông báo trên màn hình

  -- Phương pháp render thông báo
  render = "default",             -- Phương pháp render thông báo mặc định

  -- Các tùy chọn bổ sung nếu cần
})

-- Thiết lập vim.notify để sử dụng notify.nvim
vim.notify = require("notify")
