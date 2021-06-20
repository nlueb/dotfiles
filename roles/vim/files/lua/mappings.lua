require 'util'
local vim = vim

-- Use space key as <leader> key
vim.g.mapleader = ' '

-- Leader mappings {{{
map('<leader>tn', [[<cmd>tabnew<cr>]], {silent = true})
map('<leader>tc', [[<cmd>tabclose<cr>]], {silent = true})
map('<leader>tm', [[<cmd>tabmove<cr>]], {silent = true})
map('<leader>]', [[<cmd>tabnext<cr>]], {silent = true})
map('<leader>[', [[<cmd>tabprevious<cr>]], {silent = true})
map('<leader>>', [[<cmd>bn<cr>]], {silent = true})
map('<leader><', [[<cmd>bp<cr>]], {silent = true})
map('<leader>h', [[<cmd>lua ShowHighlightCaptures()<cr>]], {silent = true})
-- map('<leader>h', [[<cmd>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>]])
map('<leader>d', [[<cmd>%s/\s\+$//e<cr>]], {silent = true})
map('<leader>n', [[<cmd>noh<cr>]], {silent = true})
map('<leader>u', [[<cmd>MundoToggle<cr>]], {silent = true})
map('<leader>s', [[<cmd>Startify<cr>]], {silent = true})

-- Create a fold around visual selection in vimrc
vnoremap('<leader>f', [[<esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A}}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_f{hi ]], {silent = true})
-- Add modeline with foldmarker
nnoremap('<leader>f', [[mfGo<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>Avim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}<esc>`f]], {silent = true})
-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
-- }}}

-- Mappings {{{
-- Start interactive EasyAlign in visual mode (e.g. vipga)
xmap('ga', [[<Plug>(EasyAlign)]])
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap('ga', [[<Plug>(EasyAlign)]])

-- Insert new lines with enter and backspace in normal mode
nnoremap('\\', [[m'O<esc>0d$`']])
nnoremap('<CR>', [[m'o<esc>0d$`']])

-- Leave Terminal with Ctrl-\ Ctrl-[
tnoremap([[<C-\><C-[>]], [[<C-\><C-n>]])

-- Tab shifting
nnoremap('<Tab>', '>>')
nnoremap('<S-Tab>', '<<')
vnoremap('<Tab>', '>gv')
vnoremap('<S-Tab>', '<gv')
-- imap('<cr>', [[pumvisible() ? complete_info()['selected'] != '-1' ? '<Plug>(completion_confirm_completion)' : '<c-e><CR>' : '<CR>']], {expr = true})
-- imap('<Enter>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<Enter>']], {expr = true})
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
