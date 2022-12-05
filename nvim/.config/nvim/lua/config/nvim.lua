
-- Catppuccin {{{
local catppuccin = require "catppuccin"

catppuccin.setup {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	term_colors = false,
	transparent_background = false,
	compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
	styles = {
		comments = { "italic" },
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
	},
	color_overrides = {
		latte = {
			base = "#E1EEF5",
		},
		mocha = {
			base = "#000000",
		},
	},
	highlight_overrides = {
		mocha = function(c)
            c.superdark = '#0B0B0F'
			return {
                Folded = { bg = c.superdark, fg = c.surface0 },
                CursorLine = { bg = c.superdark },
                Comment = { fg = c.surface0 },
                SLModeText = { fg = c.green, bg = c.base, style = { 'bold' } },
                SLNormalText = { fg = c.text, bg = c.base },
                SLError = { fg = c.red, bg = c.base },
                SLWarning = { fg = c.yellow, bg = c.base },
                SLInfo = { fg = c.blue, bg = c.base },
                SLHint = { fg = c.sapphire, bg = c.base },
            }
		end,
	},
    --[[ rosewater = "#F5E0DC", ]]
	--[[ flamingo = "#F2CDCD", ]]
	--[[ pink = "#F5C2E7", ]]
	--[[ mauve = "#CBA6F7", ]]
	--[[ red = "#F38BA8", ]]
	--[[ maroon = "#EBA0AC", ]]
	--[[ peach = "#FAB387", ]]
	--[[ yellow = "#F9E2AF", ]]
	--[[ green = "#A6E3A1", ]]
	--[[ teal = "#94E2D5", ]]
	--[[ sky = "#89DCEB", ]]
	--[[ sapphire = "#74C7EC", ]]
	--[[ blue = "#89B4FA", ]]
	--[[ lavender = "#B4BEFE", ]]

	--[[ text = "#CDD6F4", ]]
	--[[ subtext1 = "#BAC2DE", ]]
	--[[ subtext0 = "#A6ADC8", ]]
	--[[ overlay2 = "#9399B2", ]]
	--[[ overlay1 = "#7F849C", ]]
	--[[ overlay0 = "#6C7086", ]]
	--[[ surface2 = "#585B70", ]]
	--[[ surface1 = "#45475A", ]]
	--[[ surface0 = "#313244", ]]

	--[[ base = "#1E1E2E", ]]
	--[[ mantle = "#181825", ]]
	--[[ crust = "#11111B", ]]
    -- #0B0B0F
	integrations = {
		treesitter = true,
        gitsigns = true,
        telescope = true,
        notify = true,
        cmp = true,
		neogit = true,
        fidget = true,
	},
}
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
