return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
      return 20 -- Default size
    end,
    open_mapping = [[<c-\>]], -- Main toggle key
    start_in_insert = true,
    insert_mappings = true, -- Apply mapping in insert mode
    terminal_mappings = true, -- Apply mapping in terminal mode
    persist_size = true,
    direction = 'horizontal', -- Options: 'vertical', 'horizontal', 'tab', 'float'
    close_on_exit = true, -- Close terminal window on process exit
    shell = vim.o.shell, -- Use the default shell
    float_opts = {
      border = 'curved',
      width = 80,
      height = 20,
      winblend = 3,
    },
    highlights = {
      -- Replace placeholders with valid color values or remove the block entirely if unnecessary
      Normal = {
        guibg = "NONE", -- Use a valid color or 'NONE' to reset
      },
      FloatBorder = {
        guifg = "Grey", -- Use a valid color or 'NONE' to reset
        guibg = "Black", -- Use a valid color or 'NONE' to reset
      },
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Key mappings for ToggleTerm
    vim.keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<CR>", { noremap = true, silent = true, desc = "Toggle all terminals" })
    vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true, desc = "Open horizontal terminal" })
    vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true, desc = "Open vertical terminal" })
    vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true, desc = "Open floating terminal" })
    vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=tab<CR>", { noremap = true, silent = true, desc = "Open terminal in a new tab" })
    vim.keymap.set("n", "<leader>lg", ":lua require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true }):toggle()<CR>", { noremap = true, silent = true, desc = "Open lazygit in a terminal" })
    vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>c", { noremap = true, silent = true, desc = "Close terminal" })

  end,
}
