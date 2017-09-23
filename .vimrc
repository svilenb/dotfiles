set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'PreserveNoEOL'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yggdroot/indentline'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'

Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/syntastic'
Plugin 'quramy/tsuquyomi'
Plugin 'valloric/youcompleteme'
Plugin 'pangloss/vim-javascript'  
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Setting up the color scheme
syntax enable
set background=dark
colorscheme solarized
" Set airline theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" 'ic' 'ignorecase'       ignore upper/lower case when searching
" 'is' 'incsearch'        show partial matches for a search phrase
" 'hls' 'hlsearch'        highlight all matching phrases
set hls is ic
" Showing the line numbers by default
set number
" Remove line breaking
:set nowrap

" File search settings
" Exclude files and directories from ctrp searches
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/](node_modules)|(\.(git|hg|svn))$'

" Allow JSX in normal JS files
let g:jsx_ext_required = 0 

" Map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<F6>'

noremap <F3> :Autoformat<CR>
" Setup used libraries for having syntax support
let g:used_javascript_libs = 'react'

" Properties set using .editorconfig
" Set tabsize
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" let g:PreserveNoEOL = 1
