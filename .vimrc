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

Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yggdroot/indentline'
Plugin 'ap/vim-css-color'
Plugin 'lifepillar/vim-solarized8'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'

Plugin 'leafgarland/typescript-vim'
Plugin 'valloric/youcompleteme'
Plugin 'w0rp/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-haml'
Plugin 'mxw/vim-jsx'
Plugin 'ianks/vim-tsx'

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

if has('termguicolors')
    set termguicolors
    set background=light
    colorscheme solarized8
    let g:airline_theme='solarized'
    let g:airline_solarized_bg='light'
endif

set guifont=Monospace\ 13

:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L "remove left-hand scroll bar

:set hidden

" 'ic' 'ignorecase' ignore upper/lower case when searching
" 'is' 'incsearch'  show partial matches for a search phrase
" 'hls' 'hlsearch'  highlight all matching phrases
set hls is ic

" Showing the line numbers by default
:set number

" Remove line breaking
:set nowrap

" Properties set using .editorconfig
" Set tabsize
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" On some machines Vim is preconfigured with the backupcopy option set to auto.
" This could potentially cause problems with the system’s file watching mechanism.
" Switching this option to yes will make sure a copy of the file is made and the original one overwritten on save.
set backupcopy=yes

" File search settings
" Exclude files and directories from ctrp searches
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

let g:ale_linters = {
            \   'typescript': ['tsserver'],
            \   'scss' : [],
            \   'javascript': [],
            \}

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Disable diagnostics for YCM since ALE is used
let g:ycm_show_diagnostics_ui = 0

map <C-n> :NERDTreeToggle<CR>
noremap <F3> :Autoformat<CR>
nnoremap <F5> :ALELint<CR>
nnoremap <F12> :YcmCompleter GoToDefinition<CR>
nnoremap <S-F12> :YcmCompleter GoToReferences<CR>
nnoremap <F2> :YcmCompleter GetType<CR>
nnoremap <S-F2> :YcmCompleter GetDoc<CR>

map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
