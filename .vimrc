set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

Plugin 'johngrib/vim-game-code-break'

Plugin 'tpope/vim-sensible'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yggdroot/indentline'
Plugin 'ap/vim-css-color'
Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'

Plugin 'leafgarland/typescript-vim'
Plugin 'valloric/youcompleteme'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ianks/vim-tsx'
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

if has('gui_running')
    set background=dark
    colorscheme solarized
    let g:airline_theme='solarized'
    let g:airline_solarized_bg='dark'
    set guifont=Monospace\ 12
endif

":set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L "remove left-hand scroll bar

:set hidden

" 'ic' 'ignorecase'       ignore upper/lower case when searching
" 'is' 'incsearch'        show partial matches for a search phrase
" 'hls' 'hlsearch'        highlight all matching phrases
set hls is ic

" Showing the line numbers by default
:set number

" redraw only when we need to.
set lazyredraw

" Remove line breaking
:set nowrap

" Properties set using .editorconfig
" Set tabsize
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" On some machines Vim is preconfigured with the backupcopy option set to auto. This could potentially cause problems with the system’s file watching mechanism. Switching this option to yes will make sure a copy of the file is made and the original one overwritten on save.
set backupcopy=yes

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

let g:ycm_always_populate_location_list = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

map <C-n> :NERDTreeToggle<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F12> :YcmCompleter GoToDefinition<CR>
nnoremap <S-F12> :YcmCompleter GoToReferences<CR>
nnoremap <F2> :YcmCompleter GetType<CR>
nnoremap <S-F2> :YcmCompleter GetDoc<CR>
nmap <F8> :TagbarToggle<CR>
noremap <F3> :Autoformat<CR>

map <Leader> <Plug>(easymotion-prefix)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

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
