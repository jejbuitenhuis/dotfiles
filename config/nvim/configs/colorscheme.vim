" set up color scheme

if ( empty($TMUX) )
	if ( has("nvim") )
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif

	if ( has("termguicolors") )
		set termguicolors
	endif
endif

function! s:habanight_setup() abort
	hi Comment gui=italic cterm=italic
	hi Statement gui=bold cterm=bold
endfunction

augroup colorscheme_change | au!
	au ColorScheme habanight call s:habanight_setup()
augroup END

syntax on

let ayucolor="dark"
let g:embark_terminal_italics = 1

colorscheme pct-flower-with-leaves
" colorscheme onedark

