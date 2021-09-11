-- Local Variables {{{
local fold_metadata = {}
local vim = vim
-- }}}

-- String Functions {{{
function string:split(delimiter)
  return vim.split(self, delimiter)
end

function string:to_regex()
	return self:gsub('[%{%}%(%)%%%.%+%-%*%[%?%^%$]', '%%%1')
end

local function CenterString(str, length)
	if #str >= length then
		return str
	end
	local padding = math.floor((length - #str) / 2)
	if (length - #str) % 2 ~= 0 then
		return string.rep(' ', padding + 1) .. str .. string.rep(' ', padding)
	else
		return string.rep(' ', padding) .. str .. string.rep(' ', padding)
	end
end

function string:align(width, align)
	if #self >= width then
		return self
	end
	local spacer = string.rep(' ', width - #self)
	if align == 'right' then
		return spacer .. self
	elseif align == 'center' then
		return CenterString(self, width)
	end
	return self .. spacer
end
-- }}}

-- Highlight Group Helper {{{
local function _is_treesitter_hl()
	for _, highlighter in pairs(vim.treesitter.highlighter.active) do
		if highlighter.bufnr == vim.api.nvim_get_current_buf() then
			return true
		end
	end
	return false
end

function _G.ShowHighlightCaptures()
	local fn = vim.fn
	if _is_treesitter_hl() then
		vim.cmd('TSHighlightCapturesUnderCursor')
	else
		local matches = {}
		for _, id in pairs(fn.synstack(fn.line('.'), fn.col('.'))) do
			local id2 = fn.synIDtrans(id)
			local name1 = fn.synIDattr(id, 'name')
			local name2 = fn.synIDattr(id2, 'name')
			table.insert(matches, '@' .. name1 .. ' -> ' .. name2)
		end
		if #matches == 0 then
			matches = {"No highlight group found!"}
		end
		vim.lsp.util.open_floating_preview(matches, "treesitter-hl-captures")
	end
end
-- }}}

-- Telescope {{{
function _G.PopulateLocationList()
	if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
		vim.lsp.diagnostic.set_loclist { open_loclist=false }
	end
	local builtin = require('telescope.builtin')
	builtin.loclist()
end
-- }}}

-- Folding {{{
-- Misc {{{
local function GetSigncolumnWidth()
	local signcolumn = vim.api.nvim_win_get_option(0, 'signcolumn')
	local signcolumn_width

	if signcolumn == 'no' or signcolumn == 'number' then
		signcolumn_width = 0
	elseif signcolumn == 'yes' then
		signcolumn_width = 2
	elseif signcolumn:match('yes') then
		signcolumn_width = tonumber(signcolumn:split(':')[2]) * 2
	elseif signcolumn == 'auto' then
		local signlist_str = vim.api.nvim_exec([[execute(printf('sign place group=* buffer=%d', bufnr('')))]], true)
		local signlist = signlist_str:split('\n')
		if #signlist > 2 then
			signcolumn_width = 2
		else
			signcolumn_width = 0
		end
	elseif signcolumn:match('auto') then
		local bufnr = vim.api.nvim_get_current_buf()
		local signs = vim.fn.sign_getplaced(bufnr, {group = '*'})[1].signs
		if #signs > 0 then
			local line_count = {}
			local max_signs = 0
			for _, sign in pairs(signs) do
				line_count[sign.lnum] = (line_count[sign.lnum] or 0) + 1
				max_signs = math.max(max_signs, line_count[sign.lnum])
			end
			signcolumn_width = math.min(
				tonumber(signcolumn:split(':')[2]) * 2,
				max_signs * 2
			)
		else
			signcolumn_width = 0
		end
	end

	return signcolumn_width
end
-- }}}

-- Fold[Marker] Helper {{{
local function GetCommentString()
	local comment_string = vim.api.nvim_buf_get_option(0, 'commentstring')
	-- Commentstring contains %s at the end, this needs to be removed
	comment_string = string.format(comment_string, '')
	return comment_string
end

local function GetFoldMarker()
	local markers = vim.api.nvim_win_get_option(0, 'foldmarker')
	markers = markers:split(',')
	return {
		start = markers[1],
		finish = markers[2]
	}
end

function _G.UpdateLongestFoldTitle()
	if vim.api.nvim_win_get_option(0, 'foldmethod') ~= 'marker' then
		return
	end
	local buf_handle = vim.api.nvim_get_current_buf()
	-- Use -2 because modeline should be ignored
	local current_lines = vim.api.nvim_buf_get_lines(buf_handle, 1, -2, false)
	local comment_string = GetCommentString()
	current_lines = vim.tbl_filter(function(line)
		return line:match(comment_string:to_regex() .. '.*%{%{%{') ~= nil
	end, current_lines)
	current_lines = vim.tbl_map(function(line)
		return line:match(comment_string:to_regex() .. '%s*(.-)%s*%{%{%{')
	end, current_lines)
	local longest = 0
	for _, line in pairs(current_lines) do
		if #line > longest then
			longest = #line
		end
	end
	if fold_metadata[buf_handle] == nil then
		fold_metadata[buf_handle] = {}
	end
	fold_metadata[buf_handle].longest_line = longest
end

local function GetLongestFoldTitle()
	local buf_handle = vim.api.nvim_get_current_buf()
	if fold_metadata[buf_handle] == nil then
		UpdateLongestFoldTitle()
	end
	return fold_metadata[buf_handle].longest_line
end
-- }}}

-- Fold Helper {{{
local function GetLineWidth()
	local win_width = vim.api.nvim_win_get_width(0)
	local number_width = math.max(
		vim.api.nvim_win_get_option(0, 'numberwidth'),
		#tostring(vim.fn.line('$')) + 1
	)
	local foldcolumn_width = vim.api.nvim_win_get_option(0, 'foldcolumn')

	return win_width - number_width - foldcolumn_width - GetSigncolumnWidth()
end
-- }}}

-- Fold[Marker] Text {{{
local function FoldMarkerText(foldstart, foldend)
	local comment_string = GetCommentString()

	local markers = GetFoldMarker()

	local first_line = vim.fn.getline(foldstart)
	local number_of_lines = (foldend + 1) - foldstart
	local section_title
	if vim.startswith(first_line, comment_string) then
		section_title = first_line:match(comment_string:to_regex() .. '%s*(.-)%s*' .. markers.start:to_regex())
	else
		section_title = first_line:match('%s*(.-)%s*' .. markers.start:to_regex())
	end
	local line_count = vim.api.nvim_buf_line_count(0)
	local line_percent = math.floor((number_of_lines / line_count) * 100)
	local line_width = GetLineWidth()

	local foldtext_left = '■─── '
		.. section_title:align(GetLongestFoldTitle() + 1)
		.. '─'
	local foldtext_left_width = vim.api.nvim_strwidth(foldtext_left)

	local foldtext_right = '─ '
						.. tostring(number_of_lines):align(3, 'right') .. 'ℓ ◦ '
						.. tostring(line_percent):align(2, 'right') .. '% ────'
	local foldtext_right_width = vim.api.nvim_strwidth(foldtext_right)

	return foldtext_left
		.. string.rep('─', line_width - foldtext_left_width - foldtext_right_width)
		.. foldtext_right
end
-- }}}

-- Fold[Other] Text {{{
local function FoldOtherTextEnd(foldstart, foldend)
	local first_line = vim.fn.getline(foldstart)

	if vim.startswith(first_line, '\t') then
		first_line = first_line:gsub('\t',
			string.rep(' ', vim.api.nvim_buf_get_option(0, 'tabstop'))
		)
	end

	local last_line = vim.trim(vim.fn.getline(foldend))
	return first_line .. '...' .. last_line
	-- local number_of_lines = (foldend + 1) - foldstart
	-- return first_line .. ' ' .. number_of_lines .. 'ℓ ' .. last_line
end

local function FoldOtherTextNoEnd(foldstart, foldend)
	local first_line = vim.fn.getline(foldstart)

	if vim.startswith(first_line, '\t') then
		first_line = first_line:gsub('\t',
			string.rep(' ', vim.api.nvim_buf_get_option(0, 'tabstop'))
		)
	end

	return first_line .. ' ...'
end

local function FoldOtherText(foldstart, foldend)
	local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
	if vim.tbl_contains({'yaml'}, filetype) then
		return FoldOtherTextNoEnd(foldstart, foldend)
	else
		return FoldOtherTextEnd(foldstart, foldend)
	end
end
-- }}}

-- Fold Text {{{
function _G.FoldText()
	local foldstart = vim.api.nvim_get_vvar('foldstart')
	local foldend = vim.api.nvim_get_vvar('foldend')
	-- local foldlevel = vim.api.nvim_get_vvar('foldlevel')
	if vim.api.nvim_win_get_option(0, 'foldmethod') ~= 'marker' then
		return FoldOtherText(foldstart, foldend)
		-- return vim.fn.foldtext()
	else
		return FoldMarkerText(foldstart, foldend)
	end
end
-- }}}
-- }}}

-- Windows WSL Stuff {{{
function _G.IsWSL()
	local version = vim.fn.readfile('/proc/version', '', 1)
	if vim.tbl_isempty(version) then
		error 'Could not read /proc/version'
	end
	return string.find(version[1], 'microsoft')
end
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
