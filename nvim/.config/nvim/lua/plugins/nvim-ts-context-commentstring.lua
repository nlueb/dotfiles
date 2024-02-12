return {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {},
    config = function(_, opts)
        vim.g.skip_ts_context_commentstring_module = true
        local tcc = require 'ts_context_commentstring'
        tcc.setup(opts)
    end
}
