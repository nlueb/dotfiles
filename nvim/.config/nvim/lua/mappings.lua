local vim = vim
local keymap = vim.api.nvim_set_keymap
local wk = require 'which-key'

-- Use space key as <leader> key
vim.g.mapleader = ' '

-- Normal Mode {{{
wk.register({
    ['<leader>'] = {
        t = {
            name = 'tabs',
            n = { [[<cmd>tabnew<cr>]], 'New tab', silent = true },
            c = { [[<cmd>tabclose<cr>]], 'Close tab', silent = true },
            m = { [[<cmd>tabmove<cr>]], 'Move tab', silent = true },
        },
        [']'] = { [[<cmd>tabnext<cr>]], 'Next tab', silent = true },
        ['['] = { [[<cmd>tabprevious<cr>]], 'Previous tab', silent = true },
        ['>'] = { [[<cmd>bn<cr>]], 'Next buffer', silent = true },
        ['<'] = { [[<cmd>bp<cr>]], 'Previous buffer', silent = true },
        h = { [[<cmd>lua ShowHighlightCaptures()<cr>]], 'Show highlight groups', silent = true },
        d = { [[<cmd>%s/\s\+$//e<cr>]], 'Remove trailing space', silent = true },
        n = { [[<cmd>noh<cr>]], 'Remove search highlight', silent = true },
        u = { [[<cmd>MundoToggle<cr>]], 'Open undo tree', silent = true },
        s = { [[<cmd>Startify<cr>]], 'Startify', silent = true },
        r = { [[<cmd>SnipRun<cr>]], 'SnipRun', silent = true },
        l = {
            name = 'lsp',
            t = { [[<cmd>TroubleToggle<cr>]], 'Show Quickfix', silent = true },
            i = { [[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'Goto Implementation', silent = true, noremap = true },
            f = { [[<cmd>lua vim.lsp.buf.formatting()<CR>]], 'Format Buffer', silent = true, noremap = true },
            l = { [[<cmd>lua print(vim.lsp.buf.server_ready())<CR>]], 'Lsp Status', silent = true, noremap = true },
            r = { [[<cmd>Lspsaga rename<cr>]], 'Rename', silent = true, noremap = true },
            a = { [[<cmd>Lspsaga code_action<cr>]], 'Code Action', silent = true, noremap = true },
            d = { [[<cmd>Lspsaga lsp_finder<cr>]], 'Find Usage', silent = true, noremap = true },
            p = { [[<cmd>Lspsaga preview_definition<cr>]], 'Preview Definition', silent = true, noremap = true },
        },
        f = {
            name = 'find',
            f = { [[<cmd>:lua require("telescope.builtin").find_files{ find_command = { "rg", "--files", "--hidden", "--ignore", "-g", "!.git/*" } }<cr>]], 'File', noremap = true },
            g = { [[<cmd>Telescope live_grep<cr>]], 'Grep', noremap = true },
            b = { [[<cmd>Telescope buffers<cr>]], 'Buffer', noremap = true },
            h = { [[<cmd>Telescope help_tags<cr>]], 'Help', noremap = true },
            c = { [[<cmd>Telescope colorscheme<cr>]], 'Colorscheme', noremap = true },
            q = { [[<cmd>Telescope quickfix<cr>]], 'Quickfix', noremap = true },
            l = { [[<cmd>lua PopulateLocationList()<cr>]], 'Populate Location List', noremap = true },
            m = { [[<cmd>Telescope man_pages<cr>]], 'Map Pages', noremap = true },
            n = { [[<cmd>Telescope notify<cr>]], 'Notifications', noremap = true }
        },
    },
    K = { [[<cmd>Lspsaga hover_doc<cr>]], 'Hover Doc', silent = true, noremap = true },
    ['<c-j>'] = { [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], 'Show line diagnostics', noremap = true },
    ['<m-j>'] = { [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>]], 'Scroll docs up', silent = true, noremap = true },
    ['<m-k>'] = { [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>]], 'Scroll docs down', silent = true, noremap = true },
    ['<c-k>'] = { [[<cmd>Lspsaga signature_help<CR>]], 'Show signature', silent = true, noremap = true },
}, {mode = 'n'})

-- keymap('n', '<c-j>', [[<cmd>LspSagaShowLineDiags<cr>]], {silent = true, noremap = true})
-- nnoremap('K', [[<cmd>lua vim.lsp.buf.hover()<CR>]], {silent = true})
-- nnoremap('<c-k>', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], {silent = true})
-- keymap('n', '<leader>ld', [[<cmd>lua vim.lsp.buf.definition()<CR>]], {silent = true}, {noremap = true})
-- keymap('n', '<leader>la', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], {silent = true}, {noremap = true})
-- vnoremap('<leader>la', [[<cmd>lua vim.lsp.buf.range_code_action()<CR>]], {silent = true})
-- keymap('n', '<leader>lr', [[<cmd>lua vim.lsp.buf.rename()<CR>]], {silent = true}, {noremap = true})
-- keymap('n', '<leader>lt', [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], {silent = true}, {noremap = true})
--}}}

-- Visual Mode {{{
wk.register({
    ['<leader>'] = {
        r = { [[<cmd>'<,'>SnipRun<cr><esc>]], 'SnipRun', silent = true },
    },
}, {mode = 'v'})
--}}}

keymap('v', '<leader>lf', [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], {silent = true, noremap = true})
keymap('v', '<leader>la', [[<cmd><C-U>Lspsaga range_code_action<cr>]], {silent = true, noremap = true})

-- Leader mappings {{{
-- keymap('', '<leader>tn', [[<cmd>tabnew<cr>]], {silent = true})
-- keymap('', '<leader>tc', [[<cmd>tabclose<cr>]], {silent = true})
-- keymap('', '<leader>tm', [[<cmd>tabmove<cr>]], {silent = true})
-- keymap('', '<leader>]', [[<cmd>tabnext<cr>]], {silent = true})
-- keymap('', '<leader>[', [[<cmd>tabprevious<cr>]], {silent = true})
-- keymap('', '<leader>>', [[<cmd>bn<cr>]], {silent = true})
-- keymap('', '<leader><', [[<cmd>bp<cr>]], {silent = true})
-- keymap('', '<leader>h', [[<cmd>lua ShowHighlightCaptures()<cr>]], {silent = true})
-- keymap('', '<leader>d', [[<cmd>%s/\s\+$//e<cr>]], {silent = true})
-- keymap('', '<leader>n', [[<cmd>noh<cr>]], {silent = true})
-- keymap('', '<leader>u', [[<cmd>MundoToggle<cr>]], {silent = true})
-- keymap('', '<leader>s', [[<cmd>Startify<cr>]], {silent = true})
-- keymap('', '<leader>lt', [[<cmd>TroubleToggle<cr>]], {silent = true})

-- Create a fold around visual selection in vimrc
keymap('v', '<leader>f', [[<esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A}}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_f{hi ]], {silent = true, noremap = true})
-- Add modeline with foldmarker
-- keymap('n', '<leader>f', [[mfGo<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>Avim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}<esc>`f]], {silent = true, noremap = true})
-- }}}

-- Mappings {{{
-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap('x', 'ga', [[<Plug>(EasyAlign)]], {noremap = true})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap('n', 'ga', [[<Plug>(EasyAlign)]], {noremap = true})

-- Insert new lines with enter and backspace in normal mode
keymap('n', '\\', [[m'O<esc>0d$`']], {noremap = true})
keymap('n', '<CR>', [[m'o<esc>0d$`']], {noremap = true})

keymap('i', '<c-q>', [[<cmd>lua JumpOut()<cr>]], {silent = true})

-- Leave Terminal with Ctrl-\ Ctrl-[
keymap('t', [[<C-\><C-[>]], [[<C-\><C-n>]], {noremap = true})

-- Tab shifting
keymap('n', '<Tab>', '>>', {noremap = true})
keymap('n', '<S-Tab>', '<<', {noremap = true})
keymap('v', '<Tab>', '>gv', {noremap = true})
keymap('v', '<S-Tab>', '<gv', {noremap = true})
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
