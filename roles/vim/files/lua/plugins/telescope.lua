require 'util'

local telescope = require 'telescope'
local previewers = require 'telescope.previewers'

telescope.setup {
	defaults = {
		prompt_prefix = ' ',
		color_devicons = false,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new
	}
}

nnoremap('<leader>ff', [[<cmd>Telescope find_files<cr>]])
nnoremap('<leader>fg', [[<cmd>Telescope live_grep<cr>]])
nnoremap('<leader>fb', [[<cmd>Telescope buffers<cr>]])
nnoremap('<leader>fh', [[<cmd>Telescope help_tags<cr>]])
nnoremap('<leader>fc', [[<cmd>Telescope colorscheme<cr>]])
nnoremap('<leader>fq', [[<cmd>Telescope quickfix<cr>]])
nnoremap('<leader>fl', [[<cmd>Telescope loclist<cr>]])
