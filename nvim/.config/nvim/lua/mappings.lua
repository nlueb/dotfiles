local vim = vim
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

-- Normal Mode {{{
vim.keymap.set('n', '<leader>tn', [[<cmd>tabnew<cr>]], { silent = true })
vim.keymap.set('n', '<leader>tc', [[<cmd>tabclose<cr>]], { silent = true })
vim.keymap.set('n', '<leader>tm', [[<cmd>tabmove<cr>]], { silent = true })
vim.keymap.set('n', '<leader>]', [[<cmd>tabnext<cr>]], { silent = true })
vim.keymap.set('n', '<leader>[', [[<cmd>tabprevious<cr>]], { silent = true })
vim.keymap.set('n', '<leader>>', [[<cmd>bn<cr>]], { silent = true })
vim.keymap.set('n', '<leader><', [[<cmd>bp<cr>]], { silent = true })
vim.keymap.set('n', '<leader>h', [[<cmd>lua ShowHighlightCaptures()<cr>]], { silent = true })
vim.keymap.set('n', '<leader>dd', [[<cmd>%s/\s\+$//e<cr>]], { silent = true })
vim.keymap.set('n', '<leader>n', [[<cmd>noh<cr>]], { silent = true })
vim.keymap.set('n', '<leader>u', [[<cmd>MundoToggle<cr>]], { silent = true })
vim.keymap.set('n', '<leader>s', [[<cmd>Startify<cr>]], { silent = true })
vim.keymap.set('n', '<leader>ed', [[<cmd>TroubleToggle<cr>]], { silent = true })
vim.keymap.set('n', '<leader>et', [[<cmd>TodoTrouble<cr>]], { silent = true })
vim.keymap.set('n', '<leader>lt', [[<cmd>TroubleToggle<cr>]], { silent = true })
vim.keymap.set('n', '<leader>li', [[<cmd>lua vim.lsp.buf.implementation()<CR>]], { silent = true, noremap = true })
vim.keymap.set('n', '<leader>lf', [[<cmd>lua vim.lsp.buf.format{ async = true }<CR>]], { silent = true, noremap = true })
vim.keymap.set('n', '<leader>ll', [[<cmd>lua print(vim.lsp.buf.server_ready())<CR>]], { silent = true, noremap = true })
vim.keymap.set('n', '<leader>lr', [[<cmd>lua vim.lsp.buf.rename()<cr>]], { silent = true, noremap = true })
vim.keymap.set('n', '<leader>la', [[<cmd>lua vim.lsp.buf.code_action()<cr>]], { silent = true, noremap = true })
vim.keymap.set('n', '<leader>ld', [[<cmd>lua vim.lsp.buf.definition()<cr>]], { silent = true, noremap = true })
vim.keymap.set('n', '<leader>ff', [[<cmd>:lua require("telescope.builtin").find_files{ find_command = { "rg", "--files", "--hidden", "--ignore", "-g", "!.git/*" } }<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fg', [[<cmd>Telescope live_grep theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fb', [[<cmd>Telescope buffers theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fh', [[<cmd>Telescope help_tags theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fc', [[<cmd>Telescope colorscheme theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fq', [[<cmd>Telescope quickfix theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fl', [[<cmd>lua PopulateLocationList() theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fm', [[<cmd>Telescope man_pages theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fn', [[<cmd>Telescope notify theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fp', [[<cmd>Telescope projects theme=ivy<cr>]], { noremap = true })
vim.keymap.set('n', '<leader>fd', [[<cmd>lua DiffviewToggle()<cr>]], { noremap = true })
keymap('n', 'ga', [[<Plug>(EasyAlign)]], {})
keymap('n', 'K', [[<cmd>lua vim.lsp.buf.hover()<cr>]], {silent = true, noremap = true })
keymap('n', '<c-j>', [[<cmd>lua vim.diagnostic.open_float()<CR>]], {noremap = true })
-- keymap('n', '<m-j>', [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>]], {silent = true, noremap = true })
-- keymap('n', '<m-k>', [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>]], {silent = true, noremap = true })
keymap('n', '<c-k>', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], {silent = true, noremap = true })
keymap('n', '\\', [[m'O<esc>0d$`']], {noremap = true })
keymap('n', '<CR>', [[m'o<esc>0d$`']], {noremap = true })
keymap('n', '<Tab>', '>>', {noremap = true })
keymap('n', '<S-Tab>', '<<', {noremap = true })
-- keymap('', 'n', 'j', {noremap = true })
-- keymap('', 'N', 'J', {noremap = true })
-- keymap('', 'j', 'n', {noremap = true })
-- keymap('', 'J', 'N', {noremap = true })
-- keymap('', 'e', 'k', {noremap = true })
-- keymap('', 'E', 'K', {noremap = true })
-- keymap('', 'k', 'e', {noremap = true })
-- keymap('', 'K', 'E', {noremap = true })
--}}}

-- Visual Mode {{{
vim.keymap.set('x', '<leader>lf', [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], { silent = true, noremap = true })
vim.keymap.set('x', '<leader>la', [[<cmd><C-U>Lspsaga range_code_action<cr>]], { silent = true, noremap = true })
keymap('x', '<Tab>', '>gv', {noremap = true })
keymap('x', '<S-Tab>', '<gv', {noremap = true })
keymap('x', 'ga', [[<Plug>(EasyAlign)]], {})
keymap('x', '<leader>f', [[<esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A}}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_f{hi ]], {silent = true, noremap = true})
--}}}

-- Insert Mode {{{
keymap('i', '<c-q>', [[<cmd>lua JumpOut()<cr>]], {silent = true})
--}}}

-- Terminal Mode {{{
keymap('t', [[<C-\><C-[>]], [[<C-\><C-n>]], {noremap = true})
--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
