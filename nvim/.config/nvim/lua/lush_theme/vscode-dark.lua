local lush = require 'lush'
local hsl = lush.hsl

-- TODO: Switch colors to hsl

-- Colors {{{
local vscNone = 'NONE'
local vscFront = '#D4D4D4'
local vscBack = '#1E1E1E'

local vscTabCurrent = '#1E1E1E'
local vscTabOther = '#2D2D2D'
local vscTabOutside = '#252526'

local vscLeftDark = '#252526'
local vscLeftMid = '#373737'
local vscLeftLight = '#636369'

local vscPopupFront = '#BBBBBB'
local vscPopupBack = '#272727'
local vscPopupHighlightBlue = '#004b72'
local vscPopupHighlightGray = '#343B41'

local vscSplitLight = '#898989'
local vscSplitDark = '#444444'
local vscSplitThumb = '#424242'

local vscCursorDarkDark = '#222222'
local vscCursorDark = '#51504F'
local vscCursorLight = '#AEAFAD'
local vscSelection = '#264F78'
local vscLineNumber = '#5A5A5A'

local vscDiffRedDark = '#4B1818'
local vscDiffRedLight = '#6F1313'
local vscDiffRedLightLight = '#FB0101'
local vscDiffGreenDark = '#373D29'
local vscDiffGreenLight = '#4B5632'
local vscSearchCurrent = '#4B5632'
local vscSearch = '#264F78'

-- Syntax colors
local vscGray = '#808080'
local vscViolet = '#646695'
local vscBlue = '#569CD6'
local vscDarkBlue = '#223E55'
local vscMediumBlue = '#18a2fe'
local vscLightBlue = '#9CDCFE'
local vscGreen = '#6A9955'
local vscBlueGreen = '#4EC9B0'
local vscLightGreen = '#B5CEA8'
local vscRed = '#F44747'
local vscOrange = '#CE9178'
local vscLightRed = '#D16969'
local vscYellowOrange = '#D7BA7D'
local vscYellow = '#DCDCAA'
local vscPink = '#C586C0'

-- Other ui specific colors
local vscUiBlue = '#084671'
local vscUiOrange = '#f28b25'
-- }}}

local theme = lush(function() return {
-- Based on https://github.com/Mofiqul/vscode.nvim

-- Vim Editor {{{
    Normal { fg = vscFront, bg = vscBack };
    ColorColumn { bg = vscCursorDarkDark };
    Cursor { fg = vscCursorDark, bg = vscCursorLight };
    CursorLine { bg = vscCursorDarkDark };
    CursorColumn { bg = vscCursorDarkDark };
    Directory { fg = vscBlue, bg = vscBack };
    DiffAdd { bg = vscDiffGreenLight };
    DiffChange { bg = vscDiffRedDark };
    DiffDelete { bg = vscDiffRedLight };
    DiffText { bg = vscDiffRedLight };
    EndOfBuffer { fg = vscBack };
    ErrorMsg { fg = vscRed, bg = vscBack };
    VertSplit { fg = vscSplitDark, bg = vscBack };
    Folded { fg = vscLeftLight, bg = vscLeftDark };
    FoldColumn { fg = vscLineNumber, bg = vscBack };
    SignColumn { bg = vscBack };
    IncSearch { fg = vscNone, bg = vscSearchCurrent };
    LineNr { fg = vscLineNumber, bg = vscBack };
    CursorLineNr { fg = vscPopupFront, bg = vscBack };
    MatchParen { fg = vscNone, bg = vscCursorDark };
    ModeMsg { fg = vscFront, bg = vscLeftDark };
    MoreMsg { fg = vscFront, bg = vscLeftDark };
    NonText { fg = vscLineNumber, bg = vscBack };
    Pmenu { fg = vscPopupFront, bg = vscPopupBack };
    PmenuSel { fg = vscPopupFront, bg = vscPopupHighlightBlue };
    PmenuSbar { bg = vscPopupHighlightGray };
    PmenuThumb { bg = vscPopupFront };
    Question { fg = vscBlue, bg = vscBack };
    Search { fg = vscNone, bg = vscSearch };
    SpecialKey { fg = vscBlue, bg = vscNone };
    StatusLine { fg = vscFront, bg = vscLeftMid };
    StatusLineNC { fg = vscFront, bg = vscLeftDark };
    TabLine { fg = vscFront, bg = vscTabOther };
    TabLineFill { fg = vscFront, bg = vscTabOutside };
    TabLineSel { fg = vscFront, bg = vscTabCurrent };
    Title { fg = vscNone, bg = vscNone, gui='bold' };
    Visual { fg = vscNone, bg = vscSelection };
    VisualNOS { fg = vscNone, bg = vscSelection };
    WarningMsg { fg = vscRed, bg = vscBack, gui='bold' };
    WildMenu { fg = vscNone, bg = vscSelection };
    Comment { fg = vscGreen, gui = 'italic' };
    Constant { fg = vscBlue };
    String { fg = vscOrange };
    Character { fg = vscOrange };
    Number { fg = vscLightGreen };
    Boolean { fg = vscBlue };
    Float { fg = vscLightGreen };
    Identifier { fg = vscLightBlue };
    Function { fg = vscYellow };
    Statement { fg = vscPink };
    Conditional { fg = vscPink };
    Repeat { fg = vscPink };
    Label { fg = vscPink };
    Operator { fg = vscFront };
    Keyword { fg = vscPink };
    Exception { fg = vscPink };
    PreProc { fg = vscPink };
    Include { fg = vscPink };
    Define { fg = vscPink };
    Macro { fg = vscPink };
    Type { fg = vscBlue };
    StorageClass { fg = vscBlue };
    Structure { fg = vscBlue };
    Typedef { fg = vscBlue };
    Special { fg = vscYellowOrange };
    SpecialChar { fg = vscFront };
    Tag { fg = vscFront };
    Delimiter { fg = vscFront };
    SpecialComment { fg = vscGreen };
    Debug { fg = vscFront };
    Underlined { fg = vscNone, gui='underline' };
    Conceal { fg = vscFront, bg = vscBack };
    Ignore { fg = vscFront };
    Error { fg = vscRed, bg = vscBack, gui = 'undercurl' };
    Todo { fg = vscYellowOrange, bg = vscBack, gui='bold' };
    SpellBad { fg = vscRed, bg = vscBack, gui = 'undercurl' };
    SpellCap { fg = vscRed, bg = vscBack, gui = 'undercurl' };
    SpellRare { fg = vscRed, bg = vscBack, gui = 'undercurl' };
    SpellLocal { fg = vscRed, bg = vscBack, gui = 'undercurl' };
    Whitespace { fg = vscLineNumber };
-- }}}

-- Treesitter {{{
    TSError { fg = vscRed };
    TSPunctBracket { fg = vscFront };
    TSPunctSpecial { fg = vscFront };
    markdownTSPunctSpecial { fg = vscBlue, gui='bold' };
    TSConstant { fg = vscYellow };
    TSConstBuiltin { fg = vscBlue };
    TSConstMacro { fg = vscBlueGreen };
    TSStringRegex { fg = vscOrange };
    TSString { fg = vscOrange };
    TSCharacter { fg = vscOrange };
    TSNumber { fg = vscLightGreen };
    TSBoolean { fg = vscBlue };
    TSFloat { fg = vscLightGreen };
    TSAnnotation { fg = vscYellow };
    TSAttribute { fg = vscBlueGreen };
    TSNamespace { fg = vscBlueGreen };
    TSFuncBuiltin { fg = vscYellow };
    TSFunction { fg = vscYellow };
    TSFuncMacro { fg = vscYellow };
    TSParameter { fg = vscLightBlue };
    TSParameterReference { fg = vscLightBlue };
    TSMethod { fg = vscYellow };
    TSField { fg = vscLightBlue };
    TSProperty { fg = vscLightBlue };
    TSConstructor { fg = vscBlueGreen };
    TSConditional { fg = vscPink };
    TSRepeat { fg = vscPink };
    TSLabel { fg = vscLightBlue };
    TSKeyword { fg = vscBlue };
    TSKeywordFunction { fg = vscBlue };
    TSKeywordOperator { fg = vscBlue };
    TSOperator { fg = vscFront };
    TSException { fg = vscPink };
    TSType { fg = vscBlueGreen };
    TSTypeBuiltin { fg = vscBlue };
    TSStructure { fg = vscLightBlue };
    TSInclude { fg = vscPink };
    TSVariable { fg = vscLightBlue };
    TSVariableBuiltin { fg = vscLightBlue };
    TSText { fg = vscYellowOrange };
    TSUnderline { fg = vscYellowOrange };
    TSTag { fg = vscBlue };
    TSTagDelimiter { fg = vscGray };

    TSTitle { fg = vscBlue, gui='bold' };
    TSLiteral { fg = vscFront };
    TSEmphasis { fg = vscFront, gui='italic' };
    TSStrong { fg = vscBlue, gui='bold' };
    TSURI { fg = vscFront };
    TSTextReference { fg = vscOrange };
    TSPunctDelimiter { fg = vscFront };
    TSStringEscape { fg = vscOrange, gui='bold' };

    TSNote { fg = vscBlueGreen, gui='bold' };
    TSWarning { fg = vscYellowOrange, gui='bold' };
    TSDanger { fg = vscRed, gui='bold' };
-- }}}

--  Extra Languages {{{
-- Markdown {{{
    markdownBold { fg = vscBlue, gui='bold' };
    markdownCode { fg = vscOrange };
    markdownRule { fg = vscBlue, gui='bold' };
    markdownCodeDelimiter { fg = vscFront };
    markdownHeadingDelimiter { fg = vscBlue };
    markdownFootnote { fg = vscOrange };
    markdownFootnoteDefinition { fg = vscOrange };
    markdownUrl { fg = vscFront, gui='underline' };
    markdownLinkText { fg = vscOrange };
    markdownEscape { fg = vscOrange };
-- }}}

-- JSON {{{
    jsonKeyword { fg = vscLightBlue };
    jsonEscape { fg = vscYellowOrange };
    jsonNull { fg = vscBlue };
    jsonBoolean { fg = vscBlue };
-- }}}

-- HTML {{{
    htmlTag { fg = vscGray };
    htmlEndTag { fg = vscGray };
    htmlTagName { fg = vscBlue };
    htmlSpecialTagName { fg = vscBlue };
    htmlArg { fg = vscLightBlue };
-- }}}

-- PHP {{{
    phpStaticClasses { fg = vscBlueGreen };
    phpMethod { fg = vscYellow };
    phpClass { fg = vscBlueGreen };
    phpFunction { fg = vscYellow };
    phpInclude { fg = vscBlue };
    phpUseClass { fg = vscBlueGreen };
    phpRegion { fg = vscBlueGreen };
    phpMethodsVar { fg = vscLightBlue };
-- }}}

-- CSS {{{
    cssBraces { fg = vscFront };
    cssInclude { fg = vscPink };
    cssTagName { fg = vscYellowOrange };
    cssClassName { fg = vscYellowOrange };
    cssPseudoClass { fg = vscYellowOrange };
    cssPseudoClassId { fg = vscYellowOrange };
    cssPseudoClassLang { fg = vscYellowOrange };
    cssIdentifier { fg = vscYellowOrange };
    cssProp { fg = vscLightBlue };
    cssDefinition { fg = vscLightBlue };
    cssAttr { fg = vscOrange };
    cssAttrRegion { fg = vscOrange };
    cssColor { fg = vscOrange };
    cssFunction { fg = vscOrange };
    cssFunctionName { fg = vscOrange };
    cssVendor { fg = vscOrange };
    cssValueNumber { fg = vscOrange };
    cssValueLength { fg = vscOrange };
    cssUnitDecorators { fg = vscOrange };
    cssStyle { fg = vscLightBlue };
    cssImportant { fg = vscBlue };
-- }}}

-- JavaScript {{{
    jsVariableDef { fg = vscLightBlue };
    jsFuncArgs { fg = vscLightBlue };
    jsFuncBlock { fg = vscLightBlue };
    jsRegexpString { fg = vscLightRed };
    jsThis { fg = vscBlue };
    jsOperatorKeyword { fg = vscBlue };
    jsDestructuringBlock { fg = vscLightBlue };
    jsObjectKey { fg = vscLightBlue };
    jsGlobalObjects { fg = vscBlueGreen };
    jsModuleKeyword { fg = vscLightBlue };
    jsClassDefinition { fg = vscBlueGreen };
    jsClassKeyword { fg = vscBlue };
    jsExtendsKeyword { fg = vscBlue };
    jsExportDefault { fg = vscPink };
    jsFuncCall { fg = vscYellow };
    jsObjectValue { fg = vscLightBlue };
    jsParen { fg = vscLightBlue };
    jsObjectProp { fg = vscLightBlue };
    jsIfElseBlock { fg = vscLightBlue };
    jsParenIfElse { fg = vscLightBlue };
    jsSpreadOperator { fg = vscLightBlue };
    jsSpreadExpression { fg = vscLightBlue };
-- }}}

-- Typescript {{{
    typescriptLabel { fg = vscLightBlue };
    typescriptExceptions { fg = vscLightBlue };
    typescriptBraces { fg = vscFront };
    typescriptEndColons { fg = vscLightBlue };
    typescriptParens { fg = vscFront };
    typescriptDocTags { fg = vscBlue };
    typescriptDocComment { fg = vscBlueGreen };
    typescriptLogicSymbols { fg = vscLightBlue };
    typescriptImport { fg = vscPink };
    typescriptBOM { fg = vscLightBlue };
    typescriptVariableDeclaration { fg = vscLightBlue };
    typescriptVariable { fg = vscBlue };
    typescriptExport { fg = vscPink };
    typescriptAliasDeclaration { fg = vscBlueGreen };
    typescriptAliasKeyword { fg = vscBlue };
    typescriptClassName { fg = vscBlueGreen };
    typescriptAccessibilityModifier { fg = vscBlue };
    typescriptOperator { fg = vscBlue };
    typescriptArrowFunc { fg = vscBlue };
    typescriptMethodAccessor { fg = vscBlue };
    typescriptMember { fg = vscYellow };
    typescriptTypeReference { fg = vscBlueGreen };
    typescriptTemplateSB { fg = vscYellowOrange };
    typescriptArrowFuncArg { fg = vscLightBlue };
    typescriptParamImpl { fg = vscLightBlue };
    typescriptFuncComma { fg = vscLightBlue };
    typescriptCastKeyword { fg = vscLightBlue };
    typescriptCall { fg = vscBlue };
    typescriptCase { fg = vscLightBlue };
    typescriptReserved { fg = vscPink };
    typescriptDefault { fg = vscLightBlue };
    typescriptDecorator { fg = vscYellow };
    typescriptPredefinedType { fg = vscBlueGreen };
    typescriptClassHeritage { fg = vscBlueGreen };
    typescriptClassExtends { fg = vscBlue };
    typescriptClassKeyword { fg = vscBlue };
    typescriptBlock { fg = vscLightBlue };
    typescriptDOMDocProp { fg = vscLightBlue };
    typescriptTemplateSubstitution { fg = vscLightBlue };
    typescriptClassBlock { fg = vscLightBlue };
    typescriptFuncCallArg { fg = vscLightBlue };
    typescriptIndexExpr { fg = vscLightBlue };
    typescriptConditionalParen { fg = vscLightBlue };
    typescriptArray { fg = vscYellow };
    typescriptES6SetProp { fg = vscLightBlue };
    typescriptObjectLiteral { fg = vscLightBlue };
    typescriptTypeParameter { fg = vscBlueGreen };
    typescriptEnumKeyword { fg = vscBlue };
    typescriptEnum { fg = vscBlueGreen };
    typescriptLoopParen { fg = vscLightBlue };
    typescriptParenExp { fg = vscLightBlue };
    typescriptModule { fg = vscLightBlue };
    typescriptAmbientDeclaration { fg = vscBlue };
    typescriptFuncTypeArrow { fg = vscBlue };
    typescriptInterfaceHeritage { fg = vscBlueGreen };
    typescriptInterfaceName { fg = vscBlueGreen };
    typescriptInterfaceKeyword { fg = vscBlue };
    typescriptInterfaceExtends { fg = vscBlue };
    typescriptGlobal { fg = vscBlueGreen };
    typescriptAsyncFuncKeyword { fg = vscBlue };
    typescriptFuncKeyword { fg = vscBlue };
    typescriptGlobalMethod { fg = vscYellow };
    typescriptPromiseMethod { fg = vscYellow };
-- }}}

-- XML {{{
    xmlTag { fg = vscBlueGreen };
    xmlTagName { fg = vscBlueGreen };
    xmlEndTag { fg = vscBlueGreen };
-- }}}

-- Ruby {{{
    rubyClassNameTag { fg = vscBlueGreen };
    rubyClassName { fg = vscBlueGreen };
    rubyModuleName { fg = vscBlueGreen };
    rubyConstant { fg = vscBlueGreen };
-- }}}

-- Golang {{{
    goPackage { fg = vscBlue };
    goImport { fg = vscBlue };
    goVar { fg = vscBlue };
    goConst { fg = vscBlue };
    goStatement { fg = vscPink };
    goType { fg = vscBlueGreen };
    goSignedInts { fg = vscBlueGreen };
    goUnsignedInts { fg = vscBlueGreen };
    goFloats { fg = vscBlueGreen };
    goComplexes { fg = vscBlueGreen };
    goBuiltins { fg = vscYellow };
    goBoolean { fg = vscBlue };
    goPredefinedIdentifiers { fg = vscBlue };
    goTodo { fg = vscGreen };
    goDeclaration { fg = vscBlue };
    goDeclType { fg = vscBlue };
    goTypeDecl { fg = vscBlue };
    goTypeName { fg = vscBlueGreen };
    goVarAssign { fg = vscLightBlue };
    goVarDefs { fg = vscLightBlue };
    goReceiver { fg = vscFront };
    goReceiverType { fg = vscFront };
    goFunctionCall { fg = vscYellow };
    goMethodCall { fg = vscYellow };
    goSingleDecl { fg = vscLightBlue };
-- }}}

-- Python {{{
    pythonStatement { fg = vscBlue };
    pythonOperator { fg = vscBlue };
    pythonException { fg = vscPink };
    pythonExClass { fg = vscBlueGreen };
    pythonBuiltinObj { fg = vscLightBlue };
    pythonBuiltinType { fg = vscBlueGreen };
    pythonBoolean { fg = vscBlue };
    pythonNone { fg = vscBlue };
    pythonTodo { fg = vscBlue };
    pythonClassVar { fg = vscBlue };
    pythonClassDef { fg = vscBlueGreen };
-- }}}

-- TeX {{{
    texStatement { fg = vscBlue };
    texBeginEnd { fg = vscYellow };
    texBeginEndName { fg = vscLightBlue };
    texOption { fg = vscLightBlue };
    texBeginEndModifier { fg = vscLightBlue };
    texDocType { fg = vscPink };
    texDocTypeArgs { fg = vscLightBlue };
-- }}}

-- Lua {{{
    luaFuncCall { fg = vscYellow };
    luaFuncArgName { fg = vscLightBlue };
    luaFuncKeyword { fg = vscPink };
    luaLocal { fg = vscPink };
    luaBuiltIn { fg = vscBlue };
-- }}}

-- Shell {{{
    shDeref { fg = vscLightBlue };
    shVariable { fg = vscLightBlue };
-- }}}

-- SQL {{{
    sqlKeyword { fg = vscPink };
    sqlFunction { fg = vscYellowOrange };
    sqlOperator { fg = vscPink };
-- }}}

-- YAML {{{
    yamlKey { fg = vscBlue };
    yamlConstant { fg = vscBlue };
-- }}}
-- }}}

-- Git {{{
    gitcommitHeader { fg = vscGray };
    gitcommitOnBranch { fg = vscGray };
    gitcommitBranch { fg = vscPink };
    gitcommitComment { fg = vscGray };
    gitcommitSelectedType { fg = vscGreen };
    gitcommitSelectedFile { fg = vscGreen };
    gitcommitDiscardedType { fg = vscRed };
    gitcommitDiscardedFile { fg = vscRed };
    gitcommitOverflow { fg = vscRed };
    gitcommitSummary { fg = vscPink };
    gitcommitBlank { fg = vscPink };
    diffAdded { DiffAdd };
    diffChanged { DiffChange };
    diffRemoved { DiffDelete };
-- }}}

-- Gitgutter {{{
    GitGutterAdd { fg = vscGreen };
    GitGutterChange { fg = vscYellow };
    GitGutterDelete { fg = vscRed };
-- }}}

-- Git Signs {{{
    GitSignsAdd { fg = vscGreen };
    GitSignsChange { fg = vscYellow };
    GitSignsDelete { fg = vscRed };
    GitSignsAddLn { fg = vscBack, bg = vscGreen };
    GitSignsChangeLn { fg = vscBack, bg = vscYellow };
    GitSignsDeleteLn { fg = vscBack, bg = vscRed };
-- }}}

-- Nvim Tree {{{
    NvimTreeRootFolder { fg = vscFront, gui='bold' };
    NvimTreeGitDirty { fg = vscYellow };
    NvimTreeGitNew { fg = vscGreen };
    NvimTreeImageFile { fg = vscViolet };
    NvimTreeEmptyFolderName { fg = vscGray };
    NvimTreeFolderName { fg = vscFront };
    NvimTreeSpecialFile { fg = vscPink, gui='underline' };
    NvimTreeNormal { fg = vscFront, bg = vscBack };
    NvimTreeCursorLine { bg = vscCursorDarkDark };
    NvimTreeVertSplit { fg = vscSplitDark, bg = vscBack };
    NvimTreeEndOfBuffer { fg = vscCursorDarkDark };
    NvimTreeOpenedFolderName { bg = vscCursorDarkDark };
-- }}}

-- Bufferline {{{
    BufferLineIndicatorSelected { fg = vscLeftDark };
    BufferLineFill { bg = vscLeftDark };
-- }}}

-- BarBar {{{
    BufferCurrent { fg = vscFront, bg = vscTabCurrent };
    BufferCurrentIndex { fg = vscFront, bg = vscTabCurrent };
    BufferCurrentMod { fg = vscYellowOrange, bg = vscTabCurrent };
    BufferCurrentSign { fg = vscFront, bg = vscTabCurrent };
    BufferCurrentTarget { fg = vscRed, bg = vscTabCurrent };
    BufferVisible { fg = vscGray, bg = vscTabCurrent };
    BufferVisibleIndex { fg = vscGray, bg = vscTabCurrent };
    BufferVisibleMod { fg = vscYellowOrange, bg = vscTabCurrent };
    BufferVisibleSign { fg = vscGray, bg = vscTabCurrent };
    BufferVisibleTarget { fg = vscRed, bg = vscTabCurrent };
    BufferInactive { fg = vscGray, bg = vscTabOther };
    BufferInactiveIndex { fg = vscGray, bg = vscTabOther };
    BufferInactiveMod { fg = vscYellowOrange, bg = vscTabOther };
    BufferInactiveSign { fg = vscGray, bg = vscTabOther };
    BufferInactiveTarget { fg = vscRed, bg = vscTabOther };
    BufferTabpages { fg = vscFront, bg = vscTabOther };
    BufferTabpagesFill { fg = vscFront, bg = vscTabOther };
-- }}}

-- Indent Blankline {{{
    IndentBlanklineContextChar { fg = vscRed };
    IndentBlanklineContextStart { IndentBlanklineContextChar };
    IndentBlanklineChar { fg = vscLineNumber };
    IndentBlanklineSpaceChar { IndentBlanklineChar };
    IndentBlanklineSpaceCharBlankline { IndentBlanklineChar };
-- }}}

-- Lsp {{{
    DiagnosticError { fg = vscRed };
    DiagnosticWarn { fg = vscYellow };
    DiagnosticInfo { fg = vscBlue };
    DiagnosticHint { fg = vscBlue };
    DiagnosticUnderlineError { gui = 'undercurl' };
    DiagnosticUnderlineWarn { gui = 'undercurl' };
    DiagnosticUnderlineInfo { gui = 'undercurl' };
    DiagnosticUnderlineHint { gui = 'undercurl' };
    LspReferenceText { bg = vscPopupHighlightGray };
    LspReferenceRead { bg = vscPopupHighlightGray };
    LspReferenceWrite { bg = vscPopupHighlightGray };
-- }}}

-- Cmp {{{
    CmpItemKindVariable { fg = vscLightBlue };
    CmpItemKindInterface { fg = vscLightBlue };
    CmpItemKindText { fg = vscLightBlue };
    CmpItemKindFunction { fg = vscPink };
    CmpItemKindMethod { fg = vscPink };
    CmpItemKindKeyword { fg = vscFront };
    CmpItemKindProperty { fg = vscFront };
    CmpItemKindUnit { fg = vscFront };
    CmpItemKindConstructor { fg = vscUiOrange };
    CmpItemAbbrDeprecated { fg = vscCursorDark, bg = vscPopupBack, gui='strikethrough' };
    CmpItemAbbrMatch { fg = vscBlue, bg = vscPopupBack, gui='bold' };
    CmpItemKind { Pmenu };
    CmpItemAbbr { Pmenu };
    CmpItemKindClass { CmpItemKindConstructor };
    CmpItemKindModule { CmpItemKindKeyword };
    CmpItemKindOperator { TSOperator };
    CmpItemKindReference { TSParameterReference };
    CmpItemKindValue { TSField };
    CmpItemKindField { TSField };
    CmpItemKindEnum { TSField };
    CmpItemKindSnippet { TSText };
    CmpItemKindColor { cssColor };
    CmpItemKindFile { TSURI };
    CmpItemKindFolder { TSURI };
    CmpItemKindEvent { TSConstant };
    CmpItemKindEnumMember { TSField };
    CmpItemKindConstant { TSConstant };
    CmpItemKindStruct { TSStructure };
    CmpItemKindTypeParameter { TSParameter };
-- }}}

-- TODO: Port all hl groups below

-- -- Vim Editor {{{
--     Normal { bg = blacker, fg = gray13 };
--     Whitespace { fg = gray01 };
--     EndOfBuffer { fg = gray01 };
--     Conceal { Normal };
--     Constant { fg = gray05, gui = 'bold' };
--     Character { Constant };
--     String { fg = gray10 };
--     Number { fg = gray06 };
--     Float { fg = gray06 };
--     NormalFloat { bg = gray01, fg = gray12 };
--     Boolean { Number };
--     Identifier { fg = gray08 };
--     Function { fg = gray08 };
--     Statement { fg = gray05, gui = 'bold' };
--     Conditional { Statement };
--     Repeat { Statement };
--     Label { Statement };
--     Exception { Statement };
--     Operator { fg = gray05 };
--     Keyword { fg = gray05 };
--     PreProc { fg = gray07 };
--     Include { PreProc };
--     Define { PreProc };
--     Macro { PreProc };
--     PreCondit { PreProc };
--     Type { fg = gray05, gui = 'bold' };
--     StorageClass { Type };
--     Structure { Type };
--     Typedef { Type };
--     Special { fg = gray05 };
--     SpecialChar { Special };
--     Tag { Special };
--     Delimiter { Special };
--     Debug { Special };
--     Question { Special };
--     SpecialComment { fg = gray03, gui = 'bold' };
--     Title { fg = gray07, gui = 'bold' };
--     Todo { fg = purple };
--     Comment { fg = gray03, gui = 'italic' };
--     LineNr { fg = gray04 };
--     Folded { LineNr, gui = 'italic' };
--     SignColumn { fg = gray07 };
--     FoldColumn { SignColumn };
--     ColorColumn { bg = blacker };
--     CursorLine { bg = black };
--     CursorColumn { CursorLine };
--     CursorLineNr { LineNr, fg = gray10, gui = 'bold' };
--     Visual { bg = gray06, fg = black };
--     VisualNOS { Visual };
--     Search { bg = gray11, fg = gray01 };
--     IncSearch { bg = gray07, fg = black, gui = 'bold' };
--     SpellBad { fg = red, gui = 'undercurl' };
--     SpellCap { fg = red, gui = 'undercurl' };
--     SpellLocal { fg = red, gui = 'undercurl' };
--     SpellRare { fg = brown, gui = 'undercurl' };
--     Error { fg = red, gui = 'bold' };
--     ErrorMsg { Error };
--     ErrorMsg { fg = red };
--     WarningMsg { fg = brown };
--     ModeMsg { fg = gray10 };
--     MoreMsg { fg = gray10 };
--     MatchParen { fg = magenta, gui = 'bold' };
--     Cursor { bg = gray12 };
--     Underlined { fg = gray08, gui = 'underline' };
--     SpecialKey { fg = gray04 };
--     NonText { fg = gray04 };
--     Directory { fg = gray08 };
--     Pmenu { fg = gray06 };
--     PmenuSbar { fg = black };
-- -- PmenuSbar { bg = Error.fg };
-- -- PmenuThumb { bg = gray09, fg = gray03 };
--     PmenuThumb { bg = gray01};
--     PmenuSel { bg = gray06, fg = blacker };
--     StatusLine { Normal , fg = gray11 };
--     TabLineSel { StatusLine };
--     StatusLineNC { StatusLine, fg = gray04 };
--     TabLine { StatusLineNC };
--     TabLineFill { StatusLineNC };
--     WildMenu { fg = gray08 };
--     VertSplit { fg = blackest };
--     DiffAdd { bg = green, fg = blackest };
--     DiffChange { bg = blue, fg = blackest };
--     DiffDelete { bg = red, fg = blackest };
--     DiffText { bg = lightblue, fg = black };
--     DiffAdded { fg = green };
--     DiffChanged { fg = blue };
--     DiffRemoved { fg = red };
-- -- }}}
--
-- -- Status Line {{{
--     SLModeText { bg = gray09, fg = black, gui = 'bold' };
--     SLModeSep { bg = blacker, fg = gray09 };
--     SLNormalText { bg = blacker, fg = gray09 };
--     SLDimText { bg = blacker, fg = gray01 };
--     SLLightText { bg = gray01, fg = gray09, gui = 'italic' };
--     SLLightSep { bg = blacker, fg = gray01 };
--     SLDarkText { bg = blacker, fg = blackest };
--     SLError { fg = red };
--     SLWarning { fg = orange };
--     SLInfo { fg = blue };
--     SLHint { fg = gray15 };
-- -- }}}
--
-- -- Treesitter {{{
--     TSComment { Comment, gui = 'italic' };
--     TSPunctDelimiter { Delimiter };
--     TSPunctBracket { Delimiter };
--     TSPunctSpecial { Delimiter };
--     TSConstant { Constant };
--     TSConstBuiltin { Special };
--     TSConstMacro { Define };
--     TSString { String };
--     TSStringRegex { String };
--     TSStringEscape { SpecialChar };
--     TSCharacter { Character };
--     TSNumber { Number };
--     TSBoolean { Boolean };
--     TSFloat { Float };
--     TSFunction { Function };
--     TSFuncBuiltin { Special };
--     TSFuncMacro { Macro };
--     TSParameter { Identifier, gui = 'italic' };
--     TSParameterReference { TSParameter };
--     TSMethod { Function };
--     TSField { Identifier };
--     TSProperty { Identifier, gui = 'italic' };
--     TSConstructor { Special };
--     TSAnnotation { PreProc };
--     TSAttribute { PreProc };
--     TSNamespace { Include };
--     TSConditional { Conditional };
--     TSRepeat { Repeat };
--     TSLabel { Label };
--     TSOperator { Operator };
--     TSKeyword { Keyword, gui = 'italic' };
--     TSKeywordFunction { Keyword };
--     TSKeywordOperator { TSOperator };
--     TSException { Exception };
--     TSType { Type };
--     TSTypeBuiltin { Type };
--     TSInclude { Include };
--     TSVariable { fg = Normal.fg, gui = 'italic'};
--     TSVariableBuiltin { Special };
--     TSText { fg = Normal.fg };
--     TSStrong { TSText, gui = 'bold' };
--     TSEmphasis { TSText, gui = 'italic' };
--     TSUnderline { TSText, gui = 'underline' };
--     TSTitle { Title };
--     TSLiteral { String };
--     TSURI { Underlined };
--     TSTag { Label };
--     TSTagDelimiter { Delimiter };
--     TSPlaygroundFocus { Visual };
--
-- -- Refactor {{{
--     TSDefinitionUsage { fg = white };
--     TSDefinition { fg = pink };
-- -- }}}
--
-- -- }}}
--
-- -- Lsp {{{
--     LspDiagnosticsDefaultError { fg = red };
--     LspDiagnosticsVirtualTextError { LspDiagnosticsDefaultError, gui = 'italic' };
--     LspDiagnosticsFloatingError { LspDiagnosticsDefaultError };
--     LspDiagnosticsSignError { LspDiagnosticsDefaultError };
--     LspDiagnosticsUnderlineError { LspDiagnosticsDefaultError, gui = 'italic' };
--
--     LspDiagnosticsDefaultWarning { fg = orange };
--     LspDiagnosticsVirtualTextWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };
--     LspDiagnosticsFloatingWarning { LspDiagnosticsDefaultWarning };
--     LspDiagnosticsSignWarning { LspDiagnosticsDefaultWarning };
--     LspDiagnosticsUnderlineWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };
--
--     LspDiagnosticsDefaultInformation { fg = blue };
--     LspDiagnosticsVirtualTextInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
--     LspDiagnosticsFloatingInformation { LspDiagnosticsDefaultInformation };
--     LspDiagnosticsSignInformation { LspDiagnosticsDefaultInformation };
--     LspDiagnosticsUnderlineInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
--
--     LspDiagnosticsDefaultHint { fg = gray15 };
--     LspDiagnosticsVirtualTextHint { LspDiagnosticsDefaultHint, gui = 'italic' };
--     LspDiagnosticsFloatingHint { LspDiagnosticsDefaultHint };
--     LspDiagnosticsSignHint { LspDiagnosticsDefaultHint };
--     LspDiagnosticsUnderlineHint { LspDiagnosticsDefaultHint, gui = 'italic' };
-- -- }}}
--
-- -- Diagnostics {{{
--     DiagnosticError { LspDiagnosticsDefaultError };
--     DiagnosticVirtualTextError { LspDiagnosticsVirtualTextError };
--     DiagnosticUnderlineError { LspDiagnosticsUnderlineError };
--     DiagnosticFloatingError { LspDiagnosticsFloatingError };
--     DiagnosticSignError { LspDiagnosticsSignError };
--
--     DiagnosticWarn { LspDiagnosticsDefaultWarning };
--     DiagnosticVirtualTextWarn { LspDiagnosticsVirtualTextWarning };
--     DiagnosticUnderlineWarn { LspDiagnosticsUnderlineWarning };
--     DiagnosticFloatingWarn { LspDiagnosticsFloatingWarning };
--     DiagnosticSignWarn { LspDiagnosticsSignWarning };
--
--     DiagnosticInfo { LspDiagnosticsDefaultInformation };
--     DiagnosticVirtualTextInfo { LspDiagnosticsVirtualTextInformation };
--     DiagnosticUnderlineInfo { LspDiagnosticsUnderlineInformation };
--     DiagnosticFloatingInfo { LspDiagnosticsFloatingInformation };
--     DiagnosticSignInfo { LspDiagnosticsSignInformation };
--
--     DiagnosticHint { LspDiagnosticsDefaultHint };
--     DiagnosticVirtualTextHint { LspDiagnosticsVirtualTextHint };
--     DiagnosticUnderlineHint { LspDiagnosticsUnderlineHint };
--     DiagnosticFloatingHint { LspDiagnosticsFloatingHint };
--     DiagnosticSignHint { LspDiagnosticsSignHint };
-- --}}}
--
-- -- Lsp Saga {{{
-- -- Misc
--     LspFloatWinBorder { fg = gray12 };
--     LspSagaBorderTitle { fg = gray10, gui = 'bold' };
--     TargetWord { fg = gray04 };
--     TargetFileName { fg = gray04 };
--     ProviderTruncateLine { fg = gray01 };
--     SagaShadow { fg = red };
--     LspSagaFinderSelection { fg = gray15 };
-- -- Diagnostic
--     LspLinesDiagBorder { fg = gray12 };
--     DiagnosticTruncateLine { fg = gray01 };
--     DiagnosticError { Normal };
--     DiagnosticWarning { Normal };
--     DiagnosticInformation { Normal };
--     DiagnosticHint { Normal };
--     LspSagaShTruncateLine { fg = gray01 };
--     LspSagaDocTruncateLine { fg = gray01 };
--     LineDiagTuncateLine { fg = gray01 };
-- -- Code Action
--     LspSagaCodeActionTitle { fg = gray10 };
--     LspSagaCodeActionTruncateLine { fg = gray01 };
--     LspSagaCodeActionContent { fg = gray07 };
--     LspSagaCodeActionBorder { fg = gray12 };
-- -- Rename
--     LspSagaRenamePromptPrefix { fg = gray08 };
--     LspSagaRenameBorder { fg = gray12 };
-- -- Hover
--     LspSagaHoverBorder { fg = gray12 };
--     LspSagaSignatureHelpBorder { fg = gray12 };
--     LspSagaAutoPreview { fg = gray12 };
-- -- Definition
--     LspSagaDefPreviewBorder { fg = gray12 };
--     DefinitionPreviewTitle { fg = gray10 };
--     ReferencesCount { fg = gray08 };
--     DefinitionCount { fg = gray08 };
--     DefinitionIcon { fg = gray08 };
--     ReferencesIcon { fg = gray08 };
-- -- }}}
--
-- -- Lsp Lightbulb {{{
--     LightBulbFloatWin { bg = blue, fg = blacker };
--     LightBulbVirtualText { fg = blue };
-- -- }}}
--
-- -- Telescope {{{
--     TelescopeSelection { Normal, fg = gray05 };
--     TelescopeSelectionCaret { fg = white };
-- -- Group.new('TelescopeMultiSelection',
--     TelescopeNormal { Normal, fg = gray05 };
--
-- -- Border highlight groups.
--     TelescopeBorder { Normal, fg = gray12 };
-- -- Group.new('TelescopePromptBorder',
-- -- Group.new('TelescopeResultsBorder',
-- -- Group.new('TelescopePreviewBorder',
--
-- -- Used for highlighting characters that you match.
--     TelescopeMatching { fg = gray14 };
--
-- -- Used for the prompt prefix
--     TelescopePromptPrefix { fg = gray12 };
-- -- }}}
--
-- -- Startify {{{
--     StartifyBracket { fg = gray02 };
--     StartifyFile { fg = gray10, gui = 'italic' };
--     StartifyFooter { fg = gray02 };
--     StartifyHeader { fg = gray02 };
--     StartifyNumber { fg = gray13 };
--     StartifyPath { fg = gray02, gui = 'italic' };
--     StartifySection { fg = gray13 };
--     StartifySelect { fg = red };
--     StartifySlash { fg = gray02, gui = 'italic' };
--     StartifySpecial { fg = gray02 };
--     StartifyVar { fg = gray13 };
-- -- }}}
--
-- -- Gitsigns {{{
--     DiffAddSign { fg = green };
--     DiffChangeSign { fg = blue };
--     DiffDeleteSign { fg = red };
-- -- }}}
--
-- -- Nvim Tree {{{
--     NvimTreeNormal { fg = gray02 };
--
--     NvimTreeSymlink { fg = gray02 };
--     NvimTreeFolderName { fg = gray12 };
--     NvimTreeRootFolder { fg = gray02, gui = 'italic' };
--     NvimTreeFolderIcon { fg = gray02 };
--     NvimTreeExecFile { fg = gray02 };
--     NvimTreeSpecialFile { fg = gray02 };
--     NvimTreeImageFile { fg = gray02 };
--     NvimTreeMarkdownFile { fg = gray02 };
--     NvimTreeIndentMarker { fg = gray02 };
--
--     NvimTreeLicenseIcon { fg = gray02 };
--     NvimTreeYamlIcon { fg = gray02 };
--     NvimTreeTomlIcon { fg = gray02 };
--     NvimTreeGitignoreIcon { fg = gray02 };
--     NvimTreeJsonIcon { fg = gray02 };
--
--     NvimTreeLuaIcon { fg = gray02 };
--     NvimTreePythonIcon { fg = gray02 };
--     NvimTreeShellIcon { fg = gray02 };
--     NvimTreeJavascriptIcon { fg = gray02 };
--     NvimTreeCIcon { fg = gray02 };
--     NvimTreeReactIcon { fg = gray02 };
--     NvimTreeHtmlIcon { fg = gray02 };
--     NvimTreeRustIcon { fg = gray02 };
--     NvimTreeVimIcon { fg = gray02 };
--     NvimTreeTypescriptIcon { fg = gray02 };
--
--     NvimTreeGitDirty { fg = gray10, gui = 'italic' };
--     NvimTreeGitStaged { fg = lightgreen, gui = 'italic' };
--     NvimTreeGitMerge { fg = magenta, gui = 'italic' };
--     NvimTreeGitRenamed { fg = gray10, gui = 'italic' };
--     NvimTreeGitNew { fg = gray10, gui = 'italic' };
-- -- }}}
--
-- -- Fern {{{
--     FernSpinner { fg = blue };
--     FernMarkedLine { fg = white };
--     FernMarkedText { fg = white };
--     FernRootSymbol { fg = gray02 };
--     FernRootText { fg = gray10 };
--     FernLeafSymbol { fg = gray02 };
--     FernLeafText { fg = gray08 };
--     FernBranchSymbol { fg = gray02 };
--     FernBranchText { fg = gray10 };
--     FernWindowSelectIndicator { Normal };
--     FernWindowSelectStatusLine { Normal };
-- -- }}}
--
-- -- Indent Blankline {{{
--     IndentBlanklineChar { fg = gray01 };
-- --}}}
--
-- -- Cmp {{{
-- -- The abbr field.
--     CmpItemAbbr { Normal };
--
-- -- The deprecated item's abbr field.
--     CmpItemAbbrDeprecated { Error };
--
-- -- The matched characters highlight.
--     CmpItemAbbrMatch { Error };
--
-- -- The fuzzy matched characters highlight.
--     CmpItemAbbrMatchFuzzy { Error };
--
-- -- The kind field.
--     CmpItemKind { fg = gray03 };
--
-- -- The menu field.
--     CmpItemMenu { Normal };
-- --}}}
} end)

return theme

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
