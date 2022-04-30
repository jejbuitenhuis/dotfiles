set statusline=

" show current mode {{{
let g:currentmode={
	\ 'n'	: 'NORMAL',
	\ 'v'	: 'VISUAL',
	\ 'V'	: 'V-LINE',
	\ "\<C-V>" : 'V-BLOCK',
	\ 's'	: 'SELECT',
	\ 'i'	: 'INSERT',
	\ 'R'	: 'REPLACE',
	\ 'Rv' : 'V-REPLACE',
	\ 'c'	: 'COMMAND',
	\ 't'	: 'TERMINAL',
	\} " }}}

function Block(content, color = 1) " {{{
	if len( trim(a:content) ) == 0
		return ''
	endif

	return '%' . a:color . '* ' . a:content . ' %0*'
endfunction " }}}

function GetTabLine() " {{{
	let result = ''
	let currTabPage = tabpagenr()
	let currBufNr = bufnr('%')

	for currTabIndex in range( tabpagenr('$') + 1 )
		let bufList = tabpagebuflist(currTabIndex)
		let currentBuf = v:false

		if type(bufList) == type([])
			for buf in bufList
				if buf == currBufNr
					let currentBuf = v:true
				endif
			endfor

			if currentBuf == v:true
				let result .= '%#TabLineSel#'
			else
				let result .= '%#TabLine#'
			endif

			let result .= ' '
				\ . bufname( bufList[ tabpagewinnr(currTabIndex) - 1 ] )
				\ . ' '
		endif
	endfor

	let result .= '%#TabLineFill#%='

	return result
endfunction " }}}

" The current mode
set statusline+=%{%Block(g:currentmode[mode()],7)%}
" Current filename and whether or not the file is readonly
set statusline+=%{%Block('%<%f%m',6)%}
" Coc status
set statusline+=%{%Block(coc#status(),2)%}

" split to the right
set statusline+=%=

" Buffer number, filetype, fileformat
set statusline+=%{%Block('%n\ %Y\ '.toupper(&fileformat),5)%}
" Current column number, current line, total line count, line percentage
set statusline+=%{%Block('%c,%l/%L\ %P',8)%}

set tabline=%!GetTabLine()
