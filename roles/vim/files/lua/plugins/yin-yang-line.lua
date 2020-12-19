local galaxyline = require('galaxyline')
local section = galaxyline.section

local colors
if vim.o.background == 'light' then
	colors = {
		bg_strong = '#d7d7d7',
		fg_strong = '#0a0a0a',
		bg_main   = '#efefef',
		fg_main   = '#404148',
		bg_normal = '#26262',
		fg_normal = '#949494',
	}
else
	colors = {
		bg_strong = '#949494',
		fg_strong = '#1c1c1c',
		bg_main   = '#1c1c1c',
		fg_main   = '#949494',
		bg_normal = '#262626',
		fg_normal = '#949494',

		fg_error  = '#ce4257',
		fg_warn   = '#f4a261',
		fg_info   = '#457b9d',
		fg_hint   = '#e4e4e4',
	}
end

local sep = {
	left = '',
	right = '',
	line = '│',
}

sep.left_fn = function()
	return sep.left
end

sep.right_fn = function()
	return sep.right
end

local function all(...)
	local args = {...}
	return function()
		for _, fn in ipairs(args) do
			if not fn() then return false end
		end
		return true
	end
end

local function buffer_not_empty()
	return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

local function checkwidth()
	return (vim.fn.winwidth(0) / 2) > 40
end

local check_git_workspace = require('galaxyline.provider_vcs').check_git_workspace
local provider_diagnostic = require 'galaxyline.provider_diagnostic'
local get_diagnostic_error = provider_diagnostic.get_diagnostic_error
local get_diagnostic_warn = provider_diagnostic.get_diagnostic_warn
local get_diagnostic_hint = provider_diagnostic.get_diagnostic_hint
local get_diagnostic_info = provider_diagnostic.get_diagnostic_info

local function str_empty(str)
	return str == nil or str == ''
end

local function check_diagnostics()
	return not str_empty(get_diagnostic_error())
	    or not str_empty(get_diagnostic_warn())
	    or not str_empty(get_diagnostic_hint())
	    or not str_empty(get_diagnostic_info())
end

local function get_file_icon_color()
	return require('galaxyline/provider_fileinfo').get_file_icon_color()
end

local function symbol(str)
	return function() return str end
end

local function negated(fn)
	return function() return not fn() end
end

local function spacer(number)
	if number then
		return function()
			return string.rep(' ', number)
		end
	else
		return function()
			return ' '
		end
	end
end

galaxyline.short_line_list =
{
	'dbui',
	'diff',
	'peekaboo',
	'undotree',
	'vista',
	'vista_markdown'
}

section.left =
{
	{ModeSeperator = {
		provider = sep.left_fn,
		highlight = {colors.fg_main, colors.bg_main},
	}},

	{ViMode = {
		provider = function()
			local modes = {
				['c']  = {text = 'COMMAND-LINE',     color = colors.fg_strong},

				['ce'] = {text = 'NORMAL EX',        color = colors.fg_strong},
				['cv'] = {text = 'EX',               color = colors.fg_strong},
				['i']  = {text = 'INSERT',           color = colors.fg_strong},
				['ic'] = {text = 'INS-COMPLETE',     color = colors.fg_strong},
				['n']  = {text = 'NORMAL',           color = colors.fg_strong},
				['no'] = {text = 'OPERATOR-PENDING', color = colors.fg_strong},
				['r']  = {text = 'HIT-ENTER',        color = colors.fg_strong},
				['r?'] = {text = ':CONFIRM',         color = colors.fg_strong},
				['rm'] = {text = '--MORE',           color = colors.fg_strong},
				['R']  = {text = 'REPLACE',          color = colors.fg_strong},
				['Rv'] = {text = 'VIRTUAL',          color = colors.fg_strong},
				['s']  = {text = 'SELECT',           color = colors.fg_strong},
				['S']  = {text = 'SELECT',           color = colors.fg_strong},
				[''] = {text = 'SELECT',           color = colors.fg_strong},
				['t']  = {text = 'TERMINAL',         color = colors.fg_strong},
				['v']  = {text = 'VISUAL',           color = colors.fg_strong},
				['V']  = {text = 'VISUAL LINE',      color = colors.fg_strong},
				[''] = {text = 'VISUAL BLOCK',     color = colors.fg_strong},
				['!']  = {text = 'SHELL',            color = colors.fg_strong},
			}
			local test = modes[vim.fn.mode(true)] or modes[vim.fn.mode(false)]
			vim.api.nvim_command('hi GalaxyViMode guifg='.. test.color)
			return modes[vim.fn.mode()].text
		end,
		highlight = {colors.fg_strong, colors.bg_strong, 'bold'},
		separator = sep.right,
		separator_highlight = {colors.fg_main, colors.bg_main}
	}},

	{File = {
		provider  = {spacer(2), 'FileIcon', 'FileName', spacer(1)},
		highlight = {colors.fg_main, colors.bg_main, 'italic'},
	}},

	{GitSeperatorLeft = {
		provider = sep.left_fn,
		condition = check_git_workspace,
		highlight = {colors.bg_normal, colors.bg_main}
	}},

	{GitBranch = {
		provider = 'GitBranch',
		icon = '  ',
		condition = check_git_workspace,
		highlight = {colors.fg_normal, colors.bg_normal},
	}},

	{DiffAdd = {
		provider = 'DiffAdd',
		icon = '+',
		condition = check_git_workspace,
		highlight = {colors.fg_normal, colors.bg_normal},
	}},

	{DiffModified = {
		provider = 'DiffModified',
		icon = '~',
		condition = check_git_workspace,
		highlight = {colors.fg_normal, colors.bg_normal},
	}},

	{DiffRemove = {
		provider = 'DiffRemove',
		icon = '-',
		condition = check_git_workspace,
		highlight = {colors.fg_normal, colors.bg_normal},
	}},

	{GitSeperatorRight = {
		provider = sep.right_fn,
		condition = check_git_workspace,
		highlight = {colors.bg_normal, colors.bg_main}
	}},

	{DiagnosticLeft = {
		provider = function()
			if check_diagnostics() then
				return sep.left
			else
				return nil
			end
		end,
		highlight = {colors.bg_normal, colors.bg_main},
	}},

	{DiagnosticError = {
		provider = function()
			local diagnostic = get_diagnostic_error()
			if not str_empty(diagnostic) then
				return '  '..diagnostic..' '
			else
				return nil
			end
		end,
		highlight = {colors.fg_error, colors.bg_normal, 'bold'},
	}},

	{DiagnosticWarnSep = {
		provider = function()
			local diagnostic = get_diagnostic_warn()
			if not str_empty(diagnostic) then
				return sep.line
			else
				return nil
			end
		end,
		highlight = {colors.fg_strong, colors.bg_normal},
	}},
	{DiagnosticWarn = {
		provider = function()
			local diagnostic = get_diagnostic_warn()
			if not str_empty(diagnostic) then
				return '  '..diagnostic..' '
			else
				return nil
			end
		end,
		highlight = {colors.fg_warn, colors.bg_normal, 'bold'},
	}},

	{DiagnosticInfoSep = {
		provider = function()
			local diagnostic = get_diagnostic_info()
			if not str_empty(diagnostic) then
				return sep.line
			else
				return nil
			end
		end,
		highlight = {colors.fg_strong, colors.bg_normal},
	}},
	{DiagnosticInfo = {
		provider = function()
			local diagnostic = get_diagnostic_info()
			if not str_empty(diagnostic) then
				return '  '..diagnostic..' '
			else
				return nil
			end
		end,
		highlight = {colors.fg_info, colors.bg_normal, 'bold'},
	}},

	{DiagnosticHintSep = {
		provider = function()
			local diagnostic = get_diagnostic_hint()
			if not str_empty(diagnostic) then
				return sep.line
			else
				return nil
			end
		end,
		highlight = {colors.fg_strong, colors.bg_normal},
	}},
	{DiagnosticHint = {
		provider = function()
			local diagnostic = get_diagnostic_hint()
			if not str_empty(diagnostic) then
				return '  '..diagnostic..' '
			else
				return nil
			end
		end,
		highlight = {colors.fg_hint, colors.bg_normal, 'bold'},
	}},

	{DiagnosticRight = {
		provider = function()
			if check_diagnostics() then
				return sep.right
			else
				return nil
			end
		end,
		highlight = {colors.bg_normal, colors.bg_main},
	}},

}
