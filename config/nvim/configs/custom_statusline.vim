set showtabline=2
set tabline=%!GetTabLine()
set statusline=

" show current mode
let g:currentmode={
	\ 'n'	: 'N ',
	\ 'v'	: 'V ',
	\ 'V'	: 'VL ',
	\ "\<C-V>" : 'VB ',
	\ 's'	: 'S ',
	\ 'i'	: 'I ',
	\ 'R'	: 'R ',
	\ 'Rv' : 'VR ',
	\ 'c'	: 'C ',
	\ 't'	: 'T ',
	\}

set statusline+=%{g:currentmode[mode()]}
" set statusline+=%{mode()}\

set statusline+=%<%f
set statusline+=%m

set statusline+=%7([%{&fileformat}]%)

set statusline+=%= " split to the right

set statusline+=[%n%R%Y]\ 
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\ %P

function GetTabLine()
	let start = ''
	let end = ''
	" for i in range(tabpagenr('$'))
		" " select the highlighting
		" if i + 1 == tabpagenr()
			" let s .= '%#TabLineSel#'
		" else
			" let s .= '%#TabLine#'
		" endif

		" " set the tab page number (for mouse clicks)
		" let s .= '%' . (i + 1) . 'T'

		" " the label is made by MyTabLabel()
		" let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	" endfor

	" " after the last tab fill with TabLineFill and reset tab page nr
	" let s .= '%#TabLineFill#%T'

	" for buf in getbufinfo({ 'buflisted': 1 })
		" if buf.bufnr == bufnr()
			" let s.= '%#TabLineSel#'
		" else
			" let s.= '%#TabLine#'
		" endif

		" let s .= ' ' . buf.bufnr . ' ' . bufname(buf.bufnr) . ' '

		" if buf.changed
			" let s .= '[+]'
		" endif
	" endfor

	let currTabPage = tabpagenr()
	let currBufNr = bufnr('%')

	for tabIndex in range( tabpagenr('$') + 1 )
		let bufList = tabpagebuflist(tabIndex)

		if type(bufList) == type([])
			for bufNum in bufList
				if bufNum == currBufNr
					let start .= '%#TabLineSel#'
				else
					let start .= '%#TabLine#'
				endif

				let start .= bufNum . ' ' . bufname(bufNum)
			endfor

			" let winNum = tabpagewinnr(tabIndex)
			" if tabIndex == currTabPage
				" let end .= '%#TabLineSel#'
			" else
				" let end .= '%#TabLine#'
			" endif
			" let end .= bufname( bufList[winNum - 1] )
		endif
	endfor

	let start .= '%#TabLineFill#%='
	" let start .= end

	return start
endfunction

function MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return bufname(buflist[winnr - 1])
endfunction
