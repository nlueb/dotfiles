local vim = vim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

function _G.IsWSL()
	local ok, version = pcall(vim.fn.readfile, "/proc/version", "", 1)
	if not ok then
		return false
	end
	if vim.tbl_isempty(version) then
		return false
	end
	return string.find(version[1], "microsoft")
end

-- require("vim._core.ui2").enable()

require("setup.lazy")

require("setup.settings")
require("setup.mappings")
require("setup.autocmds")

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
