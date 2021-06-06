require 'util'

local vim = vim

-- Cursor {{{
set {'guicursor', 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'}
-- }}}

-- Temporary files {{{
setb 'undofile'
set {'undodir', '/home/nils/.config/nvim/undo'}

set 'backup'
setb {'backupcopy', 'auto'}
set {'backupdir', '/home/nils/.config/nvim/backup'}

setb 'swapfile'
set {'directory', '/home/nils/.config/nvim/swap'}
-- }}}

-- Color settings {{{
cmd [[syntax on]]
cmd [[filetype plugin on]]
cmd [[filetype indent on]]

set 'termguicolors'

cmd [[colorscheme rose-pine]]
vim.api.nvim_set_option('background', 'dark')

-- show linenumbers
setw 'number'

-- show relative linenumbers
setw 'relativenumber'

-- highlight the line where the cursor is at
setw 'nocursorline'
-- }}}

-- Modeline {{{
setb 'modeline'
set {'modelines', 1}
-- }}}

-- Statusline {{{
-- show statusline all the time
set {'laststatus', 2}
-- don't show mode, bcs it's already in the statusline
set 'noshowmode'
-- }}}

-- Search {{{
-- Ignore case when searching
set 'ignorecase'
-- When searching try to be smart about cases
set 'smartcase'
-- Highlight search results
set 'hlsearch'
-- Makes search act like search in modern browsers
set 'incsearch'
-- }}}

-- Fillchars {{{
-- VertSplit
setw {'fillchars', 'vert:┃,fold: '}

-- Highlight characters after 90
-- setw {'colorcolumn', '90'}

-- Statusline
-- set fillchars+=stl:\- 
-- set fillchars+=stlnc:− 
-- set fillchars+=stl:\═
-- set fillchars+=stlnc:\═
-- set fillchars+=stl:\╌
-- set fillchars+=stlnc:\╌
-- set statusline=╍

-- Folding
-- setw {'fillchars', 'fold:─'}
-- }}}

-- Indentation {{{
-- Use tabs instead of spaces
setb 'noexpandtab'

-- Be smart when using tabs ;)
set 'smarttab'

-- Show indent guides
setw 'list'
setw {'listchars', 'tab:│ ,trail:━'}

-- Tabstop width
setb {'shiftwidth', 4}
setb {'tabstop', 4}
setb {'softtabstop', 4}

setb 'autoindent'
setb 'smartindent'

setw {'wrap', false}

-- Linebreak on 500 characters
setw 'linebreak'
setb {'textwidth', 500}
-- set {g, 'showbreak', '〉'}
-- }}}

-- Folding {{{
-- Enable folding
setw 'foldenable'

-- Open most folds by default
set {'foldlevelstart', -1}

-- 10 nested fold max
setw {'foldnestmax', 10}

-- Fold based on indent level
-- set foldmethod=syntax

-- Fold based on treesitter
setw {'foldmethod', 'expr'}
setw {'foldexpr', 'nvim_treesitter#foldexpr()'}

-- Improved foldtext
setw {'foldtext', [[luaeval('FoldText()')]]}

-- Fold Markers
setw {'foldmarker', '{{{,}}}'}
-- }}}

-- Misc settings {{{

-- Display the completion matches using the popupmenu
set {'wildoptions', 'pum'}

-- Enable live feedback for the :substitute command
set {'inccommand', 'split'}

-- Smaller updatetime for CursorHold and CursorHoldI
set {'updatetime', 300}

set {'wildignore', '*.o,*.obj,*.class,*/nvim/backup/*,*/nvim/undo/*,*/nvim/swap/*'}

-- Set to auto read when a file is changed from the outside
setb 'autoread'

-- Set utf8 as standard encoding and en_US as the standard language
set {'encoding', 'utf8'}
cmd [[language en_US.UTF-8]]

-- Turn on the Wild menu
set 'wildmenu'

-- show command in bottom bar
set 'showcmd'

-- A buffer becomes hidden when it is abandoned
set 'hidden'

-- -- Configure backspace so it acts as it should act
set {'backspace', 'eol,start,indent'}
set {'whichwrap', 'b,s'}

-- Don't redraw while executing macros (good performance config)
set 'lazyredraw'

-- don't give |ins-completion-menu| messages.  For example,
-- '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set {'shortmess', vim.o.shortmess .. 'c'}

-- For regular expressions turn magic on
set 'magic'

-- Show matching brackets when text indicator is over them
set 'showmatch'

-- More natural split opening
set 'splitbelow'
set 'splitright'

-- Enable mouse support
-- set {'mouse', 'a'}

-- No annoying sound on errors
set {'errorbells', false}
set {'visualbell', false}
set {'timeoutlen', 500}

-- Always show signcolumn
setw {'signcolumn', 'yes'}

-- Turn on PASTE mode with F6
set {'pastetoggle', '<F6>'}
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
set {'guifont', 'JetBrainsMono Nerd Font:h32'}
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
