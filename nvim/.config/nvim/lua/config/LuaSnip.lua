local vim = vim
local keymap = vim.api.nvim_set_keymap

local luasnip = require 'luasnip'
local vscode = require 'luasnip.loaders.from_vscode'
local types = require 'luasnip.util.types'

luasnip.config.setup {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    -- see :h User, event should never be triggered(except if it is `doautocmd`'d)
    -- region_check_events = 'CursorHold',
    -- delete_check_events = 'TextChanged,InsertLeave',
    store_selection_keys = nil, -- Supossed to be the same as the expand shortcut
    ext_base_prio = 200,
    ext_prio_increase = 7,
    enable_autosnippets = false,
}

--[[ vscode.load() ]]

-- Jump forward
keymap('i', '<C-l>',  [[<cmd>lua require('luasnip').jump(1)<cr>]], {silent = true, noremap = true})
keymap('n', '<C-l>',  [[<cmd>lua require('luasnip').jump(1)<cr>]], {silent = true, noremap = true})
keymap('s', '<C-l>',  [[<cmd>lua require('luasnip').jump(1)<cr>]], {silent = true, noremap = true})

-- Jump backward
keymap('i', '<C-h>',  [[<cmd>lua require('luasnip').jump(-1)<cr>]], {silent = true, noremap = true})
keymap('n', '<C-h>',  [[<cmd>lua require('luasnip').jump(-1)<cr>]], {silent = true, noremap = true})
keymap('s', '<C-h>',  [[<cmd>lua require('luasnip').jump(-1)<cr>]], {silent = true, noremap = true})
