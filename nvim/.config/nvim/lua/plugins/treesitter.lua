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
        ensure_installed = {
            'c',
            'cpp',
            'go',
            'lua',
            'python',
            'rust',
            'javascript',
            'typescript',
            'vimdoc',
            'vim',
            'bash',
            'yaml',
            'hcl',
            'terraform',
            'dockerfile',
            'ini',
            'regex',
            'gomod',
            'gosum',
            'cue',
            'diff',
            'csv',
            'git_config',
            'git_rebase',
            'gitattributes',
            'gitcommit',
            'gitignore',
            'http',
            'sql',
            'xml',
            'jq',
            'json',
            'java',
        },
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
