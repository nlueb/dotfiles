local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    'terraform-ls',
    rust_analyzer = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
    'clangd',
    helm_ls = {
        settings = {
            ['helm-ls'] = {
                yamlls = {
                    path = "yaml-language-server",
                }
            }
        }
    }
}

return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
        'folke/neodev.nvim',
        'hrsh7th/nvim-cmp',
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()
        require('neodev').setup()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        local mason_lspconfig = require 'mason-lspconfig'
        -- local handlers = require('config.lsp.handlers')
        mason_lspconfig.setup {
            ensure_installed = {
                'lua_ls',
            }
        }
        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = function (client, bufnr)
                        -- handlers.on_attach(client, bufnr)
                        if client.server_capabilities.inlayHintProvider then
                            vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
                        end
                    end,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                }
            end,
        }
    end
}
