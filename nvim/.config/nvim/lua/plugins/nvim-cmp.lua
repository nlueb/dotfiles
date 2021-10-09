local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup {
    snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'vsnip'},
        {name = 'buffer'},
        {name = 'path'}
    },
    formatting = {
        format = lspkind.cmp_format()
    },
}
