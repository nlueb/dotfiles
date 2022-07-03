local vim = vim
local keymap = vim.api.nvim_set_keymap
local wk = require 'which-key'

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
        dd = { [[<cmd>%s/\s\+$//e<cr>]], 'Remove trailing space', silent = true },
        n = { [[<cmd>noh<cr>]], 'Remove search highlight', silent = true },
        u = { [[<cmd>MundoToggle<cr>]], 'Open undo tree', silent = true },
        s = { [[<cmd>Startify<cr>]], 'Startify', silent = true },
        e = {
            name = 'trouble',
            d = { [[<cmd>TroubleToggle<cr>]], 'Toggle Diagnostics', silent = true },
            t = { [[<cmd>TodoTrouble<cr>]], 'Toggle Todos', silent = true },
        },
        l = {
            name = 'lsp',
            t = { [[<cmd>TroubleToggle<cr>]], 'Show Quickfix', silent = true },
            i = { [[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'Goto Implementation', silent = true, noremap = true },
            f = { [[<cmd>lua vim.lsp.buf.format{ async = true }<CR>]], 'Format Buffer', silent = true, noremap = true },
            l = { [[<cmd>lua print(vim.lsp.buf.server_ready())<CR>]], 'Lsp Status', silent = true, noremap = true },
            r = { [[<cmd>lua vim.lsp.buf.rename()<cr>]], 'Rename', silent = true, noremap = true },
            a = { [[<cmd>lua vim.lsp.buf.code_action()<cr>]], 'Code Action', silent = true, noremap = true },
            d = { [[<cmd>lua vim.lsp.buf.definition()<cr>]], 'Find Definition', silent = true, noremap = true },
            -- p = { [[<cmd>Lspsaga preview_definition<cr>]], 'Preview Definition', silent = true, noremap = true },
        },
        f = {
            name = 'find',
            f = { [[<cmd>:lua require("telescope.builtin").find_files{ find_command = { "rg", "--files", "--hidden", "--ignore", "-g", "!.git/*" } }<cr>]], 'File', noremap = true },
            g = { [[<cmd>Telescope live_grep theme=ivy<cr>]], 'Grep', noremap = true },
            b = { [[<cmd>Telescope buffers theme=ivy<cr>]], 'Buffer', noremap = true },
            h = { [[<cmd>Telescope help_tags theme=ivy<cr>]], 'Help', noremap = true },
            c = { [[<cmd>Telescope colorscheme theme=ivy<cr>]], 'Colorscheme', noremap = true },
            q = { [[<cmd>Telescope quickfix theme=ivy<cr>]], 'Quickfix', noremap = true },
            l = { [[<cmd>lua PopulateLocationList() theme=ivy<cr>]], 'Populate Location List', noremap = true },
            m = { [[<cmd>Telescope man_pages theme=ivy<cr>]], 'Map Pages', noremap = true },
            n = { [[<cmd>Telescope notify theme=ivy<cr>]], 'Notifications', noremap = true },
            p = { [[<cmd>Telescope projects theme=ivy<cr>]], 'Projects', noremap = true },
            d = { [[<cmd>lua DiffviewToggle()<cr>]], 'Diffview', noremap = true },
        },
    },
}, {mode = 'n'})
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
wk.register({
    ['<leader>'] = {
        l = {
            name = 'lsp',
            f = { [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], 'Format Range', silent = true, noremap = true },
            a = { [[<cmd><C-U>Lspsaga range_code_action<cr>]], 'Range Code Action', silent = true, noremap = true },
        },
    },
}, {mode = 'x'})
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
