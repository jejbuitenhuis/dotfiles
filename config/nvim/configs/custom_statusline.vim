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

function WrapString(string, left, right)
	if len( trim(a:string) ) == 0
		return ''
	endif

	let start = ''

	return a:left . a:string . a:right
endfunction

set statusline+=%{g:currentmode[mode()]}

set statusline+=%<%f
set statusline+=%m

set statusline+=%(\ %{WrapString(coc#status(),'[',']')}%)

set statusline+=%= " split to the right

set statusline+=[%n%R%Y,%{toupper(&fileformat)}]\ 
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\ %P

set showtabline=1
set tabline=%!GetTabLine()

function GetTabLine()
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
endfunction
