call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-git'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'valloric/youcompleteme', { 'do': './install.py --js-completer --clang-completer' }
Plug 'valloric/listtoggle'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'

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

let g:ale_linters = {
            \   'javascript': ['eslint']
            \}

let g:ale_linters_explicit = 1

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

nmap <F8> :TagbarToggle<CR>

nnoremap <Leader>b :Autoformat<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>x :ALELint<CR>
