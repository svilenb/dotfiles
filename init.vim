call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'junegunn/gv.vim'
Plug 'valloric/youcompleteme', { 'do': './install.py --js-completer --clang-completer' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'

Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'herringtondarkholme/yats.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

call plug#end()

syntax enable

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

set hidden
set incsearch ignorecase smartcase
set number relativenumber
set nowrap

" On some machines Vim is preconfigured with the backupcopy option set to auto.
" This could potentially cause problems with the system’s file watching mechanism.
" Switching this option to yes will make sure a copy of the file is made and the original one overwritten on save.
set backupcopy=yes

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
    let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let g:ycm_always_populate_location_list = 1
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

let mapleader = ","
imap jj <Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>v :VimuxRunCommand<Space>
nnoremap <Leader>e :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <Leader>gs :Gstatus<CR>

nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :FZF -m<CR>

noremap <F3> :Autoformat<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
