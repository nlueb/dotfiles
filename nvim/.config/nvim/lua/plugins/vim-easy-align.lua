return {
    'junegunn/vim-easy-align',
    init = function (_, _)
        vim.keymap.set('n', 'ga', [[<Plug>(EasyAlign)]], {})
        vim.keymap.set('x', 'ga', [[<Plug>(EasyAlign)]], {})
    end
}
