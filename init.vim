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
Plug 'joshdick/onedark.vim'

Plug 'tpope/vim-fugitive'
Plug 'valloric/youcompleteme', { 'do': './install.py --js-completer --clang-completer' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
let g:airline_theme='onedark'

set hidden
set hlsearch incsearch ignorecase
set number
set nowrap

" On some machines Vim is preconfigured with the backupcopy option set to auto.
" This could potentially cause problems with the system’s file watching mechanism.
" Switching this option to yes will make sure a copy of the file is made and the original one overwritten on save.
set backupcopy=yes

" File search settings
" Exclude files and directories from ctrp searches
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links' }

let g:ale_linters = { 'typescript': ['tsserver'], 'scss' : [], 'javascript': [] }
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

let mapleader = ","
imap jk <Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4

map <C-n> :NERDTreeToggle<CR>
noremap <F3> :Autoformat<CR>
nnoremap <F5> :ALELint<CR>
nnoremap <F12> :YcmCompleter GoToDefinition<CR>
nnoremap <F6> :YcmCompleter GoToReferences<CR>
nnoremap <F2> :YcmCompleter GetType<CR>

map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
