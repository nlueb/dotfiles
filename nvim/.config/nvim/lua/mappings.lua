local vim = vim
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
    ga = { [[<Plug>(EasyAlign)]], 'Align' },
    K = { [[<cmd>Lspsaga hover_doc<cr>]], 'Hover Doc', silent = true, noremap = true },
    ['<c-j>'] = { [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], 'Show line diagnostics', noremap = true },
    ['<m-j>'] = { [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>]], 'Scroll docs up', silent = true, noremap = true },
    ['<m-k>'] = { [[<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>]], 'Scroll docs down', silent = true, noremap = true },
    ['<c-k>'] = { [[<cmd>Lspsaga signature_help<CR>]], 'Show signature', silent = true, noremap = true },
    ['\\'] = { [[m'O<esc>0d$`']], '', noremap = true },
    ['<CR>'] = { [[m'o<esc>0d$`']], '', noremap = true },
    ['<Tab>'] = { '>>', '', noremap = true },
    ['<S-Tab>'] = { '<<', '', noremap = true },
    -- Colemak shuffle
    -- j = { 'n', 'Colemak next search', noremap = true },
    -- k = { 'e', 'Colemak end', noremap = true },
    -- n = { 'j|', 'Colemak down', noremap = true },
    -- e = { 'k|', 'Colemak down', noremap = true },
}, {mode = 'n'})
--}}}

-- Visual Mode {{{
wk.register({
    ['<leader>'] = {
        r = { [[<cmd>'<,'>SnipRun<cr><esc>]], 'SnipRun', silent = true },
        -- vim.api.nvim_set_keymap('v', '<leader>f', [[<esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A}}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_f{hi ]], {silent = true, noremap = true})
        f = { [[<esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A}}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_f{hi ]], silent = true, noremap = true },
        l = {
            name = 'lsp',
            f = { [[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], 'Format Range', silent = true, noremap = true },
            a = { [[<cmd><C-U>Lspsaga range_code_action<cr>]], 'Range Code Action', silent = true, noremap = true },
        },
    },
    ['ga'] = { [[<Plug>(EasyAlign)]], 'Align' },
    ['<Tab>'] = { '>gv', 'Indent', noremap = true },
    ['<S-Tab>'] = { '<gv', 'DedentDedent', noremap = true },
}, {mode = 'x'})
--}}}

-- Insert Mode {{{
wk.register({
    ['<c-q>'] = { [[<cmd>lua JumpOut()<cr>]], '', silent = true },
}, {mode = 'i'})
--}}}

-- Terminal Mode {{{
wk.register({
    [ [[<C-\><C-[>]] ] = { [[<C-\><C-n>]], 'Leave Terminal', noremap = true },
}, {mode = 't'})
--}}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
