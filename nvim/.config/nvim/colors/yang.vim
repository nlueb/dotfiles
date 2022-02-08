let g:colors_name="yang"
set background=light
highlight! link TSBoolean Boolean
highlight! link TSCharacter Character
highlight ColorColumn guifg=NONE guibg=#FFFFFF guisp=NONE gui=NONE blend=NONE
highlight Comment guifg=#A8A8A8 guibg=NONE guisp=NONE gui=italic blend=NONE
highlight! link TSConditional Conditional
highlight Constant guifg=#9E9E9E guibg=NONE guisp=NONE gui=bold blend=NONE
highlight! link Character Constant
highlight! link TSConstant Constant
highlight Cursor guifg=NONE guibg=#A8A8A8 guisp=NONE gui=NONE blend=NONE
highlight CursorLine guifg=NONE guibg=#E3E3E3 guisp=NONE gui=NONE blend=NONE
highlight! link CursorColumn CursorLine
highlight CursorLineNr guifg=#9E9E9E guibg=NONE guisp=NONE gui=bold blend=NONE
highlight! link TSConstMacro Define
highlight! link TSPunctBracket Delimiter
highlight! link TSPunctDelimiter Delimiter
highlight! link TSPunctSpecial Delimiter
highlight! link TSTagDelimiter Delimiter
highlight DiffAdd guifg=#F7F7F7 guibg=#69974E guisp=NONE gui=NONE blend=NONE
highlight DiffAddSign guifg=#A6C856 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight DiffAdded guifg=#69974E guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight DiffChange guifg=#F7F7F7 guibg=#70D7FF guisp=NONE gui=NONE blend=NONE
highlight DiffChangeSign guifg=#00BBFA guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight DiffChanged guifg=#00BBFA guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight DiffDelete guifg=#F7F7F7 guibg=#FF5C61 guisp=NONE gui=NONE blend=NONE
highlight DiffDeleteSign guifg=#FF5C61 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight DiffRemoved guifg=#FF5C61 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight DiffText guifg=#F7F7F7 guibg=#00BBFA guisp=NONE gui=NONE blend=NONE
highlight Directory guifg=#808080 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight EndOfBuffer guifg=#E3E3E3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Error guifg=#FF5C61 guibg=NONE guisp=NONE gui=bold blend=NONE
highlight! link CmpItemAbbrDeprecated Error
highlight! link CmpItemAbbrMatch Error
highlight! link CmpItemAbbrMatchFuzzy Error
highlight! link ErrorMsg Error
highlight! link TSException Exception
highlight Float guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TSFloat Float
highlight FoldColumn guifg=#808080 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link SignColumn FoldColumn
highlight Function guifg=#6B6B6B guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TSFunction Function
highlight! link TSMethod Function
highlight Identifier guifg=#6B6B6B guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TSField Identifier
highlight! link TSParameter Identifier
highlight! link TSProperty Identifier
highlight IncSearch guifg=#F7F7F7 guibg=#9E9E9E guisp=NONE gui=bold blend=NONE
highlight! link TSInclude Include
highlight! link TSNamespace Include
highlight IndentBlanklineChar guifg=#E3E3E3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Keyword guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TSKeyword Keyword
highlight! link TSKeywordFunction Keyword
highlight! link TSLabel Label
highlight! link TSTag Label
highlight LineNr guifg=#B3B3B3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link Folded LineNr
highlight LspDiagnosticsDefaultError guifg=#FF5C61 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link DiagnosticError LspDiagnosticsDefaultError
highlight! link LspDiagnosticsSignError LspDiagnosticsDefaultError
highlight! link LspDiagnosticsVirtualTextError LspDiagnosticsDefaultError
highlight LspDiagnosticsDefaultHint guifg=#242424 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link DiagnosticHint LspDiagnosticsDefaultHint
highlight! link LspDiagnosticsSignHint LspDiagnosticsDefaultHint
highlight! link LspDiagnosticsVirtualTextHint LspDiagnosticsDefaultHint
highlight LspDiagnosticsDefaultInformation guifg=#00BBFA guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link DiagnosticInfo LspDiagnosticsDefaultInformation
highlight! link LspDiagnosticsSignInformation LspDiagnosticsDefaultInformation
highlight! link LspDiagnosticsVirtualTextInformation LspDiagnosticsDefaultInformation
highlight LspDiagnosticsDefaultWarning guifg=#FF9F1A guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link DiagnosticWarn LspDiagnosticsDefaultWarning
highlight! link LspDiagnosticsSignWarning LspDiagnosticsDefaultWarning
highlight! link LspDiagnosticsVirtualTextWarning LspDiagnosticsDefaultWarning
highlight LspDiagnosticsFloatingError guifg=#FF5C61 guibg=NONE guisp=NONE gui=italic blend=NONE
highlight! link DiagnosticFloatingError LspDiagnosticsFloatingError
highlight LspDiagnosticsFloatingHint guifg=#242424 guibg=NONE guisp=NONE gui=italic blend=NONE
highlight! link DiagnosticFloatingHint LspDiagnosticsFloatingHint
highlight LspDiagnosticsFloatingInformation guifg=#00BBFA guibg=NONE guisp=NONE gui=italic blend=NONE
highlight! link DiagnosticFloatingInfo LspDiagnosticsFloatingInformation
highlight LspDiagnosticsFloatingWarning guifg=#FF9F1A guibg=NONE guisp=NONE gui=italic blend=NONE
highlight! link DiagnosticFloatingWarn LspDiagnosticsFloatingWarning
highlight! link DiagnosticSignError LspDiagnosticsSignError
highlight! link DiagnosticSignHint LspDiagnosticsSignHint
highlight! link DiagnosticSignInfo LspDiagnosticsSignInformation
highlight! link DiagnosticSignWarn LspDiagnosticsSignWarning
highlight LspDiagnosticsUnderlineError guifg=#FF5C61 guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight! link DiagnosticUnderlineError LspDiagnosticsUnderlineError
highlight LspDiagnosticsUnderlineHint guifg=#242424 guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight! link DiagnosticUnderlineHint LspDiagnosticsUnderlineHint
highlight LspDiagnosticsUnderlineInformation guifg=#00BBFA guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight! link DiagnosticUnderlineInfo LspDiagnosticsUnderlineInformation
highlight LspDiagnosticsUnderlineWarning guifg=#FF9F1A guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight! link DiagnosticUnderlineWarn LspDiagnosticsUnderlineWarning
highlight! link DiagnosticVirtualTextError LspDiagnosticsVirtualTextError
highlight! link DiagnosticVirtualTextHint LspDiagnosticsVirtualTextHint
highlight! link DiagnosticVirtualTextInfo LspDiagnosticsVirtualTextInformation
highlight! link DiagnosticVirtualTextWarn LspDiagnosticsVirtualTextWarning
highlight! link TSFuncMacro Macro
highlight MatchParen guifg=#EF486F guibg=NONE guisp=NONE gui=bold blend=NONE
highlight ModeMsg guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight MoreMsg guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight NonText guifg=#B3B3B3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Normal guifg=#616161 guibg=#F7F7F7 guisp=NONE gui=NONE blend=NONE
highlight! link Conceal Normal
highlight! link TSEmphasis Normal
highlight! link TSStrong Normal
highlight! link TSText Normal
highlight! link TSUnderline Normal
highlight NormalFloat guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Number guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link Boolean Number
highlight! link TSNumber Number
highlight Operator guifg=#4D4D4D guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TSOperator Operator
highlight Pmenu guifg=#616161 guibg=#EDEDED guisp=NONE gui=NONE blend=NONE
highlight! link CmpItemAbbr Pmenu
highlight! link CmpItemKind Pmenu
highlight! link CmpItemMenu Pmenu
highlight PmenuSbar guifg=#F7F7F7 guibg=#E3E3E3 guisp=NONE gui=NONE blend=NONE
highlight PmenuSel guifg=NONE guibg=#BDBDBD guisp=NONE gui=NONE blend=NONE
highlight PmenuThumb guifg=#BDBDBD guibg=#949494 guisp=NONE gui=NONE blend=NONE
highlight PreProc guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link Define PreProc
highlight! link Include PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc
highlight! link TSAnnotation PreProc
highlight! link TSAttribute PreProc
highlight! link TSRepeat Repeat
highlight SLDarkText guifg=#FFFFFF guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLDimText guifg=#E3E3E3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLError guifg=#FF5C61 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLHint guifg=#242424 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLInfo guifg=#00BBFA guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLLightSep guifg=#E3E3E3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLLightText guifg=#8A8A8A guibg=#E3E3E3 guisp=NONE gui=NONE blend=NONE
highlight SLModeSep guifg=#575757 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLModeText guifg=#F7F7F7 guibg=#575757 guisp=NONE gui=bold blend=NONE
highlight SLNormalText guifg=#8A8A8A guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SLWarning guifg=#FF9F1A guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Search guifg=#E3E3E3 guibg=#4D4D4D guisp=NONE gui=NONE blend=NONE
highlight Special guifg=#949494 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link Debug Special
highlight! link Delimiter Special
highlight! link Question Special
highlight! link SpecialChar Special
highlight! link TSConstBuiltin Special
highlight! link TSConstructor Special
highlight! link TSFuncBuiltin Special
highlight! link TSVariableBuiltin Special
highlight! link Tag Special
highlight! link TSStringEscape SpecialChar
highlight SpecialComment guifg=#A8A8A8 guibg=NONE guisp=NONE gui=bold blend=NONE
highlight SpecialKey guifg=#B3B3B3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight SpellBad guifg=#FF5C61 guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight SpellCap guifg=#FF5C61 guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight SpellLocal guifg=#FF5C61 guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight SpellRare guifg=#B08969 guibg=NONE guisp=NONE gui=undercurl blend=NONE
highlight StartifyBracket guifg=#424242 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight StartifyFile guifg=#949494 guibg=NONE guisp=NONE gui=italic blend=NONE
highlight StartifyFooter guifg=#424242 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight StartifyHeader guifg=#424242 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight StartifyNumber guifg=#B3B3B3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight StartifyPath guifg=#424242 guibg=NONE guisp=NONE gui=italic blend=NONE
highlight StartifySection guifg=#B3B3B3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight StartifySelect guifg=#FF5C61 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight StartifySlash guifg=#424242 guibg=NONE guisp=NONE gui=italic blend=NONE
highlight StartifySpecial guifg=#424242 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight StartifyVar guifg=#B3B3B3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Statement guifg=#808080 guibg=NONE guisp=NONE gui=bold blend=NONE
highlight! link Conditional Statement
highlight! link Exception Statement
highlight! link Label Statement
highlight! link Repeat Statement
highlight StatusLine guifg=#4D4D4D guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TabLineSel StatusLine
highlight StatusLineNC guifg=#B3B3B3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight String guifg=#808080 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TSLiteral String
highlight! link TSString String
highlight! link TSStringRegex String
highlight TSDefinition guifg=#EF486F guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight TSDefinitionUsage guifg=#0F0F0F guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight! link TSKeywordOperator TSOperator
highlight! link TSParameterReference TSParameter
highlight TelescopeBorder guifg=#808080 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight TelescopeMatching guifg=#424242 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight TelescopeNormal guifg=#9E9E9E guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight TelescopePromptPrefix guifg=#575757 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight TelescopeSelection guifg=#9E9E9E guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight TelescopeSelectionCaret guifg=#0F0F0F guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Title guifg=#949494 guibg=NONE guisp=NONE gui=bold blend=NONE
highlight! link TSTitle Title
highlight Todo guifg=#C880FF guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Type guifg=#8A8A8A guibg=NONE guisp=NONE gui=bold blend=NONE
highlight! link StorageClass Type
highlight! link Structure Type
highlight! link TSType Type
highlight! link TSTypeBuiltin Type
highlight! link Typedef Type
highlight Underlined guifg=#808080 guibg=NONE guisp=NONE gui=underline blend=NONE
highlight! link TSURI Underlined
highlight VertSplit guifg=#FFFFFF guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Visual guifg=#F7F7F7 guibg=#6B6B6B guisp=NONE gui=NONE blend=NONE
highlight! link TSPlaygroundFocus Visual
highlight! link VisualNOS Visual
highlight WarningMsg guifg=#B08969 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight Whitespace guifg=#E3E3E3 guibg=NONE guisp=NONE gui=NONE blend=NONE
highlight WildMenu guifg=#808080 guibg=NONE guisp=NONE gui=NONE blend=NONE
