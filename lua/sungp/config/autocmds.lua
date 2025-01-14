-- Disable auto-commenting for all file types
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" }) -- Disable automatic comment continuation
    end,
})

-- Automatically check for external changes and reload files
vim.api.nvim_create_autocmd("FocusGained", { pattern = "*", command = "checktime" }) -- Reload files on gaining focus
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        local choice = vim.fn.confirm("File changed on disk. Reload buffer? (Yes/No)", "&Yes\n&No")
        if choice == 1 then
            vim.cmd("checktime")
        end
    end
})

-- Configure clipboard support based on OS
if vim.fn.has('win32') == 1 then
  vim.opt.clipboard = 'unnamed' -- System clipboard on Windows
else
  vim.opt.clipboard = 'unnamedplus' -- Enhanced clipboard on other systems
end

-- Set transparent background for specific UI elements
vim.cmd('hi Normal guibg=NONE ctermbg=NONE') -- Transparent background for normal text
vim.cmd('hi Comment guibg=NONE ctermbg=NONE') -- Transparent background for comments
vim.cmd('hi String guibg=NONE ctermbg=NONE') -- Transparent background for strings