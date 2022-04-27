local cmp = require 'cmp'

-- Local Vars {{{
-- Credit: https://github.com/onsails/lspkind-nvim/blob/master/lua/lspkind/init.lua#L34-L60
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
--}}}

-- Setup {{{
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false}),
        ['<C-p>'] = cmp.mapping.close(),
        ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip', option = { use_show_condition = false } },
        { name = 'buffer' },
        { name = 'latex_symbols' },
        { name = 'path' },
    },
    formatting = {
        format = function(entry, vim_item)
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
--}}}

cmp.setup.filetype('lua', {
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', option = { use_show_condition = false } },
        { name = 'buffer' },
        { name = 'latex_symbols' },
        { name = 'path' },
    }
})

-- Cmdline {{{
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    },
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'}
    },
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'}
    },
})
--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
