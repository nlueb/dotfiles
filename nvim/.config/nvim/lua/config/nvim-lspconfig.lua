local vim = vim
local lsp = vim.lsp
local cmd = vim.cmd

local lspcfg = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'

-- Handlers {{{
lsp.handlers['textDocument/publishDiagnostics'] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false
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

cmd [[sign define DiagnosticSignError text= texthl=DiagnosticError linehl= numhl=]]
cmd [[sign define DiagnosticSignWarn text= texthl=DiagnosticWarn linehl= numhl=]]
cmd [[sign define DiagnosticSignInfo text= texthl=DiagnosticInfo linehl= numhl=]]
cmd [[sign define DiagnosticSignHint text= texthl=DiagnosticHint linehl= numhl=]]

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
    lsp_status.on_attach(client)
    -- lspsig.on_attach({
    --     bind = true,
    --     floating_window = true,
    --     -- floating_window_above_cur_line = true,
    --     hint_enable = false,
    --     doc_lines = 0,
    --     fix_pos = true,
    --     handler_opts = {
    --         border = "none"
    --     }
    -- }, bufnr)
end

local custom_capabilities = cmp_lsp.update_capabilities(lsp.protocol.make_client_capabilities())

-- Go {{{
lspcfg.gopls.setup {
    capabilities = custom_capabilities
}
-- }}}

-- Terraform {{{
lspcfg.terraformls.setup {
    capabilities = custom_capabilities
}
-- }}}

if IsWSL() then return end

-- C {{{
lspcfg.clangd.setup {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    capabilities = custom_capabilities
}
-- lspcfg.ccls.setup {
--     init_options = {
--         compilationDatabaseDirectory = 'build',
--     },
--     filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
--     capabilities = custom_capabilities
-- }
-- }}}

-- Lua {{{
-- local lua_conf = luadev.setup {
--     -- add any options here, or leave empty to use the default settings
--     lspconfig = {
--         cmd = {
--             '/usr/bin/lua-language-server', '-E',
--             '/usr/share/lua-language-server/main.lua'
--         },
--         on_attach = CustomOnAttach,
--         capabilities = custom_capabilities,
--         settings = {
--             Lua = {
--                 runtime = {
--                     version = 'LuaJIT',
--                     path = vim.split(package.path, ';')
--                 },
--                 diagnostics = {enable = true, globals = {'vim', 'it'}},
--                 workspace = {
--                     library = {
--                         [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--                         [vim.fn.expand('~/.config/nvim/lua')] = true
--                     }
--                 },
--                 telemetry = {enable = false}
--             }
--         }
--     }
-- }

-- lspcfg.sumneko_lua.setup(lua_conf)
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

-- Python {{{
-- lspcfg.pyright.setup {
--     on_attach = CustomOnAttach,
--     capabilities = custom_capabilities
-- }
lspcfg.pylsp.setup {
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
    capabilities = custom_capabilities
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
