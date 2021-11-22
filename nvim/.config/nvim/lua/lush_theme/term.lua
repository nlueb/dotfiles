local lush = require 'lush'
local hsl = lush.hsl

-- Colors {{{
-- ========================================
-- Function to get colors from xresources
-- ========================================
local function get_xresources_color (c)
   local command = io.popen('xrdb -query | grep ' .. c .. ' -m 1 | cut -f 2')
   local color = command:read("*l")
   return color
end


local color1  = hsl(get_xresources_color('color0'))
local color2  = hsl(get_xresources_color('color1'))
local color3  = hsl(get_xresources_color('color2'))
local color4  = hsl(get_xresources_color('color3'))
local color5  = hsl(get_xresources_color('color4'))
local color6  = hsl(get_xresources_color('color5'))
local color7  = hsl(get_xresources_color('color6'))
local color8  = hsl(get_xresources_color('color7'))
local color9  = hsl(get_xresources_color('color8'))
local color10 = hsl(get_xresources_color('color9'))
local color11 = hsl(get_xresources_color('color10'))
local color12 = hsl(get_xresources_color('color11'))
local color13 = hsl(get_xresources_color('color12'))
local color14 = hsl(get_xresources_color('color13'))
local color15 = hsl(get_xresources_color('color14'))
local color16 = hsl(get_xresources_color('color15'))

local bg = hsl(get_xresources_color('background'))
local fg = hsl(get_xresources_color('foreground'))
-- }}}

-- NeoVim Terminal {{{
-- vim.g.terminal_color_0 = '#262626'
-- vim.g.terminal_color_1 = '#767676'
-- vim.g.terminal_color_2 = '#4e4e4e'
-- vim.g.terminal_color_3 = '#a8a8a8'
-- vim.g.terminal_color_4 = '#444444'
-- vim.g.terminal_color_5 = '#8a8a8a'
-- vim.g.terminal_color_6 = '#949494'
-- vim.g.terminal_color_7 = '#bcbcbc'
-- vim.g.terminal_color_8 = '#4e4e4e'
-- vim.g.terminal_color_9 = '#9e9e9e'
-- vim.g.terminal_color_10 = '#808080'
-- vim.g.terminal_color_11 = '#e4e4e4'
-- vim.g.terminal_color_12 = '#666666'
-- vim.g.terminal_color_13 = '#b2b2b2'
-- vim.g.terminal_color_14 = '#c6c6c6'
-- vim.g.terminal_color_15 = '#eeeeee'
-- }}}

local theme = lush(function()
        return {
-- Vim Editor {{{
        Normal { bg = bg, fg = fg };
        Whitespace { fg = color1 };
        EndOfBuffer { fg = color1 };
        Conceal { Normal };
        Constant { fg = fg, gui = 'bold' };
        Character { Constant };
        String { fg = color7 };
        Number { fg = color7 };
        Float { fg = color7 };
        NormalFloat { bg = color1, fg = color8 };
        Boolean { Number };
        Identifier { fg = color8 };
        Function { fg = color4, gui='bold' };
        Statement { fg = color6, gui = 'bold' };
        Conditional { Statement };
        Repeat { Statement };
        Label { Statement };
        Exception { Statement };
        Operator { fg = fg };
        Keyword { fg = color8 };
        PreProc { fg = color8 };
        Include { PreProc };
        Define { PreProc };
        Macro { PreProc };
        PreCondit { PreProc };
        Type { fg = fg, gui = 'bold' };
        StorageClass { Type };
        Structure { Type };
        Typedef { Type };
        Special { fg = color8 };
        SpecialChar { Special };
        Tag { Special };
        Delimiter { Special };
        Debug { Special };
        Question { Special };
        SpecialComment { fg = color16, gui = 'bold' };
        Title { fg = color16, gui = 'bold' };
        Todo { fg = bg, bg=color2 };
        Comment { fg = color9, gui = 'italic' };
        LineNr { fg = color9 };
        Folded { LineNr, gui = 'italic' };
        FoldColumn { bg = color8, fg = color9 };
        SignColumn { fg = color8 };
        ColorColumn { bg = color9 };
        CursorLine { bg = color1 };
        CursorColumn { CursorLine };
        CursorLineNr { LineNr, fg = color8, gui = 'bold' };
        Visual { bg = color9, fg = color16 };
        VisualNOS { Visual };
        Search { bg = color4, fg = bg };
        IncSearch { bg = fg, fg = bg, gui = 'bold' };
        SpellBad { fg = color2, gui = 'undercurl' };
        SpellCap { fg = color2, gui = 'undercurl' };
        SpellLocal { fg = color2, gui = 'undercurl' };
        SpellRare { fg = color4, gui = 'undercurl' };
        Error { fg = color2, gui = 'bold' };
        ErrorMsg { Error };
        ErrorMsg { fg = color2 };
        WarningMsg { fg = color4 };
        ModeMsg { fg = color8 };
        MoreMsg { fg = color8 };
        MatchParen { fg = color2, gui = 'bold' };
        Cursor { bg = color8 };
        Underlined { fg = color8, gui = 'underline' };
        SpecialKey { fg = color8 };
        NonText { fg = color8 };
        Directory { fg = color8 };
        Pmenu { fg = color8 };
        PmenuSbar { fg = color8 };
        -- PmenuSbar { bg = Error.fg };
        -- PmenuThumb { bg = gray09, fg = gray03 };
        PmenuThumb { bg = color8};
        PmenuSel { bg = color9, fg = color16 };
        StatusLine { Normal , fg = color8 };
        TabLineSel { StatusLine };
        StatusLineNC { StatusLine, fg = color8 };
        TabLine { StatusLineNC };
        TabLineFill { StatusLineNC };
        WildMenu { fg = color8 };
        VertSplit { fg = color9 };
        DiffAdd { bg = color3, fg = bg };
        DiffChange { bg = color5, fg = bg };
        DiffDelete { bg = color2, fg = bg };
        DiffText { bg = color4, fg = bg };
        DiffAdded { fg = color3 };
        DiffChanged { fg = color5 };
        DiffRemoved { fg = color2 };
-- }}}

-- Status Line {{{
        SLModeText { bg = color1, fg = fg, gui = 'bold' };
        SLModeSep { bg = bg, fg = color1 };
        SLNormalText { bg = bg, fg = color8 };
        SLDimText { bg = bg, fg = color8 };
        SLLightText { bg = color1, fg = fg, gui = 'italic' };
        SLLightSep { bg = bg, fg = color1 };
        SLDarkText { bg = bg, fg = color1 };
        SLError { fg = color2 };
        SLWarning { fg = color4 };
        SLInfo { fg = color3 };
        SLHint { fg = color8 };
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
        TSDefinitionUsage { fg = color16, gui= 'bold' };
        TSDefinition { fg = color6, gui= 'bold' };
-- }}}

-- }}}

-- LSP {{{
        LspDiagnosticsDefaultHint { fg = color8 };
        LspDiagnosticsVirtualTextHint { LspDiagnosticsDefaultHint, gui = 'italic' };
        LspDiagnosticsFloatingHint { LspDiagnosticsDefaultHint };
        LspDiagnosticsSignHint { LspDiagnosticsDefaultHint };
        LspDiagnosticsUnderlineHint { LspDiagnosticsDefaultHint, gui = 'italic' };

        LspDiagnosticsDefaultError { fg = color2 };
        LspDiagnosticsVirtualTextError { LspDiagnosticsDefaultError, gui = 'italic' };
        LspDiagnosticsFloatingError { LspDiagnosticsDefaultError };
        LspDiagnosticsSignError { LspDiagnosticsDefaultError };
        LspDiagnosticsUnderlineError { LspDiagnosticsDefaultError, gui = 'italic' };

        LspDiagnosticsDefaultWarning { fg = color4 };
        LspDiagnosticsVirtualTextWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };
        LspDiagnosticsFloatingWarning { LspDiagnosticsDefaultWarning };
        LspDiagnosticsSignWarning { LspDiagnosticsDefaultWarning };
        LspDiagnosticsUnderlineWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };

        LspDiagnosticsDefaultInformation { fg = color3 };
        LspDiagnosticsVirtualTextInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
        LspDiagnosticsFloatingInformation { LspDiagnosticsDefaultInformation };
        LspDiagnosticsSignInformation { LspDiagnosticsDefaultInformation };
        LspDiagnosticsUnderlineInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
-- }}}

-- Lsp Saga {{{
-- Misc
        LspFloatWinBorder { fg = color9 };
        LspSagaBorderTitle { fg = color8, gui = 'bold' };
        TargetWord { fg = color16 };
        TargetFileName { fg = color16 };
        ProviderTruncateLine { fg = color9 };
        SagaShadow { fg = color2 };
        LspSagaFinderSelection { fg = color8 };
-- Diagnostic
        LspLinesDiagBorder { fg = color9 };
        DiagnosticTruncateLine { fg = color9 };
        DiagnosticError { Normal };
        DiagnosticWarning { Normal };
        DiagnosticInformation { Normal };
        DiagnosticHint { Normal };
        LspSagaShTruncateLine { fg = color9 };
        LspSagaDocTruncateLine { fg = color9 };
        LineDiagTuncateLine { fg = color9 };
-- Code Action
        LspSagaCodeActionTitle { fg = color8 };
        LspSagaCodeActionTruncateLine { fg = color9 };
        LspSagaCodeActionContent { fg = color8 };
        LspSagaCodeActionBorder { fg = color9 };
-- Rename
        LspSagaRenamePromptPrefix { fg = color8 };
        LspSagaRenameBorder { fg = color9 };
-- Hover
        LspSagaHoverBorder { fg = color9 };
        LspSagaSignatureHelpBorder { fg = color9 };
        LspSagaAutoPreview { fg = color8 };
-- Definition
        LspSagaDefPreviewBorder { fg = color9 };
        DefinitionPreviewTitle { fg = color8 };
        ReferencesCount { fg = color8 };
        DefinitionCount { fg = color8 };
        DefinitionIcon { fg = color8 };
        ReferencesIcon { fg = color8 };
-- }}}

-- Lsp Lightbulb {{{
        LightBulbFloatWin { bg = color3, fg = bg };
        LightBulbVirtualText { fg = color3 };
-- }}}

-- Telescope {{{
        TelescopeSelection { bg=color9, fg = color16 };
        TelescopeSelectionCaret { bg=color9, fg = color9 };
-- Group.new('TelescopeMultiSelection',
        TelescopeNormal { bg=bg, fg = color8 };

-- Border highlight groups.
        TelescopeBorder { bg=bg, fg = color9 };

-- Group.new('TelescopePromptBorder',
-- Group.new('TelescopeResultsBorder',
-- Group.new('TelescopePreviewBorder',

-- Used for highlighting characters that you match.
        TelescopeMatching { fg = color16, gui="bold" };

-- Used for the prompt prefix
        TelescopePromptPrefix { fg = color8 };
-- }}}

-- Startify {{{
        StartifyBracket { fg = color9 };
        StartifyFile { fg = color16, gui = 'italic' };
        StartifyFooter { fg = color9 };
        StartifyHeader { fg = color16 };
        StartifyNumber { fg = color8 };
        StartifyPath { fg = color8, gui = 'italic' };
        StartifySection { fg = color8 };
        StartifySelect { fg = color8 };
        StartifySlash { fg = color8, gui = 'italic' };
        StartifySpecial { fg = color9 };
        StartifyVar { fg = color8 };
-- }}}

-- Gitsigns {{{
        DiffAddSign { fg = color3 };
        DiffChangeSign { fg = color5 };
        DiffDeleteSign { fg = color2 };
-- }}}

-- Nvim Tree {{{
        -- NvimTreeNormal { fg = gray02 };

        -- NvimTreeSymlink { fg = gray02 };
        -- NvimTreeFolderName { fg = gray12 };
        -- NvimTreeRootFolder { fg = gray02, gui = 'italic' };
        -- NvimTreeFolderIcon { fg = gray02 };
        -- NvimTreeExecFile { fg = gray02 };
        -- NvimTreeSpecialFile { fg = gray02 };
        -- NvimTreeImageFile { fg = gray02 };
        -- NvimTreeMarkdownFile { fg = gray02 };
        -- NvimTreeIndentMarker { fg = gray02 };

        -- NvimTreeLicenseIcon { fg = gray02 };
        -- NvimTreeYamlIcon { fg = gray02 };
        -- NvimTreeTomlIcon { fg = gray02 };
        -- NvimTreeGitignoreIcon { fg = gray02 };
        -- NvimTreeJsonIcon { fg = gray02 };

        -- NvimTreeLuaIcon { fg = gray02 };
        -- NvimTreePythonIcon { fg = gray02 };
        -- NvimTreeShellIcon { fg = gray02 };
        -- NvimTreeJavascriptIcon { fg = gray02 };
        -- NvimTreeCIcon { fg = gray02 };
        -- NvimTreeReactIcon { fg = gray02 };
        -- NvimTreeHtmlIcon { fg = gray02 };
        -- NvimTreeRustIcon { fg = gray02 };
        -- NvimTreeVimIcon { fg = gray02 };
        -- NvimTreeTypescriptIcon { fg = gray02 };

        -- NvimTreeGitDirty { fg = gray10, gui = 'italic' };
        -- NvimTreeGitStaged { fg = lightgreen, gui = 'italic' };
        -- NvimTreeGitMerge { fg = magenta, gui = 'italic' };
        -- NvimTreeGitRenamed { fg = gray10, gui = 'italic' };
        -- NvimTreeGitNew { fg = gray10, gui = 'italic' };
-- }}}

-- Fern {{{
        FernSpinner { fg = color3 };
        FernMarkedLine { fg = color16 };
        FernMarkedText { fg = color16 };
        FernRootSymbol { fg = color8 };
        FernRootText { fg = color8 };
        FernLeafSymbol { fg = color8 };
        FernLeafText { fg = fg };
        FernBranchSymbol { fg = color8 };
        FernBranchText { fg = fg };
        FernWindowSelectIndicator { Normal };
        FernWindowSelectStatusLine { Normal };
-- }}}

-- Indent Blankline {{{
    IndentBlanklineChar { fg = color1 };
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
        CmpItemKind { fg = fg };

        -- The menu field.
        CmpItemMenu { Normal };
--}}}
}
end)

return theme

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
