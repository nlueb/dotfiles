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
