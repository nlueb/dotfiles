local ok, dap_go = pcall(require, 'dap-go')

if ok then
    dap_go.setup()
end

local vim = vim

vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DapBreakpointCondition', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='', texthl='DapLogPoint', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text=' ', texthl='DapStopped', linehl='DapStoppedLine', numhl='DapStoppedLine'})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='DapBreakpointRejected', linehl='', numhl=''})

local dap = require 'dap'

vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>dn', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do', dap.step_out)
vim.keymap.set('n', '<leader>db', dap.set_breakpoint)
vim.keymap.set('n', '<leader>dt', function()
    dap.terminate()
    dap.close()
end)
vim.keymap.set('n', '<leader>da', dap.run_to_cursor)
vim.keymap.set('n', '<leader>dr', dap.repl.toggle)

local widgets = require 'dap.ui.widgets'

vim.keymap.set('n', '<leader>dh', widgets.hover)
vim.keymap.set('n', '<leader>ds', function()
    widgets.cursor_float(widgets.scopes)
end)
