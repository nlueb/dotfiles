require 'util'

local lsp = vim.lsp
local lspcfg = require 'lspconfig'
local completion = require 'completion'

lspcfg.sumneko_lua.setup {
	cmd = {"/usr/bin/lua-language-server"},
	on_attach = completion.on_attach
}

lspcfg.gopls.setup {
	on_attach = completion.on_attach
}

lspcfg.rust_analyzer.setup {
	on_attach = completion.on_attach
}

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(
	lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = {
			spacing = 4,
			-- prefix = '',
			-- prefix = '',
			-- prefix = '',
			prefix = '',
			-- prefix = '',
			-- prefix = '',
			-- prefix = '',
			-- prefix = '',
		},
		signs = true,
		update_in_insert = true,
	}
)

nnoremap('K', [[<cmd>lua vim.lsp.buf.hover()<CR>]], {silent = true})
nnoremap('<c-k>', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], {silent = true})
nnoremap('<leader>ld', [[<cmd>lua vim.lsp.buf.definition()<CR>]], {silent = true})
nnoremap('<leader>li', [[<cmd>lua vim.lsp.buf.implementation()<CR>]], {silent = true})
nnoremap('<leader>la', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], {silent = true})
vnoremap('<leader>la', [[<cmd>lua vim.lsp.buf.range_code_action()<CR>]], {silent = true})
nnoremap('<leader>lf', [[<cmd>lua vim.lsp.buf.formatting()<CR>]], {silent = true})
vnoremap('<leader>lf', [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], {silent = true})
nnoremap('<leader>lr', [[<cmd>lua vim.lsp.buf.rename()<CR>]], {silent = true})
nnoremap('<leader>lt', [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], {silent = true})
nnoremap('<leader>ll', [[<cmd>lua print(vim.lsp.buf.server_ready())<CR>]], {silent = true})

cmd [[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]]
cmd [[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]]
