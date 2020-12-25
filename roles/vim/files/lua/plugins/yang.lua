local Color, c, Group, g, s = require("colorbuddy").setup()

-- Reset {{{
local cmd = vim.api.nvim_command

cmd [[highlight clear]]

if vim.fn.exists('syntax_on') then
  cmd [[syntax reset]]
end
-- }}}

vim.api.nvim_set_option('background', 'light')
vim.g.colors_name = 'yang'

-- Colors {{{
Color.new('whitest', '#ffffff')
Color.new('white',   '#f7f7f7')
Color.new('gray15',  '#e4e4e4')
Color.new('gray14',  '#bcbcbc')
Color.new('gray13',  '#b2b2b2')
Color.new('gray12',  '#a8a8a8')
Color.new('gray11',  '#9e9e9e')
Color.new('gray10',  '#949494')
Color.new('gray09',  '#8a8a8a')
Color.new('gray08',  '#808080')
Color.new('gray07',  '#767676')
Color.new('gray06',  '#666666')
Color.new('gray05',  '#606060')
Color.new('gray04',  '#585858')
Color.new('gray03',  '#4e4e4e')
Color.new('gray02',  '#444444')
Color.new('gray01',  '#262626')
Color.new('black',   '#121212')

Color.new('red',        '#ff5a5f')
Color.new('lightred',   '#fe938c')
Color.new('blue',       '#00bbf9')
Color.new('lightblue',  '#70d6ff')
Color.new('green',      '#6a994e')
Color.new('lightgreen', '#a7c957')
Color.new('purple',     '#c77dff')
Color.new('orange',     '#ff9f1c')
Color.new('yellow',     '#ffd166')
Color.new('magenta',    '#ef476f')
Color.new('pink',       '#f194b4')
Color.new('brown',      '#b08968')
-- }}}

-- NeoVim Terminal {{{
vim.g.terminal_color_0 = '#262626'
vim.g.terminal_color_1 = '#666666'
vim.g.terminal_color_2 = '#4e4e4e'
vim.g.terminal_color_3 = '#9e9e9e'
vim.g.terminal_color_4 = '#444444'
vim.g.terminal_color_5 = '#808080'
vim.g.terminal_color_6 = '#8a8a8a'
vim.g.terminal_color_7 = '#b2b2b2'
vim.g.terminal_color_8 = '#4e4e4e'
vim.g.terminal_color_9 = '#949494'
vim.g.terminal_color_10 = '#767676'
vim.g.terminal_color_11 = '#b2b2b2'
vim.g.terminal_color_12 = '#606060'
vim.g.terminal_color_13 = '#a8a8a8'
vim.g.terminal_color_14 = '#bcbcbc'
vim.g.terminal_color_15 = '#f7f7f7'
-- }}}

-- Vim Editor {{{
Group.new('Normal', c.gray05, c.white, s.none)
Group.new('Whitespace', c.gray15, c.none, s.none)
Group.new('EndOfBuffer', c.gray15, c.none, s.none)
Group.new('Conceal', g.Normal, g.Normal, g.Normal)
Group.new('Constant', c.gray11, c.none, s.bold)
Group.new('Character', g.Constant, g.Constant, g.Constant)
Group.new('String', c.gray08, c.none, s.none)
Group.new('Number', c.gray10, c.none, s.none)
Group.new('Float', c.gray10, c.gray15, s.none)
Group.new('NormalFloat', c.gray10, c.gray15, s.none)
Group.new('Boolean', g.Number, g.Number, g.Number)
Group.new('Identifier', c.gray06, c.none, s.none)
Group.new('Function', c.gray06, c.none, s.none)
Group.new('Statement', c.gray08, c.none, s.bold)
Group.new('Conditional', g.Statement, g.Statement, g.Statement)
Group.new('Repeat', g.Statement, g.Statement, g.Statement)
Group.new('Label', g.Statement, g.Statement, g.Statement)
Group.new('Exception', g.Statement, g.Statement, g.Statement)
Group.new('Operator', c.gray03, c.none, s.none)
Group.new('Keyword', c.gray10, c.none, s.none)
Group.new('PreProc', c.gray10, c.none, s.none)
Group.new('Include', g.PreProc, g.PreProc, g.PreProc)
Group.new('Define', g.PreProc, g.PreProc, g.PreProc)
Group.new('Macro', g.PreProc, g.PreProc, g.PreProc)
Group.new('PreCondit', g.PreProc, g.PreProc, g.PreProc)
Group.new('Type', c.gray09, c.none, s.bold)
Group.new('StorageClass', g.Type, g.Type, g.Type)
Group.new('Structure', g.Type, g.Type, g.Type)
Group.new('Typedef', g.Type, g.Type, g.Type)
Group.new('Special', c.gray10, c.none, s.none)
Group.new('SpecialChar', g.Special, g.Special, g.Special)
Group.new('Tag', g.Special, g.Special, g.Special)
Group.new('Delimiter', g.Special, g.Special, g.Special)
Group.new('Debug', g.Special, g.Special, g.Special)
Group.new('Question', g.Special, g.Special, g.Special)
Group.new('SpecialComment', c.gray12, c.none, s.bold)
Group.new('Title', c.gray10, c.none, s.bold)
Group.new('Todo', c.purple, c.white, s.none)
Group.new('Comment', c.gray12, c.none, s.italic)
Group.new('LineNr', c.gray13, c.none, s.none)
Group.new('Folded', g.LineNr, g.LineNr, s.italic)
Group.new('FoldColumn', c.gray08, c.gray15, s.none)
Group.new('SignColumn', g.FoldColumn, c.none, g.FoldColumn)
Group.new('ColorColumn', g.FoldColumn, g.FoldColumn, g.FoldColumn)
Group.new('CursorLine', c.none, c.gray15, s.none)
Group.new('CursorColumn', g.CursorLine, g.CursorLine, g.CursorLine)
Group.new('CursorLineNr', c.gray11, c.none, s.bold)
Group.new('Visual', c.white, c.gray06, s.none)
Group.new('VisualNOS', g.Visual, g.Visual, g.Visual)
Group.new('Search', c.gray15, c.gray03, s.none)
Group.new('IncSearch', c.white, c.gray11, s.bold)
Group.new('SpellBad', c.red, c.white, s.undercurl)
Group.new('SpellCap', c.red, c.white, s.undercurl)
Group.new('SpellLocal', c.red, c.white, s.undercurl)
Group.new('SpellRare', c.brown, c.white, s.undercurl)
Group.new('Error', c.red, c.white, s.bold)
Group.new('ErrorMsg', g.Error, g.Error, g.Error)
Group.new('ErrorMsg', c.red, c.white, s.none)
Group.new('WarningMsg', c.brown, c.white, s.none)
Group.new('ModeMsg', c.gray10, c.none, s.none)
Group.new('MoreMsg', c.gray10, c.none, s.none)
Group.new('MatchParen', c.magenta, c.white, s.bold)
Group.new('Cursor', c.none, c.gray12, s.none)
Group.new('Underlined', c.gray08, c.none, s.underline)
Group.new('SpecialKey', c.gray13, c.none, s.none)
Group.new('NonText', c.gray13, c.none, s.none)
Group.new('Directory', c.gray08, c.none, s.none)
Group.new('Pmenu', c.gray05, c.gray14, s.none)
Group.new('PmenuSbar', c.white, c.gray01, s.none)
Group.new('PmenuSel', c.gray14, c.gray05, s.none)
Group.new('PmenuThumb', c.gray14, c.gray03, s.none)
Group.new('StatusLine', c.gray03, c.white, s.none)
Group.new('TabLineSel', g.StatusLine, g.StatusLine, g.StatusLine)
Group.new('StatusLineNC', c.gray13, c.white, s.none)
Group.new('TabLine', g.StatusLineNC, g.StatusLineNC, g.StatusLineNC)
Group.new('TabLineFill', g.StatusLineNC, g.StatusLineNC, g.StatusLineNC)
Group.new('WildMenu', c.gray08, c.none, s.none)
Group.new('VertSplit', c.whitest, c.none, s.none)
Group.new('DiffAdd', c.white, c.green, s.none)
Group.new('DiffChange', c.white, c.blue, s.none)
Group.new('DiffDelete', c.white, c.red, s.none)
Group.new('DiffText', c.white, c.darkblue, s.none)
Group.new('DiffAdded', c.green, c.white, s.none)
Group.new('DiffChanged', c.blue, c.white, s.none)
Group.new('DiffRemoved', c.red, c.white, s.none)
-- }}}

-- Status Line {{{
Group.new('SLModeText', c.white, c.gray04, s.bold)
Group.new('SLModeSep', c.gray04, c.white, s.none)
Group.new('SLNormalText', c.gray09, c.white, s.none)
Group.new('SLDimText', c.gray15, c.white, s.none)
Group.new('SLLightText', c.gray09, c.gray15, s.none)
Group.new('SLLightSep', c.gray15, c.white, s.none)
Group.new('SLError', c.red, c.none, s.none)
Group.new('SLWarning', c.orange, c.none, s.none)
Group.new('SLInfo', c.blue, c.none, s.none)
Group.new('SLHint', c.gray01, c.none, s.none)
-- }}}

-- Treesitter {{{
Group.new('TSPunctDelimiter', g.Delimiter, g.Delimiter, g.Delimiter)
Group.new('TSPunctBracket', g.Delimiter, g.Delimiter, g.Delimiter)
Group.new('TSPunctSpecial', g.Delimiter, g.Delimiter, g.Delimiter)
Group.new('TSConstant', g.Constant, g.Constant, g.Constant)
Group.new('TSConstBuiltin', g.Special, g.Special, g.Special)
Group.new('TSConstMacro', g.Define, g.Define, g.Define)
Group.new('TSString', g.String, g.String, g.String)
Group.new('TSStringRegex', g.String, g.String, g.String)
Group.new('TSStringEscape', g.SpecialChar, g.SpecialChar, g.SpecialChar)
Group.new('TSCharacter', g.Character, g.Character, g.Character)
Group.new('TSNumber', g.Number, g.Number, g.Number)
Group.new('TSBoolean', g.Boolean, g.Boolean, g.Boolean)
Group.new('TSFloat', g.Float, g.Float, g.Float)
Group.new('TSFunction', g.Function, g.Function, g.Function)
Group.new('TSFuncBuiltin', g.Special, g.Special, g.Special)
Group.new('TSFuncMacro', g.Macro, g.Macro, g.Macro)
Group.new('TSParameter', g.Identifier, g.Identifier, g.Identifier)
Group.new('TSParameterReference', g.TSParameter, g.TSParameter, g.TSParameter)
Group.new('TSMethod', g.Function, g.Function, g.Function)
Group.new('TSField', g.Identifier, g.Identifier, g.Identifier)
Group.new('TSProperty', g.Identifier, g.Identifier, g.Identifier)
Group.new('TSConstructor', g.Special, g.Special, g.Special)
Group.new('TSAnnotation', g.PreProc, g.PreProc, g.PreProc)
Group.new('TSAttribute', g.PreProc, g.PreProc, g.PreProc)
Group.new('TSNamespace', g.Include, g.Include, g.Include)
Group.new('TSConditional', g.Conditional, g.Conditional, g.Conditional)
Group.new('TSRepeat', g.Repeat, g.Repeat, g.Repeat)
Group.new('TSLabel', g.Label, g.Label, g.Label)
Group.new('TSOperator', g.Operator, g.Operator, g.Operator)
Group.new('TSKeyword', g.Keyword, g.Keyword, g.Keyword)
Group.new('TSKeywordFunction', g.Keyword, g.Keyword, g.Keyword)
Group.new('TSKeywordOperator', g.TSOperator, g.TSOperator, g.TSOperator)
Group.new('TSException', g.Exception, g.Exception, g.Exception)
Group.new('TSType', g.Type, g.Type, g.Type)
Group.new('TSTypeBuiltin', g.Type, g.Type, g.Type)
Group.new('TSInclude', g.Include, g.Include, g.Include)
Group.new('TSVariableBuiltin', g.Special, g.Special, g.Special)
Group.new('TSText', g.Normal, g.Normal, g.Normal)
Group.new('TSStrong', g.Normal, g.Normal, s.bold)
Group.new('TSEmphasis', g.Normal, g.Normal, s.italic)
Group.new('TSUnderline', g.Normal, g.Normal, s.underline)
Group.new('TSTitle', g.Title, g.Title, g.Title)
Group.new('TSLiteral', g.String, g.String, g.String)
Group.new('TSURI', g.Underlined, g.Underlined, g.Underlined)
Group.new('TSTag', g.Label, g.Label, g.Label)
Group.new('TSTagDelimiter', g.Delimiter, g.Delimiter, g.Delimiter)
Group.new('TSPlaygroundFocus', g.Visual, g.Visual, g.Visual)
-- }}}

-- LSP {{{
Group.new('LspDiagnosticsDefaultHint', c.gray01, c.none, s.none)
Group.new('LspDiagnosticsVirtualTextHint', g.LspDiagnosticsDefaultHint, g.LspDiagnosticsDefaultHint, s.italic)
Group.new('LspDiagnosticsFloatingHint', g.LspDiagnosticsDefaultHint, g.LspDiagnosticsDefaultHint, g.LspDiagnosticsDefaultHint)
Group.new('LspDiagnosticsSignHint', g.LspDiagnosticsDefaultHint, g.LspDiagnosticsDefaultHint, g.LspDiagnosticsDefaultHint)
Group.new('LspDiagnosticsUnderlineHint', g.LspDiagnosticsDefaultHint, g.LspDiagnosticsDefaultHint, s.italic)

Group.new('LspDiagnosticsDefaultError', c.red, c.none, s.none)
Group.new('LspDiagnosticsVirtualTextError', g.LspDiagnosticsDefaultError, g.LspDiagnosticsDefaultError, g.LspDiagnosticsDefaultError)
Group.new('LspDiagnosticsFloatingError', g.LspDiagnosticsDefaultError, g.LspDiagnosticsDefaultError, s.italic)
Group.new('LspDiagnosticsSignError', g.LspDiagnosticsDefaultError, g.LspDiagnosticsDefaultError, g.LspDiagnosticsDefaultError)
Group.new('LspDiagnosticsUnderlineError', g.LspDiagnosticsDefaultError, g.LspDiagnosticsDefaultError, s.italic)

Group.new('LspDiagnosticsDefaultWarning', c.orange, c.none, s.none)
Group.new('LspDiagnosticsVirtualTextWarning', g.LspDiagnosticsDefaultWarning, g.LspDiagnosticsDefaultWarning, g.LspDiagnosticsDefaultWarning)
Group.new('LspDiagnosticsFloatingWarning', g.LspDiagnosticsDefaultWarning, g.LspDiagnosticsDefaultWarning, s.italic)
Group.new('LspDiagnosticsSignWarning', g.LspDiagnosticsDefaultWarning, g.LspDiagnosticsDefaultWarning, g.LspDiagnosticsDefaultWarning)
Group.new('LspDiagnosticsUnderlineWarning', g.LspDiagnosticsDefaultWarning, g.LspDiagnosticsDefaultWarning, s.italic)

Group.new('LspDiagnosticsDefaultInformation', c.blue, c.none, s.none)
Group.new('LspDiagnosticsVirtualTextInformation', g.LspDiagnosticsDefaultInformation, g.LspDiagnosticsDefaultInformation, g.LspDiagnosticsDefaultInformation)
Group.new('LspDiagnosticsFloatingInformation', g.LspDiagnosticsDefaultInformation, g.LspDiagnosticsDefaultInformation, s.italic)
Group.new('LspDiagnosticsSignInformation', g.LspDiagnosticsDefaultInformation, g.LspDiagnosticsDefaultInformation, g.LspDiagnosticsDefaultInformation)
Group.new('LspDiagnosticsUnderlineInformation', g.LspDiagnosticsDefaultInformation, g.LspDiagnosticsDefaultInformation, s.italic)

-- Group.new("LspReferenceText", c.nord_10, c.none)
-- Group.new("LspReferenceRead", c.nord_10, c.none)
-- Group.new("LspReferenceWrite", c.nord_10, c.none)
-- }}}

-- Telescope {{{
Group.new('TelescopeSelection', c.gray11, c.white, s.none)
Group.new('TelescopeSelectionCaret', c.black, c.none, s.none)
-- Group.new('TelescopeMultiSelection',
Group.new('TelescopeNormal', c.gray11, c.white, s.none)

-- Border highlight groups.
Group.new('TelescopeBorder', c.gray08, c.white, s.none)
-- Group.new('TelescopePromptBorder',
-- Group.new('TelescopeResultsBorder',
-- Group.new('TelescopePreviewBorder',

-- Used for highlighting characters that you match.
Group.new('TelescopeMatching', c.gray02, c.none, s.none)

-- Used for the prompt prefix
Group.new('TelescopePromptPrefix', c.gray04, c.none, s.none)
-- }}}

-- Gitsigns {{{
Group.new('DiffAddSign', c.lightgreen, c.none, s.none)
Group.new('DiffChangeSign', c.blue, c.none, s.none)
Group.new('DiffDeleteSign', c.red, c.none, s.none)
-- }}}

-- vim: foldmethod=marker foldlevel=0 foldenable formatoptions-=cro foldlevelstart=0
