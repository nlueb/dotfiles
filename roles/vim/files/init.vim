"Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-fold'
Plug 'glts/vim-textobj-indblock'
Plug 'kana/vim-textobj-indent'
Plug 'wellle/targets.vim'
Plug 'dracula/vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'posva/vim-vue'
Plug 'gcmt/taboo.vim'
Plug 'Lokaltog/vim-monotone'
Plug 'osyo-manga/vim-over'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'pearofducks/ansible-vim'
Plug 'morhetz/gruvbox'
call plug#end()
" }}}

" TrueColor (Terminal/Tmux) {{{
if exists('$TMUX')
	set t_8f=[38;2;%lu;%lu;%lum "for tmux true color
	set t_8b=[48;2;%lu;%lu;%lum "same
endif
" }}}

" Cursor shape (Terminal/Tmux) {{{
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
if exists('$TMUX')
	" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif
" don't wait to change modes (cursor shape will change instantly)
set timeoutlen=0 ttimeoutlen=0
" }}}

" Temporary files {{{
set undofile
set undodir=~/.config/nvim/undo
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swap
" }}}

" Color settings {{{
set background=dark
syntax on
filetype plugin on
filetype indent on
" enable true color in terminals (Vim 8.0)
set termguicolors
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
let g:gruvbox_italic=1
" colorscheme monotone
colorscheme gruvbox
" show linenumbers
set number
" show relative linenumbers
set relativenumber
" highlight the line where the cursor is at
" set cursorline
" }}}

" Statusline {{{
" show statusline all the time
set laststatus=0
set statusline=\ 
" don't show mode, bcs it's already in the statusline
set noshowmode

let g:lightline = {
			\ 'colorscheme': 'gruvbox',
			\ }
" }}}

"Tabline {{{
let g:taboo_tab_format = " %l%f "
" }}}

" Leader mappings {{{
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

nmap <leader>s :Startify<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q!<cr>
" map <leader>l :bnext<cr>
" map <leader>h :bprevious<cr>
map <silent> <leader>n :noh<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>] :tabnext<cr>
map <leader>[ :tabprevious<cr>
map <leader>> :bn<cr>
map <leader>< :bp<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>vs :so /Users/nils/.vimrc<cr>:setlocal foldmethod=marker<cr>:nohl
map <silent> <leader>ll :call ToggleList("Location List", 'l')<cr>
map <silent> <leader>ff :call ToggleList("Quickfix List", 'c')<cr>
map <leader>r :AsyncRun 
map <leader>ch f#lcw
map <silent> <leader>k <Plug>(ale_previous_wrap)
map <silent> <leader>j <Plug>(ale_next_wrap)
map <leader>h :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
map <leader>d :%s/\s\+$//e<cr>
map <leader>b :Buffers<cr>
map <leader>f :Files<cr>

" Create a fold around visual selection in vimrc
vnoremap <leader>f <esc>'>o<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A }}}<esc>'<O<esc>:call setline(line('.'), split(&commentstring, '%s')[0])<cr>A {{{<esc>_a 
" remove strange mappings
" iunmap <leader>ihn
" iunmap <leader>is
" iunmap <leader>ih
" }}}

" Mappings {{{
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
inoremap <C-k> <C-p>
inoremap <C-j> <C-n>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Insert new lines with enter and backspace in normal mode
nnoremap \ o<Esc>0d$
nnoremap <S-CR> s<cr><esc>
nnoremap <BS> O<Esc>0d$
nnoremap <S-BS> O<Esc>0d$j

tnoremap <Esc> <C-\><C-n>
" }}}

" Search {{{
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch
" }}}

" Misc settings {{{

set wildignore=*.o,*.obj,*.class

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
language en_US.UTF-8

" Turn on the Wild menu
set wildmenu

" show command in bottom bar
set showcmd

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" set fillchars=
set fillchars=vert:\╎ 
" set fillchars=vert:\⁣
" set fillchars=vert:\┊
set fillchars+=stl:\- 
set fillchars+=stlnc:− 
" set fillchars=fold:\- 
" set fillchars=vert:\║
" set fillchars+=stl:\═
" set fillchars+=stlnc:\═
" set fillchars=vert:\┊
" set fillchars+=stl:\╌
" set fillchars+=stlnc:\╌
" set statusline=╍
" set fillchars=vert:\╿
" set fillchars=vert:\|

" check the last line of a file for vim settings
set modelines=1

" turn on PASTE mode with F6
set pastetoggle=<F6>
" }}}

" Indentation {{{
" Use spaces instead of tabs
" set expandtab

" Be smart when using tabs ;)
set smarttab

" Show indent guides
set list listchars=tab:\│\ ,trail:━
" set list listchars=tab:\|\ ,trail:━
" set list listchars=tab:\
" set list listchars=tab:\|\ ,trail:■
" set list listchars=tab:\╽\

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Linebreak on 500 characters
set lbr
set tw=500
" }}}

" Folding {{{
" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" fold based on indent level
set foldmethod=syntax
" }}}

"IndentLine settings {{{
let g:indentLine_char = '│'
" }}}
" ALE settings {{{
let g:ale_statusline_format = [' %d ', ' %d ', ' ok ']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
" let g:ale_sign_error = '█'
" let g:ale_sign_warning = '█'

"linters {{{
let g:ale_linters = {'rust': ['rls'], 'python': ['pylint']}
" }}}
"fixers {{{
let g:ale_fixers = {'python': ['black', 'isort']}
" }}}
"rust {{{
let g:ale_rust_rls_executable = '/users/nils/.cargo/bin/rls'
"}}}
"python3 {{{
let g:ale_python_prospector_executable = 'python3'
" let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pyre_use_global = 1
let g:ale_python_pyls_use_global = 1
let g:ale_python_pylint_use_global = 1
" }}}
"lua {{{
let g:ale_lua_luacheck_executable='/users/nils/.luarocks/bin/luacheck'
" }}}

" }}}
" AutoPair settings {{{
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutJump = '<c-q>'
" }}}
" Completor settings {{{
let g:completor_min_chars = 1
let g:completor_racer_binary = '~/.cargo/bin/racer'
" }}}
" VimShell settings {{{
let g:vimshell_editor_command='/usr/local/bin/mvim'
" }}}
" NERDTree settings {{{
let g:NERDTreeDirArrowExpandable  = '●'
let g:NERDTreeDirArrowCollapsible = '○'
" }}}
" Colorizer settings {{{
let g:colorizer_auto_filetype = 'css,html'
let g:colorizer_auto_color    = 0
" }}}
" Startify settings {{{
let g:startify_fortune_use_unicode = 1
let g:startify_session_sort = 1
let g:startify_custom_header = []
" }}}
"Deoplete settings{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/5.0.0/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:racer_cmd = '/Users/nils/.cargo/bin/racer'
let g:racer_experimental_completer = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.rust = '[(\.)(::)]'
" don't open the preview window when completing
set completeopt-=preview
" let g:deoplete#sources#rust#racer_binary='/Users/nils/.cargo/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/Users/nils/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
" }}}
"Chromatic settings {{{
let g:chromatica#libclang_path='/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
let g:chromatica#enable_at_startup=0
" }}}
"UltiSnips settings {{{
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
" }}}
"Polyglot {{{
let g:python_highlight_builtins = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
" }}}

" Extra color settings {{{
if !exists('g:colors_name')
	let g:colors_name = 'monotone'
endif
if g:colors_name == 'ayu'
	hi! link ALEWarningSign Normal
	hi! link SignColumn Normal
	hi! link ALEErrorSign Todo
	hi! link VertSplit Normal
	hi! link StatusLine Normal
	hi! link StatusLineNC Normal
	hi! link MatchParen SpellRare
elseif g:colors_name == 'badwolf'
	hi! link ALEWarningSign Normal
	hi! link SignColumn Normal
	hi! link ALEErrorSign ErrorMsg
	hi! link VertSplit Comment
	hi! link StatusLine LineNr
	hi! link StatusLineNC Comment
	hi! link TabLine LineNr
	hi! link TabLineSel Normal
	hi! link CursorLineNr Normal
	hi! link ALEWarning SpellBad
	hi! link ALEError SpellCap
	hi! link luaDocTag String
	hi! link SpecialComment String
elseif g:colors_name == 'gruvbox'
	hi! link SignColumn Normal
	hi! link ALEErrorSign WarningMsg
	hi TabLineSel guifg=#282a36 guibg=#ebebeb
elseif g:colors_name == 'dracula'
	hi! link CursorLineNr Normal
	hi! link SignColumn Normal
	hi! link ALEErrorSign Statement
	hi! link ALEWarningSign Normal
	hi! link StatusLine NonText
	hi! link StatusLineNC NonText
	hi! link VertSplit NonText
	" hi! StatusLine guifg=#424450 guibg=#424450
	" hi! StatusLineNC guifg=#424450 guibg=#424450
	" hi! VertSplit guifg=#424450 guibg=#424450
elseif g:colors_name == 'monotone'
	hi! link CursorLineNr Normal
	hi! link Folded Comment
endif

"nor working in neovim :(
hi Cursor cterm=reverse ctermbg=NONE ctermfg=NONE gui=reverse guifg=NONE guibg=NONE

hi! link pythonNone pythonBoolean

"Neovim :terminal colors
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

augroup vimrc_autocmds
	autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#44475a
	autocmd BufEnter * match OverLength /\%>80v.\+/
	" autocmd TermOpen * match OverLength //
augroup END

" }}}

" misc functions {{{
function! GetBufferList()
	redir =>buflist
	silent! ls!
	redir END
	return buflist
endfunction

function! ToggleList(bufname, pfx)
	let buflist = GetBufferList()
	for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
		if bufwinnr(bufnum) != -1
			exec(a:pfx.'close')
			return
		endif
	endfor
	if a:pfx == 'l' && len(getloclist(0)) == 0
		echohl ErrorMsg
		echo "Location List is Empty."
		return
	endif
	let winnr = winnr()
	exec(a:pfx.'open')
	if winnr() != winnr
		wincmd p
	endif
endfunction
" }}}

" vim: foldmethod=marker foldlevel=0 foldenable
