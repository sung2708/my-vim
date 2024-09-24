local dap = require('dap')

-- DAP Adapter configurations
dap.adapters.python = {
    type = 'server',
    host = '127.0.0.1',
    port = 5678,  -- The port for debugpy
}

dap.adapters.cppdbg = {
    type = 'server',
    port = 13000, -- Adjust as necessary
    executable = {
        command = vim.fn.expand('~/.local/share/nvim/mason/bin/codelldb'), -- Adjust this path if necessary
        args = { '--port', '13000' }
    }
}

dap.adapters.typescript = {
    type = 'server',
    host = '127.0.0.1',
    port = 9229,  -- The port for the TypeScript debugger
}

dap.adapters.go = {
    type = 'server',
    host = '127.0.0.1',
    port = 8080,  -- Adjust as necessary for Delve
}

-- Configuration for Python
dap.configurations.python = {
    {
        name = "Launch Python file",
        type = "python",
        request = "launch",
        program = "${file}",  -- The currently opened file
        pythonPath = function()
            return '/usr/bin/python'  -- Adjust as necessary
        end,
    },
}

-- Configuration for C/C++
dap.configurations.cpp = {
    {
        name = "Launch C/C++",
        type = "cppdbg",
        request = "launch",
        program = "${workspaceFolder}/bin/${workspaceFolderBasename}", -- Adjust the output path
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        runInTerminal = false,
        setupCommands = {
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = true,
            },
        },
    },
}

-- Configuration for TypeScript
dap.configurations.typescript = {
    {
        name = "Launch TypeScript file",
        type = "typescript",
        request = "launch",
        program = "${file}",  -- The currently opened file
        cwd = "${workspaceFolder}",
        runtimeArgs = { "--inspect-brk" },
        protocol = "inspector",
    },
}

-- Configuration for Go
dap.configurations.go = {
    {
        name = "Launch Go file",
        type = "go",
        request = "launch",
        program = "${file}",  -- The currently opened file
        cwd = "${workspaceFolder}",
    },
}

-- Key mappings for DAP
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })

-- Optional: Set up virtual text
require('nvim-dap-virtual-text').setup()
