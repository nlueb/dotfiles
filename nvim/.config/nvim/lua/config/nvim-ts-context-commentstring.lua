local vim = vim
local nvim_create_augroup = vim.api.nvim_create_augroup
local nvim_create_autocmd = vim.api.nvim_create_autocmd

local CommentString = nvim_create_augroup('CommentString', { clear = false })
nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
    group = CommentString,
    callback = require('ts_context_commentstring.internal').update_commentstring
})
