--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- Colors {{{
local base = hsl(249, 23, 12)
local surface = hsl(247, 23, 15)
local overlay = hsl(248, 25, 18)
local inactive = hsl(250, 13, 36)
local subtle = hsl(249, 12, 47)
local text = hsl(245, 50, 91)
local love = hsl(343, 76, 68)
local dim_love = love.desaturate(60).darken(40)
local gold = hsl(35, 88, 72)
local dim_gold = gold.desaturate(60).darken(40)
local rose = hsl(2, 55, 83)
local pine = hsl(197, 49, 38)
local foam = hsl(189, 43, 73)
local iris = hsl(267, 57, 78)
local dim_iris = foam.desaturate(80).darken(40)
local highlight = hsl(248, 16, 19)
local highlight_inactive = hsl(249, 18, 15)
local highlight_overlay = hsl(247, 14, 25)
--}}}

local theme = lush(function()
	return {

-- Vim Editor {{{
		-- The following are all the Neovim default highlight groups from the docs
		-- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
		-- probably style all of these at a bare minimum.
		--
		-- Referenced/linked groups must come before being referenced/lined,
		-- so the order shown ((mostly) alphabetical) is likely
		-- not the order you will end up with.
		--
		-- You can uncomment these and leave them empty to disable any
		-- styling for that group (meaning they mostly get styled as Normal)
		-- or leave them commented to apply vims default colouring or linking.

		Comment      { fg = subtle, gui = 'italic' }; -- any comment
		-- ColorColumn  { }; -- used for the columns set with 'colorcolumn'
		-- Conceal      { }; -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor       { bg = text, fg = base }; -- character under the cursor
		-- lCursor      { }; -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }; -- like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn { }; -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine   { bg = highlight_inactive }; -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory    { fg = foam }; -- directory names (and other special names in listings)
		DiffAdd      { bg = highlight, fg = foam }; -- diff mode: Added line |diff.txt|
		DiffChange   { bg = highlight, fg = gold }; -- diff mode: Changed line |diff.txt|
		DiffDelete   { fg = love }; -- diff mode: Deleted line |diff.txt|
		DiffText     { fg = text }; -- diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer  { }; -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   { }; -- cursor in a focused terminal
		-- TermCursorNC { }; -- cursor in an unfocused terminal
		ErrorMsg     { fg = love, gui = 'bold' }; -- error messages on the command line
		VertSplit    { fg = overlay }; -- the column separating vertically split windows
		Folded       { bg = surface, fg = subtle }; -- line used for closed folds
		SignColumn   { fg = text }; -- column where |signs| are displayed
		FoldColumn   { SignColumn }; -- 'foldcolumn'
		IncSearch    { bg = highlight }; -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute   { }; -- |:substitute| replacement text highlighting
		LineNr       { fg = inactive }; -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr { fg = text }; -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen   { bg = overlay, fg = text }; -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg      { }; -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }; -- Area for messages and cmdline
		-- MsgSeparator { }; -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg      { fg = iris }; -- |more-prompt|
		NonText      { fg = inactive }; -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal       { bg = base, fg = text }; -- normal text
		-- NormalFloat  { }; -- Normal text in floating windows.
		-- NormalNC     { }; -- normal text in non-current windows
		Pmenu        { bg = surface, fg = subtle }; -- Popup menu: normal item.
		PmenuSel     { bg = overlay, fg = text }; -- Popup menu: selected item.
		PmenuSbar    { bg = overlay }; -- Popup menu: scrollbar.
		PmenuThumb   { bg = inactive }; -- Popup menu: Thumb of the scrollbar.
		Question     { fg = gold }; -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine { }; -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search       { bg = highlight_overlay, fg = iris }; -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey   { fg = foam }; -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad     { }; -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
		-- SpellCap     { }; -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }; -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }; -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine   { bg = surface, fg = text }; -- status line of current window
		StatusLineNC { bg = surface, fg = subtle }; -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine      { fg = subtle }; -- tab pages line, not active tab page label
		TabLineFill  { }; -- tab pages line, where there are no labels
		TabLineSel   { fg = text }; -- tab pages line, active tab page label
		Title        { fg = rose }; -- titles for output from ":set all", ":autocmd" etc.
		Visual       { bg = highlight }; -- Visual mode selection
		-- VisualNOS    { }; -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg   { fg = gold }; -- warning messages
		Whitespace   { fg = overlay }; -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- WildMenu     { }; -- current match in 'wildmenu' completion
--}}}

-- Syntax {{{
		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant       { fg = gold }; -- (preferred) any constant
		String         { fg = gold }; --   a string constant: "this is a string"
		Character      { fg = gold }; --  a character constant: 'c', '\n'
		Number         { fg = gold }; --   a number constant: 234, 0xff
		Boolean        { fg = gold }; --  a boolean constant: TRUE, false
		Float          { fg = gold }; --    a floating point constant: 2.3e10

		Identifier     { fg = rose }; -- (preferred) any variable name
		Function       { fg = rose }; -- function name (also: methods for classes)

		Statement      { fg = pine }; -- (preferred) any statement
		Conditional    { fg = pine }; --  if, then, else, endif, switch, etc.
		Repeat         { fg = pine }; --   for, do, while, etc.
		Label          { fg = foam }; --    case, default, etc.
		Operator       { fg = subtle }; -- "sizeof", "+", "*", etc.
		Keyword        { fg = pine }; --  any other keyword
		Exception      { fg = pine }; --  try, catch, throw

		PreProc        { fg = iris }; -- (preferred) generic Preprocessor
		Include        { fg = iris }; --  preprocessor #include
		Define         { fg = iris }; --   preprocessor #define
		Macro          { fg = iris }; --    same as Define
		PreCondit      { fg = iris }; --  preprocessor #if, #else, #endif, etc.

		Type           { fg = foam }; -- (preferred) int, long, char, etc.
		StorageClass   { fg = foam }; -- static, register, volatile, etc.
		Structure      { fg = foam }; --  struct, union, enum, etc.
		Typedef        { fg = foam }; --  A typedef

		Special        { fg = rose }; -- (preferred) any special symbol
		SpecialChar    { fg = rose }; --  special character in a constant
		Tag            { fg = rose }; --    you can use CTRL-] on this
		Delimiter      { fg = rose }; --  character that needs attention
		SpecialComment { fg = iris }; -- special things inside a comment
		Debug          { fg = rose }; --    debugging statements

		Underlined { fg = foam,  gui = "underline" }; -- (preferred) text that stands out, HTML links
		-- Bold       { gui = "bold" };
		-- Italic     { gui = "italic" };

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }; -- (preferred) left blank, hidden  |hl-Ignore|

		Error          { fg = love }; -- (preferred) any erroneous construct

		Todo           { fg = iris }; -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
--}}}

-- LSP {{{
		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.

		LspReferenceText                     { bg = highlight, fg = rose }; -- used for highlighting "text" references
		LspReferenceRead                     { LspReferenceText }; -- used for highlighting "read" references
		LspReferenceWrite                    { LspReferenceText }; -- used for highlighting "write" references

		LspDiagnosticsDefaultError           { fg = love }; -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultWarning         { fg = gold }; -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultInformation     { fg = foam }; -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultHint            { fg = iris }; -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

		LspDiagnosticsVirtualTextError       { LspDiagnosticsDefaultError }; -- Used for "Error" diagnostic virtual text
		LspDiagnosticsVirtualTextWarning     { LspDiagnosticsDefaultWarning }; -- Used for "Warning" diagnostic virtual text
		LspDiagnosticsVirtualTextInformation { LspDiagnosticsDefaultInformation }; -- Used for "Information" diagnostic virtual text
		LspDiagnosticsVirtualTextHint        { LspDiagnosticsDefaultHint }; -- Used for "Hint" diagnostic virtual text

		LspDiagnosticsUnderlineError         { LspDiagnosticsDefaultError, gui = 'underline' }; -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning       { LspDiagnosticsDefaultWarning, gui = 'underline' }; -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation   { LspDiagnosticsDefaultInformation, gui = 'underline' }; -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint          { LspDiagnosticsDefaultHint, gui = 'underline' }; -- Used to underline "Hint" diagnostics

		LspDiagnosticsFloatingError          { LspDiagnosticsDefaultError }; -- Used to color "Error" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingWarning        { LspDiagnosticsDefaultWarning }; -- Used to color "Warning" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingInformation    { LspDiagnosticsDefaultInformation }; -- Used to color "Information" diagnostic messages in diagnostics float
		LspDiagnosticsFloatingHint           { LspDiagnosticsDefaultHint }; -- Used to color "Hint" diagnostic messages in diagnostics float

		LspDiagnosticsSignError              { LspDiagnosticsDefaultError }; -- Used for "Error" signs in sign column
		LspDiagnosticsSignWarning            { LspDiagnosticsDefaultWarning }; -- Used for "Warning" signs in sign column
		LspDiagnosticsSignInformation        { LspDiagnosticsDefaultInformation }; -- Used for "Information" signs in sign column
		LspDiagnosticsSignHint               { LspDiagnosticsDefaultHint }; -- Used for "Hint" signs in sign column
--}}}

-- Treesitter {{{
		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		-- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSAttribute          { };    -- (unstable) TODO: docs
		TSBoolean            { fg = rose };    -- For booleans.
		-- TSCharacter          { };    -- For characters.
		TSComment            { fg = subtle, gui = 'italic' };    -- For comment blocks.
		TSConstructor        { fg = foam };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
		-- TSConditional        { };    -- For keywords related to conditionnals.
		TSConstant           { fg = foam };    -- For constants
		TSConstBuiltin       { fg = love };    -- For constant that are built in the language: `nil` in Lua.
		-- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
		-- TSError              { };    -- For syntax/parser errors.
		-- TSException          { };    -- For exception related keywords.
		-- TSField              { };    -- For fields.
		-- TSFloat              { };    -- For floats.
		TSFunction           { fg = rose };    -- For function (calls and definitions).
		TSFuncBuiltin        { fg = love };    -- For builtin functions: `table.insert` in Lua.
		-- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude            { fg = pine };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword            { fg = pine };    -- For keywords that don't fall in previous categories.
		-- TSKeywordFunction    { };    -- For keywords used to define a fuction.
		-- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
		-- TSMethod             { };    -- For method calls and definitions.
		-- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
		-- TSNone               { };    -- TODO: docs
		-- TSNumber             { };    -- For all numbers
		TSOperator           { fg = pine };    -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter          { fg = iris, gui = 'italic' };    -- For parameters of a function.
		-- TSParameterReference { };    -- For references to parameters of a function.
		TSProperty           { fg = iris, gui = 'italic' };    -- Same as `TSField`.
		TSPunctDelimiter     { fg = subtle };    -- For delimiters ie: `.`
		TSPunctBracket       { fg = subtle };    -- For brackets and parens.
		TSPunctSpecial       { fg = subtle };    -- For special punctutation that does not fall in the catagories before.
		-- TSRepeat             { };    -- For keywords related to loops.
		-- TSString             { };    -- For strings.
		-- TSStringRegex        { };    -- For regexes.
		TSStringEscape       { fg = pine };    -- For escape characters within a string.
		-- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
		-- TSType               { };    -- For types.
		-- TSTypeBuiltin        { };    -- For builtin types.
		TSVariable           { fg = text, gui = 'italic' };    -- Any variable name that does not have another highlight.
		TSVariableBuiltin    { fg = love };    -- Variable names that are defined by the languages, like `this` or `self`.

		TSTag                { fg = foam };    -- Tags like html tag names.
		TSTagDelimiter       { fg = subtle };    -- Tag delimiter like `<` `>` `/`
		-- TSText               { };    -- For strings considered text in a markup language.
		-- TSEmphasis           { };    -- For text to be represented with emphasis.
		-- TSUnderline          { };    -- For text to be represented with an underline.
		-- TSStrike             { };    -- For strikethrough text.
		-- TSTitle              { };    -- Text that is part of a title.
		-- TSLiteral            { };    -- Literal text.
		TSURI                { fg = gold, gui = 'underline' };    -- Any URI like a link or email.
--}}}

-- StatusLine {{{
		SLModeText   { gui = 'bold' };
		SLModeSep    { bg = surface,  fg = base };
		SLNormalText { bg = surface, fg = subtle };
		SLDimText    { bg = surface, fg = subtle };
		SLLightText  { fg = subtle };
		SLLightSep   { bg = surface, fg = base };
		SLDarkText   { bg = surface };
		SLError      { bg = surface, fg = love };
		SLWarning    { bg = surface, fg = gold };
		SLInfo       { bg = surface, fg = iris };
		SLHint       { bg = surface, fg = foam };
--}}}

-- Gitsigns {{{
		DiffAddSign { fg = dim_iris };
		DiffChangeSign { fg = dim_gold };
		DiffDeleteSign { fg = dim_love };
-- }}}

	}
end)

-- return our parsed theme for extension or use else where.
return theme

-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
