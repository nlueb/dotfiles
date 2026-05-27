return {
	"m00qek/baleia.nvim",
	lazy = false,
	config = function()
		local baleia = require("baleia").setup({})
		vim.api.nvim_create_user_command("BaleiaColorize", function()
			baleia.once(vim.api.nvim_get_current_buf())
		end, {})
		vim.api.nvim_create_user_command("BaleiaLogs", baleia.logger.show, {})

		vim.api.nvim_create_autocmd("BufReadPost", {
			pattern = "*.dump",
			callback = function()
				baleia.once(vim.api.nvim_get_current_buf())
			end,
		})
	end,
}
