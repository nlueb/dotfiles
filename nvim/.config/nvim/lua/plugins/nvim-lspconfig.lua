local vim = vim
local lsp = vim.lsp
local cmd = vim.cmd

local lspcfg = require 'lspconfig'
-- local lspsig = require 'lsp_signature'
local cmp_lsp = require 'cmp_nvim_lsp'
local luadev = require 'lua-dev'

-- lsp-status {{{
local lsp_status = require 'lsp-status'
lsp_status.config {
    select_symbol = function(cursor_pos, symbol)
        if symbol.valueRange then
            local value_range = {
                ['start'] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[1])
                },
                ['end'] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[2])
                }
            }
            return require('lsp-status.util').in_range(cursor_pos, value_range)
        end
    end
}
lsp_status.register_progress()
-- }}}

-- Handlers {{{
lsp.handlers['textDocument/publishDiagnostics'] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        -- {
        -- 	spacing = 4,
        -- 	-- prefix = '',
        -- 	-- prefix = '',
        -- 	prefix = '',
        -- 	-- prefix = '',
        -- 	-- prefix = '',
        -- 	-- prefix = '',
        -- 	-- prefix = '',
        -- 	-- prefix = '',
        -- 	-- prefix = '',
        -- },
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

-- cmd [[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]]

cmd [[sign define LspDiagnosticsSignError text=┣ texthl=LspDiagnosticsSignError linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignWarning text=┣ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignInformation text=┣ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignHint text=┣ texthl=LspDiagnosticsSignHint linehl= numhl=]]

cmd [[sign define DiagnosticSignError text=┣ texthl=LspDiagnosticsSignError linehl= numhl=]]
cmd [[sign define DiagnosticSignWarn text=┣ texthl=LspDiagnosticsSignWarning linehl= numhl=]]
cmd [[sign define DiagnosticSignInfo text=┣ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
cmd [[sign define DiagnosticSignHint text=┣ texthl=LspDiagnosticsSignHint linehl= numhl=]]

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
    -- completion.on_attach(client)
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

local custom_capabilities = cmp_lsp.update_capabilities(lsp_status.capabilities)

-- Terraform {{{
lspcfg.terraformls.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

if IsWSL() then return end

-- CCLS {{{
-- lspcfg.clangd.setup {
--     filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
--     on_attach = CustomOnAttach,
--     capabilities = custom_capabilities
-- }
lspcfg.ccls.setup {
    init_options = {
        compilationDatabaseDirectory = 'build',
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Lua {{{
local lua_conf = luadev.setup {
    -- add any options here, or leave empty to use the default settings
    lspconfig = {
        cmd = {
            '/usr/bin/lua-language-server', '-E',
            '/usr/share/lua-language-server/main.lua'
        },
        on_attach = CustomOnAttach,
        capabilities = custom_capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';')
                },
                diagnostics = {enable = true, globals = {'vim', 'it'}},
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('~/.config/nvim/lua')] = true
                    }
                },
                telemetry = {enable = false}
            }
        }
    }
}

lspcfg.sumneko_lua.setup(lua_conf)
-- }}}

-- Go {{{
lspcfg.gopls.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Rust {{{
lspcfg.rust_analyzer.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Css {{{
lspcfg.cssls.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Bash {{{
lspcfg.bashls.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Python {{{
-- lspcfg.pyright.setup {
--     on_attach = CustomOnAttach,
--     capabilities = custom_capabilities
-- }
lspcfg.pylsp.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Java {{{
lspcfg.jdtls.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities,
    root_dir = lspcfg.util.root_pattern('.git', 'pom.xml')
}
-- }}}

-- Yaml {{{
lspcfg.yamlls.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Racket {{{
lspcfg.racket_langserver.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Json {{{
lspcfg.jsonls.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

lspcfg.solargraph.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}

-- Vue {{{
lspcfg.vuels.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- TypeScript {{{
lspcfg.tsserver.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Ansible {{{
lspcfg.ansiblels.setup {
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- Julia {{{
local function julia_new_config(new_config)
    local server_path = "/home/nils/.julia/packages/LanguageServer/y1ebo/src"
    local cmd = {
        "julia", "--project=" .. server_path, "--startup-file=no",
        "--history-file=no", "-e", [[
			using Pkg;
			Pkg.instantiate()
			using LanguageServer; using SymbolServer;
			depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
			project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
			# Make sure that we only load packages from this environment specifically.
			@info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
			server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
			server.runlinter = true;
			run(server);
		]]
    };
    new_config.cmd = cmd
end

lspcfg.julials.setup {
    on_new_config = julia_new_config,
    on_attach = CustomOnAttach,
    capabilities = custom_capabilities
}
-- }}}

-- EFM {{{
lspcfg.efm.setup {
    init_options = {documentFormatting = true, publishDiagnostics = true},
    root_dir = lspcfg.util.root_pattern('.git', 'pom.xml', 'go.mod'),
    filetypes = {'go', 'gomod', 'lua'},
    settings = {
        rootMarkers = {'.git/', 'pom.xml', 'go.mod'},
        languages = {
            lua = {{formatCommand = 'lua-format -i', formatStdin = true}},
            go = {
                {
                    formatCommand = 'gopls format',
                    lintCommand = 'revive -config /home/nils/.config/revive/config.toml',
                    lintIgnoreExitCode = true,
                    lintFormats = {'%f:%l:%c: %m'}
                }
            }
        }
    }
}
-- }}}
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
