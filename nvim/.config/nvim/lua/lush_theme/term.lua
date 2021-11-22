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


local color0  = hsl(get_xresources_color('color0'))
local color1  = hsl(get_xresources_color('color1'))
local color2  = hsl(get_xresources_color('color2'))
local color3  = hsl(get_xresources_color('color3'))
local color4  = hsl(get_xresources_color('color4'))
local color5  = hsl(get_xresources_color('color5'))
local color6  = hsl(get_xresources_color('color6'))
local color7  = hsl(get_xresources_color('color7'))
local color8  = hsl(get_xresources_color('color8'))
local color9 = hsl(get_xresources_color('color9'))
local color10 = hsl(get_xresources_color('color10'))
local color11 = hsl(get_xresources_color('color11'))
local color12 = hsl(get_xresources_color('color12'))
local color13 = hsl(get_xresources_color('color13'))
local color14 = hsl(get_xresources_color('color14'))
local color15 = hsl(get_xresources_color('color15'))

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
        Whitespace { fg = color0 };
        EndOfBuffer { fg = color0 };
        Conceal { Normal };
        Constant { fg = fg, gui = 'bold' };
        Character { Constant };
        String { fg = color6 };
        Number { fg = color6 };
        Float { fg = color6 };
        NormalFloat { bg = color0, fg = color8 };
        Boolean { Number };
        Identifier { fg = color7 };
        Function { fg = color3, gui='bold' };
        Statement { fg = color5, gui = 'bold' };
        Conditional { Statement };
        Repeat { Statement };
        Label { Statement };
        Exception { Statement };
        Operator { fg = fg };
        Keyword { fg = color7 };
        PreProc { fg = color7 };
        Include { PreProc };
        Define { PreProc };
        Macro { PreProc };
        PreCondit { PreProc };
        Type { fg = fg, gui = 'bold' };
        StorageClass { Type };
        Structure { Type };
        Typedef { Type };
        Special { fg = color7 };
        SpecialChar { Special };
        Tag { Special };
        Delimiter { Special };
        Debug { Special };
        Question { Special };
        SpecialComment { fg = color15, gui = 'bold' };
        Title { fg = color15, gui = 'bold' };
        Todo { fg = bg, bg=color1 };
        Comment { fg = color8, gui = 'italic' };
        LineNr { fg = color8 };
        Folded { LineNr, gui = 'italic' };
        FoldColumn { bg = color7, fg = color9 };
        SignColumn { fg = color7 };
        ColorColumn { bg = color8 };
        CursorLine { bg = color0 };
        CursorColumn { CursorLine };
        CursorLineNr { LineNr, fg = color7, gui = 'bold' };
        Visual { bg = color8, fg = color15 };
        VisualNOS { Visual };
        Search { bg = color3, fg = bg };
        IncSearch { bg = fg, fg = bg, gui = 'bold' };
        SpellBad { fg = color1, gui = 'undercurl' };
        SpellCap { fg = color1, gui = 'undercurl' };
        SpellLocal { fg = color1, gui = 'undercurl' };
        SpellRare { fg = color3, gui = 'undercurl' };
        Error { fg = color1, gui = 'bold' };
        ErrorMsg { Error };
        ErrorMsg { fg = color1 };
        WarningMsg { fg = color3 };
        ModeMsg { fg = color7 };
        MoreMsg { fg = color7 };
        MatchParen { fg = color1, gui = 'bold' };
        Cursor { bg = color7 };
        Underlined { fg = color7, gui = 'underline' };
        SpecialKey { fg = color7 };
        NonText { fg = color7 };
        Directory { fg = color7 };
        Pmenu { fg = color7 };
        PmenuSbar { fg = color7 };
        -- PmenuSbar { bg = Error.fg };
        -- PmenuThumb { bg = gray09, fg = gray03 };
        PmenuThumb { bg = color7};
        PmenuSel { bg = color8, fg = color15 };
        StatusLine { Normal , fg = color7 };
        TabLineSel { StatusLine };
        StatusLineNC { StatusLine, fg = color7 };
        TabLine { StatusLineNC };
        TabLineFill { StatusLineNC };
        WildMenu { fg = color7 };
        VertSplit { fg = color8 };
        DiffAdd { bg = color2, fg = bg };
        DiffChange { bg = color4, fg = bg };
        DiffDelete { bg = color1, fg = bg };
        DiffText { bg = color3, fg = bg };
        DiffAdded { fg = color2 };
        DiffChanged { fg = color4 };
        DiffRemoved { fg = color1 };
-- }}}

-- Status Line {{{
        SLModeText { bg = color0, fg = fg, gui = 'bold' };
        SLModeSep { bg = bg, fg = color0 };
        SLNormalText { bg = bg, fg = color7 };
        SLDimText { bg = bg, fg = color7 };
        SLLightText { bg = color0, fg = fg, gui = 'italic' };
        SLLightSep { bg = bg, fg = color0 };
        SLDarkText { bg = bg, fg = color0 };
        SLError { fg = color1 };
        SLWarning { fg = color3 };
        SLInfo { fg = color2 };
        SLHint { fg = color7 };
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
        TSDefinitionUsage { fg = color15, gui= 'bold' };
        TSDefinition { fg = color5, gui= 'bold' };
-- }}}

-- }}}

-- LSP {{{
        LspDiagnosticsDefaultHint { fg = color7 };
        LspDiagnosticsVirtualTextHint { LspDiagnosticsDefaultHint, gui = 'italic' };
        LspDiagnosticsFloatingHint { LspDiagnosticsDefaultHint };
        LspDiagnosticsSignHint { LspDiagnosticsDefaultHint };
        LspDiagnosticsUnderlineHint { LspDiagnosticsDefaultHint, gui = 'italic' };

        LspDiagnosticsDefaultError { fg = color1 };
        LspDiagnosticsVirtualTextError { LspDiagnosticsDefaultError, gui = 'italic' };
        LspDiagnosticsFloatingError { LspDiagnosticsDefaultError };
        LspDiagnosticsSignError { LspDiagnosticsDefaultError };
        LspDiagnosticsUnderlineError { LspDiagnosticsDefaultError, gui = 'italic' };

        LspDiagnosticsDefaultWarning { fg = color3 };
        LspDiagnosticsVirtualTextWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };
        LspDiagnosticsFloatingWarning { LspDiagnosticsDefaultWarning };
        LspDiagnosticsSignWarning { LspDiagnosticsDefaultWarning };
        LspDiagnosticsUnderlineWarning { LspDiagnosticsDefaultWarning, gui = 'italic' };

        LspDiagnosticsDefaultInformation { fg = color2 };
        LspDiagnosticsVirtualTextInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
        LspDiagnosticsFloatingInformation { LspDiagnosticsDefaultInformation };
        LspDiagnosticsSignInformation { LspDiagnosticsDefaultInformation };
        LspDiagnosticsUnderlineInformation { LspDiagnosticsDefaultInformation, gui = 'italic' };
-- }}}

-- Lsp Saga {{{
-- Misc
        LspFloatWinBorder { fg = color8 };
        LspSagaBorderTitle { fg = color7, gui = 'bold' };
        TargetWord { fg = color15 };
        TargetFileName { fg = color15 };
        ProviderTruncateLine { fg = color8 };
        SagaShadow { fg = color1 };
        LspSagaFinderSelection { fg = color7 };
-- Diagnostic
        LspLinesDiagBorder { fg = color8 };
        DiagnosticTruncateLine { fg = color8 };
        DiagnosticError { Normal };
        DiagnosticWarning { Normal };
        DiagnosticInformation { Normal };
        DiagnosticHint { Normal };
        LspSagaShTruncateLine { fg = color8 };
        LspSagaDocTruncateLine { fg = color8 };
        LineDiagTuncateLine { fg = color8 };
-- Code Action
        LspSagaCodeActionTitle { fg = color7 };
        LspSagaCodeActionTruncateLine { fg = color8 };
        LspSagaCodeActionContent { fg = color7 };
        LspSagaCodeActionBorder { fg = color8 };
-- Rename
        LspSagaRenamePromptPrefix { fg = color7 };
        LspSagaRenameBorder { fg = color8 };
-- Hover
        LspSagaHoverBorder { fg = color8 };
        LspSagaSignatureHelpBorder { fg = color8 };
        LspSagaAutoPreview { fg = color7 };
-- Definition
        LspSagaDefPreviewBorder { fg = color8 };
        DefinitionPreviewTitle { fg = color7 };
        ReferencesCount { fg = color7 };
        DefinitionCount { fg = color7 };
        DefinitionIcon { fg = color7 };
        ReferencesIcon { fg = color7 };
-- }}}

-- Lsp Lightbulb {{{
        LightBulbFloatWin { bg = color2, fg = bg };
        LightBulbVirtualText { fg = color2 };
-- }}}

-- Telescope {{{
        TelescopeSelection { bg=color8, fg = color15 };
        TelescopeSelectionCaret { bg=color8, fg = color9 };
-- Group.new('TelescopeMultiSelection',
        TelescopeNormal { bg=bg, fg = color7 };

-- Border highlight groups.
        TelescopeBorder { bg=bg, fg = color8 };

-- Group.new('TelescopePromptBorder',
-- Group.new('TelescopeResultsBorder',
-- Group.new('TelescopePreviewBorder',

-- Used for highlighting characters that you match.
        TelescopeMatching { fg = color15, gui="bold" };

-- Used for the prompt prefix
        TelescopePromptPrefix { fg = color7 };
-- }}}

-- Startify {{{
        StartifyBracket { fg = color8 };
        StartifyFile { fg = color15, gui = 'italic' };
        StartifyFooter { fg = color8 };
        StartifyHeader { fg = color15 };
        StartifyNumber { fg = color7 };
        StartifyPath { fg = color7, gui = 'italic' };
        StartifySection { fg = color7 };
        StartifySelect { fg = color7 };
        StartifySlash { fg = color7, gui = 'italic' };
        StartifySpecial { fg = color8 };
        StartifyVar { fg = color7 };
-- }}}

-- Gitsigns {{{
        DiffAddSign { fg = color2 };
        DiffChangeSign { fg = color4 };
        DiffDeleteSign { fg = color1 };
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
        FernSpinner { fg = color2 };
        FernMarkedLine { fg = color15 };
        FernMarkedText { fg = color15 };
        FernRootSymbol { fg = color7 };
        FernRootText { fg = color7 };
        FernLeafSymbol { fg = color7 };
        FernLeafText { fg = fg };
        FernBranchSymbol { fg = color7 };
        FernBranchText { fg = fg };
        FernWindowSelectIndicator { Normal };
        FernWindowSelectStatusLine { Normal };
-- }}}

-- Indent Blankline {{{
    IndentBlanklineChar { fg = color0 };
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
