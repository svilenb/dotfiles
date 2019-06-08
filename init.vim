call plug#begin('~/.local/share/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'valloric/youcompleteme', { 'do': './install.py --ts-completer' }
Plug 'w0rp/ale'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ianks/vim-tsx'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'

call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1

colorscheme nord

set background=dark
set hidden
set incsearch ignorecase smartcase
set number relativenumber
set list
set nowrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set completeopt-=preview
set mouse=a
set inccommand=split
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

if (has('nvim-0.4'))
    set wildoptions=pum
endif

let g:airline_theme='nord'

let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment']
            \}

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_detailed_diagnostics = ''

let mapleader = " "

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
            \   'typescript': ['prettier'],
            \   'javascript': ['prettier'],
            \   'jsx': ['prettier'],
            \   'json': ['prettier'],
            \   'css': ['prettier'],
            \   'scss': ['prettier']
            \}

nnoremap <Leader>m :match StatusLine /\<<C-R><C-W>\>/<CR>
nnoremap <Leader>n :match none<CR>

nnoremap <Leader>a :Ack!<Space>

nnoremap <Leader>rr :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>b :YcmCompleter Format<CR>
nnoremap <Leader>oi :YcmCompleter OrganizeImports<CR>

nnoremap <Leader>p :FZF -m<CR>
nnoremap <Leader>t :Buffers<CR>

nnoremap <F5> :ALELint<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>d :ALEDetail<CR>
