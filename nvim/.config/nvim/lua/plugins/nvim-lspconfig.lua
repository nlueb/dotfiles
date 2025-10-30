return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>lr", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>la", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
					map("K", vim.lsp.buf.hover, "[K]over", { "n" })
					map("<c-j>", vim.diagnostic.open_float, "[F]loat", { "n" })
					map("<c-k>", vim.lsp.buf.signature_help, "[L]ol", { "n" })

					-- -- Find references for the word under your cursor.
					-- map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
					--
					-- -- Jump to the implementation of the word under your cursor.
					-- --  Useful when your language has ways of declaring types without an actual implementation.
					-- map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
					--
					-- -- Jump to the definition of the word under your cursor.
					-- --  This is where a variable was first declared, or where a function is defined, etc.
					-- --  To jump back, press <C-t>.
					-- map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
					--
					-- -- WARN: This is not Goto Definition, this is Goto Declaration.
					-- --  For example, in C this would take you to the header.
					-- map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
					--
					-- -- Fuzzy find all the symbols in your current document.
					-- --  Symbols are things like variables, functions, types, etc.
					-- map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
					--
					-- -- Fuzzy find all the symbols in your current workspace.
					-- --  Similar to document symbols, except searches over your entire project.
					-- map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
					--
					-- -- Jump to the type of the word under your cursor.
					-- --  Useful when you're not sure what type a variable is and you want to see
					-- --  the definition of its *type*, not where it was *defined*.
					-- map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					-- if
					--     client
					--     and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
					-- then
					--     local highlight_augroup =
					--         vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
					--     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
					--         buffer = event.buf,
					--         group = highlight_augroup,
					--         callback = vim.lsp.buf.document_highlight,
					--     })
					--
					--     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
					--         buffer = event.buf,
					--         group = highlight_augroup,
					--         callback = vim.lsp.buf.clear_references,
					--     })
					--
					--     vim.api.nvim_create_autocmd('LspDetach', {
					--         group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
					--         callback = function(event2)
					--             vim.lsp.buf.clear_references()
					--             vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
					--         end,
					--     })
					-- end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						vim.lsp.inlay_hint.enable(true)
						map("<leader>lh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "none", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
				},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				-- bashls = {},

				lua_ls = {
					-- cmd = { ... },
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},

				gopls = {
					settings = {
						gopls = {
							semanticTokens = false,
							usePlaceholders = true,
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},

				-- cssls = {},
				zls = {},

				nixd = {},
				-- dartls = {
				--     cmd = { 'fvm', 'dart', 'language-server', '--protocol=lsp' },
				-- },
			}

			for server_name, config in pairs(servers) do
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				vim.lsp.config(server_name, config)
				vim.lsp.enable(server_name)
			end
		end,
	},
}
