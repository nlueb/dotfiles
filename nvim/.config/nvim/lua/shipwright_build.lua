local lushwright = require 'shipwright.transform.lush'

run(require 'lush_theme.yin',
    lushwright.to_vimscript,
    {prepend, 'set background=dark'},
    {prepend, 'let g:colors_name="yin"'},
    {overwrite, '../colors/yin.vim'})

run(require 'lush_theme.rose-pine',
    lushwright.to_vimscript,
    {prepend, 'set background=dark'},
    {prepend, 'let g:colors_name="rose-pine"'},
    {overwrite, '../colors/rose-pine.vim'})

run(require 'lush_theme.term',
    lushwright.to_vimscript,
    {prepend, 'set background=dark'},
    {prepend, 'let g:colors_name="term"'},
    {overwrite, '../colors/term.vim'})
