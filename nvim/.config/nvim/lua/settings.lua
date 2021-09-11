local cmd = vim.cmd
local opt = vim.opt

-- Cursor {{{
opt.guicursor =  'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
-- }}}

-- Temporary files {{{
opt.undofile = true
opt.undodir = '/home/nils/.config/nvim/undo'

opt.backup = true
opt.backupcopy = 'auto'
opt.backupdir = '/home/nils/.config/nvim/backup'

opt.swapfile = true
opt.directory = '/home/nils/.config/nvim/swap'
-- }}}

-- Color settings {{{
cmd [[syntax on]]
cmd [[filetype plugin on]]
cmd [[filetype indent on]]

opt.termguicolors = true

cmd [[colorscheme yin]]

-- show linenumbers
opt.number = true

-- show relative linenumbers
opt.relativenumber = true

-- highlight the line where the cursor is at
opt.cursorline = false
-- }}}

-- Modeline {{{
opt.modeline = true
opt.modelines = 1
-- }}}

-- Statusline {{{
-- show statusline all the time
opt.laststatus = 2
-- don't show mode, bcs it's already in the statusline
opt.showmode = false
-- }}}

-- Search {{{
-- Ignore case when searching
opt.ignorecase = true
-- When searching try to be smart about cases
opt.smartcase = true
-- Highlight search results
opt.hlsearch = true
-- Makes search act like search in modern browsers
opt.incsearch = true
-- }}}

-- Fillchars {{{
-- VertSplit
opt.fillchars = 'vert:┃,fold: '

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

-- Folding
-- opt.fillchars = 'fold:─'
-- }}}

-- Indentation {{{
-- Use tabs instead of spaces
-- opt.expandtab = false
opt.expandtab = true

-- Be smart when using tabs ;)
opt.smarttab = true

-- Show indent guides
opt.list = true
opt.listchars = 'tab:│ ,trail:━'

-- Tabstop width
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.autoindent = true
opt.smartindent = true

opt.wrap = false

-- Linebreak on 500 characters
opt.linebreak = true
opt.textwidth = 500
-- set {g, 'showbreak', '〉'}
-- }}}

-- Folding {{{
-- Enable folding
opt.foldenable = true

-- Open most folds by default
opt.foldlevelstart = 99

-- 10 nested fold max
opt.foldnestmax = 10

-- Fold based on indent level
-- set foldmethod=syntax

-- Fold based on treesitter
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Improved foldtext
opt.foldtext = [[v:lua.FoldText()]]

-- Fold Markers
opt.foldmarker = '{{{,}}}'
-- }}}

-- Misc settings {{{

-- Display the completion matches using the popupmenu
opt.wildoptions = 'pum'

-- Enable live feedback for the :substitute command
opt.inccommand = 'split'

-- Smaller updatetime for CursorHold and CursorHoldI
opt.updatetime = 300

opt.wildignore = '*.o,*.obj,*.class,*/nvim/backup/*,*/nvim/undo/*,*/nvim/swap/*'

-- Set to auto read when a file is changed from the outside
opt.autoread = true

-- Set utf8 as standard encoding and en_US as the standard language
opt.encoding = 'utf8'
cmd [[language en_US.UTF-8]]

-- Turn on the Wild menu
opt.wildmenu = true

-- show command in bottom bar
opt.showcmd = true

-- A buffer becomes hidden when it is abandoned
opt.hidden = true

-- -- Configure backspace so it acts as it should act
opt.backspace = 'eol,start,indent'
opt.whichwrap = 'b,s'

-- Don't redraw while executing macros (good performance config)
opt.lazyredraw = true

-- don't give |ins-completion-menu| messages.  For example,
-- '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
opt.shortmess = vim.o.shortmess .. 'c'

-- For regular expressions turn magic on
opt.magic = true

-- Show matching brackets when text indicator is over them
opt.showmatch = true

-- More natural split opening
opt.splitbelow = true
opt.splitright = true

-- Enable mouse support
-- opt.mouse = 'a'

-- No annoying sound on errors
opt.errorbells = false
opt.visualbell = false
opt.timeoutlen = 500

-- Always show signcolumn
opt.signcolumn = 'yes'

-- Turn on PASTE mode with F6
opt.pastetoggle = '<F6>'
-- }}}

-- WSL Specific {{{
if IsWSL() then
	vim.g.clipboard = {
		name = 'win32yank-wsl',
		copy = {
			['+'] = 'win32yank.exe -i --crlf',
			['*'] = 'win32yank.exe -i --crlf'
		},
		paste = {
			['+'] = 'win32yank.exe -o --lf',
			['*'] = 'win32yank.exe -o --lf'
		},
		cache_enabled = 0
	}
end
-- }}}

-- Neovide settings {{{
vim.g.neovide_refresh_rate = 144
-- vim.g.neovide_cursor_vfx_mode = "railgun"
opt.guifont = 'JetBrainsMono Nerd Font:h32'
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
