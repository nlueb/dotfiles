local lush = require 'lush'
local hsl = lush.hsl

-- Colors {{{
local blackest = hsl(0, 0, 0)
local blacker = hsl(0, 0, 6)
local black = hsl(0, 0, 11)
local gray01 = hsl(0, 0, 15)
local gray02 = hsl(0, 0, 27)
local gray03 = hsl(0, 0, 31)
local gray04 = hsl(0, 0, 35)
local gray05 = hsl(0, 0, 40)
local gray06 = hsl(0, 0, 46)
local gray07 = hsl(0, 0, 50)
local gray08 = hsl(0, 0, 54)
local gray09 = hsl(0, 0, 58)
local gray10 = hsl(0, 0, 62)
local gray11 = hsl(0, 0, 68)
local gray12 = hsl(0, 0, 70)
local gray13 = hsl(0, 0, 74)
local gray14 = hsl(0, 0, 78)
local gray15 = hsl(0, 0, 89)
local white = hsl(0, 0, 93)

local red = hsl(351, 59, 53)
local lightred = hsl(4, 98, 77)
local blue = hsl(203, 39, 44)
local lightblue = hsl(224, 28, 67)
local green = hsl(165, 19, 40)
local lightgreen = hsl(133, 18, 59)
local purple = hsl(274, 100, 75)
local orange = hsl(27, 87, 67)
local bright_orange = hsl(17, 83, 54)
local yellow = hsl(40, 100, 67)
local magenta = hsl(342, 100, 52)
local pink = hsl(339, 77, 76)
local brown = hsl(27, 31, 55)
-- }}}

local theme = lush(function() return {
-- Vim Editor {{{
    Normal { bg = blacker, fg = gray13 };
    Whitespace { fg = gray01 };
    EndOfBuffer { fg = gray01 };
    Conceal { Normal };
    Constant { fg = gray05, gui = 'bold' };
    Character { Constant };
    String { fg = gray10 };
    Number { fg = gray06 };
    Float { fg = gray06 };
    NormalFloat { bg = gray01, fg = gray12 };
    Boolean { Number };
    Identifier { fg = gray08 };
    Function { fg = gray08 };
    Statement { fg = gray05, gui = 'bold' };
    Conditional { Statement };
    Repeat { Statement };
    Label { Statement };
    Exception { Statement };
    Operator { fg = gray05 };
    Keyword { fg = gray05 };
    PreProc { fg = gray07 };
    Include { PreProc };
    Define { PreProc };
    Macro { PreProc };
    PreCondit { PreProc };
    Type { fg = gray05, gui = 'bold' };
    StorageClass { Type };
    Structure { Type };
    Typedef { Type };
    Special { fg = gray05 };
    SpecialChar { Special };
    Tag { Special };
    Delimiter { Special };
    Debug { Special };
    Question { Special };
    SpecialComment { fg = gray03, gui = 'bold' };
    Title { fg = gray07, gui = 'bold' };
    Todo { fg = purple };
    Comment { fg = gray03, gui = 'italic' };
    LineNr { fg = gray04 };
    Folded { LineNr, gui = 'italic' };
    SignColumn { fg = gray07 };
    FoldColumn { SignColumn };
    ColorColumn { bg = blacker };
    CursorLine { bg = black };
    CursorColumn { CursorLine };
    CursorLineNr { LineNr, fg = gray10, gui = 'bold' };
    Visual { bg = gray06, fg = black };
    VisualNOS { Visual };
    Search { bg = gray11, fg = gray01 };
    IncSearch { bg = gray07, fg = black, gui = 'bold' };
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
    SpecialKey { fg = gray04 };
    NonText { fg = gray04 };
    Directory { fg = gray08 };
    Pmenu { fg = gray06 };
    PmenuSbar { fg = black };
-- PmenuSbar { bg = Error.fg };
-- PmenuThumb { bg = gray09, fg = gray03 };
    PmenuThumb { bg = gray01};
    PmenuSel { bg = gray06, fg = blacker };
    StatusLine { Normal , fg = gray11 };
    TabLineSel { StatusLine };
    StatusLineNC { StatusLine, fg = gray04 };
    TabLine { StatusLineNC };
    TabLineFill { StatusLineNC };
    WildMenu { fg = gray08 };
    VertSplit { fg = blackest };
    DiffAdd { bg = green, fg = blackest };
    DiffChange { bg = blue, fg = blackest };
    DiffDelete { bg = red, fg = blackest };
    DiffText { bg = lightblue, fg = black };
    DiffAdded { fg = green };
    DiffChanged { fg = blue };
    DiffRemoved { fg = red };
-- }}}

-- Status Line {{{
    SLModeText { bg = gray09, fg = black, gui = 'bold' };
    SLModeSep { bg = blacker, fg = gray09 };
    SLNormalText { bg = blacker, fg = gray09 };
    SLDimText { bg = blacker, fg = gray01 };
    SLLightText { bg = gray01, fg = gray09, gui = 'italic' };
    SLLightSep { bg = blacker, fg = gray01 };
    SLDarkText { bg = blacker, fg = blackest };
    SLError { fg = red };
    SLWarning { fg = orange };
    SLInfo { fg = blue };
    SLHint { fg = gray15 };
-- }}}

-- Treesitter {{{
    TSComment { Comment, gui = 'italic' };
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
    TSParameter { Identifier, gui = 'italic' };
    TSParameterReference { TSParameter };
    TSMethod { Function };
    TSField { Identifier };
    TSProperty { Identifier, gui = 'italic' };
    TSConstructor { Special };
    TSAnnotation { PreProc };
    TSAttribute { PreProc };
    TSNamespace { Include };
    TSConditional { Conditional };
    TSRepeat { Repeat };
    TSLabel { Label };
    TSOperator { Operator };
    TSKeyword { Keyword, gui = 'italic' };
    TSKeywordFunction { Keyword };
    TSKeywordOperator { TSOperator };
    TSException { Exception };
    TSType { Type };
    TSTypeBuiltin { Type };
    TSInclude { Include };
    TSVariable { fg = Normal.fg, gui = 'italic'};
    TSVariableBuiltin { Special };
    TSText { fg = Normal.fg };
    TSStrong { TSText, gui = 'bold' };
    TSEmphasis { TSText, gui = 'italic' };
    TSUnderline { TSText, gui = 'underline' };
    TSTitle { Title };
    TSLiteral { String };
    TSURI { Underlined };
    TSTag { Label };
    TSTagDelimiter { Delimiter };
    TSPlaygroundFocus { Visual };

-- Refactor {{{
    TSDefinitionUsage { fg = white };
    TSDefinition { fg = pink };
-- }}}

-- }}}

-- Lsp {{{
    LspDiagnosticsDefaultError { fg = red };
    LspDiagnosticsVirtualTextError { LspDiagnosticsDefaultError, gui = 'italic' };
    LspDiagnosticsFloatingError { LspDiagnosticsDefaultError };
    LspDiagnosticsSignError { LspDiagnosticsDefaultError };
    LspDiagnosticsUnderlineError { LspDiagnosticsDefaultError, gui = 'italic' };

    LspDiagnosticsDefaultWarning { fg = orange };
    LspDiagnosticsVirtualTextWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };
    LspDiagnosticsFloatingWarning { LspDiagnosticsDefaultWarning };
    LspDiagnosticsSignWarning { LspDiagnosticsDefaultWarning };
    LspDiagnosticsUnderlineWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };

    LspDiagnosticsDefaultInformation { fg = blue };
    LspDiagnosticsVirtualTextInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
    LspDiagnosticsFloatingInformation { LspDiagnosticsDefaultInformation };
    LspDiagnosticsSignInformation { LspDiagnosticsDefaultInformation };
    LspDiagnosticsUnderlineInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };

    LspDiagnosticsDefaultHint { fg = gray15 };
    LspDiagnosticsVirtualTextHint { LspDiagnosticsDefaultHint, gui = 'italic' };
    LspDiagnosticsFloatingHint { LspDiagnosticsDefaultHint };
    LspDiagnosticsSignHint { LspDiagnosticsDefaultHint };
    LspDiagnosticsUnderlineHint { LspDiagnosticsDefaultHint, gui = 'italic' };
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

-- Lsp Saga {{{
-- Misc
    LspFloatWinBorder { fg = gray12 };
    LspSagaBorderTitle { fg = gray10, gui = 'bold' };
    TargetWord { fg = gray04 };
    TargetFileName { fg = gray04 };
    ProviderTruncateLine { fg = gray01 };
    SagaShadow { fg = red };
    LspSagaFinderSelection { fg = gray15 };
-- Diagnostic
    LspLinesDiagBorder { fg = gray12 };
    DiagnosticTruncateLine { fg = gray01 };
    DiagnosticError { Normal };
    DiagnosticWarning { Normal };
    DiagnosticInformation { Normal };
    DiagnosticHint { Normal };
    LspSagaShTruncateLine { fg = gray01 };
    LspSagaDocTruncateLine { fg = gray01 };
    LineDiagTuncateLine { fg = gray01 };
-- Code Action
    LspSagaCodeActionTitle { fg = gray10 };
    LspSagaCodeActionTruncateLine { fg = gray01 };
    LspSagaCodeActionContent { fg = gray07 };
    LspSagaCodeActionBorder { fg = gray12 };
-- Rename
    LspSagaRenamePromptPrefix { fg = gray08 };
    LspSagaRenameBorder { fg = gray12 };
-- Hover
    LspSagaHoverBorder { fg = gray12 };
    LspSagaSignatureHelpBorder { fg = gray12 };
    LspSagaAutoPreview { fg = gray12 };
-- Definition
    LspSagaDefPreviewBorder { fg = gray12 };
    DefinitionPreviewTitle { fg = gray10 };
    ReferencesCount { fg = gray08 };
    DefinitionCount { fg = gray08 };
    DefinitionIcon { fg = gray08 };
    ReferencesIcon { fg = gray08 };
-- }}}

-- Lsp Lightbulb {{{
    LightBulbFloatWin { bg = blue, fg = blacker };
    LightBulbVirtualText { fg = blue };
-- }}}

-- Telescope {{{
    TelescopeSelection { Normal, fg = gray05 };
    TelescopeSelectionCaret { fg = white };
-- Group.new('TelescopeMultiSelection',
    TelescopeNormal { Normal, fg = gray05 };

-- Border highlight groups.
    TelescopeBorder { Normal, fg = gray12 };
-- Group.new('TelescopePromptBorder',
-- Group.new('TelescopeResultsBorder',
-- Group.new('TelescopePreviewBorder',

-- Used for highlighting characters that you match.
    TelescopeMatching { fg = gray14 };

-- Used for the prompt prefix
    TelescopePromptPrefix { fg = gray12 };
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

-- Gitsigns {{{
    DiffAddSign { fg = green };
    DiffChangeSign { fg = blue };
    DiffDeleteSign { fg = red };
-- }}}

-- Nvim Tree {{{
    NvimTreeNormal { fg = gray02 };

    NvimTreeSymlink { fg = gray02 };
    NvimTreeFolderName { fg = gray12 };
    NvimTreeRootFolder { fg = gray02, gui = 'italic' };
    NvimTreeFolderIcon { fg = gray02 };
    NvimTreeExecFile { fg = gray02 };
    NvimTreeSpecialFile { fg = gray02 };
    NvimTreeImageFile { fg = gray02 };
    NvimTreeMarkdownFile { fg = gray02 };
    NvimTreeIndentMarker { fg = gray02 };

    NvimTreeLicenseIcon { fg = gray02 };
    NvimTreeYamlIcon { fg = gray02 };
    NvimTreeTomlIcon { fg = gray02 };
    NvimTreeGitignoreIcon { fg = gray02 };
    NvimTreeJsonIcon { fg = gray02 };

    NvimTreeLuaIcon { fg = gray02 };
    NvimTreePythonIcon { fg = gray02 };
    NvimTreeShellIcon { fg = gray02 };
    NvimTreeJavascriptIcon { fg = gray02 };
    NvimTreeCIcon { fg = gray02 };
    NvimTreeReactIcon { fg = gray02 };
    NvimTreeHtmlIcon { fg = gray02 };
    NvimTreeRustIcon { fg = gray02 };
    NvimTreeVimIcon { fg = gray02 };
    NvimTreeTypescriptIcon { fg = gray02 };

    NvimTreeGitDirty { fg = gray10, gui = 'italic' };
    NvimTreeGitStaged { fg = lightgreen, gui = 'italic' };
    NvimTreeGitMerge { fg = magenta, gui = 'italic' };
    NvimTreeGitRenamed { fg = gray10, gui = 'italic' };
    NvimTreeGitNew { fg = gray10, gui = 'italic' };
-- }}}

-- Fern {{{
    FernSpinner { fg = blue };
    FernMarkedLine { fg = white };
    FernMarkedText { fg = white };
    FernRootSymbol { fg = gray02 };
    FernRootText { fg = gray10 };
    FernLeafSymbol { fg = gray02 };
    FernLeafText { fg = gray08 };
    FernBranchSymbol { fg = gray02 };
    FernBranchText { fg = gray10 };
    FernWindowSelectIndicator { Normal };
    FernWindowSelectStatusLine { Normal };
-- }}}

-- Indent Blankline {{{
    IndentBlanklineChar { fg = gray01 };
--}}}

-- Cmp {{{
-- The abbr field.
    CmpItemAbbr { Normal };

-- The deprecated item's abbr field.
    CmpItemAbbrDeprecated { Error };

-- The matched characters highlight.
    CmpItemAbbrMatch { Error };

-- The fuzzy matched characters highlight.
    CmpItemAbbrMatchFuzzy { Error };

-- The kind field.
    CmpItemKind { fg = gray03 };

-- The menu field.
    CmpItemMenu { Normal };
--}}}
} end)

return theme

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
