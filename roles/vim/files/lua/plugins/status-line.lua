
-- Local Variable {{{
local vim = vim
local M = {}

local HlGroup = {
	ModeText   = '%#SLModeText#',
	ModeSep    = '%#SLModeSep#',
	NormalText = '%#SLNormalText#',
	DimText    = '%#SLDimText#',
	LightText  = '%#SLLightText#',
	LightSep   = '%#SLLightSep#',
	DarkText   = '%#SLDarkText#',
	Error      = '%#SLError#',
	Warning    = '%#SLWarning#',
	Info       = '%#SLInfo#',
	Hint       = '%#SLHint#',
}

local Sep = {
	Left  = '',
	Right = '',
	LeftAlt = '',
	RightAlt = '',
	Line  = '│',
}

local Icon = {
	Git     = '',
	Error   = '',
	Warning = '',
	Info    = '',
	Hint    = '',
	Help    = '',
	-- Help    = '',
	Default = '',
	Function = '𝑓',
}

-- }}}

-- Helper Functions {{{
local function Spacer(num)
	if num then
		return string.rep(' ', num)
	else
		return ' '
	end
end

local function StrEmpty(str)
	return str == nil or str == ''
end

local function VimBufExpand(bufnr, expand)
	return vim.fn.expand('#' .. bufnr .. expand)
end
-- }}}

-- Mode {{{
-- From :h mode()
local mode = {
	['n']     = 'N', -- Normal
	['no']    = 'N', -- Operator-pending
	['nov']   = 'N', -- Operator-pending (forced charwise |o_v|)
	['noV']   = 'N', -- Operator-pending (forced linewise |o_V|)
	['no\22'] = 'N', -- Operator-pending (forced blockwise |o_CTRL-V|)
	['niI']   = 'N', -- Normal using |i_CTRL-O| in |Insert-mode|
	['niR']   = 'N', -- Normal using |i_CTRL-O| in |Replace-mode|
	['niV']   = 'N', -- Normal using |i_CTRL-O| in |Virtual-Replace-mode|
	['v']     = 'V', -- Visual by character
	['V']     = 'V', -- Visual by line
	['\22']   = 'V', -- Visual blockwise
	['s']     = 'S', -- Select by character
	['S']     = 'S', -- Select by line
	['\19']   = 'S', -- Select blockwise
	['i']     = 'I', -- Insert
	['ic']    = 'I', -- Insert mode completion |compl-generic|
	['ix']    = 'I', -- Insert mode |i_CTRL-X| completion
	['R']     = 'R', -- Replace |R|
	['Rc']    = 'R', -- Replace mode completion |compl-generic|
	['Rv']    = 'R', -- Virtual Replace |gR|
	['Rx']    = 'R', -- Replace mode |i_CTRL-X| completion
	['c']     = 'C', -- Command-line editing
	['cv']    = 'E', -- Vim Ex mode |gQ|
	['ce']    = 'E', -- Normal Ex mode |Q|
	['r']     = 'P', -- Hit-enter prompt
	['rm']    = 'M', -- The -- more -- prompt
	['r?']    = 'C', -- |:confirm| query of some sort
	['!']     = 'S', -- Shell or external command is executing
	['t']     = 'T', -- Terminal mode: keys go to the job
}

local function GetMode()
	local m = vim.fn.mode(true)
	if m == nil or m == vim.NIL then
		return 'NIL'
	end
	return mode[m]
end

local function GetModeStatusline()
	local statusline = ''
	statusline = statusline
			  .. HlGroup.ModeSep .. Sep.Left
			  .. HlGroup.ModeText .. GetMode()
			  .. HlGroup.ModeSep .. Sep.Right
	return statusline
end
-- }}}

-- File {{{
local function GetFileIcon(bufnr)
	-- Mb look at https://github.com/liuchengxu/eleline.vim/blob/master/plugin/eleline.vim#L79-L83
	if vim.api.nvim_buf_get_option(bufnr, 'buftype')  == 'help' then
		return Icon.Help
	end
	local ok,devicons = pcall(require,'nvim-web-devicons')
	if not ok then
		error [[Missing dependencie 'nvim-web-devicons']]
	end
	local file_name = VimBufExpand(bufnr, ':t')
	local file_extension = VimBufExpand(bufnr, ':e')
	local icon = devicons.get_icon(file_name, file_extension)
	if icon == nil then
		return Icon.Default
	end
	return icon
end

local function GetFileName(bufnr)
	if vim.api.nvim_buf_get_option(bufnr, 'buftype') == 'help' then
		return 'help'
	end
	local file_name = VimBufExpand(bufnr, ':t')
	return file_name
end

local function GetFileStatusline(bufnr)
	local statusline = ''
	statusline = statusline
			  .. HlGroup.NormalText .. Spacer(2) .. GetFileIcon(bufnr)
			  .. Spacer() .. GetFileName(bufnr)
	return statusline
end
-- }}}

-- Git {{{
local function GetGitDir(bufnr)
	if vim.api.nvim_buf_get_option(bufnr, 'buftype') == 'help' then
		return nil
	end
	if not vim.fn.exists('*FugitiveExtractGitDir') then
		error [[Missing dependencie 'vim-fugitive']]
	end
	local file_name = VimBufExpand(bufnr, ':p')
	if vim.fn.getftype(file_name) == 'link' then
		file_name = vim.fn.resolve(file_name)
	end
	return vim.fn.FugitiveExtractGitDir(file_name)
end

local function GetGitBranch(bufnr)
	if vim.fn.exists('b:gitsigns_head') ~= 1 then
		return ''
	end
	return vim.api.nvim_buf_get_var(bufnr, 'gitsigns_head')
end

local function GetGitInfo(bufnr, t)
	if vim.fn.exists('b:gitsigns_status_dict') ~= 1 then
		return nil
	end
	local status_dict = vim.api.nvim_buf_get_var(bufnr, 'gitsigns_status_dict')
	return status_dict[t]
end

local function GetGitStatusline(bufnr)
	local statusline = ''
	statusline = statusline .. Spacer(2)
			  .. HlGroup.LightSep .. Sep.Left
			  .. HlGroup.LightText .. Icon.Git
			  .. Spacer() .. GetGitBranch(bufnr)
	local added = GetGitInfo(bufnr, 'added')
	if added and added > 0 then
		statusline = statusline .. Spacer()
				  .. '+' .. added
	end
	local changed = GetGitInfo(bufnr, 'changed')
	if changed and changed > 0 then
		statusline = statusline .. Spacer()
				  .. '~' .. changed
	end
	local removed = GetGitInfo(bufnr, 'removed')
	if removed and removed > 0 then
		statusline = statusline .. Spacer()
				  .. '-' .. removed
	end
	statusline = statusline
			  .. HlGroup.LightSep .. Sep.Right
	return statusline
end
-- }}}

-- LSP {{{
local function HasLSP(bufnr)
	return not vim.tbl_isempty(vim.lsp.buf_get_clients(bufnr))
end

local function GetLSPDisagnosticCount(bufnr, diagnostic_type)
	return vim.lsp.diagnostic.get_count(bufnr, diagnostic_type)
end

local function InsideOfFunctionBlock(bufnr)
	return vim.fn.exists('b:lsp_current_function') == 1
	and not StrEmpty(vim.api.nvim_buf_get_var(bufnr, 'lsp_current_function'))
end

local function GetLSPCurrentFunction(bufnr)
	return vim.api.nvim_buf_get_var(bufnr, 'lsp_current_function')
end

local function GetLSPDiagnosticsStatusline(bufnr)
	local statusline = ''
	statusline = statusline .. Spacer() .. HlGroup.NormalText
	local error_count = GetLSPDisagnosticCount(bufnr, 'Error')
	if error_count and error_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Error
				  -- .. Icon.Error .. Spacer() .. error_count
				  .. error_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	local warning_count = GetLSPDisagnosticCount(bufnr, 'Warning')
	if warning_count and warning_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Warning
				  -- .. Icon.Warning .. Spacer() .. warning_count
				  .. warning_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	local info_count = GetLSPDisagnosticCount(bufnr, 'Information')
	if info_count and info_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Info
				  -- .. Icon.Info .. Spacer() .. info_count
				  .. info_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	local hint_count = GetLSPDisagnosticCount(bufnr, 'Hint')
	if hint_count and hint_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Hint
				  -- .. Icon.Hint .. Spacer() .. hint_count
				  .. hint_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	return statusline
end
-- }}}

-- Plugin integration {{{
local mundo_focused = false

local function MundoStatusLine(bufnr, winnr, active)
	mundo_focused = active
	local win_width = vim.api.nvim_win_get_width(winnr)
	return HlGroup.DarkText .. string.rep('━', win_width)
end

local function MundoDiffStatusLine(bufnr, winnr, active)
	mundo_focused = mundo_focused or active
	if mundo_focused then
		return HlGroup.ModeSep .. Sep.Left
			.. HlGroup.ModeText .. '社Mundo'
			.. HlGroup.ModeSep .. Sep.Right
	end
	return HlGroup.LightSep .. Sep.Left
		.. HlGroup.LightText .. '社Mundo'
		.. HlGroup.LightSep .. Sep.Right
end

local function DetectPluginWindow(bufnr, winnr, active)
	local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
	local plugin_list = {
		Mundo = MundoStatusLine,
		MundoDiff = MundoDiffStatusLine
	}
	for plugin, func in pairs(plugin_list) do
		if filetype == plugin then
			return func(bufnr, winnr, active)
		end
	end
end
-- }}}

-- Active Line {{{
function M.ActiveLine(bufnr, winnr)
	local plugin_line = DetectPluginWindow(bufnr, winnr, true)
	if plugin_line then
		return plugin_line
	end
	local statusline = ''
	statusline = statusline
			  .. GetModeStatusline()
			  .. GetFileStatusline(bufnr)
	if not StrEmpty(GetGitDir(bufnr)) then
		statusline = statusline .. GetGitStatusline(bufnr)
	end
	if HasLSP(bufnr) then
		statusline = statusline .. GetLSPDiagnosticsStatusline(bufnr)
	end
	-- Start a new section
	statusline = statusline .. '%='
	-- statusline = statusline .. require("lsp-status").status() .. Spacer()
	if InsideOfFunctionBlock(bufnr) then
		statusline = statusline ..HlGroup.LightSep .. Sep.Left
				  .. HlGroup.LightText .. Icon.Function .. Spacer()
				  .. GetLSPCurrentFunction(bufnr) .. HlGroup.LightSep .. Sep.Right
				  .. Spacer(2)
	end
	statusline = statusline .. HlGroup.NormalText .. 'Ln %-3l Col %-2c'
	return statusline
end
-- }}}

-- Inactive Line {{{
function M.InActiveLine(bufnr, winnr)
	local plugin_line = DetectPluginWindow(bufnr, winnr, false)
	if plugin_line then
		return plugin_line
	end
	local statusline = ''
	statusline = statusline
			  .. HlGroup.LightSep .. Sep.Left
			  .. HlGroup.LightText .. GetMode()
			  .. HlGroup.LightSep .. Sep.Right
			  .. HlGroup.NormalText .. Spacer(2) .. GetFileIcon(bufnr)
			  .. Spacer() .. GetFileName(bufnr)
	return statusline
end
-- }}}

return M

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
