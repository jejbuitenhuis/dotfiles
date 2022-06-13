function FuckWindows() " {{{
	execute "%s///g"
	execute "noh"
endfun " }}}

function FixIndent() " {{{
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
endfun " }}}

function! MoveFile(newLocation) " {{{
	let oldLocation = expand('%')

	if oldLocation == a:newLocation
		return 0
	endif

	execute 'saveas' fnameescape(a:newLocation)
	call delete(oldLocation)
endfunction

command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')
" }}}
