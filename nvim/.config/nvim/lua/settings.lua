local vim = vim
local colorscheme = vim.cmd.colorscheme

local opt = vim.opt

opt.mouse = ""

opt.relativenumber = true
opt.number = true

-- Temporary files {{{
opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undo'

opt.backup = true
opt.backupcopy = 'auto'
opt.backupdir = vim.fn.stdpath('config') .. '/backup'

opt.swapfile = true
opt.directory = vim.fn.stdpath('config') .. '/swap'
-- }}}

-- Colors {{{
opt.termguicolors = true
-- colorscheme 'zaibatsu'
colorscheme 'dobri-next'

opt.number = true
opt.relativenumber = true

-- Always show signcolumn
opt.signcolumn = 'yes'

opt.cursorline = true
--}}}

-- Modeline {{{
opt.modeline = true
opt.modelines = 1
-- }}}

-- Statusline {{{
opt.showmode = false
opt.laststatus = 3
opt.cmdheight = 0
-- }}}

-- Search {{{
opt.ignorecase = true
opt.smartcase = true
-- }}}

-- Indentation {{{
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

opt.list = true
opt.listchars = 'tab:⇥ ,trail:░'

opt.wrap = false
--}}}

-- Misc settings {{{
-- Enable live feedback for the :substitute command
-- opt.inccommand = 'split'

-- Smaller updatetime for CursorHold and CursorHoldI
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

opt.wildignore = '*.o,*.obj,*.class,*/nvim/backup/*,*/nvim/undo/*,*/nvim/swap/*,*.ppm'

-- Don't redraw while executing macros (good performance config)
opt.lazyredraw = true

-- don't give |ins-completion-menu| messages.  For example,
-- '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
opt.shortmess:append('c')

-- Show matching brackets when text indicator is over them
opt.showmatch = true

-- More natural split opening
opt.splitbelow = true
opt.splitright = true

-- To ALWAYS use the clipboard for ALL operations
-- opt.clipboard = 'unnamedplus'
-- }}}

vim.diagnostic.config {
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.INFO]  = '',
            [vim.diagnostic.severity.HINT]  = '',
            -- [vim.diagnostic.severity.ERROR] = '',
            -- [vim.diagnostic.severity.WARN]  = '',
            -- [vim.diagnostic.severity.INFO]  = '',
            -- [vim.diagnostic.severity.HINT]  = '',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
            [vim.diagnostic.severity.WARN]  = 'DiagnosticWarn',
            [vim.diagnostic.severity.INFO]  = 'DiagnosticInfo',
            [vim.diagnostic.severity.HINT]  = 'DiagnosticHint',
        },
    },
}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
