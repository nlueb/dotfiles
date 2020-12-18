require 'util'

-- Use space key as <leader> key
vim.g.mapleader = ' '

-- Leader mappings {{{
map('<leader>tn', [[:tabnew<cr>]])
map('<leader>tc', [[:tabclose<cr>]])
map('<leader>tm', [[:tabmove<cr>]])
map('<leader>]', [[:tabnext<cr>]])
map('<leader>[', [[:tabprevious<cr>]])
map('<leader>>', [[:bn<cr>]])
map('<leader><', [[:bp<cr>]])
map('<leader>h', [[:lua ShowHighlightCaptures()<cr>]], {silent = true})
-- map('<leader>h', [[:echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>]])
map('<leader>d', [[:%s/\s\+$//e<cr>]])
map('<leader>n', [[:noh<cr>]], {silent = true})

-- Create a fold around visual selection in vimrc
vnoremap('<leader>f', [[<esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A }}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_f{hi ]])
-- }}}

-- Mappings {{{
-- Start interactive EasyAlign in visual mode (e.g. vipga)
xmap('ga', [[<Plug>(EasyAlign)]])
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap('ga', [[<Plug>(EasyAlign)]])
-- Insert new lines with enter and backspace in normal mode
nnoremap('\\', [[o<Esc>0d$]])
nnoremap('<S-CR>', [[s<cr><esc>]])
nnoremap('<BS>', [[O<Esc>0d$]])
nnoremap('<S-BS>', [[O<Esc>0d$j]])
nnoremap('Z', [[:MundoToggle<CR>]])
nnoremap('<C-g>', [[:GitMessenger<CR>]])
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable formatoptions-=cro foldlevelstart=0