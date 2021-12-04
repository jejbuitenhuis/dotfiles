" toggle linenumbers
map <F2> :set nu! rnu!<CR>

" toggle space characters
map <F3> :set list!<CR>

" toggle line indentation characters
map <F4> :IndentLinesToggle<CR>

" toggle nerdtree (file explorer)
nmap <F5> :NERDTreeToggle<CR>

" Use ctrl + h,j,k,l to move cursor
" imap <c-h> <Left>
" imap <c-j> <Down>
" imap <c-k> <Up>
" imap <c-l> <Right>

" Show all buffers
" map <silent> <leader>l :ls<CR>

" Toggle conceal level
" map <leader>c :exec &conceallevel ? "set conceallevel=-" : "set conceallevel=2"<CR>

" Toggle cursor at the center
nnoremap \zz  :let &scrolloff=999-&scrolloff<CR>

" Escape in terminal is really escape
" tnoremap <ESC> <C-\><C-n>

" Open a terminal in the current directory
map <silent> <leader>c :Deol<CR>

" You complete me
" nmap <silent> <leader>D :YcmCompleter GetDoc<CR>
" nmap <silent> <leader>r :call YcmRename()<CR>

" Close all buffers except the current one
nnoremap <leader>ca :w <bar> %bd <bar> e# <bar> bd# <CR>

" fzf
nnoremap <silent> <leader>of :Files<CR>
nnoremap <silent> <leader>ob :Buffers<CR>

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

" Move line up or down
" nnoremap <silent> <leader>md :move '<-2<CR>gv-gv
" nnoremap <silent> <leader>mu :move '>+1<CR>gv-gv

nnoremap n nzz
nnoremap N Nzz

