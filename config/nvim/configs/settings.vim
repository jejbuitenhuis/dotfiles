set termguicolors

filetype plugin on
syntax on

" characters {{{
function! MyFoldText(char)
	let line = getline(v:foldstart)
	let foldedLineCount = v:foldend - v:foldstart + 1

	return " " . a:char . " " . foldedLineCount . " " . line
endfunction

if &encoding == "utf-8"
	set listchars=space:·,nbsp:␣,tab:→\ ,eol:↩,extends:»,precedes:« list
	set showbreak=↪\ 

	set foldtext=MyFoldText('')
	set fillchars=fold:\ 
else
	set listchars=space:.,tab:>-,eol:/,nbsp:~,extends:>,precedes:< list
	set showbreak=\\

	set foldtext=MyFoldText('^')
	set fillchars=fold:\ 
endif
" }}}

" line_numbers {{{
let no_line_numbers = [ 'help', 'dbui' ]

if index(no_line_numbers, &ft) < 0
	set nu rnu
	set numberwidth=4

	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
	augroup END
endif
" }}}

" standard settings {{{
" setup tabs as spaces
" set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " spaces
set autoindent noexpandtab tabstop=4 shiftwidth=4 " tabs

" Use unix line endings
set ff=unix

" open split windows on the right side or on the bottom
set splitright
set splitbelow

" Center cursor
set scrolloff=999

" Conceal settings
set conceallevel=2

" Disable wrap
set nowrap
set linebreak
set breakindent

" except these
augroup wrap
	autocmd!
	autocmd FileType css,markdown,text,sass,scss,sql setlocal wrap
augroup END

" Map extensions to their correct filetype
autocmd BufNewFile,BufRead *.asm set ft=nasm
autocmd BufNewFile,BufRead *.y set ft=y

" Show folds in sidebar
set foldcolumn=1
set foldmethod=marker

" Highlight current line
set cursorline

" text can't be longer than 80 columns
set colorcolumn=80

" Check open files for updates
set autoread

" Disable vim buildin spellcheck
set nospell
set spelllang=en,nl

" Give more space for displaying messages
set cmdheight=1

" Set leader
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

" Mark trailing whitespace with an error color
call matchadd('Error', '\s\+$')

" match column's that are longer than 80 characters
" call matchadd('Error', '\%>80v.\+')
" }}}

" persistent undo {{{
" from https://stackoverflow.com/a/22676189/9946744
let vim_dir = '$HOME/.local/share/nvim'

if stridx( &runtimepath, expand(vim_dir) ) == -1
	" vim_dir is not in runtimepath, add it
	let &runtimepath.=','.vim_dir
endif

" keep undo history across sessions by storing in in a file
if has('persistent_undo')
	let my_undo_dir = expand(vim_dir . '/undodir')
	" create dirs
	call system('mkdir ' . vim_dir)
	call system('mkdir ' . my_undo_dir)
	let &undodir = my_undo_dir
	set undofile
endif
" }}}

" SQL highlighting withing php strings
let php_sql_query = 1

" Character highlight (f, F)
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Markdown stuff {{{
let g:markdown_fenced_languages = [ 'html', 'javascript', 'typescript', 'css', 'scss' ]
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100

" vim markdown
let g:vim_markdown_folding_level = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
" }}}

" NerdCommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
" }}}

" Setup local vimrc {{{
let g:localvimrc_enable = 1
let g:localvimrc_name = [ '.lvimrc', '.vimrc' ]
let g:localvimrc_persistent = 1
" }}}

" Setup color highlighting {{{
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatters = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
" }}}

" Indent line {{{
" let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0
let g:indentLine_defaultGroup = 'Comment'
let g:indentLine_char = '¦'
" }}}

" javascript bundle {{{
let g:javascript_plugin_jsdoc = 1
" }}}

" vue bundle {{{
let g:vim_vue_plugin_use_scss = 1
let g:vim_vue_plugin_highlight_vue_attr = 1
let g:vim_vue_plugin_config = {
	\'syntax': {
	\	'template': ['html'],
	\	'script': ['javascript'],
	\	'style': ['scss'],
	\},
	\'full_syntax': [],
	\'initial_indent': [],
	\'attribute': 1,
	\'keyword': 1,
	\'foldexpr': 0,
	\'debug': 0,
	\}
" }}}

" syntastic {{{
let g:syntastic_error_symbol = ""
let g:syntastic_warning_symbol = ""
let g:syntastic_sql_checkers = [ 'tsqllint' ]
" }}}

" skeleton {{{
let g:skeleton_template_dir = '~/.config/nvim/templates'
let g:skeleton_replacements_cpp = {}

function! g:skeleton_replacements_cpp.GUARD()
	let filePath = expand('%:r')
	let filePath = substitute(filePath, "\/", "_", "g")

	return toupper(filePath)
endfunction
" }}}

" fzf {{{
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
let g:fzf_colors =
	\ { 'fg':	  ['fg', 'Normal'],
	\ 'bg':	  ['bg', 'Normal'],
	\ 'hl':	  ['fg', 'Comment'],
	\ 'fg+':	 ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':	 ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':	 ['fg', 'Statement'],
	\ 'info':	['fg', 'PreProc'],
	\ 'border':  ['fg', 'Identifier'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }
command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}}

" clang completion {{{
let g:clang_library_path = '/usr/lib/llvm-10/lib'
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = "<c-e>"
" }}}

" emmet {{{
let g:user_emmet_leader_key = "<c-l>"
let g:user_emmet_install_global = 0

autocmd FileType html,vue EmmetInstall
" }}}

" i3config {{{
aug i3config_ft_detection
	au!
	au BufNewFile,BufRead .config/i3/config set filetype=i3config
	au BufNewFile,BufRead .dotfiles/config/i3/config set filetype=i3config
aug end
" }}}

" c++ {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" }}}

" html autoclose tags {{{
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_filenames = '*.html,*.phtml,*.vue'
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,phtml,vue'
let g:closetag_xhtml_filetypes = 'xml,xhtml,jsx,tsx'
" }}}

" Match tag always {{{
let g:mta_filetypes = {
	\ 'html' : 1,
	\ 'xhtml' : 1,
	\ 'xml' : 1,
	\ 'jinja' : 1,
	\}
" }}}

" Database conncetion strings {{{
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_show_help = 0
" }}}

" go language {{{
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0 " managed by coc-go
let g:go_fmt_autosave = 0
let g:go_snippets_engine = 'ultisnips'
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_string_spellcheck = 0
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
" }}}

" Blamer {{{
let g:blamer_enabled = 1
let g:blamer_prefix = ' ‣ '
" }}}

" Rust {{{
let g:syntastic_rust_checkers = [] " Disable syntastic rust checker in favour of coc
" }}}
