local vim = vim
local keymap = vim.api.nvim_set_keymap

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
	code_action_icon = ' ',
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

keymap('n', 'K', [[<cmd>Lspsaga hover_doc<cr>]], {silent = true, noremap = true})
keymap('n', '<m-j>', [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>]], {silent = true, noremap = true})
keymap('n', '<m-k>', [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>]], {silent = true, noremap = true})
keymap('n', '<c-k>', [[<cmd>Lspsaga signature_help<CR>]], {silent = true, noremap = true})
keymap('n', '<leader>lr', [[<cmd>Lspsaga rename<cr>]], {silent = true, noremap = true})
keymap('n', '<leader>la', [[<cmd>Lspsaga code_action<cr>]], {silent = true, noremap = true})
keymap('v', '<leader>la', [[<cmd><C-U>Lspsaga range_code_action<cr>]], {silent = true, noremap = true})
keymap('n', '<leader>ld', [[<cmd>Lspsaga lsp_finder<cr>]], {silent = true, noremap = true})
keymap('n', '<leader>lp', [[<cmd>Lspsaga preview_definition<cr>]], {silent = true, noremap = true})
-- keymap('n', '<c-j>', [[<cmd>LspSagaShowLineDiags<cr>]], {silent = true, noremap = true})
