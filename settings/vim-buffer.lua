require('bufferline').setup{
  options = {
    offsets = {{filetype = "NERDTree", text = "File Explorer", padding = 1}},
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = {
        {
          name = "Your Project", -- Customize this to your project's name or any name you prefer
          highlight = {gui = "underline", guisp = "blue"},
          priority = 2, -- Smaller number = higher priority groups appear first
          icon = "",
          matcher = function(buf) -- Define how to match this group
            return buf.name:match("YOUR_PROJECT_PATH") -- Adjust this regex to match your project directory
          end,
        },
      }
    },
  },
}

