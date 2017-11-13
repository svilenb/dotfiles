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
" Plugin 'PreserveNoEOL'

" Plugin 'takac/vim-spotifysearch'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yggdroot/indentline'
Plugin 'ap/vim-css-color'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'

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
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Allow JSX in normal JS files
let g:jsx_ext_required = 0
" Setup used libraries for having syntax support
let g:used_javascript_libs = 'react'

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers['typescript'] = ['.']

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

set ballooneval
if has('gui_running')
    autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
else
    autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
endif

map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
noremap <F3> :Autoformat<CR>

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_scss_checkers = [ 'sass_lint' ]
let g:syntastic_scss_sass_lint_quiet_messages = { "level": "warnings" }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<F6>'

let g:tagbar_type_typescript = {
            \ 'ctagstype': 'typescript',
            \ 'kinds': [
            \ 'c:classes',
            \ 'n:modules',
            \ 'f:functions',
            \ 'v:variables',
            \ 'v:varlambdas',
            \ 'm:members',
            \ 'i:interfaces',
            \ 'e:enums',
            \ ]
            \ }

" Properties set using .editorconfig
" Set tabsize
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" let g:PreserveNoEOL = 1

" To filter spotify results appropriate to your region add the line below to your .vimrc with the correct country code.
let g:spotify_country_code = 'BG'

" For linux operating systems with dbus, you can map specific keys to play/pause, next and previous.
" These mappings will only work inside the spotify list buffer.
let g:spotify_prev_key = "<F9>"
let g:spotify_playpause_key = "<F10>"
let g:spotify_next_key = "<F11>"
