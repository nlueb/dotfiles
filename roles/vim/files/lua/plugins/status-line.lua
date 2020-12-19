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
	-- Help    = '',
	Help    = '',
	Default = ''
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
local function GetFileIcon()
	-- Mb look at https://github.com/liuchengxu/eleline.vim/blob/master/plugin/eleline.vim#L79-L83
	if vim.bo.buftype == 'help' then
		return Icon.Help
	end
	local ok,devicons = pcall(require,'nvim-web-devicons')
	if not ok then
		error [[Missing dependencie 'nvim-web-devicons']]
	end
	local file_name = vim.fn.expand('%:t')
	local file_extension = vim.fn.expand('%:e')
	local icon = devicons.get_icon(file_name,file_extension)
	if icon == nil then
		return Icon.Default
	end
	return icon
end

local function GetFileName()
	if vim.bo.buftype == 'help' then
		return 'help'
	end
	local file_name = vim.fn.expand('%:t')
	return file_name
end

local function GetFileStatusline()
	local statusline = ''
	statusline = statusline
			  .. HlGroup.NormalText .. Spacer(2) .. GetFileIcon()
			  .. Spacer() .. GetFileName()
	return statusline
end
-- }}}

-- Git {{{
local function GetGitDir()
	if vim.bo.buftype == 'help' then
		return nil
	end
	if not vim.fn.exists('*FugitiveExtractGitDir') then
		error [[Missing dependencie 'vim-fugitive']]
	end
	local file_name = vim.fn.expand('%:p')
	if vim.fn.getftype(file_name) == 'link' then
		file_name = vim.fn.resolve(file_name)
	end
	return vim.fn.FugitiveExtractGitDir(file_name)
end

local function GetGitBranch()
	if vim.fn.exists('b:gitsigns_head') ~= 1 then
		return ''
	end
	return vim.api.nvim_buf_get_var(0, 'gitsigns_head')
end

local function GetGitInfo(t)
	if vim.fn.exists('b:gitsigns_status_dict') ~= 1 then
		return nil
	end
	local status_dict = vim.api.nvim_buf_get_var(0, 'gitsigns_status_dict')
	return status_dict[t]
end

local function GetGitStatusline()
	local statusline = ''
	statusline = statusline .. Spacer(2)
			  .. HlGroup.LightSep .. Sep.Left
			  .. HlGroup.LightText .. Icon.Git
			  .. Spacer() .. GetGitBranch()
	local added = GetGitInfo('added')
	if added and added > 0 then
		statusline = statusline .. Spacer()
				  .. '+' .. added
	end
	local changed = GetGitInfo('changed')
	if changed and changed > 0 then
		statusline = statusline .. Spacer()
				  .. '~' .. changed
	end
	local removed = GetGitInfo('removed')
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
local function HasLSP()
	return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
end

local function GetLSPDisagnosticCount(diagnostic_type)
	return vim.lsp.diagnostic.get_count(0, diagnostic_type)
end

local function GetLSPStatusline()
	local statusline = ''
	statusline = statusline .. Spacer() .. HlGroup.NormalText
	local error_count = GetLSPDisagnosticCount('Error')
	if error_count and error_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Error
				  -- .. Icon.Error .. Spacer() .. error_count
				  .. error_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	local warning_count = GetLSPDisagnosticCount('Warning')
	if warning_count and warning_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Warning
				  -- .. Icon.Warning .. Spacer() .. warning_count
				  .. warning_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	local info_count = GetLSPDisagnosticCount('Information')
	if info_count and info_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Info
				  -- .. Icon.Info .. Spacer() .. info_count
				  .. info_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	local hint_count = GetLSPDisagnosticCount('Hint')
	if hint_count and hint_count > 0 then
		statusline = statusline .. Spacer() .. HlGroup.Hint
				  -- .. Icon.Hint .. Spacer() .. hint_count
				  .. hint_count
				  .. Spacer() .. HlGroup.DimText .. Sep.RightAlt
	end
	return statusline
end
-- }}}

-- Active Line {{{
function M.ActiveLine()
	local statusline = ''
	statusline = statusline
			  .. GetModeStatusline()
			  .. GetFileStatusline()
	if not StrEmpty(GetGitDir()) then
		statusline = statusline .. GetGitStatusline()
	end
	if HasLSP() then
		statusline = statusline .. GetLSPStatusline()
	end
	return statusline
end
-- }}}

-- Inactive Line {{{
function M.InActiveLine()
	local statusline = ''
	statusline = statusline
			  .. HlGroup.LightSep .. Sep.Left
			  .. HlGroup.LightText .. GetMode()
			  .. HlGroup.LightSep .. Sep.Right
			  .. HlGroup.NormalText .. Spacer(2) .. GetFileIcon()
			  .. Spacer() .. GetFileName()
	return statusline
end
-- }}}

return M

-- vim: foldmethod=marker foldlevel=0 foldenable formatoptions-=cro foldlevelstart=0
