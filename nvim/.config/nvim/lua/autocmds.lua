local vim = vim
local nvim_create_augroup = vim.api.nvim_create_augroup
local nvim_create_autocmd = vim.api.nvim_create_autocmd

-- StatusLine setup {{{
vim.api.nvim_exec([[
    function! InActiveLine()
        return luaeval("require'status-line'.InActiveLine(vim.api.nvim_win_get_buf(_A), _A)", g:statusline_winid)
    endfunction

    function! ActiveLine()
        return luaeval("require'status-line'.ActiveLine(vim.api.nvim_win_get_buf(_A), _A)", g:statusline_winid)
    endfunction
]], false)
--}}}

-- Auto commands {{{

-- YankHighlight {{{
local YankHighlight = nvim_create_augroup('YankHighlight', { clear = false })
nvim_create_autocmd('TextYankPost', {
    group = YankHighlight,
    callback = function()
        vim.highlight.on_yank()
    end
})
-- }}}

-- StatusLine {{{
local StatusLine = nvim_create_augroup('StatusLine', { clear = false })
nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
    group = StatusLine,
    callback = function()
        vim.opt_local.statusline = '%!ActiveLine()'
    end
})
nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
    group = StatusLine,
    callback = function()
        vim.opt_local.statusline = '%!InActiveLine()'
    end
})
nvim_create_autocmd('User StartifyReady', {
    group = StatusLine,
    pattern = '',
    callback = function()
        vim.opt_local.statusline = '%!ActiveLine()'
    end
})
-- }}}

-- FoldText {{{
local FoldText = nvim_create_augroup('FoldText', { clear = false })
nvim_create_autocmd({'BufEnter', 'InsertLeave', 'TextChanged'}, {
    group = FoldText,
    callback = _G.UpdateLongestFoldTitle
})
-- }}}

-- FiletypeSettings {{{
local FiletypeSettings = nvim_create_augroup('FiletypeSettings', { clear = false })
-- {'FileType', 'lua', [[lua require('cmp').setup.buffer { sources = { {name = 'latex_symbols'}, {name = 'nvim_lua'}, {name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'} } }]]},
-- {'FileType', 'toml', [[lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }]]},
-- {'FileType', 'org', [[lua require('cmp').setup.buffer { sources = { { name = 'orgmode' }, { name = 'buffer' }, { name = 'path' } } }]]},
-- {'FileType', 'norg', [[lua require('cmp').setup.buffer { sources = { { name = 'neorg' }, { name = 'buffer' }, { name = 'path' } } }]]},
-- {'FileType', 'helm', [[setlocal ts=2 sts=2 sw=2 expandtab]]}
nvim_create_autocmd('FileType', {
    group = FiletypeSettings,
    pattern = 'scheme',
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
        vim.b.AutoPairs = {
            ['('] = ')',
            ['['] = ']',
            ['{'] = '}',
            ['"'] = '"',
        }
    end
})
nvim_create_autocmd('FileType', {
    group = FiletypeSettings,
    pattern = 'help',
    callback = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
    end
})
nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
    group = FiletypeSettings,
    callback = function()
        -- Don't insert comments automatically
        -- See fo-o help page for more info
        vim.opt_local.formatoptions:remove('o')
    end
})
nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    group = FiletypeSettings,
    pattern = '*.gotmpl',
    command = 'setfiletype helm'
})
-- }}}

-- CommentString {{{
local CommentString = nvim_create_augroup('CommentString', { clear = false })
nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
    group = CommentString,
    callback = require('ts_context_commentstring.internal').update_commentstring
})
-- }}}

-- IndentRefresh {{{
local IndentRefresh = nvim_create_augroup('IndentRefresh', { clear = false })
nvim_create_autocmd('CursorHold', {
    group = IndentRefresh,
    command = 'IndentBlanklineRefresh'
})
-- }}}

--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
