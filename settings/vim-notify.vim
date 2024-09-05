lua << EOF

require("notify")("nvim has been started . . .", "info", {
    title = "Startup",
    timeout = 2000, -- Thời gian thông báo tồn tại (ms)
    icon = "", -- Biểu tượng cho thông báo
    on_open = function() 
        vim.cmd("echo 'Neovim has been started'")
    end,
})

require('notify').setup({
    stages = 'fade_in_slide_out',
    timeout = 2000,
    background_colour = '#282c34',
    text_colour = '#abb2bf'
})


EOF
