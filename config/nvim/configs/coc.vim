" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000ms) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
set signcolumn=number

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:insert_tab()
	let col = col('.') - 1
	if getline('.')[col - 1] == ' '
		return "\<C-h>	"
	endif
	return "	"
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all the diagnostics of current buffer in
" location list.
nmap <silent> [g <Plug>(coc-diagnostics-prev)
nmap <silent> ]g <Plug>(coc-diagnostics-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" scroll pop-up windows https://vi.stackexchange.com/a/27861
if has('nvim-0.4.3') || has('patch-8.2.0750')
	nnoremap <nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<C-f>"
	nnoremap <nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0, -1) : "\<C-b>"
	inoremap <nowait><expr> <c-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
	inoremap <nowait><expr> <c-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, -1)\<cr>" : "\<Left>"
endif

function! s:show_documentation()
	if ( index(['vim', 'help'], &filetype) >= 0 )
		execute 'h ' . expand('<cword>')
	elseif ( coc#rpc#ready() )
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . ' ' . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:OR` command for organizing imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
