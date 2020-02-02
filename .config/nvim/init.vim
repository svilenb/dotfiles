set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

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
Plug 'neovim/nvim-lsp'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mhinz/vim-grepper'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

if (has("termguicolors"))
	set termguicolors
endif

set hidden
set incsearch ignorecase smartcase nohlsearch
set number relativenumber
set nowrap
set list
set listchars+=eol:$
set completeopt-=preview
set completeopt+=longest,noinsert,menuone,noselect
set mouse=a
set laststatus=2
set showtabline=2

if exists('&inccommand')
	set inccommand=split
endif

let mapleader = " "

nnoremap <Leader>e :find **/*

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" https://stackoverflow.com/a/27593908/4978402

augroup Linting
	autocmd!
	autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal makeprg=./node_modules/.bin/eslint\ --format\ compact\ %
	autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
augroup END

augroup Completing
	autocmd!
	autocmd Filetype javascript,javascriptreact,typescript,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <Leader>a :Grepper

let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='bg'

set background=dark
colorscheme gruvbox

lua require 'plugins'

" nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

" nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
" nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>d <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>

" Reference for what I used before
"
" autocmd FileType typescript nnoremap <buffer> K :YcmCompleter GetType<CR>
" autocmd FileType typescript nnoremap <buffer> <C-^> :YcmCompleter GoToReferences<CR>
" autocmd FileType typescript nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
