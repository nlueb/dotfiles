local ts = require 'nvim-treesitter.configs'
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

-- parser_config.racket = {
--   install_info = {
--     url = "https://github.com/tautologico/tree-sitter-racket",
--     files = {"src/parser.c"}
--   },
--   filetype = "scheme", -- if filetype does not agrees with parser name
--   used_by = {"racket"} -- additional filetypes that use this parser
-- }

ts.setup {
	ensure_installed = 'all', -- one of "all", "language", or a list of languages
	highlight = { enable = true },
	indent = { enable = true },
    autopairs = {enable = true},
    autotag = {enable = true},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false -- Whether the query persists across vim sessions
	},
	refactor = {
		highlight_definitions = { enable = true },
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			}
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	}
}
