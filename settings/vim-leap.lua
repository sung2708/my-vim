-- Initialize Leap
local leap = require('leap')

-- Ensure leap.opts is initialized
leap.opts = leap.opts or {}

-- Basic Leap configuration
leap.opts.case_sensitive = true  -- Enable case-sensitive search
leap.opts.substitute_chars = { ['\r'] = '¬' }  -- Substitute \r character with a special symbol

-- Define equivalence classes for pattern matching (used for finding similar characters)
leap.opts.equivalence_classes = leap.opts.equivalence_classes or { ' \t\r\n', '([{', ')]}', '\'"`' }

-- Define safe labels for automatic jumping without conflicts
leap.opts.safe_labels = leap.opts.safe_labels or { 'a', 's', 'd', 'f', 'g' }

-- Define special keys for controlling the jump progress
leap.opts.special_keys = leap.opts.special_keys or {
  next_target = '<enter>',  -- Key to jump to the next target
  prev_target = '<backspace>',  -- Key to jump to the previous target
}

-- Custom key mappings for Leap's jump actions
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)', { noremap = true, silent = true })  -- Jump forward
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)', { noremap = true, silent = true }) -- Jump backward
vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)', { noremap = true, silent = true })  -- Search in another window

-- Configure repeat keys to repeat the last jump action
local leap_user = require('leap.user')

if leap_user then
  leap_user.set_repeat_keys('<enter>', '<backspace>', {
    relative_directions = true,  -- Adjust repeat keys based on the direction of the last jump
    modes = {'n', 'x', 'o'},  -- Modes where the repeat keys will work
  })
else
  print("Leap user module not found")
end
