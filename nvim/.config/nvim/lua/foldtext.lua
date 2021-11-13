local vim = vim
local api = vim.api
local fn = vim.fn

local fold_metadata = {}

-- Misc {{{
local function GetSigncolumnWidth()
	local signcolumn = api.nvim_win_get_option(0, 'signcolumn')
	local signcolumn_width

	if signcolumn == 'no' or signcolumn == 'number' then
		signcolumn_width = 0
	elseif signcolumn == 'yes' then
		signcolumn_width = 2
	elseif signcolumn:match('yes') then
		signcolumn_width = tonumber(signcolumn:split(':')[2]) * 2
	elseif signcolumn == 'auto' then
		local signlist_str = api.nvim_exec([[execute(printf('sign place group=* buffer=%d', bufnr('')))]], true)
		local signlist = signlist_str:split('\n')
		if #signlist > 2 then
			signcolumn_width = 2
		else
			signcolumn_width = 0
		end
	elseif signcolumn:match('auto') then
		local bufnr = api.nvim_get_current_buf()
		local signs = fn.sign_getplaced(bufnr, {group = '*'})[1].signs
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
	local comment_string = api.nvim_buf_get_option(0, 'commentstring')
	-- Commentstring contains %s at the end, this needs to be removed
	comment_string = string.format(comment_string, '')
	return comment_string
end

local function GetFoldMarker()
	local markers = api.nvim_win_get_option(0, 'foldmarker')
	markers = markers:split(',')
	return {
		start = markers[1],
		finish = markers[2]
	}
end

function _G.UpdateLongestFoldTitle()
	if api.nvim_win_get_option(0, 'foldmethod') ~= 'marker' then
		return
	end
	local buf_handle = api.nvim_get_current_buf()
	-- Use -2 because modeline should be ignored
	local current_lines = api.nvim_buf_get_lines(buf_handle, 1, -2, false)
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
	local buf_handle = api.nvim_get_current_buf()
	if fold_metadata[buf_handle] == nil then
		UpdateLongestFoldTitle()
	end
	return fold_metadata[buf_handle].longest_line
end
-- }}}

-- Fold Helper {{{
local function GetLineWidth()
	local win_width = api.nvim_win_get_width(0)
	local number_width = math.max(
		api.nvim_win_get_option(0, 'numberwidth'),
		#tostring(fn.line('$')) + 1
	)
	local foldcolumn_width = api.nvim_win_get_option(0, 'foldcolumn')

	return win_width - number_width - foldcolumn_width - GetSigncolumnWidth()
end
-- }}}

-- Fold[Marker] Text {{{
local function FoldMarkerText(foldstart, foldend)
	local comment_string = GetCommentString()

	local markers = GetFoldMarker()

	local first_line = fn.getline(foldstart)
	local number_of_lines = (foldend + 1) - foldstart
	local section_title
	-- if vim.startswith(first_line, comment_string) then
		section_title = first_line:match('%s*' .. comment_string:to_regex() .. '%s*(.-)%s*' .. markers.start:to_regex())
	-- else
	-- 	section_title = first_line:match('%s*(.-)%s*' .. markers.start:to_regex())
	-- end
	local line_count = api.nvim_buf_line_count(0)
	local line_percent = math.floor((number_of_lines / line_count) * 100)
	local line_width = GetLineWidth()

	local foldtext_left = '■─── '
		.. section_title:align(GetLongestFoldTitle() + 1)
		.. '─'
	local foldtext_left_width = api.nvim_strwidth(foldtext_left)

	local foldtext_right = '─ '
						.. tostring(number_of_lines):align(3, 'right') .. 'ℓ ◦ '
						.. tostring(line_percent):align(2, 'right') .. '% ────'
	local foldtext_right_width = api.nvim_strwidth(foldtext_right)

	return foldtext_left
		.. string.rep('─', line_width - foldtext_left_width - foldtext_right_width)
		.. foldtext_right
end
-- }}}

-- Fold[Other] Text {{{
local function FoldOtherTextEnd(foldstart, foldend)
	local first_line = fn.getline(foldstart)

	if vim.startswith(first_line, '\t') then
		first_line = first_line:gsub('\t',
			string.rep(' ', api.nvim_buf_get_option(0, 'tabstop'))
		)
	end

	local last_line = vim.trim(fn.getline(foldend))
	return first_line .. '...' .. last_line
	-- local number_of_lines = (foldend + 1) - foldstart
	-- return first_line .. ' ' .. number_of_lines .. 'ℓ ' .. last_line
end

local function FoldOtherTextNoEnd(foldstart, foldend)
	local first_line = fn.getline(foldstart)

	if vim.startswith(first_line, '\t') then
		first_line = first_line:gsub('\t',
			string.rep(' ', api.nvim_buf_get_option(0, 'tabstop'))
		)
	end

	return first_line .. ' ...'
end

local function FoldOtherText(foldstart, foldend)
	local filetype = api.nvim_buf_get_option(0, 'filetype')
	if vim.tbl_contains({'yaml'}, filetype) then
		return FoldOtherTextNoEnd(foldstart, foldend)
	else
		return FoldOtherTextEnd(foldstart, foldend)
	end
end
-- }}}

-- Fold Text {{{
function _G.FoldText()
	local foldstart = api.nvim_get_vvar('foldstart')
	local foldend = api.nvim_get_vvar('foldend')
	-- local foldlevel = api.nvim_get_vvar('foldlevel')
	if api.nvim_win_get_option(0, 'foldmethod') ~= 'marker' then
		return FoldOtherText(foldstart, foldend)
		-- return fn.foldtext()
	else
		return FoldMarkerText(foldstart, foldend)
	end
end
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
