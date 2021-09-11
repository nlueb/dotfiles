local keymap = vim.api.nvim_set_keymap

local telescope = require 'telescope'
local previewers = require 'telescope.previewers'

telescope.setup {
	defaults = {
		prompt_prefix = '  ',
		color_devicons = false,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		file_ignore_patterns = {
			'node_modules/*'
		},
	},
}

keymap('n', '<leader>ff', [[<cmd>:lua require("telescope.builtin").find_files{ find_command = { "rg", "--files", "--hidden", "--ignore", "-g", "!.git/*" } }<cr>]], {noremap = true})
keymap('n', '<leader>fg', [[<cmd>Telescope live_grep<cr>]], {noremap = true})
keymap('n', '<leader>fb', [[<cmd>Telescope buffers<cr>]], {noremap = true})
keymap('n', '<leader>fh', [[<cmd>Telescope help_tags<cr>]], {noremap = true})
keymap('n', '<leader>fc', [[<cmd>Telescope colorscheme<cr>]], {noremap = true})
keymap('n', '<leader>fq', [[<cmd>Telescope quickfix<cr>]], {noremap = true})
keymap('n', '<leader>fl', [[<cmd>lua PopulateLocationList()<cr>]], {noremap = true})
keymap('n', '<leader>fm', [[<cmd>Telescope man_pages<cr>]], {noremap = true})
