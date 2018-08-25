call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'sjl/gundo.vim'
Plug 'valloric/youcompleteme', { 'do': './install.py --js-completer --clang-completer' }
Plug 'rdnetto/ycm-generator', { 'branch': 'stable'}
Plug 'w0rp/ale'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'chiel92/vim-autoformat'

Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'

Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'edkolev/tmuxline.vim'

call plug#end()

syntax on

if (has("termguicolors"))
    set termguicolors
endif

colorscheme gruvbox
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='bg'

set background=dark

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'full'
let g:tmuxline_theme = {
            \'a'    : [ 237, 250 ],
            \'b'    : [ 250, 237 ],
            \'bg'   : [ 237, 237 ],
            \'c'    : [ 250, 237 ],
            \'win'  : [ 108, 237 ],
            \'cwin' : [ 237, 108 ],
            \'x'    : [ 250, 237 ],
            \'y'    : [ 250, 237 ],
            \'z'    : [ 237, 250 ]
            \ }

set hidden
set incsearch ignorecase smartcase
set number relativenumber
set nowrap

" On some machines Vim is preconfigured with the backupcopy option set to auto.
" This could potentially cause problems with the system’s file watching mechanism.
" Switching this option to yes will make sure a copy of the file is made and the original one overwritten on save.
set backupcopy=yes

" The Silver Searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ale_linters = { 'typescript': ['tsserver'], 'scss' : [], 'javascript': [] }
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

let mapleader = ","
imap jj <Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>v :VimuxRunCommand<Space>

nnoremap <F2> :YcmCompleter GetType<CR>
noremap <F3> :Autoformat<CR>
nnoremap <F5> :ALELint<CR>
nnoremap <F6> :YcmCompleter GoToReferences<CR>
nnoremap <F7> :GundoToggle<CR>
nnoremap <F12> :YcmCompleter GoToDefinition<CR>

