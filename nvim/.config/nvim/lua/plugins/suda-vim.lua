local vim = vim
local keymap = vim.api.nvim_set_keymap

keymap('c', 'w!!', 'w suda://%', {})
