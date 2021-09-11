local vim = vim
local keymap = vim.api.nvim_set_keymap

-- Use space key as <leader> key
vim.g.mapleader = ' '

-- Leader mappings {{{
keymap('', '<leader>tn', [[<cmd>tabnew<cr>]], {silent = true})
keymap('', '<leader>tc', [[<cmd>tabclose<cr>]], {silent = true})
keymap('', '<leader>tm', [[<cmd>tabmove<cr>]], {silent = true})
keymap('', '<leader>]', [[<cmd>tabnext<cr>]], {silent = true})
keymap('', '<leader>[', [[<cmd>tabprevious<cr>]], {silent = true})
keymap('', '<leader>>', [[<cmd>bn<cr>]], {silent = true})
keymap('', '<leader><', [[<cmd>bp<cr>]], {silent = true})
keymap('', '<leader>h', [[<cmd>lua ShowHighlightCaptures()<cr>]], {silent = true})
keymap('', '<leader>d', [[<cmd>%s/\s\+$//e<cr>]], {silent = true})
keymap('', '<leader>n', [[<cmd>noh<cr>]], {silent = true})
keymap('', '<leader>u', [[<cmd>MundoToggle<cr>]], {silent = true})
keymap('', '<leader>s', [[<cmd>Startify<cr>]], {silent = true})
keymap('', '<leader>lt', [[<cmd>TroubleToggle<cr>]], {silent = true})

-- Create a fold around visual selection in vimrc
keymap('v', '<leader>f', [[<esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A}}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_f{hi ]], {silent = true, noremap = true})
-- Add modeline with foldmarker
keymap('n', '<leader>f', [[mfGo<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>Avim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}<esc>`f]], {silent = true, noremap = true})
-- }}}

-- Mappings {{{
-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap('x', 'ga', [[<Plug>(EasyAlign)]], {})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap('n', 'ga', [[<Plug>(EasyAlign)]], {})

-- Insert new lines with enter and backspace in normal mode
keymap('n', '\\', [[m'O<esc>0d$`']], {noremap = true})
keymap('n', '<CR>', [[m'o<esc>0d$`']], {noremap = true})

-- Leave Terminal with Ctrl-\ Ctrl-[
keymap('t', [[<C-\><C-[>]], [[<C-\><C-n>]], {noremap = true})

-- Tab shifting
keymap('n', '<Tab>', '>>', {noremap = true})
keymap('n', '<S-Tab>', '<<', {noremap = true})
keymap('v', '<Tab>', '>gv', {noremap = true})
keymap('v', '<S-Tab>', '<gv', {noremap = true})
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
