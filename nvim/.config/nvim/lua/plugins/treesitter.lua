return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		-- opts = {
		-- 	ensure_installed = "all",
		-- 	ignore_install = { "ipkg" },
		-- 	auto_install = true,
		-- 	highlight = {
		-- 		enable = true,
		-- 		-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
		-- 		--  If you are experiencing weird indenting issues, add the language to
		-- 		--  the list of additional_vim_regex_highlighting and disabled languages for indent.
		-- 		additional_vim_regex_highlighting = { "ruby" },
		-- 	},
		-- 	indent = { enable = true, disable = { "ruby" } },
		-- },
		config = function()
			require("nvim-treesitter").install("stable")
		end,
	},
}
