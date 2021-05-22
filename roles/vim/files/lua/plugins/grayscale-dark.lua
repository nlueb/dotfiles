local Color, c, Group, g, s = require("colorbuddy").setup()
local vim = vim

-- Reset {{{
local cmd = vim.api.nvim_command

cmd [[highlight clear]]

if vim.fn.exists('syntax_on') then
  cmd [[syntax reset]]
end
-- }}}

vim.api.nvim_set_option('background', 'dark')
vim.g.colors_name = 'grayscale-dark'

-- Colors {{{
Color.new('gui00', '#101010')
Color.new('gui01', '#252525')
Color.new('gui02', '#464646')
Color.new('gui03', '#525252')
Color.new('gui04', '#ababab')
Color.new('gui05', '#b9b9b9')
Color.new('gui06', '#e3e3e3')
Color.new('gui07', '#f7f7f7')
Color.new('gui08', '#7c7c7c')
Color.new('gui09', '#999999')
Color.new('gui0A', '#a0a0a0')
Color.new('gui0B', '#8e8e8e')
Color.new('gui0C', '#868686')
Color.new('gui0D', '#686868')
Color.new('gui0E', '#747474')
Color.new('gui0F', '#5e5e5e')
-- }}}

-- NeoVim Terminal {{{
vim.g.terminal_color_0 =  '#101010'
vim.g.terminal_color_1 =  '#7c7c7c'
vim.g.terminal_color_2 =  '#8e8e8e'
vim.g.terminal_color_3 =  '#a0a0a0'
vim.g.terminal_color_4 =  '#686868'
vim.g.terminal_color_5 =  '#747474'
vim.g.terminal_color_6 =  '#868686'
vim.g.terminal_color_7 =  '#b9b9b9'
vim.g.terminal_color_8 =  '#525252'
vim.g.terminal_color_9 =  '#7c7c7c'
vim.g.terminal_color_10 = '#8e8e8e'
vim.g.terminal_color_11 = '#a0a0a0'
vim.g.terminal_color_12 = '#686868'
vim.g.terminal_color_13 = '#747474'
vim.g.terminal_color_14 = '#868686'
vim.g.terminal_color_15 = '#f7f7f7'
vim.g.terminal_color_background = vim.g.terminal_color_0
vim.g.terminal_color_foreground = vim.g.terminal_color_5
-- }}}

-- Vim editor colors
Group.new('Normal',                     c.gui05, c.gui00, s.none)
Group.new('Bold',                       c.none, c.none, s.bold)
Group.new('Debug',                      c.gui08, c.none, s.none)
Group.new('Directory',                  c.gui0D, c.none, s.none)
Group.new('Error',                      c.gui00, c.gui08, s.none)
Group.new('ErrorMsg',                   c.gui08, c.gui00, s.none)
Group.new('Exception',                  c.gui08, c.none, s.none)
Group.new('FoldColumn',                 c.gui0C, c.gui01, s.none)
Group.new('Folded',                     c.gui03, c.gui01, s.none)
Group.new('IncSearch',                  c.gui01, c.gui09, s.none)
Group.new('Italic',                     c.none, c.none, s.none)
Group.new('Macro',                      c.gui08, c.none, s.none)
Group.new('MatchParen',                 c.none, c.gui03,  s.none)
Group.new('ModeMsg',                    c.gui0B, c.none, s.none)
Group.new('MoreMsg',                    c.gui0B, c.none, s.none)
Group.new('Question',                   c.gui0D, c.none, s.none)
Group.new('Search',                     c.gui01, c.gui0A,  s.none)
Group.new('Substitute',                 c.gui01, c.gui0A, s.none)
Group.new('SpecialKey',                 c.gui03, c.none, s.none)
Group.new('TooLong',                    c.gui08, c.none, s.none)
Group.new('Underlined',                 c.gui08, c.none, s.none)
Group.new('Visual',                     c.none, c.gui02, s.none)
Group.new('VisualNOS',                  c.gui08, c.none, s.none)
Group.new('WarningMsg',                 c.gui08, c.none, s.none)
Group.new('WildMenu',                   c.gui08, c.gui0A, s.none)
Group.new('Title',                      c.gui0D, c.none, s.none)
Group.new('Conceal',                    c.gui0D, c.gui00, s.none)
Group.new('Cursor',                     c.gui00, c.gui05, s.none)
Group.new('NonText',                    c.gui03, c.none, s.none)
Group.new('LineNr',                     c.gui03, c.gui01, s.none)
Group.new('SignColumn',                 c.gui03, c.gui01, s.none)
Group.new('StatusLine',                 c.gui04, c.gui02, s.none)
Group.new('StatusLineNC',               c.gui03, c.gui01, s.none)
Group.new('VertSplit',                  c.gui02, c.gui02, s.none)
Group.new('ColorColumn',                c.none, c.gui01, s.none)
Group.new('CursorColumn',               c.none, c.gui01, s.none)
Group.new('CursorLine',                 c.none, c.gui01, s.none)
Group.new('CursorLineNr',               c.gui04, c.gui01, s.none)
Group.new('QuickFixLine',               c.none, c.gui01, s.none)
Group.new('PMenu',                      c.gui05, c.gui01, s.none)
Group.new('PMenuSel',                   c.gui01, c.gui05, s.none)
Group.new('TabLine',                    c.gui03, c.gui01, s.none)
Group.new('TabLineFill',                c.gui03, c.gui01, s.none)
Group.new('TabLineSel',                 c.gui0B, c.gui01, s.none)

-- Standard syntax highlighting
Group.new('Boolean',                    c.gui09, c.none, s.none)
Group.new('Character',                  c.gui08, c.none, s.none)
Group.new('Comment',                    c.gui03, c.none, s.none)
Group.new('Conditional',                c.gui0E, c.none, s.none)
Group.new('Constant',                   c.gui09, c.none, s.none)
Group.new('Define',                     c.gui0E, c.none, s.none)
Group.new('Delimiter',                  c.gui0F, c.none, s.none)
Group.new('Float',                      c.gui09, c.none, s.none)
Group.new('Function',                   c.gui0D, c.none, s.none)
Group.new('Identifier',                 c.gui08, c.none, s.none)
Group.new('Include',                    c.gui0D, c.none, s.none)
Group.new('Keyword',                    c.gui0E, c.none, s.none)
Group.new('Label',                      c.gui0A, c.none, s.none)
Group.new('Number',                     c.gui09, c.none, s.none)
Group.new('Operator',                   c.gui05, c.none, s.none)
Group.new('PreProc',                    c.gui0A, c.none, s.none)
Group.new('Repeat',                     c.gui0A, c.none, s.none)
Group.new('Special',                    c.gui0C, c.none, s.none)
Group.new('SpecialChar',                c.gui0F, c.none, s.none)
Group.new('Statement',                  c.gui08, c.none, s.none)
Group.new('StorageClass',               c.gui0A, c.none, s.none)
Group.new('String',                     c.gui0B, c.none, s.none)
Group.new('Structure',                  c.gui0E, c.none, s.none)
Group.new('Tag',                        c.gui0A, c.none, s.none)
Group.new('Todo',                       c.gui0A, c.gui01, s.none)
Group.new('Type',                       c.gui0A, c.none, s.none)
Group.new('Typedef',                    c.gui0A, c.none, s.none)

-- C highlighting
Group.new('cOperator',                  c.gui0C, c.none, s.none)
Group.new('cPreCondit',                 c.gui0E, c.none, s.none)

-- C# highlighting
Group.new('csClass',                    c.gui0A, c.none, s.none)
Group.new('csAttribute',                c.gui0A, c.none, s.none)
Group.new('csModifier',                 c.gui0E, c.none, s.none)
Group.new('csType',                     c.gui08, c.none, s.none)
Group.new('csUnspecifiedStatement',     c.gui0D, c.none, s.none)
Group.new('csContextualStatement',      c.gui0E, c.none, s.none)
Group.new('csNewDecleration',           c.gui08, c.none, s.none)

-- CSS highlighting
Group.new('cssBraces',                  c.gui05, c.none, s.none)
Group.new('cssClassName',               c.gui0E, c.none, s.none)
Group.new('cssColor',                   c.gui0C, c.none, s.none)

-- Diff highlighting
Group.new('DiffAdd',                    c.gui0B, c.gui01, s.none)
Group.new('DiffChange',                 c.gui03, c.gui01, s.none)
Group.new('DiffDelete',                 c.gui08, c.gui01, s.none)
Group.new('DiffText',                   c.gui0D, c.gui01, s.none)
Group.new('DiffAdded',                  c.gui0B, c.gui00, s.none)
Group.new('DiffFile',                   c.gui08, c.gui00, s.none)
Group.new('DiffNewFile',                c.gui0B, c.gui00, s.none)
Group.new('DiffLine',                   c.gui0D, c.gui00, s.none)
Group.new('DiffRemoved',                c.gui08, c.gui00, s.none)

-- Git highlighting
Group.new('gitcommitOverflow',          c.gui08, c.none, s.none)
Group.new('gitcommitSummary',           c.gui0B, c.none, s.none)
Group.new('gitcommitComment',           c.gui03, c.none, s.none)
Group.new('gitcommitUntracked',         c.gui03, c.none, s.none)
Group.new('gitcommitDiscarded',         c.gui03, c.none, s.none)
Group.new('gitcommitSelected',          c.gui03, c.none, s.none)
Group.new('gitcommitHeader',            c.gui0E, c.none, s.none)
Group.new('gitcommitSelectedType',      c.gui0D, c.none, s.none)
Group.new('gitcommitUnmergedType',      c.gui0D, c.none, s.none)
Group.new('gitcommitDiscardedType',     c.gui0D, c.none, s.none)
Group.new('gitcommitBranch',            c.gui09, c.none, s.bold)
Group.new('gitcommitUntrackedFile',     c.gui0A, c.none, s.none)
Group.new('gitcommitUnmergedFile',      c.gui08, c.none, s.bold)
Group.new('gitcommitDiscardedFile',     c.gui08, c.none, s.bold)
Group.new('gitcommitSelectedFile',      c.gui0B, c.none, s.bold)

-- GitGutter highlighting
Group.new('GitGutterAdd',               c.gui0B, c.gui01, s.none)
Group.new('GitGutterChange',            c.gui0D, c.gui01, s.none)
Group.new('GitGutterDelete',            c.gui08, c.gui01, s.none)
Group.new('GitGutterChangeDelete',      c.gui0E, c.gui01, s.none)

-- HTML highlighting
Group.new('htmlBold',                   c.gui0A, c.none, s.none)
Group.new('htmlItalic',                 c.gui0E, c.none, s.none)
Group.new('htmlEndTag',                 c.gui05, c.none, s.none)
Group.new('htmlTag',                    c.gui05, c.none, s.none)

-- JavaScript highlighting
Group.new('javaScript',                 c.gui05, c.none, s.none)
Group.new('javaScriptBraces',           c.gui05, c.none, s.none)
Group.new('javaScriptNumber',           c.gui09, c.none, s.none)
-- pangloss/vim-javascript highlighting
Group.new('jsOperator',                 c.gui0D, c.none, s.none)
Group.new('jsStatement',                c.gui0E, c.none, s.none)
Group.new('jsReturn',                   c.gui0E, c.none, s.none)
Group.new('jsThis',                     c.gui08, c.none, s.none)
Group.new('jsClassDefinition',          c.gui0A, c.none, s.none)
Group.new('jsFunction',                 c.gui0E, c.none, s.none)
Group.new('jsFuncName',                 c.gui0D, c.none, s.none)
Group.new('jsFuncCall',                 c.gui0D, c.none, s.none)
Group.new('jsClassFuncName',            c.gui0D, c.none, s.none)
Group.new('jsClassMethodType',          c.gui0E, c.none, s.none)
Group.new('jsRegexpString',             c.gui0C, c.none, s.none)
Group.new('jsGlobalObjects',            c.gui0A, c.none, s.none)
Group.new('jsGlobalNodeObjects',        c.gui0A, c.none, s.none)
Group.new('jsExceptions',               c.gui0A, c.none, s.none)
Group.new('jsBuiltins',                 c.gui0A, c.none, s.none)

-- Mail highlighting
Group.new('mailQuoted1',                c.gui0A, c.none, s.none)
Group.new('mailQuoted2',                c.gui0B, c.none, s.none)
Group.new('mailQuoted3',                c.gui0E, c.none, s.none)
Group.new('mailQuoted4',                c.gui0C, c.none, s.none)
Group.new('mailQuoted5',                c.gui0D, c.none, s.none)
Group.new('mailQuoted6',                c.gui0A, c.none, s.none)
Group.new('mailURL',                    c.gui0D, c.none, s.none)
Group.new('mailEmail',                  c.gui0D, c.none, s.none)

-- Markdown highlighting
Group.new('markdownCode',               c.gui0B, c.none, s.none)
Group.new('markdownError',              c.gui05, c.gui00, s.none)
Group.new('markdownCodeBlock',          c.gui0B, c.none, s.none)
Group.new('markdownHeadingDelimiter',   c.gui0D, c.none, s.none)

-- NERDTree highlighting
Group.new('NERDTreeDirSlash',           c.gui0D, c.none, s.none)
Group.new('NERDTreeExecFile',           c.gui05, c.none, s.none)

-- PHP highlighting
Group.new('phpMemberSelector',          c.gui05, c.none, s.none)
Group.new('phpComparison',              c.gui05, c.none, s.none)
Group.new('phpParent',                  c.gui05, c.none, s.none)
Group.new('phpMethodsVar',              c.gui0C, c.none, s.none)

-- Python highlighting
Group.new('pythonOperator',             c.gui0E, c.none, s.none)
Group.new('pythonRepeat',               c.gui0E, c.none, s.none)
Group.new('pythonInclude',              c.gui0E, c.none, s.none)
Group.new('pythonStatement',            c.gui0E, c.none, s.none)

-- Ruby highlighting
Group.new('rubyAttribute',              c.gui0D, c.none, s.none)
Group.new('rubyConstant',               c.gui0A, c.none, s.none)
Group.new('rubyInterpolationDelimiter', c.gui0F, c.none, s.none)
Group.new('rubyRegexp',                 c.gui0C, c.none, s.none)
Group.new('rubySymbol',                 c.gui0B, c.none, s.none)
Group.new('rubyStringDelimiter',        c.gui0B, c.none, s.none)

-- SASS highlighting
Group.new('sassidChar',                 c.gui08, c.none, s.none)
Group.new('sassClassChar',              c.gui09, c.none, s.none)
Group.new('sassInclude',                c.gui0E, c.none, s.none)
Group.new('sassMixing',                 c.gui0E, c.none, s.none)
Group.new('sassMixinName',              c.gui0D, c.none, s.none)

-- Signify highlighting
Group.new('SignifySignAdd',             c.gui0B, c.gui01, s.none)
Group.new('SignifySignChange',          c.gui0D, c.gui01, s.none)
Group.new('SignifySignDelete',          c.gui08, c.gui01, s.none)

-- Spelling highlighting
Group.new('SpellBad',                   c.none, c.none, s.undercurl)
Group.new('SpellLocal',                 c.none, c.none, s.undercurl)
Group.new('SpellCap',                   c.none, c.none, s.undercurl)
Group.new('SpellRare',                  c.none, c.none, s.undercurl)

-- Startify highlighting
Group.new('StartifyBracket',            c.gui03, c.none, s.none)
Group.new('StartifyFile',               c.gui07, c.none, s.none)
Group.new('StartifyFooter',             c.gui03, c.none, s.none)
Group.new('StartifyHeader',             c.gui0B, c.none, s.none)
Group.new('StartifyNumber',             c.gui09, c.none, s.none)
Group.new('StartifyPath',               c.gui03, c.none, s.none)
Group.new('StartifySection',            c.gui0E, c.none, s.none)
Group.new('StartifySelect',             c.gui0C, c.none, s.none)
Group.new('StartifySlash',              c.gui03, c.none, s.none)
Group.new('StartifySpecial',            c.gui03, c.none, s.none)

-- Java highlighting
Group.new('javaOperator',               c.gui0D, c.none, s.none)

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
