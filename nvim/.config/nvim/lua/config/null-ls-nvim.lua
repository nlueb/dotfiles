local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        null_ls.builtins.diagnostics.golangci_lint,
        -- null_ls.builtins.diagnostics.revive,
        -- null_ls.builtins.diagnostics.staticcheck,
    }
}
