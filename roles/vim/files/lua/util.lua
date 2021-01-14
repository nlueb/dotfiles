local function _set_scope(scope, option, setting)
	if scope == 'wo' then
		vim.api.nvim_win_set_option(0, option, setting)
	elseif scope == 'bo' then
		vim.api.nvim_buf_set_option(0, option, setting)
	end
	vim.api.nvim_set_option(option, setting)
end

local function _set(opts, scope)
	if type(opts) == 'string' then
		if opts:sub(1, 2) == 'no' then
			_set_scope(scope, opts:sub(3), false)
		else
			_set_scope(scope, opts, true)
		end
	else
		_set_scope(scope, opts[1], opts[2])
	end
end

function set(opts)
	_set(opts, 'o')
end

function setw(opts)
	_set(opts, 'wo')
end

function setb(opts)
	_set(opts, 'bo')
end

local function _map(mode, trigger, sequence, args)
	if args == nil then
		vim.api.nvim_set_keymap(mode, trigger, sequence, {})
	else
		vim.api.nvim_set_keymap(mode, trigger, sequence, args)
	end
end

function map(trigger, sequence, args)
	_map('', trigger, sequence, args)
end

function nmap(trigger, sequence, args)
	_map('n', trigger, sequence, args)
end

function nnoremap(trigger, sequence, args)
	if args == nil then
		nmap(trigger, sequence, {noremap = true})
		return
	end
	args.noremap = true
	nmap(trigger, sequence, args)
end

function imap(trigger, sequence, args)
	_map('i', trigger, sequence, args)
end

function inoremap(trigger, sequence, args)
	if args == nil then
		imap(trigger, sequence, {noremap = true})
		return
	end
	args.noremap = true
	imap(trigger, sequence, args)
end

function tmap(trigger, sequence, args)
	_map('t', trigger, sequence, args)
end

function tnoremap(trigger, sequence, args)
	if args == nil then
		tmap(trigger, sequence, {noremap = true})
		return
	end
	args.noremap = true
	tmap(trigger, sequence, args)
end

function xmap(trigger, sequence, args)
	_map('x', trigger, sequence, args)
end

function vmap(trigger, sequence, args)
	_map('v', trigger, sequence, args)
end

function vnoremap(trigger, sequence, args)
	if args == nil then
		vmap(trigger, sequence, {noremap = true})
		return
	end
	args.noremap = true
	vmap(trigger, sequence, args)
end

function smap(trigger, sequence, args)
	_map('s', trigger, sequence, args)
end

function cmap(trigger, sequence, args)
	_map('c', trigger, sequence, args)
end

cmd = vim.cmd
