call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'

Plug 'mhinz/vim-startify'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-dispatch'
Plug 'valloric/youcompleteme', { 'do': './install.py --js-completer --clang-completer' }
Plug 'valloric/listtoggle'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'

Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-git'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

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

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
    let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let g:ycm_always_populate_location_list = 1
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

let g:ale_lint_on_text_changed = '0'
let g:ale_lint_on_insert_leave = '0'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '0'
let g:ale_lint_on_filetype_changed = '0'

let g:ale_fixers = {
            \   'typescript': ['prettier'],
            \   'javascript': ['prettier'],
            \   'json': ['prettier'],
            \   'css': ['prettier'],
            \   'scss': ['prettier']
            \}

let g:netrw_banner = 1

let mapleader = ","

imap jj <Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4

nnoremap <Leader>m :match StatusLine /\<<C-R><C-W>\>/<CR>
nnoremap <Leader>n :match none<CR>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

nnoremap <Leader>e :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

nnoremap <Leader>gs :Gstatus<CR>

nnoremap <silent> <C-n> :Buffers<CR>
nnoremap <silent> <C-p> :FZF -m<CR>

nnoremap <Leader>f :YcmCompleter Format<CR>
nnoremap <Leader>b :ALEFix<CR>
