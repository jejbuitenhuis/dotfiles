" Close all buffers except the current one
nnoremap <leader>ca :w <bar> %bd <bar> e# <bar> bd# <CR>

" fzf
nnoremap <silent> <c-k> :Files<CR>
nnoremap <silent> <c-j> :Buffers<CR>

" cursor highlight in command mode
function! HighlightCursor( isOn, key )
	if a:isOn
		match Cursor /\%#./
		redraw
	else
		match
	endif
	return a:key
endfunction

nnoremap <expr> : HighlightCursor(1, ':')
cnoremap <expr> <CR> HighlightCursor(0, "\<lt>CR>")
cnoremap <expr> <ESC> HighlightCursor(0, "\<lt>c-c>")

" Center next/previous search
nnoremap n nzz
nnoremap N Nzz
