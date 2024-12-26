local dap = require('dap')

-- Helper function to set up adapters
local function setup_adapter(name, config)
  dap.adapters[name] = config
end

-- Define DAP Adapters
setup_adapter('python', {
  type = 'server',
  host = '127.0.0.1',
  port = 5678, -- Port for debugpy
})

setup_adapter('cppdbg', {
  type = 'server',
  port = 13000,
  executable = {
    command = vim.fn.expand('~/.local/share/nvim/mason/bin/codelldb'), -- Adjust as needed
    args = { '--port', '13000' },
  },
})

setup_adapter('typescript', {
  type = 'server',
  host = '127.0.0.1',
  port = 9229, -- Node.js debugger port
})

setup_adapter('go', {
  type = 'server',
  host = '127.0.0.1',
  port = 8080, -- Port for Delve
})

-- Configurations for Python
dap.configurations.python = {
  {
    name = "Launch Python file",
    type = "python",
    request = "launch",
    program = "${file}", -- Current file
    pythonPath = function()
      return '/usr/bin/python' -- Adjust as needed
    end,
  },
}

-- Configurations for C/C++
dap.configurations.cpp = {
  {
    name = "Launch C/C++ program",
    type = "cppdbg",
    request = "launch",
    program = "${workspaceFolder}/bin/${workspaceFolderBasename}",
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
    program = "${file}",
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
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

-- Helper function for key mappings
local function set_keymap(key, command)
  vim.api.nvim_set_keymap('n', key, command, { noremap = true, silent = true })
end

-- Key mappings for DAP
local dap_mappings = {
  ['<F5>'] = "require'dap'.continue()",
  ['<F10>'] = "require'dap'.step_over()",
  ['<F11>'] = "require'dap'.step_into()",
  ['<F12>'] = "require'dap'.step_out()",
  ['<Leader>b'] = "require'dap'.toggle_breakpoint()",
}

for key, command in pairs(dap_mappings) do
  set_keymap(key, "<cmd>lua " .. command .. "<CR>")
end

-- Optional: Set up virtual text for DAP
local dap_virtual_text_ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if dap_virtual_text_ok then
  dap_virtual_text.setup()
else
  vim.notify("nvim-dap-virtual-text not installed", vim.log.levels.WARN)
end
