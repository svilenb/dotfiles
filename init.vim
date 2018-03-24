call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'

Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'ap/vim-css-color'
Plug 'lifepillar/vim-solarized8'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'

Plug 'shougo/deoplete.nvim'
Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'

call plug#end()

if has('termguicolors')
	set termguicolors
	set background=dark
	colorscheme solarized8
	let g:airline_theme='solarized'
	let g:airline_solarized_bg='dark'
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

" On some machines Vim is preconfigured with the backupcopy option set to auto.
" This could potentially cause problems with the system’s file watching mechanism.
" Switching this option to yes will make sure a copy of the file is made and the original one overwritten on save.
set backupcopy=yes

" File search settings
" Exclude files and directories from ctrp searches
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links' }

let g:ale_linters = { 'typescript': ['tsserver'], 'scss' : [], 'javascript': [] }
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

let g:deoplete#enable_at_startup = 1
let g:nvim_typescript#default_mappings = 1
let g:nvim_typescript#loc_list_item_truncate_after = -1

map <C-n> :NERDTreeToggle<CR>
noremap <F3> :Autoformat<CR>
nnoremap <F5> :ALELint<CR>

map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
