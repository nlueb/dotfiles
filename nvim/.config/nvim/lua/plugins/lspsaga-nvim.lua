local saga = require 'lspsaga'

saga.init_lsp_saga {
	use_saga_diagnostic_sign = false,
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	-- error_header = " Error",
	-- warn_header = " Warn",
	-- hint_header = " Hint",
	-- infor_header = " Infor",
	-- max_diag_msg_width = 50,
	code_action_icon = '',
	code_action_keys = { quit = '<Esc>',exec = '<CR>' },
	finder_definition_icon = '   ',
	finder_reference_icon = '   ',
	finder_action_keys = {
	  open = 'o', vsplit = 's', split = 'i', quit = '<Esc>'
	},
	rename_action_keys = {
	  quit = '<Esc>',exec = '<CR>'  -- quit can be a table
	},
	definition_preview_icon = '   ',
	-- 1: thin border | 2: rounded border | 3: thick border
	border_style = 2,
	rename_prompt_prefix = ' ',
	-- if you don't use nvim-lspconfig you must pass your server name and
	-- the related filetypes into this table
	-- like server_filetype_map = {metals = {'sbt', 'scala'}}
	-- server_filetype_map = {}
}
