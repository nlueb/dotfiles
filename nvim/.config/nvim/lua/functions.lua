local vim = vim

-- String Functions {{{
function string:split(delimiter)
  return vim.split(self, delimiter)
end

function string:empty()
	return self == nil or self == ''
end

function string:to_regex()
	return self:gsub('[%{%}%(%)%%%.%+%-%*%[%]%?%^%$]', '%%%1')
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

-- Windows WSL Stuff {{{
function _G.IsWSL()
	local version = vim.fn.readfile('/proc/version', '', 1)
	if vim.tbl_isempty(version) then
		error 'Could not read /proc/version'
	end
	return string.find(version[1], 'microsoft')
end
-- }}}

-- Jump Out {{{
local function jump_regex(chars)
    return '[^'
        .. table.concat(chars, ''):to_regex()
        .. ']'
end

function _G.JumpOut()
    local jump_chars = {'}', ')', ']', "'", '"',}

    local curr_line = vim.api.nvim_get_current_line()
    local _, cursor_col = unpack(vim.api.nvim_win_get_cursor(0))

    if cursor_col == curr_line:len() then
        return
    end

    local text_after_cursor = curr_line:sub(cursor_col + 1)

    local jump_targets = text_after_cursor:gsub(jump_regex(jump_chars), '')
    if jump_targets:empty() then
        return
    end

    local jump_target = jump_targets:sub(1, 1)
    if jump_target:empty() then
        return
    end

    local action = '<esc>f' .. jump_target .. 'a'
    local keys = vim.api.nvim_replace_termcodes(action, true, false, true)

    vim.api.nvim_feedkeys(keys, 'n!', false)
end
--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
