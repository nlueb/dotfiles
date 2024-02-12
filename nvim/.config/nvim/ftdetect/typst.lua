local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '*.typ',
    command = 'set filetype=typst'
})
