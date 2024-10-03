local dap = require('dap')

-- DAP Adapter configurations
dap.adapters = {
    python = {
        type = 'server',
        host = '127.0.0.1',
        port = 5678,  -- The port for debugpy
    },
    cppdbg = {
        type = 'server',
        port = 13000,  -- Adjust as necessary
        executable = {
            command = vim.fn.expand('~/.local/share/nvim/mason/bin/codelldb'),  -- Adjust this path if necessary
            args = { '--port', '13000' }
        }
    },
    typescript = {
        type = 'server',
        host = '127.0.0.1',
        port = 9229,  -- The port for the TypeScript debugger
    },
    go = {
        type = 'server',
        host = '127.0.0.1',
        port = 8080,  -- Adjust as necessary for Delve
    },
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
        program = "${workspaceFolder}/bin/${workspaceFolderBasename}",  -- Adjust the output path
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
local function set_keymap(key, command)
    vim.api.nvim_set_keymap('n', key, command, { noremap = true, silent = true })
end

set_keymap('<F5>', "<cmd>lua require'dap'.continue()<CR>")
set_keymap('<F10>', "<cmd>lua require'dap'.step_over()<CR>")
set_keymap('<F11>', "<cmd>lua require'dap'.step_into()<CR>")
set_keymap('<F12>', "<cmd>lua require'dap'.step_out()<CR>")
set_keymap('<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>")

-- Optional: Set up virtual text for DAP
require('nvim-dap-virtual-text').setup()
