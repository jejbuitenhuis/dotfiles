call plug#begin( stdpath('data') . '/plugged' )
" Plug 'vim-airline/vim-airline'											" bar
" Plug 'vim-airline/vim-airline-themes'									" bar thema's
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }				" Color visualizer (installed GO)
Plug 'scrooloose/nerdtree'												" File explorer
Plug 'preservim/nerdcommenter'											" Comment stuff
Plug 'mattn/emmet-vim'													" Emmet
Plug 'unblevable/quick-scope'											" Key highlight (f, F)
Plug 'tpope/vim-characterize'											" Better character info (decimal, octal & hex)
Plug 'vim-scripts/loremipsum'											" Generate lorem ipsum
Plug 'chun-yang/auto-pairs'												" Autocomplete brackets and stuff
Plug 'tpope/vim-surround'												" Surrounding characters made easy
Plug 'embear/vim-localvimrc'											" Local vimrc
Plug 'ryanoasis/vim-devicons'											" Icons
Plug 'mhinz/vim-startify'												" Fancy stuff on startup
Plug 'kamykn/spelunker.vim'												" Spellchecker
Plug 'vim-scripts/SyntaxAttr.vim'										" Check what attribute is used for color scheme
Plug 'mboughaba/i3config.vim'											" i3 config color coding
Plug 'shougo/deol.nvim'													" Console
Plug 'alvan/vim-closetag'												" Autoclose html tags
Plug 'valloric/matchtagalways'											" Highlight html matching tags
Plug 'AndrewRadev/splitjoin.vim'										" Switching between single-line statement and multi-line statement
Plug 'scrooloose/syntastic'												" Syntax checker and linter
Plug 'triglav/vim-visual-increment'										" Better number and letter increment
Plug 'noahfrederick/vim-skeleton'										" File templates
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }						" fzf in vim
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'									" Highlight yanked text
Plug 'iqxd/vim-mine-sweeping'											" Mine sweeper game
Plug 'godlygeek/tabular', { 'for': 'markdown' } 						" Align text on certain characters. Only used with vim-markdown
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }					" Generate c++ documentation comment template

" Code completion and snippets
" Plug 'valloric/youcompleteme', { 'do': 'python3 ./install.py --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xavierd/clang_complete'
Plug 'sirver/ultisnips'

" language bundles and/or highlighting
Plug 'pangloss/vim-javascript'
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

