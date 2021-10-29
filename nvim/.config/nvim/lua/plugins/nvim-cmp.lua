local cmp = require 'cmp'
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local lspkind = require 'lspkind'

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})
    },
    sources = {
        {name = 'latex_symbols'},
        {name = 'luasnip'},
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'path'}
    },
    formatting = {
        format = lspkind.cmp_format()
    },
    documentation = {
        border = { '', '', '', ' ', '', '', '', ' ' },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    }
}

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
