return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = {
			sections = {
				{
					section = "terminal",
					cmd = "chafa /home/nils/Pictures/NixOS.png --format symbols --symbols vhalf --view-size 46x46 --align center; sleep .1",
					height = 22,
					padding = 0,
					ttl = 5 * 60,
				},
				{
					pane = 2,
					{ text = string.rep("\n", 3) }, -- vertical spacer
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
		},
		input = {
			icon = " ",
			icon_hl = "SnacksInputIcon",
			icon_pos = "left",
			prompt_pos = "title",
			win = { style = "input" },
			expand = true,
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = {
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = false, -- show open fold icons
				git_hl = false, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},
		-- picker = {},
		-- terminal = {},
	},
}
