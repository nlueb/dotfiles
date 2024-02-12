local vim = vim
local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

-- YankHighlight {{{
local YankHighlight = create_augroup('YankHighlight', { clear = false })
create_autocmd('TextYankPost', {
    group = YankHighlight,
    callback = function()
        vim.highlight.on_yank()
    end
})
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
