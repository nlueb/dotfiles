return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        {
            'JoosepAlviste/nvim-ts-context-commentstring',
            config = true
        },
    },
    build = ':TSUpdate',
    opts = {
        ensure_installed = 'all',
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        local ts = require 'nvim-treesitter.configs'
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.opt.foldenable = false
        ts.setup(opts)
    end
}
