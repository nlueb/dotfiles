local ok, dap_go = pcall(require, 'dap-go')

if ok then
    dap_go.setup()
end

local vim = vim
local keymap = vim.keymap
local sign_define = vim.fn.sign_define

sign_define('DapBreakpoint', {text='', texthl='DapBreakpoint', linehl='', numhl=''})
sign_define('DapBreakpointCondition', {text='', texthl='DapBreakpointCondition', linehl='', numhl=''})
sign_define('DapLogPoint', {text='', texthl='DapLogPoint', linehl='', numhl=''})
sign_define('DapStopped', {text=' ', texthl='DapStopped', linehl='DapStoppedLine', numhl='DapStoppedLine'})
sign_define('DapBreakpointRejected', {text='', texthl='DapBreakpointRejected', linehl='', numhl=''})

local dap = require 'dap'

keymap.set('n', '<leader>dc', dap.continue)
keymap.set('n', '<leader>dn', dap.step_over)
keymap.set('n', '<leader>di', dap.step_into)
keymap.set('n', '<leader>do', dap.step_out)
keymap.set('n', '<leader>db', dap.set_breakpoint)
keymap.set('n', '<leader>dt', function()
    dap.terminate()
    dap.close()
end)
keymap.set('n', '<leader>da', dap.run_to_cursor)
keymap.set('n', '<leader>dr', dap.repl.toggle)

local widgets = require 'dap.ui.widgets'

keymap.set('n', '<leader>dh', widgets.hover)
keymap.set('n', '<leader>ds', function()
    widgets.cursor_float(widgets.scopes)
end)

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
