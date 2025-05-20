return {
    {
        'ibhagwan/fzf-lua',
        keys = {
            -- {'<C-\\>', [[<Cmd>lua require'fzf-lua'.buffers()<CR>]]},
            -- {'<C-k>', [[<Cmd>lua require'fzf-lua'.builtin()<CR>]]},
            { '<leader>ff', [[<Cmd>lua require'fzf-lua'.files()<CR>]] },
            { '<leader>fg', [[<Cmd>lua require'fzf-lua'.live_grep_glob()<CR>]] },
            -- {'<C-g>', [[<Cmd>lua require'fzf-lua'.grep_project()<CR>]]},
            { '<leader>fh', [[<Cmd>lua require'fzf-lua'.help_tags()<CR>]] },
        },
        opts = {
            'default-title',
            winopts = {
                border = { ' ', ' ', ' ', ' ', '', '', '', ' ' }, -- "solid-top" (+side margins)
                preview = {
                    border = 'solid',
                    scrollbar = 'float',
                    scrolloff = '-1',
                    title_pos = 'center',
                },
                row = 1,
                col = 0,
                width = 1,
                height = 0.4,
            },
            file_ignore_patterns = {
                '%~$',
                '%.swp$',
            },
            files = {
                fd_opts = '--type f --exclude node_modules --exclude undo',
            },
            grep = {
                rg_opts = "--column --line-number --color=always --smart-case -g '!{.git,node_modules,undo}/'",
                rg_glob = true,
            },
            hls = {
                title = 'DiffAdd',
                border = 'Normal',
                preview_title = 'DiffAdd',
                preview_border = 'Normal',
                scrollfloat_e = '',
                scrollfloat_f = 'Normal',
            },
            fzf_colors = {
                ['fg'] = { 'fg', 'Comment' },
                ['bg'] = { 'bg', 'Normal' },
                ['selected-fg'] = { 'fg', 'Folded' },
                ['selected-bg'] = { 'bg', 'Normal' },
                ['list-bg'] = { 'bg', 'Normal' },
                ['hl'] = { 'fg', 'Constant' },
                ['selected-hl'] = { 'fg', 'Constant' },
                ['current-fg'] = { 'fg', 'Folded' },
                ['current-bg'] = { 'bg', 'Normal' },
                ['current-hl'] = { 'fg', 'Constant' },
                ['separator'] = { 'bg', 'Normal' },
                ['scrollbar'] = { 'fg', 'Comment' },
                ['info'] = { 'fg', 'Constant' },
                ['prompt'] = { 'fg', 'Constant' },
                ['pointer'] = { 'fg', 'Constant' },
                ['marker'] = { 'fg', 'Character' },
                ['spinner'] = { 'fg', 'Constant' },
                ['header'] = { 'fg', 'Comment' },
                ['gutter'] = '-1',
            },
        },
    },
}
