local lush = require 'lush'
local hsl = lush.hsl

-- Colors {{{
local whitest  = hsl(0, 0, 100)
local white    = hsl(0, 0, 97)
local gray16   = hsl(0, 0, 93)
local gray15   = hsl(0, 0, 89)
local gray14   = hsl(0, 0, 74)
local gray13   = hsl(0, 0, 70)
local gray12   = hsl(0, 0, 66)
local gray11   = hsl(0, 0, 62)
local gray10   = hsl(0, 0, 58)
local gray09   = hsl(0, 0, 54)
local gray08   = hsl(0, 0, 50)
local gray07   = hsl(0, 0, 46)
local gray06   = hsl(0, 0, 42)
local gray05   = hsl(0, 0, 38)
local gray04   = hsl(0, 0, 34)
local gray03   = hsl(0, 0, 30)
local gray02   = hsl(0, 0, 26)
local gray01   = hsl(0, 0, 14)
local black    = hsl(0, 0, 6)
local blackest = hsl(0, 0, 0)

local red        = hsl(358, 100, 68)
local lightred   = hsl(4, 98, 77)
local blue       = hsl(195, 100, 49)
local lightblue  = hsl(197, 100, 72)
local green      = hsl(98, 32, 45)
local lightgreen = hsl(78, 51, 56)
local purple     = hsl(274, 100, 75)
local orange     = hsl(35, 100, 55)
local yellow     = hsl(42, 100, 70)
local magenta    = hsl(346, 84, 61)
local pink       = hsl(339, 77, 76)
local brown      = hsl(27, 31, 55)
-- }}}

local theme = lush(function() return {
-- Vim Editor {{{
    Normal { bg = white, fg = gray05 };
    Whitespace { fg = gray15 };
    EndOfBuffer { fg = gray15 };
    Conceal { Normal };
    Constant { fg = gray11, gui = 'bold' };
    Character { Constant };
    String { fg = gray08 };
    Number { fg = gray10 };
    Float { fg = gray10 };
    NormalFloat { fg = gray10 };
    Boolean { Number };
    Identifier { fg = gray06 };
    Function { fg = gray06 };
    Statement { fg = gray08, gui = 'bold' };
    Conditional { Statement };
    Repeat { Statement };
    Label { Statement };
    Exception { Statement };
    Operator { fg = gray03 };
    Keyword { fg = gray10 };
    PreProc { fg = gray10 };
    Include { PreProc };
    Define { PreProc };
    Macro { PreProc };
    PreCondit { PreProc };
    Type { fg = gray09, gui = 'bold' };
    StorageClass { Type };
    Structure { Type };
    Typedef { Type };
    Special { fg = gray10 };
    SpecialChar { Special };
    Tag { Special };
    Delimiter { Special };
    Debug { Special };
    Question { Special };
    SpecialComment { fg = gray12, gui = 'bold' };
    Title { fg = gray10, gui = 'bold' };
    Todo { fg = purple };
    Comment { fg = gray12, gui = 'italic' };
    LineNr { fg = gray13 };
    Folded { LineNr };
    FoldColumn { fg = gray08 };
    SignColumn { FoldColumn };
    ColorColumn { bg = whitest };
    CursorLine { bg = gray15 };
    CursorColumn { CursorLine };
    CursorLineNr { fg = gray11, gui = 'bold' };
    Visual { bg = gray06, fg = white };
    VisualNOS { Visual };
    Search { bg = gray03, fg = gray15 };
    IncSearch { bg = gray11, fg = white, gui = 'bold' };
    SpellBad { fg = red, gui = 'undercurl' };
    SpellCap { fg = red, gui = 'undercurl' };
    SpellLocal { fg = red, gui = 'undercurl' };
    SpellRare { fg = brown, gui = 'undercurl' };
    Error { fg = red, gui = 'bold' };
    ErrorMsg { Error };
    ErrorMsg { fg = red };
    WarningMsg { fg = brown };
    ModeMsg { fg = gray10 };
    MoreMsg { fg = gray10 };
    MatchParen { fg = magenta, gui = 'bold' };
    Cursor { bg = gray12 };
    Underlined { fg = gray08, gui = 'underline' };
    SpecialKey { fg = gray13 };
    NonText { fg = gray13 };
    Directory { fg = gray08 };
    Pmenu { bg = gray16, fg = gray05 };
    PmenuSbar { bg = gray15, fg = white };
    PmenuSel { bg = gray14 };
    PmenuThumb { bg = gray10, fg = gray14 };
    StatusLine { fg = gray03 };
    TabLineSel { StatusLine };
    StatusLineNC { fg = gray13 };
    TabLine { StatusLineNC };
    TabLineFill { StatusLineNC };
    WildMenu { fg = gray08 };
    VertSplit { fg = whitest };
    DiffAdd { bg = green, fg = white };
    DiffChange { bg = lightblue, fg = white };
    DiffDelete { bg = red, fg = white };
    DiffText { bg = blue, fg = white };
    DiffAdded { fg = green };
    DiffChanged { fg = blue };
    DiffRemoved { fg = red };
-- }}}

-- Status Line {{{
    SLModeText { bg = gray04, fg = white, gui = 'bold' };
    SLModeSep { fg = gray04 };
    SLNormalText { fg = gray09 };
    SLDimText { fg = gray15 };
    SLLightText { bg = gray15, fg = gray09 };
    SLLightSep { fg = gray15 };
    SLDarkText { fg = whitest };
    SLError { fg = red };
    SLWarning { fg = orange };
    SLInfo { fg = blue };
    SLHint { fg = gray01 };
-- }}}

-- Treesitter {{{
    TSPunctDelimiter { Delimiter };
    TSPunctBracket { Delimiter };
    TSPunctSpecial { Delimiter };
    TSConstant { Constant };
    TSConstBuiltin { Special };
    TSConstMacro { Define };
    TSString { String };
    TSStringRegex { String };
    TSStringEscape { SpecialChar };
    TSCharacter { Character };
    TSNumber { Number };
    TSBoolean { Boolean };
    TSFloat { Float };
    TSFunction { Function };
    TSFuncBuiltin { Special };
    TSFuncMacro { Macro };
    TSParameter { Identifier };
    TSParameterReference { TSParameter };
    TSMethod { Function };
    TSField { Identifier };
    TSProperty { Identifier };
    TSConstructor { Special };
    TSAnnotation { PreProc };
    TSAttribute { PreProc };
    TSNamespace { Include };
    TSConditional { Conditional };
    TSRepeat { Repeat };
    TSLabel { Label };
    TSOperator { Operator };
    TSKeyword { Keyword };
    TSKeywordFunction { Keyword };
    TSKeywordOperator { TSOperator };
    TSException { Exception };
    TSType { Type };
    TSTypeBuiltin { Type };
    TSInclude { Include };
    TSVariableBuiltin { Special };
    TSText { Normal };
    TSStrong { Normal };
    TSEmphasis { Normal };
    TSUnderline { Normal };
    TSTitle { Title };
    TSLiteral { String };
    TSURI { Underlined };
    TSTag { Label };
    TSTagDelimiter { Delimiter };
    TSPlaygroundFocus { Visual };

-- Refactor {{{
    TSDefinitionUsage { fg = black };
    TSDefinition { fg = magenta };
-- }}}

-- }}}

-- LSP {{{
    LspDiagnosticsDefaultHint { fg = gray01 };
    LspDiagnosticsVirtualTextHint { LspDiagnosticsDefaultHint };
    LspDiagnosticsFloatingHint { LspDiagnosticsDefaultHint, gui = 'italic' };
    LspDiagnosticsSignHint { LspDiagnosticsDefaultHint };
    LspDiagnosticsUnderlineHint { LspDiagnosticsDefaultHint, gui = 'undercurl'};

    LspDiagnosticsDefaultError { fg = red };
    LspDiagnosticsVirtualTextError { LspDiagnosticsDefaultError };
    LspDiagnosticsFloatingError { LspDiagnosticsDefaultError, gui = 'italic' };
    LspDiagnosticsSignError { LspDiagnosticsDefaultError };
    LspDiagnosticsUnderlineError { LspDiagnosticsDefaultError, gui = 'undercurl'};

    LspDiagnosticsDefaultWarning { fg = orange };
    LspDiagnosticsVirtualTextWarning { LspDiagnosticsDefaultWarning };
    LspDiagnosticsFloatingWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };
    LspDiagnosticsSignWarning { LspDiagnosticsDefaultWarning };
    LspDiagnosticsUnderlineWarning { LspDiagnosticsDefaultWarning, gui = 'undercurl'};

    LspDiagnosticsDefaultInformation { fg = blue };
    LspDiagnosticsVirtualTextInformation { LspDiagnosticsDefaultInformation };
    LspDiagnosticsFloatingInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
    LspDiagnosticsSignInformation { LspDiagnosticsDefaultInformation };
    LspDiagnosticsUnderlineInformation { LspDiagnosticsDefaultInformation, gui = 'undercurl'};

-- Group.new("LspReferenceText", c.nord_10, c.none)
-- Group.new("LspReferenceRead", c.nord_10, c.none)
-- Group.new("LspReferenceWrite", c.nord_10, c.none)
-- }}}

-- Diagnostics {{{
    DiagnosticError { LspDiagnosticsDefaultError };
    DiagnosticVirtualTextError { LspDiagnosticsVirtualTextError };
    DiagnosticUnderlineError { LspDiagnosticsUnderlineError };
    DiagnosticFloatingError { LspDiagnosticsFloatingError };
    DiagnosticSignError { LspDiagnosticsSignError };

    DiagnosticWarn { LspDiagnosticsDefaultWarning };
    DiagnosticVirtualTextWarn { LspDiagnosticsVirtualTextWarning };
    DiagnosticUnderlineWarn { LspDiagnosticsUnderlineWarning };
    DiagnosticFloatingWarn { LspDiagnosticsFloatingWarning };
    DiagnosticSignWarn { LspDiagnosticsSignWarning };

    DiagnosticInfo { LspDiagnosticsDefaultInformation };
    DiagnosticVirtualTextInfo { LspDiagnosticsVirtualTextInformation };
    DiagnosticUnderlineInfo { LspDiagnosticsUnderlineInformation };
    DiagnosticFloatingInfo { LspDiagnosticsFloatingInformation };
    DiagnosticSignInfo { LspDiagnosticsSignInformation };

    DiagnosticHint { LspDiagnosticsDefaultHint };
    DiagnosticVirtualTextHint { LspDiagnosticsVirtualTextHint };
    DiagnosticUnderlineHint { LspDiagnosticsUnderlineHint };
    DiagnosticFloatingHint { LspDiagnosticsFloatingHint };
    DiagnosticSignHint { LspDiagnosticsSignHint };
--}}}

-- Telescope {{{
    TelescopeSelection { fg = gray11 };
    TelescopeSelectionCaret { fg = black };
    TelescopeNormal { fg = gray11 };
    TelescopeBorder { fg = gray08 };
    TelescopeMatching { fg = gray02 };
    TelescopePromptPrefix { fg = gray04 };
-- }}}

-- Gitsigns {{{
    DiffAddSign { fg = lightgreen };
    DiffChangeSign { fg = blue };
    DiffDeleteSign { fg = red };
-- }}}

-- Startify {{{
    StartifyBracket { fg = gray02 };
    StartifyFile { fg = gray10, gui = 'italic' };
    StartifyFooter { fg = gray02 };
    StartifyHeader { fg = gray02 };
    StartifyNumber { fg = gray13 };
    StartifyPath { fg = gray02, gui = 'italic' };
    StartifySection { fg = gray13 };
    StartifySelect { fg = red };
    StartifySlash { fg = gray02, gui = 'italic' };
    StartifySpecial { fg = gray02 };
    StartifyVar { fg = gray13 };
-- }}}

-- Indent Blankline {{{
    IndentBlanklineChar { fg = gray15 };
--}}}

-- Cmp {{{
    -- The abbr field.
    CmpItemAbbr { Pmenu };

    -- The deprecated item's abbr field.
    CmpItemAbbrDeprecated { Error };

    -- The matched characters highlight.
    CmpItemAbbrMatch { Error };

    -- The fuzzy matched characters highlight.
    CmpItemAbbrMatchFuzzy { Error };

    -- The kind field.
    CmpItemKind { Pmenu };

    -- The menu field.
    CmpItemMenu { Pmenu };
--}}}
} end)

return theme

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
