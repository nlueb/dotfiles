require 'plugins'
require 'functions'
require 'settings'
require 'mappings'
require 'autocmd'

-- local vim = vim

-- local function create_server(host, port, on_connect)
-- 	local server = vim.loop.new_udp()
-- 	server:bind(host, port)
-- 	server:recv_start(on_connect)
-- 	return server
-- end

-- create_server('127.0.0.1', 8888, function(err, data, _, _)
-- 	assert(not err, err) -- Check for errors.
-- 	if data == nil then return end
-- 	data = data:gsub("%s+", "")
-- 	vim.schedule(function()
-- 		print(string.format("lua require('colorbuddy').colorscheme('plugins/%s')", data))
-- 		vim.cmd(string.format([[silent lua require('colorbuddy').colorscheme('plugins/%s')]], data))
-- 		-- print(data)
-- 	end, 1000)
-- end)
