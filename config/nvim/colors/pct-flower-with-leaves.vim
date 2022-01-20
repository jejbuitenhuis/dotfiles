" vim:fdm=marker
" Vim Color File
" Name:   pct-flower-with-leaves.vim
" Author: jejbuitenhuis

" Setup {{{
highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name="Flower with Leaves"

function s:hi(group, styles)
	let s:highlight = {}
	let s:highlight.fg = "NONE"		" guifg
	let s:highlight.bg = "NONE"		" guibg
	let s:highlight.sp = "NONE"		" guisp
	let s:highlight.gui = "NONE"	" gui
	let s:highlight.cfg = "NONE"	" ctermfg
	let s:highlight.cbg = "NONE"	" ctermbg
	let s:highlight.c = "NONE"		" cterm

	for style in keys(s:highlight)
		if has_key(a:styles, style)
			let s:highlight[style] = a:styles[style]
		endif
	endfor

	execute "highlight" a:group
		\ "guifg=" s:highlight.fg
		\ "guibg=" s:highlight.bg
		\ "guisp=" s:highlight.sp
		\ "gui=" s:highlight.gui
		\ "ctermfg=" s:highlight.cfg
		\ "ctermbg=" s:highlight.cbg
		\ "cterm=" s:highlight.c
endfunction
" }}}

" Colors {{{
let s:colors = {}
let s:colors.lighter = {}
let s:colors.darker = {}
let s:colors.white = "#ffe3ff"
let s:colors.darker.white = "#bfaabf"
let s:colors.black = "#0d0d0d"
let s:colors.darker.black = "#000000"
let s:colors.gray = "#595959"
let s:colors.darker.gray = "#333333"
let s:colors.red = "#f99f9b"
let s:colors.green = "#a2f28a"
let s:colors.lighter.green = "#b5f2a2"
let s:colors.yellow = "#eef2bb"
let s:colors.blue = "#96c7f2"
let s:colors.pink = "#f2a2e5"
let s:colors.cyan = "#8af2ec"
" }}}

" Syntax groups (`:h w18`) {{{
call s:hi("Comment", { "fg": s:colors.gray, "gui": "italic", "c": "italic" }) " Any comment

call s:hi("String", { "fg": s:colors.green }) " a string constant
call s:hi("Character", { "fg": s:colors.lighter.green }) " a character constant
call s:hi("Number", { "fg": s:colors.red }) " a number constant
call s:hi("Boolean", { "fg": s:colors.red }) " a boolean constant
call s:hi("Float", { "fg": s:colors.red }) " a floating point constant
call s:hi("Identifier", { "fg": s:colors.blue }) " any variable name
call s:hi("Function", { "fg": s:colors.blue, "gui": "bold", "c": "bold" }) " function name and methods
call s:hi("Statement", { "fg": s:colors.pink }) " any statement
call s:hi("Conditional", { "fg": s:colors.pink }) " if, then, else, endif, switch, etc
call s:hi("Repeat", { "fg": s:colors.pink }) " for, do, while, etc
call s:hi("Label", { "fg": s:colors.pink }) " case, default, etc
call s:hi("Operator", { "fg": s:colors.yellow }) " sizeof, +, *, etc
call s:hi("Keyword", { "fg": s:colors.pink }) " any other keyword
call s:hi("Exception", { "fg": s:colors.pink }) " try, catch, throw
call s:hi("PreProc", { "fg": s:colors.yellow }) " generic preprocessor
call s:hi("Include", { "fg": s:colors.yellow }) " preprocessor #include
call s:hi("Define", { "fg": s:colors.yellow }) " preprocessor #define
call s:hi("Macro", { "fg": s:colors.yellow }) " same as Define
call s:hi("PreCondit", { "fg": s:colors.yellow }) " preprocessor #if, #else, #endif, etc
call s:hi("Type", { "fg": s:colors.cyan }) " int, long, char, etc
call s:hi("StorageClass", { "fg": s:colors.pink }) " static, register, volatile, etc
call s:hi("Structure", { "fg": s:colors.pink }) " struct, union, enum, etc
call s:hi("Typedef", { "fg": s:colors.pink }) " a typedef
call s:hi("Special", { "fg": s:colors.blue }) " any special symbol
call s:hi("SpecialChar", { "fg": s:colors.lighter.green }) " special character in a constant
call s:hi("Tag", {}) " you can use CTRL-] on this
call s:hi("Delimiter", {}) " character that needs attention
call s:hi("SpecialComment", { "fg": s:colors.gray }) " special thing inside a comment
call s:hi("Debug", {}) " debugging statements
call s:hi("Underlined", { "gui": "underline", "c": "underline" }) " text that stands out, HTML links
call s:hi("Ignore", {}) " left blank, hidden
call s:hi("Error", { "bg": s:colors.red }) " any erroneous construct
call s:hi("Todo", { "fg": s:colors.pink }) " anything that needs extra attentions; mostly the keywords TODO FIXME AND XXX
" }}}

" Highlighting groups (`:h highlight-groups`) {{{
call s:hi("ColorColumn", { "bg": s:colors.darker.gray })
call s:hi("Conceal", {})
call s:hi("Cursor", { "fg": s:colors.black, "bg": s:colors.pink })
call s:hi("CursorIM", {})
call s:hi("CursorColumn", { "bg": s:colors.darker.gray })
if &diff
	" don't change the background color when in diff mode
	call s:hi("CursorLine", { "gui": "underline", "c": "underline" })
else
	call s:hi("CursorLine", { "bg": s:colors.darker.gray })
endif
call s:hi("Directory", { "fg": s:colors.pink })
call s:hi("DiffAdd", {})
call s:hi("DiffChange", {})
call s:hi("DiffDelete", {})
call s:hi("DiffText", {})
call s:hi("EndOfBuffer", { "fg": s:colors.gray })
call s:hi("ErrorMsg", { "fg": s:colors.red })
call s:hi("VertSplit", { "fg": s:colors.darker.gray })
call s:hi("Folded", { "fg": s:colors.gray })
call s:hi("FoldColumn", { "bg": s:colors.darker.black })
call s:hi("SignColumn", { "bg": s:colors.darker.black })
call s:hi("IncSearch", { "fg": s:colors.black, "bg": s:colors.pink })
call s:hi("LineNr", { "fg": s:colors.darker.white, "bg": s:colors.darker.black })
call s:hi("CursorLineNr", { "fg": s:colors.pink, "bg": s:colors.darker.black })
call s:hi("MatchParen", { "fg": s:colors.yellow, "gui": "underline", "c": "underline" })
call s:hi("ModeMsg", { "fg": s:colors.gray })
call s:hi("MoreMsg", { "fg": s:colors.gray })
call s:hi("NonText", { "fg": s:colors.gray })
call s:hi("Normal", { "fg": s:colors.white, "bg": s:colors.black })
call s:hi("Pmenu", { "fg": s:colors.white, "bg": s:colors.darker.gray })
call s:hi("PmenuSel", { "fg": s:colors.black, "bg": s:colors.pink })
call s:hi("PmenuSbar", { "bg": s:colors.darker.gray })
call s:hi("PmenuThumb", { "bg": s:colors.gray })
call s:hi("Question", {})
call s:hi("Search", { "fg": s:colors.white, "bg": s:colors.pink })
call s:hi("SpecialKey", { "fg": s:colors.gray })
call s:hi("SpellBad", { "gui": "underline,italic", "c": "underline,italic" })
call s:hi("SpellCap", { "gui": "underline,italic", "c": "underline,italic" })
call s:hi("SpellLocal", { "gui": "underline,italic", "c": "underline,italic" })
call s:hi("SpellRare", { "gui": "underline,italic", "c": "underline,italic" })
call s:hi("StatusLine", { "fg": s:colors.black, "bg": s:colors.pink })
call s:hi("StatusLineNC", { "fg": s:colors.darker.white, "bg": s:colors.darker.gray })
call s:hi("TabLine", { "fg": s:colors.darker.white, "bg": s:colors.darker.gray })
call s:hi("TabLineFill", { "fg": s:colors.darker.white, "bg": s:colors.darker.gray })
call s:hi("TabLineSel", { "fg": s:colors.black, "bg": s:colors.pink })
call s:hi("Visual", { "bg": s:colors.darker.gray })
call s:hi("WarningMsg", { "bg": s:colors.yellow })
call s:hi("WildMenu", { "fg": s:colors.black, "bg": s:colors.pink })
" }}}

" Special highlighting groups {{{
call s:hi("diffRemoved", { "fg": s:colors.red })
call s:hi("diffAdded", { "fg": s:colors.green })
" }}}

" Language specific highlighting {{{

" HTML {{{
call s:hi("htmlArg", { "fg": s:colors.blue })
call s:hi("htmlBold", {})
call s:hi("htmlEndTag", { "fg": s:colors.cyan })
call s:hi("htmlH1", {})
call s:hi("htmlH2", {})
call s:hi("htmlH3", {})
call s:hi("htmlH4", {})
call s:hi("htmlH5", {})
call s:hi("htmlH6", {})
call s:hi("htmlItalic", {})
call s:hi("htmlLink", {})
call s:hi("htmlSpecialChar", { "fg": s:colors.cyan })
call s:hi("htmlSpecialTagName", { "fg": s:colors.pink })
call s:hi("htmlTag", { "fg": s:colors.cyan })
call s:hi("htmlTagN", {})
call s:hi("htmlTagName", { "fg": s:colors.pink })
call s:hi("htmlTitle", { "fg": s:colors.white })
" }}}

" CSS {{{
call s:hi("cssAttrComma", {})
call s:hi("cssAttributeSelector", {})
call s:hi("cssBraces", {})
call s:hi("cssClassName", { "fg": s:colors.blue })
call s:hi("cssClassNameDot", { "fg": s:colors.blue })
call s:hi("cssDefinition", {})
call s:hi("cssFontAttr", {})
call s:hi("cssFontDescriptor", {})
call s:hi("cssFunctionName", { "fg": s:colors.blue, "gui": "bold", "c": "bold" })
call s:hi("cssIdentifier", { "fg": s:colors.blue })
call s:hi("cssImportant", { "fg": s:colors.cyan })
call s:hi("cssInclude", {})
call s:hi("cssIncludeKeyword", { "fg": s:colors.yellow })
call s:hi("cssMediaType", { "fg": s:colors.yellow })
call s:hi("cssProp", { "fg": s:colors.cyan })
call s:hi("cssPseudoClassId", { "fg": s:colors.yellow })
call s:hi("cssSelectorOp", {})
call s:hi("cssSelectorOp2", {})
call s:hi("cssTagName", { "fg": s:colors.pink })
" }}}

" JavaScript {{{
call s:hi("javaScriptBraces", {})
call s:hi("javaScriptFunction", { "fg": s:colors.pink })
call s:hi("javaScriptIdentifier", { "fg": s:colors.pink })
call s:hi("javaScriptNull", { "fg": s:colors.red })
call s:hi("javaScriptNumber", { "fg": s:colors.red })
call s:hi("javaScriptRequire", { "fg": s:colors.blue, "gui": "bold", "c": "bold" })
call s:hi("javaScriptReserved", { "fg": s:colors.cyan })
" https://github.com/pangloss/vim-javascript
call s:hi("jsArrowFunction", { "fg": s:colors.pink })
call s:hi("jsClassKeyword", { "fg": s:colors.pink })
call s:hi("jsClassMethodType", {})
call s:hi("jsDocParam", { "fg": s:colors.blue })
call s:hi("jsDocTags", { "fg": s:colors.pink })
call s:hi("jsExport", { "fg": s:colors.pink })
call s:hi("jsExportDefault", { "fg": s:colors.pink })
call s:hi("jsExtendsKeyword", { "fg": s:colors.pink })
call s:hi("jsFrom", { "fg": s:colors.pink })
call s:hi("jsFuncCall", { "fg": s:colors.blue, "gui": "bold", "c": "bold" })
call s:hi("jsFunction", { "fg": s:colors.pink })
call s:hi("jsGenerator", {})
call s:hi("jsGlobalObjects", { "fg": s:colors.cyan })
call s:hi("jsImport", { "fg": s:colors.pink })
call s:hi("jsModuleAs", { "fg": s:colors.pink })
call s:hi("jsNull", { "fg": s:colors.red })
call s:hi("jsOperator", { "fg": s:colors.pink })
call s:hi("jsStorageClass", { "fg": s:colors.cyan })
call s:hi("jsSuper", { "fg": s:colors.blue, "gui": "bold", "c": "bold" })
call s:hi("jsTemplateBraces", { "fg": s:colors.pink })
call s:hi("jsTemplateVar", {})
call s:hi("jsThis", { "fg": s:colors.cyan })
call s:hi("jsUndefined", { "fg": s:colors.red })
" }}}

" JSON {{{
call s:hi("jsonCommentError", { "fg": s:colors.black, "bg": s:colors.red })
call s:hi("jsonKeyword", { "fg": s:colors.pink })
call s:hi("jsonBoolean", { "fg": s:colors.red })
call s:hi("jsonNumber", { "fg": s:colors.red })
call s:hi("jsonNull", { "fg": s:colors.red })
call s:hi("jsonQuote", { "fg": s:colors.green })
call s:hi("jsonMissingCommaError", { "fg": s:colors.black, "bg": s:colors.red })
call s:hi("jsonNoQuotesError", { "fg": s:colors.black, "bg": s:colors.red })
call s:hi("jsonNumError", { "fg": s:colors.black, "bg": s:colors.red })
call s:hi("jsonString", { "fg": s:colors.green })
call s:hi("jsonStringSQError", { "fg": s:colors.black, "bg": s:colors.red })
call s:hi("jsonSemicolonError", { "fg": s:colors.black, "bg": s:colors.red })
" }}}

" }}}

" Plugin highlighting {{{

" https://github.com/kamykn/spelunker.vim {{{
call s:hi("SpelunkerSpellBad", { "gui": "underline,italic", "c": "underline,italic" })
call s:hi("SpelunkerComplexOrCompoundWord", { "gui": "underline,italic", "c": "underline,italic" })
" }}}

" https://github.com/unblevable/quick-scope {{{
call s:hi("QuickScopePrimary", { "fg": s:colors.pink, "gui": "underline", "c": "underline" })
call s:hi("QuickScopeSecondary", { "fg": s:colors.yellow, "gui": "underline", "c": "underline" })
" }}}

" }}}

set background=dark

