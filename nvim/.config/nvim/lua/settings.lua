local vim = vim
local cmd = vim.cmd
local opt = vim.opt

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
cmd [[colorscheme vscode-dark]]

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

-- Fillchars {{{
-- VertSplit
opt.fillchars = 'fold: ,diff:,foldclose:,foldopen:'
        -- item = { '', '' },
        -- section = { '', '' },

-- Highlight characters after 90
-- opt.colorcolumn = '90'

-- Statusline
-- set fillchars+=stl:\- 
-- set fillchars+=stlnc:− 
-- set fillchars+=stl:\═
-- set fillchars+=stlnc:\═
-- set fillchars+=stl:\╌
-- set fillchars+=stlnc:\╌
-- set statusline=╍
-- }}}

-- Indentation {{{
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

opt.list = true
-- opt.listchars = 'tab:│ ,trail:━'
opt.listchars = 'tab:⇥ ,trail:━'

opt.wrap = false
--}}}

-- Folding {{{
-- Open most folds by default
opt.foldlevelstart = 99

-- Fold based on treesitter
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Improved foldtext
opt.foldtext = [[v:lua.FoldText()]]
-- }}}

-- Misc settings {{{
-- Enable live feedback for the :substitute command
-- opt.inccommand = 'split'

-- Smaller updatetime for CursorHold and CursorHoldI
opt.updatetime = 300

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
-- }}}

-- WSL Specific {{{
-- if IsWSL() then
-- 	vim.g.clipboard = {
-- 		name = 'win32yank-wsl',
-- 		copy = {
-- 			['+'] = 'win32yank.exe -i --crlf',
-- 			['*'] = 'win32yank.exe -i --crlf'
-- 		},
-- 		paste = {
-- 			['+'] = 'win32yank.exe -o --lf',
-- 			['*'] = 'win32yank.exe -o --lf'
-- 		},
-- 		cache_enabled = 0
-- 	}
-- end
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
