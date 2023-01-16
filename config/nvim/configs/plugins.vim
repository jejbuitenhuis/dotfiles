call plug#begin( stdpath('data') . '/plugged' )
" Color visualizer (installed GO)
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
" Comment stuff
Plug 'preservim/nerdcommenter'
" Emmet
Plug 'mattn/emmet-vim'
" Key highlight (f, F)
Plug 'unblevable/quick-scope'
" Autocomplete brackets and stuff
Plug 'chun-yang/auto-pairs'
" Surrounding characters made easy
Plug 'tpope/vim-surround'
" Local vimrc
Plug 'embear/vim-localvimrc'
" Icons
Plug 'ryanoasis/vim-devicons'
" Spell checker
Plug 'kamykn/spelunker.vim'
" Check what attribute is used for color scheme
Plug 'vim-scripts/SyntaxAttr.vim'
" i3 config color coding
Plug 'mboughaba/i3config.vim'
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
" Generate c++ documentation comment template
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }
" Show indentation lines when indented with spaces
Plug 'Yggdroot/indentLine'
" Git in vim
Plug 'tpope/vim-fugitive'
" Git diff
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
" Live markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Execute sql to a server
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
" Show git blame behind current line
Plug 'APZelos/blamer.nvim'
" Swap text with cx
Plug 'tommcdo/vim-exchange'
" Open file text on window separator
Plug 'b0o/incline.nvim'
" Restore cursor in last position
Plug 'farmergreg/vim-lastplace'
" Plantuml preview
Plug 'tyru/open-browser.vim', { 'for': 'plantuml' }
Plug 'weirongxu/plantuml-previewer.vim', { 'for': 'plantuml' }

" Code completion and snippets
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'xavierd/clang_complete'
Plug 'sirver/ultisnips'

" language bundles and/or highlighting
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'leafoftree/vim-vue-plugin'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'peitalin/vim-jsx-typescript'
Plug 'LnL7/vim-nix'
" Plug 'neovimhaskell/haskell-vim'
Plug 'jrozner/vim-antlr'
Plug 'aklt/plantuml-syntax'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" Plug 'nvim-treesitter/playground'

" Color schemes
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'embark-theme/vim', { 'as': 'embark' }

call plug#end()
