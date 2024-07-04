local vim = vim

vim.cmd [[highlight clear]]
vim.cmd [[syntax reset]]

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.colors_name = 'dobri-next'

local HL_NAMESPACE = 0

local colors = {
    Background = '#000000',
    Foreground = '#CED5E5',
    White = '#FFFFFF',
    Black = '#05080a',
    GrayBlue = '#5C6370',
    DarkBlue = '#14344B',
    DarkBlue2 = '#22303E',
    DarkBlue3 = '#18222D',
    Brown = '#523D14',
    LightBrown = '#E0C285',
    Cyan = '#56D6D6',
    BrightBlue = '#61AFEF',
    Blue = '#6796e6',
    LightBlue = '#97a7c8',
    Green = '#A6E22E',
    LightGreen = '#C3E88D',
    LightOrange = '#FFCB6B',
    Purple = '#AE81FF',
    DarkPurple = '#b267e6',
    LightPurple = '#CB6CFE',
    LightYellow = '#E6DB74',
    Yellow = '#FFCC00',
    DarkYellow = '#cd9731',
    Orange = '#F78C6C',
    Magenta = '#FB467B',
         -- x = '#E05252',
    BrightRed = '#f44747',
    LightRed = '#f78787',
}

-- local hi = setmetatable({}, {
--     __index = function (_, highlight_group)
--         return setmetatable({}, {
--             __call = function (_, def)
--                 vim.api.nvim_set_hl(HL_NAMESPACE, highlight_group, def)
--             end
--         })
--     end
-- })
--
-- setfenv(1, hi)
--
-- Normal { fg = colors.Foreground, bg = colors.Background}

-----------------------------------------
--  Editor settings
-----------------------------------------

-- completion menu
----------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'Pmenu', { bg = colors.Black })
vim.api.nvim_set_hl(HL_NAMESPACE, 'PmenuSel', { fg = colors.Yellow, bg = colors.DarkBlue3 })
vim.api.nvim_set_hl(HL_NAMESPACE, 'PmenuSbar', { bg = colors.Black })
vim.api.nvim_set_hl(HL_NAMESPACE, 'PmenuThumb', { bg = colors.DarkBlue2 })
----------------------------------

-- cursor
----------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'Cursor', { fg = colors.Black, bg = colors.Yellow, nocombine = true })
vim.api.nvim_set_hl(HL_NAMESPACE, 'CursorIM', { bg = colors.Yellow })
vim.api.nvim_set_hl(HL_NAMESPACE, 'CursorLine', { bg = colors.Black })
vim.api.nvim_set_hl(HL_NAMESPACE, 'CursorLineNr', { fg = colors.Yellow, bg = colors.Black })
vim.api.nvim_set_hl(HL_NAMESPACE, 'CursorColumn', { bg = colors.Black })
vim.api.nvim_set_hl(HL_NAMESPACE, 'lCursor', { bg = colors.Yellow })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TermCursor', { fg = colors.Black, bg = colors.Yellow })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TermCursorNC', { bg = colors.Yellow })
----------------------------------

-- Lsp: neovim.io/doc/user/lsp.html
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'LspInlayHint', { fg = colors.GrayBlue })

vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticError', {bg = colors.LightRed, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticHint', {bg = colors.LightBlue, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticInfo', {bg = colors.LightGreen, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticWarn', {bg = colors.LightOrange, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingError', {link = 'DiagnosticVirtualTextError'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingHint', {link = 'DiagnosticVirtualTextHint'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingInfo', {link = 'DiagnosticVirtualTextInfo'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingWarn', {link = 'DiagnosticVirtualTextWarn'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignError', {link = 'DiagnosticError'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignHint', {link = 'DiagnosticHint'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignInfo', {link = 'DiagnosticInfo'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignWarn', {link = 'DiagnosticWarn'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineHint', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineInfo', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineWarn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextError', {fg = colors.LightRed})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextHint', {fg = colors.LightBlue})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextInfo', {fg = colors.LightGreen})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextWarn', {fg = colors.LightOrange})
----------------------------------

vim.api.nvim_set_hl(HL_NAMESPACE, 'ColorColumn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Conceal', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CurSearch', { fg = colors.Black, bg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Debug', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Delimiter', { fg = colors.Foreground })
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffAdd', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffAdded', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffChange', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffDelete', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffFile', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffRemoved', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffText', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Error', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'ErrorMsg', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'FloatBorder', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'FoldColumn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Folded', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'IncSearch', { bg = colors.Brown })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Label', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'LineNr', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'MatchParen', { fg = colors.BrightRed })
vim.api.nvim_set_hl(HL_NAMESPACE, 'MatchParenCur', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'MatchWord', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'MatchWordCur', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'ModeMsg', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'MoreMsg', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'MsgArea', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'MsgSeparator', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Normal', { bg = colors.Background, fg = colors.Foreground })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NormalFloat', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NormalNC', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'QuickFixLine', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Search', { bg = colors.Brown })
vim.api.nvim_set_hl(HL_NAMESPACE, 'SignColumn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'StatusLine', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'StatusLineNC', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'StatusLineSeparator', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'StatusLineTerm', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'StatusLineTermNC', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Substitute', { bg = colors.Brown })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Underline', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'VertSplit', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Visual', { bg = colors.DarkBlue3 })
vim.api.nvim_set_hl(HL_NAMESPACE, 'VisualNOS', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'WarningMsg', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Whitespace', { fg = colors.Black, bg = colors.BrightRed})
vim.api.nvim_set_hl(HL_NAMESPACE, 'WildMenu', {})
-----------------------------------------
--  end Editor settings
-----------------------------------------


-----------------------------------------
-- LANGUAGE SYNTAX
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'Annotation', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Attribute', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Boolean', { fg = colors.Magenta, italic = true })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Character', { fg = colors.Cyan })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Repeat', { fg = colors.LightPurple })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Comment', { fg = colors.GrayBlue, italic = true })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Conditional', { fg = colors.LightPurple })
vim.api.nvim_set_hl(HL_NAMESPACE, 'ConstBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'ConstMacro', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Constant', { fg = colors.Cyan })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Constructor', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Define', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Emphasis', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Exception', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Field', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Float', { fg = colors.Orange })
vim.api.nvim_set_hl(HL_NAMESPACE, 'FuncBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'FuncMacro', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Function', { fg = colors.Yellow })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Identifier', { fg = colors.Orange })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Ignore', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Include', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Keyword', { fg = colors.DarkPurple })
vim.api.nvim_set_hl(HL_NAMESPACE, 'KeywordFunction', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'KeywordOperator', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'KeywordReturn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Literal', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Macro', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Method', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Namespace', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NonText', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Note', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Number', { fg = colors.Orange })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Operator', { fg = colors.Cyan })
vim.api.nvim_set_hl(HL_NAMESPACE, 'Parameter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'ParameterReference', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'PreCondit', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'PreProc', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Property', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'PunctBracket', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'PunctDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'PunctSpecial', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'QueryLinterError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Question', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Special', { fg = colors.BrightBlue })
vim.api.nvim_set_hl(HL_NAMESPACE, 'SpecialChar', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'SpecialComment', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'SpecialKey', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'SpellBad', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'SpellCap', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'SpellLocal', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'SpellRare', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Statement', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'StorageClass', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'String', { fg = colors.LightGreen })
vim.api.nvim_set_hl(HL_NAMESPACE, 'StringEscape', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'StringRegex', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Strong', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Structure', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Symbol', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TabLine', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TabLineFill', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TabLineSel', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TableBlock', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Tag', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TagAttribute', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TagDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Text', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Title', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Todo', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Type', { fg = colors.Purple })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TypeBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Typedef', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'URI', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Variable', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'VariableBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'Warning', {})
-----------------------------------------
-- end LANGUAGE SYNTAX
-----------------------------------------


-----------------------------------------
-- PLUGIN SPECIFIC
-----------------------------------------

-- Notify: https://github.com/rcarriga/nvim-notify
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyERRORBorder', { fg = '#8A1F1F' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyWARNBorder', { fg = '#79491D' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyINFOBorder', { fg = '#4F6752' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyDEBUGBorder', { fg = '#8B8B8B' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyTRACEBorder', { fg = '#4F3552' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyERRORIcon', { fg = '#F70067' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyWARNIcon', { fg = '#F79000' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyINFOIcon', { fg = '#A9FF68' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyDEBUGIcon', { fg = '#8B8B8B' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyTRACEIcon', { fg = '#D484FF' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyERRORTitle', {  fg = '#F70067' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyWARNTitle', { fg = '#F79000' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyINFOTitle', { fg = '#A9FF68' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyDEBUGTitle', {  fg = '#8B8B8B' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyTRACETitle', {  fg = '#D484FF' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyERRORBody', { link = 'Normal' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyWARNBody', { link = 'Normal' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyINFOBody', { link = 'Normal' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyDEBUGBody', { link = 'Normal' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'NotifyTRACEBody', { link = 'Normal' })

-- todo-comments: https://github.com/folke/todo-comments.nvim
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'TodoError', { fg = colors.Magenta })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TodoWran', { fg = colors.LightOrange })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TodoInfo', { fg = colors.Purple })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TodoHint', { fg = colors.Blue })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TodoDefault', { fg = colors.LightGreen })
vim.api.nvim_set_hl(HL_NAMESPACE, 'TodoTest', { fg = colors.LightBlue })

-- Buffer:
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferCloseButtonSelected', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferCurrent', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferCurrentIndex', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferCurrentMod', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferCurrentSign', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferCurrentTarget', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferInactive', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferInactiveIndex', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferInactiveMod', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferInactiveSign', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferInactiveTarget', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferIndicatorSelected', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferLineFill', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BuffNumbers', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferVisible', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferVisibleIndex', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferVisibleMod', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferVisibleSign', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferVisibleTarget', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'BufferSelected', {})

-- Tabs
vim.api.nvim_set_hl(HL_NAMESPACE, 'TabSelectedFG', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TabSelectedBG', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TabFG', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TabBG', {})
-----------------------------------------


-- Cmp: github.com/hrsh7th/nvim-cmp
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpDocumentation', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpDocumentationBorder', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemAbbr', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemAbbrDeprecated', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemAbbrMatch', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemAbbrMatchFuzzy', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemMenu', {})
-- icon colors
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKind', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindClass', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindFunction', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindInterface', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindKeyword', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindMethod', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindProperty', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindText', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindUnit', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'CmpItemKindVariable', {})
-----------------------------------------


-- Dashboard: github.com/glepnir/dashboard-nvim
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'DashboardCenter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DashboardFooter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DashboardHeader', {})
-----------------------------------------


--  Debug:
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'debugBreakpoint', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'debugPc', {})
-----------------------------------------


-- Diffview
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffViewNormal', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffviewFilePanelDeletion', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffviewFilePanelInsertion', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffviewStatusAdded', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffviewStatusDeleted', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffviewStatusModified', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffviewStatusRenamed', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiffviewVertSplit', {})
-----------------------------------------


-- Gitsigns: github.com/lewis6991/gitsigns.nvim
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'GitSignsAdd', { fg = colors.Green })
vim.api.nvim_set_hl(HL_NAMESPACE, 'GitSignsChange', { fg = colors.Yellow })
vim.api.nvim_set_hl(HL_NAMESPACE, 'GitSignsDelete', { fg = colors.Magenta })
-----------------------------------------


-- gitgutter: github.com/airblade/vim-gitgutter
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'GitGutterAdd', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'GitGutterChange', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'GitGutterDelete', {})
-----------------------------------------


-- Indent-blankline: github.com/lukas-reineke/indent-blankline.nvim
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'IblScope', { fg = colors.DarkBlue3 })
vim.api.nvim_set_hl(HL_NAMESPACE, 'IblIndent', { fg = '#0c1317' })
vim.api.nvim_set_hl(HL_NAMESPACE, 'IblWhitespace', { fg = colors.Black })
-----------------------------------------


-- Lsp: neovim.io/doc/user/lsp.html
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticError', {bg = colors.LightRed, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticHint', {bg = colors.LightBlue, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticInfo', {bg = colors.LightGreen, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticWarn', {bg = colors.LightOrange, fg = colors.Background})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingError', {link = 'DiagnosticVirtualTextError'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingHint', {link = 'DiagnosticVirtualTextHint'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingInfo', {link = 'DiagnosticVirtualTextInfo'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticFloatingWarn', {link = 'DiagnosticVirtualTextWarn'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignError', {link = 'DiagnosticError'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignHint', {link = 'DiagnosticHint'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignInfo', {link = 'DiagnosticInfo'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticSignWarn', {link = 'DiagnosticWarn'})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineHint', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineInfo', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticUnderlineWarn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextError', {fg = colors.LightRed})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextHint', {fg = colors.LightBlue})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextInfo', {fg = colors.LightGreen})
vim.api.nvim_set_hl(HL_NAMESPACE, 'DiagnosticVirtualTextWarn', {fg = colors.LightOrange})
-----------------------------------------


-- lspsaga.nvim: https://github.com/glepnir/lspsaga.nvim
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'LspSagaLightBulb', {})


-- fidget.nvim: https://github.com/j-hui/fidget.nvim
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'FidgetTitle', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'FidgetTask', {})
-----------------------------------------


-- vim-indent-guides: github.com/nathanaelkane/vim-indent-guides
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'IndentGuidesEven', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'IndentGuidesOdd', {})
-----------------------------------------


-- flutter-tools.nvim: github.com/akinsho/flutter-tools.nvim/
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'FlutterWidgetGuides', {})
-----------------------------------------


-- Neogit: github.com/TimUntersberger/neogit
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitBranch', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitDiffAdd', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitDiffContext', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitDiffDelete', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitHunkHeader', {})
-- Neogit...Highlight is when group is focused
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitDiffAddHighlight', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitDiffContextHighlight', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitDiffDeleteHighlight', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitHunkHeaderHighlight', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NeogitRemote', {})
-----------------------------------------


-- Nvim-tree: github.com/kyazdani42/nvim-tree.lua
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeCursorLine', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeExecFile', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeFolderIcon', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeFolderName', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeGitDeleted', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeGitDirty', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeGitMerge', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeGitNew', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeGitRenamed', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeGitStaged', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeImageFile', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeIndentMarker', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeNormal', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeRootFolder', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeSpecialFile', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeSymlink', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeVertSplit', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'NvimTreeOpenedFolderName', {})
-----------------------------------------


-- telescope: github.com/nvim-telescope/telescope.nvim
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'TelescopeBorder', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TelescopeMatching', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TelescopePromptPrefix', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TelescopeSelection', {})
-----------------------------------------


-- https://github.com/folke/trouble.nvim
-----------------------------------------
-- TroubleTextInformation = { fg=colors.red, bg=colors.green },
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleFile', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleFoldIcon', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleCount', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleTextError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleNormal', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleLocation', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleIndent', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleSignError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleSignWarn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleCode', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TroubleSignHint', {})
-- TroubleError       = { fg=colors.red, bg=colors.green },
-- TroubleWarning     = { fg=colors.red, bg=colors.green },
-- TroublePreview     = { fg=colors.red, bg=colors.green },
-- TroubleSource      = { fg=colors.red, bg=colors.green },
-- TroubleSignOther   = { fg=colors.red, bg=colors.green },
-- TroubleTextWarning = { fg=colors.red, bg=colors.green },
-- TroubleInformation = { fg=colors.red, bg=colors.green },
-- TroubleHint        = { fg=colors.red, bg=colors.green },
-- TroubleTextHint    = { fg=colors.red, bg=colors.green },
-- TroubleText        = { fg=colors.red, bg=colors.green },
-- TroubleSignInformation = { fg=colors.red, bg=colors.green },
-----------------------------------------

-----------------------------------------
-- end PLUGIN SPECIFIC
-----------------------------------------


-----------------------------------------
-- LANGUAGE SYNTAX
-----------------------------------------

-- Lua
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, '@punctuation.bracket.lua', { fg = colors.Yellow })
vim.api.nvim_set_hl(HL_NAMESPACE, '@keyword.operator.lua', { fg = colors.Cyan })
vim.api.nvim_set_hl(HL_NAMESPACE, '@lsp.typemod.function.defaultLibrary.lua', { fg = colors.Cyan })

-- ini
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.ini', { link = 'String' })

-- Markdown
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.1.markdown', { fg = colors.LightOrange })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.2.markdown', { fg = colors.LightOrange })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.3.markdown', { fg = colors.LightOrange })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.4.markdown', { fg = colors.LightOrange })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.5.markdown', { fg = colors.LightOrange })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.6.markdown', { fg = colors.LightOrange })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.1.marker.markdown', { fg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.2.marker.markdown', { fg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.3.marker.markdown', { fg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.4.marker.markdown', { fg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.5.marker.markdown', { fg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.title.6.marker.markdown', { fg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, '@punctuation.special.markdown', { fg = colors.LightBrown })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.strong.markdown_inline', { fg = colors.LightGreen, bold = true })
vim.api.nvim_set_hl(HL_NAMESPACE, '@text.emphasis.markdown_inline', { fg = colors.LightGreen, italic = true })
vim.api.nvim_set_hl(HL_NAMESPACE, '@punctuation.delimiter.markdown_inline', { fg = colors.Green, bold = true })

-- Markdown
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownH1', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownH2', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownH3', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownH4', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownH5', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownH6', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownId', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownUrl', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownRule', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownBold', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownCode', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownItalic', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownCodeBlock', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownCodeError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownLinkText', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownListMarker', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownCodeSpecial', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownCodeDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownBlockquote', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownIdDeclaration', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownIdDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownLinkDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownHeadingRule', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownHeadingDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownUrlTitleDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'markdownOrderedListMarker', {})

-----------------------------------------


-- HTML language:
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'htmlArg', {})
-----------------------------------------


-- CSS / SASS / SCSS
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssFlexibleBoxAttr', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssColor', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssUnitDecorators', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssTagName', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssBoxProp', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssBraces', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssUIProp', {})

vim.api.nvim_set_hl(HL_NAMESPACE, 'sassDefinition', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'sassProperty', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'sassCssAttribute', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'sassInclude', {})

vim.api.nvim_set_hl(HL_NAMESPACE, 'cssTSPunctDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssTSPunctBracket', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssTSProperty', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cssTSType', {})

vim.api.nvim_set_hl(HL_NAMESPACE, 'scssTSProperty', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'scssTSPunctBracket', {})
-----------------------------------------


-- JSON Language
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'jsonLabel', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'jsonKeyword', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'jsonKeywordMatch', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'jsonString', {})

vim.api.nvim_set_hl(HL_NAMESPACE, 'jsonTSLabel', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'jsonTSPunctBracket', {})
-----------------------------------------


-- MAKE Language
-----------------------------------------
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeCommand', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeArguments', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeKWvariable_watch', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeKWproject', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeGeneratorExpressions', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeVariable', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeKWuse_mangled_mesa', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'cmakeTSVariable', {})
-----------------------------------------


-----------------------------------------
-- end LANGUAGE SYNTAX
-----------------------------------------


-----------------------------------------
-- treesitter:  github.com/nvim-treesitter/nvim-treesitter
-----------------------------------------

vim.api.nvim_set_hl(HL_NAMESPACE, 'TSTitle', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSURI', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSVariable', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSParameter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSComment', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSKeyword', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSType', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSInclude', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSString', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSFunction', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSKeywordFunction', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSKeywordReturn', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSKeywordOperator', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSOperator', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSConditional', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSException', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSBoolean', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSNumber', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSMethod', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSConstructor', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSFuncBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSWarning', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSNote', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSTag', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSTagAttribute', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSAnnotation', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSAttribute', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSCharacter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSConstBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSConstMacro', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSConstant', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSField', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSFloat', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSFuncMacro', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSLabel', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSLiteral', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSNamespace', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSProperty', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSPunctBracket', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSPunctDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSPunctSpecial', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSRepeat', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSStringEscape', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSStringRegex', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSStrong', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSStructure', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSSymbol', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSTagDelimiter', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSText', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSQueryLinterError', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSTypeBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSVariableBuiltin', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSParameterReference', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSEmphasis', {})
vim.api.nvim_set_hl(HL_NAMESPACE, 'TSUnderline', {})
-----------------------------------------

vim.api.nvim_set_hl_ns(HL_NAMESPACE)
