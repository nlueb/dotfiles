local symbol_map = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
}

local menu_abbr = {
    buffer = '[buf]',
    nvim_lsp = '[lsp]',
    luasnip = '[snp]',
    nvim_lua = '[lua]',
    latex_symbols = '[sym]',
    path = '[pth]',
    treesitter = '[tre]',
}

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'windwp/nvim-autopairs',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function(_, _)
        local cmp = require 'cmp'
        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
                ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
            },
            sources = cmp.config.sources {
                { name = 'nvim_lsp' },
                { name = 'luasnip', option = { use_show_condition = false } },
                { name = 'buffer' },
                { name = 'path' },
            },
            formatting = {
                format = function(_, vim_item)
                    vim_item.kind = symbol_map[vim_item.kind] .. '  ' .. vim_item.kind
                    -- vim_item.menu = menu_abbr[entry.source.name]
                    vim_item.abbr = vim_item.abbr:gsub("%(.*%)", "(…)")
                    return vim_item
                end
            },
            experimental = {
                ghost_text = true,
            }
        }
        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            },
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
        })
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}
