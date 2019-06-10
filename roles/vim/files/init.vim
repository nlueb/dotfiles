" Variables {{{
let s:os = system("uname -s")
" }}}

"Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
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
Plug 'lervag/vimtex'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'shmup/vim-sql-syntax'
Plug 'sjl/badwolf'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'honza/vim-snippets'
Plug 'cormacrelf/vim-colors-github'
Plug 'jeetsukumaran/vim-markology'
Plug 'liuchengxu/space-vim-theme'
Plug 'ARM9/arm-syntax-vim'
Plug 'liuchengxu/vista.vim'
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
" colorscheme badwolf
colorscheme space_vim_theme
" colorscheme github
" show linenumbers
set number
" show relative linenumbers
set relativenumber
" highlight the line where the cursor is at
set cursorline
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
map <silent> <leader>lc :CocList diagnostics<cr>
map <silent> <leader>ff :call ToggleList("Quickfix List", 'c')<cr>
map <leader>r :AsyncRun 
map <leader>ch f#lcw
map <silent> <leader>k <Plug>(ale_previous_wrap)
map <silent> <leader>j <Plug>(ale_next_wrap)
map <leader>h :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
map <leader>d :%s/\s\+$//e<cr>
map <leader>b :Buffers<cr>
map <leader>f :Files<cr>
map <silent> <leader>x :call ToggleSourceHeader(@%)<cr>
map <silent> <leader>y :<C-u>CocList -A --normal yank<cr>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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
" nnoremap <silent> <C-l> :wincmd l<cr>
" nnoremap <silent> <C-k> :wincmd k<cr>
" nnoremap <silent> <C-j> :wincmd j<cr>
" nnoremap <silent> <C-h> :wincmd h<cr>
" inoremap <C-j> <C-n>
" inoremap <C-k> <C-p>

" Coc Mappings {{{
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-h> <Plug>(coc-snippets-select)
" }}}

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

" Neovim specific settings {{{
if has('nvim')
	" Display the completion matches using the popupmenu
	" set wildoptions=pum

	" Enable live feedback for the :substitute command
	set inccommand=split
endif
" }}}

" Smaller updatetime for CursorHold and CursorHoldI
set updatetime=300

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
set hidden

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

" more natural split opening
set splitbelow
set splitright

" Enable mouse support
" set mouse=a

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
set fillchars+=fold:⠀ 
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

" always show signcolumn
set signcolumn=yes

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
" set list listchars=tab:\ ,trail:━
" set list listchars=tab:\|\ ,trail:■
" set list listchars=tab:\╽\

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

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

" Improved foldtext
set foldtext=FoldText()
" }}}

" NeoTeX {{{
let g:tex_flavor = 'latex'
let g:neotex_enabled = 1 " 0=always disabled, 1=default off, 2=default on
let g:neotex_delay = 1000
let g:neotex_latexdiff = 0
" }}}
"IndentLine {{{
let g:indentLine_char = '│'
" }}}
" ALE {{{
let g:ale_statusline_format = [' %d ', ' %d ', ' ok ']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

" let g:ale_c_parse_makefile = 1
let g:ale_c_gcc_options = '-O2 -pedantic -Wextra -Wall -Wfloat-equal -Wundef -Wpointer-arith -Wswitch-default -Wswitch-enum -Wconversion -Wunreachable-code -Winit-self -std=gnu17'
let g:ale_c_clang_options = '-O2 -pedantic -Wextra -Wall -Wfloat-equal -Wundef -Wpointer-arith -Wswitch-default -Wswitch-enum -Wconversion -Wunreachable-code -Winit-self -std=gnu17'
let g:ale_c_clangd_options = '-O2 -pedantic -Wextra -Wall -Wfloat-equal -Wundef -Wpointer-arith -Wswitch-default -Wswitch-enum -Wconversion -Wunreachable-code -Winit-self -std=gnu17'
let g:ale_c_uncrustify_options = '-c ~/scripts/uncrustify-c-cpp.cfg'

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
" AutoPair {{{
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutJump = '<c-q>'
" }}}
" Completor {{{
let g:completor_min_chars = 1
let g:completor_racer_binary = '~/.cargo/bin/racer'
" }}}
" VimShell {{{
let g:vimshell_editor_command='/usr/local/bin/mvim'
" }}}
" NERDTree {{{
let g:NERDTreeDirArrowExpandable  = '●'
let g:NERDTreeDirArrowCollapsible = '○'
" }}}
" Colorizer {{{
let g:colorizer_auto_filetype = 'css,html'
let g:colorizer_auto_color    = 0
" }}}
" Startify {{{
let g:startify_fortune_use_unicode = 1
let g:startify_session_sort = 1
let g:startify_custom_header = []
" }}}
"Deoplete {{{
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
"Chromatic {{{
if s:os ==? 'Darwin'
	let g:chromatica#libclang_path = '/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib'
elseif s:os ==? 'Linux'
	let g:chromatica#libclang_path = '/usr/lib/libclang.so'
endif
let g:chromatica#enable_at_startup = 0
let g:chromatica#responsive_mode = 1
" }}}
"UltiSnips {{{
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
" }}}
"Polyglot {{{
let g:python_highlight_builtins = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
" }}}
" Signify {{{
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_sign_add = '+'
let g:signify_sign_delete = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = '~'
" }}}
" Coc settings {{{
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
autocmd FileType json syntax match Comment +\/\/.\+$+
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" }}}
" Markology {{{
let g:markology_textlower="\t"
let g:markology_textupper=g:markology_textlower
let g:markology_textother=g:markology_textlower
let g:markology_disable_mappings=1
let g:markology_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'`^<>[]\""
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
elseif g:colors_name == 'space_vim_theme'
	" hi! Folded guifg=#a45bad guibg=cleared
	" hi! link Folded Pmenu
	let g:space_vim_italic = 1
	hi! Comment guifg=#5C6370 ctermfg=59
	hi! link MarkologyHLl ShowMarksHLl
	hi! link MarkologyHLu ShowMarksHLl
	hi! link MarkologyHLo ShowMarksHLl
	hi! link MarkologyHLm ShowMarksHLl
	hi! link SignifyLineAdd String
	hi! link SignifyLineChange NvimArrow
	hi! link SignifyLineDelete Type
	hi! link SignifySignAdd String
	hi! link SignifySignChange NvimArrow
	hi! link SignifySignDelete Type
	hi! CocHighlightText cterm=reverse gui=reverse
	hi! link CocErrorSign Type
	hi! CocWarningSign guifg=#b2b2b2
	hi! CocInfoSign guifg=#b2b2b2
	hi! link VertSplit Comment
	hi! link StatusLine Comment
	hi! link StatusLineNC Comment
	hi! link TabLine LineNr
	hi! link TabLineSel Normal
	" hi! link CursorLineNr Normal
	hi! link ALEWarningSign Normal
	hi! link SignColumn Normal
	hi! link ALEErrorSign ErrorMsg
	hi! link ALEWarning SpellBad
	hi! link ALEError SpellCap
	hi! link luaDocTag String
	hi! link SpecialComment String
elseif g:colors_name == 'badwolf'
	hi! link MarkologyHLl ShowMarksHLl
	hi! link MarkologyHLu ShowMarksHLl
	hi! link MarkologyHLo ShowMarksHLl
	hi! link MarkologyHLm ShowMarksHLl
	hi! link SignifyLineAdd PreProc
	hi! link SignifyLineChange Function
	hi! link SignifyLineDelete Keyword
	hi! link SignifySignAdd PreProc
	hi! link SignifySignChange Function
	hi! link SignifySignDelete Keyword
	hi! CocHighlightText cterm=reverse gui=reverse
	hi! link CocErrorSign Keyword
	hi! link CocWarningSign Normal
	hi! link CocInfoSign Normal
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
elseif g:colors_name == 'github'
	hi! link SignifyLineAdd Question
	hi! link SignifyLineChange Function
	hi! link SignifyLineDelete Keyword
	hi! link SignifySignAdd Question
	hi! link SignifySignChange Function
	hi! link SignifySignDelete Keyword
	hi! CocHighlightText cterm=reverse gui=reverse
	hi! link CocErrorSign Keyword
	hi! link CocWarningSign Normal
	hi! link CocInfoSign Normal
	hi! link ALEWarningSign Normal
	hi! link SignColumn Normal
	hi! link ALEErrorSign ErrorMsg
	hi! link VertSplit Comment
	hi! link StatusLine Comment
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
	hi! TabLineSel guifg=#282a36 guibg=#ebebeb
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
	" autocmd BufEnter * if &buftype != 'nofile' | highlight OverLength ctermbg=darkgrey guibg=#eeeeec | endif
	" autocmd BufEnter * match OverLength /\%>80v.\+/
	" autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#44475a
	autocmd BufEnter * if &buftype == '' || &buftype == 'acwrite' | set cc=80 | endif
augroup END

" }}}

" Commands {{{
command! -nargs=1 -complete=command R call RedirectOutput(<q-args>)
command! -nargs=1 -complete=command Rp call RedirectOutput(<q-args>, 1)
" }}}

" Functions {{{
function! GetBufferList()
	redir => buflist
	silent! ls!
	redir END
	return l:buflist
endfunction

function! ToggleList(bufname, pfx)
	let l:buflist = GetBufferList()
	for bufnum in map(filter(split(l:buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
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

function! ToggleSourceHeader(file)
	let l:split_file = split(a:file, '\.')
	if l:split_file[-1] == 'h'
		execute 'edit '.l:split_file[0].'.c'
	else
		execute 'edit '.l:split_file[0].'.h'
	endif
endfunction

function! s:check_back_space() abort
	let l:col = col('.') - 1
	return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

function! FoldText()
	" Get first non-blank line
	let l:fs = v:foldstart
	while getline(l:fs) =~? '^\s*$' | let l:fs = nextnonblank(l:fs + 1)
	endwhile

	if l:fs > v:foldend
		let l:line = getline(v:foldstart)
	else
		let l:line = substitute(getline(l:fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	if &foldmethod == 'marker' && &filetype == 'vim'
		let l:test = luaeval("string.match(_A, '\"%s*([%w%s]+)%s*')", l:line)
		" return  "ⵗ " . l:test
		" return  "⯆ " . l:test
		" return  "◢ " . l:test
		" return  "● " . l:test
		" return  "▼ " . l:test
		" return  "⏷ " . l:test
		" return  "⎖ " . l:test
		" return "∎ " . l:test
		return "∟ " . l:test
		" return "∫ " . l:test
	endif

	let l:w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let l:foldSize = 1 + v:foldend - v:foldstart
	let l:foldSizeStr = ' ' . l:foldSize . ' lines '
	let l:foldLevelStr = repeat('+--', v:foldlevel)
	let l:lineCount = line('$')
	let l:foldPercentage = printf('[%.1f', (l:foldSize*1.0)/l:lineCount*100) . '%] '
	let l:expansionString = repeat('.', l:w - strwidth(l:foldSizeStr.line.foldLevelStr.foldPercentage))
	return l:line . l:expansionString . l:foldSizeStr . l:foldPercentage . l:foldLevelStr
endfunction

function! RedirectOutput(cmd, ...)
	" Get the first argument from varargs, if not present default to 0 (false)
	let l:paste_to_buffer = get(a:, 1, 0)

	let l:message = ""

	" Redirect messages from a:cmd to the variable l:message or the paste register
	if l:paste_to_buffer
		redir => l:message
	else
		" Redirect messages from a:cmd to the paste register
		redir @"
	endif

	" Execute the given ex command
	silent execute a:cmd

	" Tur off the redirection
	redir END

	" Paste the message to the current buffer
	if l:paste_to_buffer
		silent put=l:message
	endif
endfunction
" }}}

" vim: foldmethod=marker foldlevel=0 foldenable formatoptions-=cro
