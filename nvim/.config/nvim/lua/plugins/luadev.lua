local vim = vim
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>l', [[<Plug>(Luadev-RunLine)]], {})
keymap('n', '<leader>r', [[<Plug>(Luadev-Run)]], {})
