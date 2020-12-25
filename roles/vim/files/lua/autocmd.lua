require 'util'

local vim = vim

-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
local function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup '..group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

-- Highlight yanked region
cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank()]]
cmd [[au VimLeave * set guicursor=a:ver30-blinkoff0]]

vim.api.nvim_exec([[
	function! InActiveLine()
		return luaeval("require'plugins/status-line'.InActiveLine()")
	endfunction

	function! ActiveLine()
		return luaeval("require'plugins/status-line'.ActiveLine()")
	endfunction
]], false)

local autocmds = {
	StatusLine = {
		{'WinEnter,BufEnter', '*', [[setlocal statusline=%!ActiveLine()]]},
		{'WinLeave,BufLeave', '*', [[setlocal statusline=%!InActiveLine()]]},
	},
	FoldText = {
		{'BufEnter,InsertLeave,TextChanged', '*', [[lua UpdateLongestFoldTitle()]]},
	},
}

nvim_create_augroups(autocmds)
