local vim = vim
local api = vim.api
local cmd = vim.cmd

local CURRNET_BUFFER = 0

local function test()
    local filetype = api.nvim_buf_get_option(CURRNET_BUFFER, 'filetype')
    if filetype ~= 'cpp' or filetype ~= 'c' then
        return
    end
    local filename = api.nvim_buf_get_name(CURRNET_BUFFER)
    api.nvim_command('edit /tmp/test')
end
