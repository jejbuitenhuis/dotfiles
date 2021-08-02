highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="pct-mountain-fuji"

function! Coloring(group,bg,fg,style)
	let highlightstr = 'highlight ' . a:group . ' '
	let highlightstr .= 'guibg=' . a:bg . ' '
	let highlightstr .= 'guifg=' . a:fg . ' '
	let highlightstr .= 'gui=' . a:style . ' '
	" let highlightstr .= 'ctermbg=' . a:bg . ' '
	" let highlightstr .= 'ctermfg=' . a:fg . ' '
	let highlightstr .= 'cterm=' . a:style . ' '

	execute highlightstr
endfunction

" default colors
call Coloring('Normal',			'#4C4E73',	'#ffffff',	'NONE')
call Coloring('Cursor',			'NONE',		'#000000',	'NONE')

" comments
call Coloring('Comment',		'NONE',		'#7E81BF',	'italic')

" ts/js throw, (s)css variables (-- prefix), html entities
call Coloring('Special',		'NONE',		'#9ac7d9',	'NONE')

" constant variable
call Coloring('Constant',		'NONE',		'#D99E91',	'NONE')

" data types typed (like 12, "hey")
call Coloring('String',			'NONE',		'#B2D9CA',	'NONE')
call Coloring('Character',		'NONE',		'#738C83',	'NONE')
call Coloring('Number',			'NONE',		'#E3A1BF',	'NONE')
call Coloring('Boolean',		'NONE',	 'NONE',	'NONE')

" types (number, string), html attributes, css attributes
call Coloring('Type',			'NONE',		'#ac96f2',	'NONE')

" types and funtion names
call Coloring('Identifier',		'NONE',		'#D9B89C',	'NONE')
call Coloring('Function',		'NONE',		'#869FD9',	'bold')

" certain function names and constants, words like function, class
call Coloring('Keyword',		'NONE',		'#9AC7D9',	'NONE')

" Classes and certain variables
call Coloring('Structure',		'NONE',		'#AC96F2',	'underline')

" variables, for if else return, argument seperators
call Coloring('Statement',		'NONE',		'#9ac7d9',	'NONE')

" function parameters, (s)css pseudo stuff
call Coloring('PreProc',		'NONE',		'#d99e91',	'NONE')

" gutter
call Coloring('LineNr',			'#2A2940',	'#7E81BF',	'NONE')
call Coloring('CursorLine',		'#5D5F8C',	'NONE',		'NONE')
call Coloring('CursorLineNr',	'#3B3C59',	'#A8ADFF',	'NONE')

" the dots and more on whitespace
call Coloring('Whitespace',		'NONE',		'#656899',	'NONE')

set background=dark
