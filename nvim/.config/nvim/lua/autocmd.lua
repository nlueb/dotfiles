local vim = vim
local cmd = vim.cmd

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

vim.api.nvim_exec([[
	function! InActiveLine()
		return luaeval("require'plugins/status-line'.InActiveLine(vim.api.nvim_win_get_buf(_A), _A)", g:statusline_winid)
	endfunction

	function! ActiveLine()
		return luaeval("require'plugins/status-line'.ActiveLine(vim.api.nvim_win_get_buf(_A), _A)", g:statusline_winid)
	endfunction
]], false)


-- Use spaces for YAML
local autocmds = {
-- Set Cursor to beam when leaving vim
    -- BeamCursor = {
    --     {'VimLeave', '*', [[set guicursor=a:ver30-blinkoff0]]}
    -- },
    YankHighlight = {
        {'TextYankPost', '*', [[silent! lua vim.highlight.on_yank()]]}
    },
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
		{'FileType', 'scheme', [[setlocal shiftwidth=2 softtabstop=2 expandtab | let b:AutoPairs = {"(": ")", "[":"]", "{":"}", '"':'"'}]]},
        {'FileType', 'help', [[setlocal number relativenumber]]}
	},
	Helmfile = {
		{'BufRead,BufNewFile', '*.gotmpl', [[setfiletype helm]]}
	},
    CompletionSources = {
        {'FileType', 'lua', [[lua require('cmp').setup.buffer { sources = { {name = 'latex_symbols'}, {name = 'nvim_lua'}, {name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'} } }]]},
        {'FileType', 'toml', [[lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }]]},
        {'FileType', 'org', [[lua require('cmp').setup.buffer { sources = { { name = 'orgmode' }, { name = 'buffer' }, { name = 'path' } } }]]},
        {'FileType', 'norg', [[lua require('cmp').setup.buffer { sources = { { name = 'neorg' }, { name = 'buffer' }, { name = 'path' } } }]]},
        {'FileType', 'helm', [[setlocal ts=2 sts=2 sw=2 expandtab]]}
    }
}

nvim_create_augroups(autocmds)
