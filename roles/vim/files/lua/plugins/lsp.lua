require 'util'

local vim = vim
local lsp = vim.lsp
local lspcfg = require 'lspconfig'
-- local completion = require 'completion'

-- lsp-status {{{
local lsp_status = require 'lsp-status'
lsp_status.config {
	select_symbol = function(cursor_pos, symbol)
		if symbol.valueRange then
			local value_range = {
				['start'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[1])},
				['end'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[2])},
			}
			return require('lsp-status.util').in_range(cursor_pos, value_range)
		end
	end,
}
lsp_status.register_progress()
-- }}}

local function CustomOnAttach(client)
	-- completion.on_attach(client)
	lsp_status.on_attach(client)
end

-- Language Servers {{{
lspcfg.sumneko_lua.setup {
	cmd = {'/usr/bin/lua-language-server'},
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
	settings = {
		Lua = {
			runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
			diagnostics = {enable = true, globals = {'vim', 'it'}},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('~/.config/nvim/lua')] = true,
				},
			},
		},
	},
}

lspcfg.gopls.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.rust_analyzer.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.cssls.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.bashls.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.pyright.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.jdtls.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
	root_dir = lspcfg.util.root_pattern('.git', 'pom.xml'),
}

lspcfg.yamlls.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.racket_langserver.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.solargraph.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.vuels.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

lspcfg.tsserver.setup {
	on_attach = CustomOnAttach,
	capabilities = lsp_status.capabilities,
}

-- lspcfg.vimls.setup {
-- 	on_attach = CustomOnAttach,
-- 	capabilities = lsp_status.capabilities,
-- }

local function julia_new_config(new_config)
	local server_path = "/home/nils/.julia/packages/LanguageServer/y1ebo/src"
	local cmd = {
		"julia",
		"--project="..server_path,
		"--startup-file=no",
		"--history-file=no",
		"-e", [[
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
	capabilities = lsp_status.capabilities,
}

lspcfg.efm.setup {
	init_options = {documentFormatting = true, publishDiagnostics = true},
	root_dir = lspcfg.util.root_pattern('.git', 'pom.xml', 'go.mod'),
	filetypes = {'go', 'gomod', 'lua'},
	settings = {
		rootMarkers = {'.git/', 'pom.xml', 'go.mod'},
		languages = {
			lua = {
				{
					formatCommand = 'lua-format -i -c ~/.config/luaformatter/config.yml',
					formatStdin = true,
				},
			},
			go = {
				{
					formatCommand = 'gopls format',
					lintCommand = 'revive -config /home/nils/.config/revive/config.toml',
					lintIgnoreExitCode = true,
					lintFormats = {'%f:%l:%c: %m'},
				},
			},
		},
	},
}
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
		update_in_insert = true,
	})
-- }}}

-- Mapping {{{
-- nnoremap('K', [[<cmd>lua vim.lsp.buf.hover()<CR>]], {silent = true})
-- nnoremap('<c-k>', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], {silent = true})
nnoremap('<c-j>', [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]])
-- nnoremap('<leader>ld', [[<cmd>lua vim.lsp.buf.definition()<CR>]], {silent = true})
nnoremap('<leader>li', [[<cmd>lua vim.lsp.buf.implementation()<CR>]], {silent = true})
-- nnoremap('<leader>la', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], {silent = true})
-- vnoremap('<leader>la', [[<cmd>lua vim.lsp.buf.range_code_action()<CR>]], {silent = true})
nnoremap('<leader>lf', [[<cmd>lua vim.lsp.buf.formatting()<CR>]], {silent = true})
vnoremap('<leader>lf', [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], {silent = true})
-- nnoremap('<leader>lr', [[<cmd>lua vim.lsp.buf.rename()<CR>]], {silent = true})
nnoremap('<leader>lt', [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], {silent = true})
nnoremap('<leader>ll', [[<cmd>lua print(vim.lsp.buf.server_ready())<CR>]], {silent = true})
-- }}}

-- Signs {{{
cmd [[sign define LspDiagnosticsSignError text=▌ texthl=LspDiagnosticsSignError linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignWarning text=▌  texthl=LspDiagnosticsSignWarning linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignInformation text=▌ texthl=LspDiagnosticsSignInformation linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignHint text=▌ texthl=LspDiagnosticsSignHint linehl= numhl=]]

-- cmd [[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- cmd [[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]]
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
