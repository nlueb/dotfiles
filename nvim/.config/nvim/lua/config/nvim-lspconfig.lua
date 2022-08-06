local vim = vim
local lsp = vim.lsp
local cmd = vim.cmd
local sign_define = vim.fn.sign_define

local lspcfg = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'
local lsp_format = require 'lsp-format'

-- Handlers {{{
lsp.handlers['textDocument/publishDiagnostics'] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true
    })
-- }}}

-- Signs {{{
-- cmd [[sign define LspDiagnosticsSignError text=▌ texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignWarning text=▌ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignInformation text=▌ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignHint text=▌ texthl=LspDiagnosticsSignHint linehl= numhl=]]

-- cmd [[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]]

sign_define('DiagnosticSignError', {text='', texthl='DiagnosticError', linehl='', numhl=''})
sign_define('DiagnosticSignWarn', {text='', texthl='DiagnosticWarn', linehl='', numhl=''})
sign_define('DiagnosticSignInfo', {text='', texthl='DiagnosticInfo', linehl='', numhl=''})
sign_define('DiagnosticSignHint', {text='', texthl='DiagnosticHint', linehl='', numhl=''})

-- cmd [[sign define LspDiagnosticsSignError text=┣ texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignWarning text=┣ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignInformation text=┣ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignHint text=┣ texthl=LspDiagnosticsSignHint linehl= numhl=]]

-- cmd [[sign define DiagnosticSignError text=┣ texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define DiagnosticSignWarn text=┣ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define DiagnosticSignInfo text=┣ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define DiagnosticSignHint text=┣ texthl=LspDiagnosticsSignHint linehl= numhl=]]

-- cmd [[sign define LspDiagnosticsSignError text=░ texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignWarning text=░ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignInformation text=░ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignHint text=░ texthl=LspDiagnosticsSignHint linehl= numhl=]]

-- cmd [[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]]
-- }}}

-- Language Servers {{{
local function CustomOnAttach(client, bufnr)
    -- lsp_status.on_attach(client)
    lsp_format.on_attach(client)
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
        vim.diagnostic.disable()
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

local custom_capabilities = cmp_lsp.update_capabilities(capabilities)

-- Go {{{
lspcfg.gopls.setup {
    capabilities = custom_capabilities,
    on_attach = CustomOnAttach,
    settings = {
        gopls = {
            analyses = {
                nilness = true,
            },
            staticcheck = true,
            usePlaceholders = true,
        },
    },
}
-- }}}

-- Terraform {{{
lspcfg.terraformls.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Python {{{
-- lspcfg.pyright.setup {
--     on_attach = CustomOnAttach,
--     capabilities = custom_capabilities
-- }
lspcfg.pylsp.setup {
    capabilities = custom_capabilities,
    on_attach = CustomOnAttach,
}
-- }}}

-- C {{{
lspcfg.clangd.setup {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    capabilities = custom_capabilities,
    on_attach = CustomOnAttach,
}
-- lspcfg.ccls.setup {
--     init_options = {
--         compilationDatabaseDirectory = 'build',
--     },
--     filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
--     capabilities = custom_capabilities
-- }
-- }}}

if IsWSL() then return end

-- Lua {{{
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspcfg.sumneko_lua.setup({
    cmd = {
        '/home/nils/Documents/lua/lua-language-server/bin/lua-language-server', '-E',
        '/home/nils/Documents/lua/lua-language-server/main.lua'
    },
    capabilities = custom_capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                enable = true,
                globals = {'vim', 'it'}
            },
            workspace = {
                -- library = {
                --     [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                --     [vim.fn.expand('~/.config/nvim/lua')] = true
                -- }
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false
            }
        }
    },
    commands = {
        Format = {
            function()
                require('stylua-nvim').format_file()
            end,
        },
    },
})
-- }}}

-- Rust {{{
lspcfg.rust_analyzer.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Css {{{
lspcfg.cssls.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Bash {{{
lspcfg.bashls.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Java {{{
lspcfg.jdtls.setup {
    capabilities = custom_capabilities,
    root_dir = lspcfg.util.root_pattern('.git', 'pom.xml')
}
-- }}}

-- Yaml {{{
lspcfg.yamlls.setup {
    capabilities = custom_capabilities,
    on_attach = CustomOnAttach,
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            }
        }
    }
}
-- }}}

-- Racket {{{
lspcfg.racket_langserver.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Json {{{
lspcfg.jsonls.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Vue {{{
lspcfg.vuels.setup {
    capabilities = custom_capabilities
}
-- }}}

-- TypeScript {{{
lspcfg.tsserver.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Ansible {{{
lspcfg.ansiblels.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Julia {{{
lspcfg.julials.setup {
    capabilities = custom_capabilities,
}
-- }}}
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
