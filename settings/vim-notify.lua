-- Thông báo khi Neovim khởi động
require("notify")("nvim has been started . . .", "info", {
    title = "Startup",
    timeout = 2000,  -- Thời gian thông báo tồn tại (ms)
    icon = "",     -- Biểu tượng cho thông báo
    on_open = function() 
        vim.cmd("echo 'Neovim has been started'")
    end,
})

-- Cấu hình cho nvim-notify
require('notify').setup({
    stages = 'fade_in_slide_out',   -- Hiệu ứng thông báo
    timeout = 2000,                 -- Thời gian thông báo tồn tại (ms)
    background_colour = '#282c34',  -- Màu nền thông báo
    text_colour = '#abb2bf'         -- Màu chữ thông báo
})
