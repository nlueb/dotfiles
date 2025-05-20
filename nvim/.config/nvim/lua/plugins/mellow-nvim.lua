return {
    {
        'mellow-theme/mellow.nvim',
        priority = 1000,
        config = function()
            vim.g.mellow_highlight_overrides = {
                ['IblIndent'] = { fg = '#1f1f1f' },
                ['IblScope'] = { fg = '#57575f' },
                ['LineNr'] = { fg = '#57575f', bg = '#181818' },
                ['CursorLineNr'] = { fg = '#9998a8', bg = '#181818', bold = true },
                ['SignColumn'] = { fg = '#9998a8', bg = '#181818' },
                ['Comment'] = { fg = '#2a2a2d', italic = true },
                ['LspInlayHint'] = { fg = '#2d2d2f' },
            }
            vim.cmd.colorscheme 'mellow'
        end,
    },
}
