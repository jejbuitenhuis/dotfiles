function! FuckWindows()
	execute "%s///g"
	execute "noh"
endfun

function! FixIndent()
	call inputsave()
	let currentIndent = input("Current indent: ")
	call inputrestore()

	let whitespace = ""
	let i = 0

	while i < currentIndent
		let whitespace .= " "
		let i += 1
	endwhile

	execute "%s/" . whitespace . "/\t/g"
endfun

function! GetSynGroup()
	let l:s = synID( line('.'), col('.'), 1 )
	return [ synIDattr(l:s, 'name'), synIDattr( synIDtrans(l:s), 'name' ) ]
endfun

function! PrintSynGroup()
	let l:groups = GetSynGroup()
	echo l:groups[0] . ' -> ' . l:groups[1]
endfun

function! HighlightSynGroup(group, bg, fg, style)
	let highlightStr = 'highlight ' . a:group . ' '
	let highlightStr .= 'guibg=' . a:bg . ' '
	let highlightStr .= 'guifg=' . a:fg . ' '
	let highlightStr .= 'gui=' . a:style . ' '
	let highlightStr .= 'cterm=' . a:style

	execute highlightStr
endfun

function! HighlightCurrSynGroup(bg, fg, style)
	let l:synGroup = GetSynGroup()[0]

	call HighlightSynGroup(l:synGroup, a:bg, a:fg, a:style)
endfun

function! YcmRename()
	call inputsave()
	let newName = input('New variable name: ')
	call inputrestore()

	exec 'YcmCompleter RefactorRename ' . newName
endfun

