local dap = require('dap')

-- Define DAP Adapters
dap.adapters = {
  -- Adapter for Python (debugpy)
  python = {
    type = 'server',
    host = '127.0.0.1',
    port = 5678, -- Ensure debugpy listens on this port
  },
  -- Adapter for C/C++ (codelldb)
  cppdbg = {
    type = 'server',
    port = 13000, -- Port for codelldb
    executable = {
      command = vim.fn.expand('~/.local/share/nvim/mason/bin/codelldb'), -- Adjust path as needed
      args = { '--port', '13000' },
    },
  },
  -- Adapter for TypeScript (Node.js debugger)
  typescript = {
    type = 'server',
    host = '127.0.0.1',
    port = 9229, -- Node.js debugger port
  },
  -- Adapter for Go (Delve)
  go = {
    type = 'server',
    host = '127.0.0.1',
    port = 8080, -- Port for Delve debugger
  },
}

-- Configurations for Python
dap.configurations.python = {
  {
    name = "Launch Python file",
    type = "python",
    request = "launch",
    program = "${file}", -- Current file
    pythonPath = function()
      return '/usr/bin/python' -- Adjust to your Python interpreter path
    end,
  },
}

-- Configurations for C/C++
dap.configurations.cpp = {
  {
    name = "Launch C/C++ program",
    type = "cppdbg",
    request = "launch",
    program = "${workspaceFolder}/bin/${workspaceFolderBasename}", -- Output path
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

-- Configurations for TypeScript
dap.configurations.typescript = {
  {
    name = "Launch TypeScript file",
    type = "typescript",
    request = "launch",
    program = "${file}", -- Current file
    cwd = "${workspaceFolder}",
    runtimeArgs = { "--inspect-brk" }, -- Node.js runtime args
    protocol = "inspector",
  },
}

-- Configurations for Go
dap.configurations.go = {
  {
    name = "Launch Go file",
    type = "go",
    request = "launch",
    program = "${file}", -- Current file
    cwd = "${workspaceFolder}",
  },
}

-- Key mappings for DAP
local function set_keymap(key, command)
  vim.api.nvim_set_keymap('n', key, command, { noremap = true, silent = true })
end

set_keymap('<F5>', "<cmd>lua require'dap'.continue()<CR>") -- Start/continue debugging
set_keymap('<F10>', "<cmd>lua require'dap'.step_over()<CR>") -- Step over
set_keymap('<F11>', "<cmd>lua require'dap'.step_into()<CR>") -- Step into
set_keymap('<F12>', "<cmd>lua require'dap'.step_out()<CR>") -- Step out
set_keymap('<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>") -- Toggle breakpoint

-- Optional: Set up virtual text for DAP
local dap_virtual_text_ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if dap_virtual_text_ok then
  dap_virtual_text.setup()
else
  vim.notify("nvim-dap-virtual-text not installed", vim.log.levels.WARN)
end
