call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-dadbod'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-fubitive'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mhinz/vim-grepper'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --ts-completer' }
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

set nocompatible

if (has("termguicolors"))
    set termguicolors
endif

set hidden
set incsearch ignorecase smartcase
set number relativenumber
set nowrap
set list
set listchars+=eol:$
set completeopt-=preview
set mouse=a
set backupcopy=yes
set laststatus=2
set showtabline=2
set guioptions-=e

if exists('&inccommand')
    set inccommand=split
endif

let mapleader = " "

augroup Linting
    autocmd!
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal makeprg=./node_modules/.bin/eslint\ --format\ compact\ %
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
augroup END

augroup Formatting
    autocmd!
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact,scss,css setlocal formatprg=./node_modules/.bin/prettier\ --stdin\ --stdin-filepath\ %
augroup END

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='bg'

set background=dark
colorscheme gruvbox

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_always_populate_location_list = 1

nnoremap <Leader>a :Grepper
nnoremap <Leader>e :find **/*

nnoremap <leader>b :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>f :YcmCompleter Format<CR>
nnoremap <leader>oi :YcmCompleter OrganizeImports<CR>

nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

