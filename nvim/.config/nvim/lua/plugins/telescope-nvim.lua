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
