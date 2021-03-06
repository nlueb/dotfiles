local signs = require 'gitsigns'

signs.setup {
	signs = {
		add          = {hl = 'DiffAddSign'   , text = '▎', numhl='GitSignsAddNr'},
		change       = {hl = 'DiffChangeSign', text = '▎', numhl='GitSignsChangeNr'},
		delete       = {hl = 'DiffDeleteSign', text = '▎', numhl='GitSignsDeleteNr'},
		topdelete    = {hl = 'DiffDeleteSign', text = '▎', numhl='GitSignsDeleteNr'},
		changedelete = {hl = 'DiffChangeSign', text = '▎', numhl='GitSignsChangeNr'},
	},
	numhl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,

		['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
		['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

		['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
	},
	watch_index = {
		interval = 1000
	},
	sign_priority = 6,
	status_formatter = nil, -- Use default
}
