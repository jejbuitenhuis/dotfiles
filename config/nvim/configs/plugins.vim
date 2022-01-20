call plug#begin( stdpath('data') . '/plugged' )
" bar
" Plug 'vim-airline/vim-airline'
" bar thema's
" Plug 'vim-airline/vim-airline-themes'
" Color visualizer (installed GO)
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
" Comment stuff
Plug 'preservim/nerdcommenter'
" Emmet
Plug 'mattn/emmet-vim'
" Key highlight (f, F)
Plug 'unblevable/quick-scope'
" Generate lorem ipsum
Plug 'vim-scripts/loremipsum'
" Autocomplete brackets and stuff
Plug 'chun-yang/auto-pairs'
" Surrounding characters made easy
Plug 'tpope/vim-surround'
" Local vimrc
Plug 'embear/vim-localvimrc'
" Icons
Plug 'ryanoasis/vim-devicons'
" Fancy stuff on startup
Plug 'mhinz/vim-startify'
" Spell checker
Plug 'kamykn/spelunker.vim'
" Check what attribute is used for color scheme
Plug 'vim-scripts/SyntaxAttr.vim'
" i3 config color coding
Plug 'mboughaba/i3config.vim'
" Console
Plug 'shougo/deol.nvim'
" Autoclose html tags
Plug 'alvan/vim-closetag'
" Highlight html matching tags
Plug 'valloric/matchtagalways'
" Switching between single-line statement and multi-line statement
Plug 'AndrewRadev/splitjoin.vim'
" Syntax checker and linter
Plug 'scrooloose/syntastic'
" Better number and letter increment
Plug 'triglav/vim-visual-increment'
" File templates
Plug 'noahfrederick/vim-skeleton'
" fzf in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Highlight yanked text
Plug 'machakann/vim-highlightedyank'
" Align text on certain characters. Only used with vim-markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
" Generate c++ documentation comment template
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }
" Show indentation lines when indented with spaces
Plug 'Yggdroot/indentLine'
" Git in vim
Plug 'tpope/vim-fugitive'
" Required by plantuml-previewer
Plug 'tyru/open-browser.vim'
" Git diff
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

" Code completion and snippets
" Plug 'valloric/youcompleteme', { 'do': 'python3 ./install.py --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xavierd/clang_complete'
Plug 'sirver/ultisnips'

" language bundles and/or highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'StanAngeloff/php.vim'
Plug 'rust-lang/rust.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'compnerd/arm64asm-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'leafoftree/vim-vue-plugin'
Plug 'sophacles/vim-processing'
Plug 'sudar/vim-arduino-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'janiczek/vim-latte'
Plug 'lervag/vimtex'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'vim-scripts/asmx86'

" Color schemes
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'habamax/vim-habanight'

call plug#end()

