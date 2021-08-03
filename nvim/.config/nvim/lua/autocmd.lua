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
-- Set Cursor to beam when leaving vim
-- cmd [[au VimLeave * set guicursor=a:ver30-blinkoff0]]

-- Use spaces for YAML
cmd [[autocmd FileType helm setlocal ts=2 sts=2 sw=2 expandtab]]

vim.api.nvim_exec([[
	function! InActiveLine()
		return luaeval("require'plugins/status-line'.InActiveLine(vim.api.nvim_win_get_buf(_A), _A)", g:statusline_winid)
	endfunction

	function! ActiveLine()
		return luaeval("require'plugins/status-line'.ActiveLine(vim.api.nvim_win_get_buf(_A), _A)", g:statusline_winid)
	endfunction
]], false)

local autocmds = {
	StatusLine = {
		{'WinEnter,BufEnter', '*', [[setlocal statusline=%!ActiveLine()]]},
		{'WinLeave,BufLeave', '*', [[setlocal statusline=%!InActiveLine()]]},
		{'User StartifyReady', '', [[setlocal statusline=%!ActiveLine()]]},
	},
	FoldText = {
		{'BufEnter,InsertLeave,TextChanged', '*', [[lua UpdateLongestFoldTitle()]]},
	},
	FernCustom = {
		{'FileType', 'fern', [[lua FernInit()]]}
	},
	FiletypeSettings = {
		{'FileType', 'scheme', [[setlocal shiftwidth=2 softtabstop=2 expandtab | let b:AutoPairs = {"(": ")", "[":"]", "{":"}", '"':'"'}]]}
	},
	Helmfile = {
		{'BufRead,BufNewFile', '*.gotmpl', [[setfiletype helm]]}
	}
}

nvim_create_augroups(autocmds)
