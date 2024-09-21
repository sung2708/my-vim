-- NERDTree key mappings
vim.keymap.set('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true, desc = "Focus NERDTree" })
vim.keymap.set('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true, desc = "Open NERDTree" })
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NERDTree" })
vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true, desc = "Find File in NERDTree" })

-- Configure arrows for NERDTree
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

-- Enable highlighting for the current file in NERDTree
vim.g.nerdtree_sync_cursorline = 1

-- Automatically open NERDTree when starting Neovim
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("NERDTree")
  end
})

--Start NERDTree and put the cursor back in the other window.
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("NERDTree")
        vim.cmd("wincmd p")  -- Switch to the previous window
    end
})