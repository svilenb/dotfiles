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
Plug 'tpope/vim-dadbod'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-fubitive'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'neovim/nvim-lsp'
Plug 'editorconfig/editorconfig-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tmux-plugins/vim-tmux'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'junegunn/seoul256.vim'

call plug#end()

if (has('termguicolors'))
	set termguicolors
endif

set hidden
set incsearch ignorecase smartcase nohlsearch
set number relativenumber
set nowrap
set list
set listchars+=eol:$
set mouse=a
set laststatus=2
set cmdheight=2

if exists('&inccommand')
	set inccommand=split
endif

let mapleader = " "

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:seoul256_srgb = 1

function! SetupLSP()
	setlocal omnifunc=v:lua.vim.lsp.omnifunc

	nnoremap <buffer> gd <cmd>lua vim.lsp.buf.declaration()<CR>
	nnoremap <buffer> gD <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <buffer> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <buffer> K <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <buffer> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
	nnoremap <buffer> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
	nnoremap <buffer> gr <cmd>lua vim.lsp.buf.references()<CR>
	nnoremap <buffer> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
	nnoremap <silent> gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

	nnoremap <buffer> gR <cmd>lua vim.lsp.buf.rename()<CR>
	nnoremap <buffer> <leader>d <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
	nnoremap <buffer> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
endfunction

augroup Filetypes
	autocmd!
	autocmd FileType javascript,javascriptreact call SetupLSP()
	autocmd FileType typescript,typescriptreact call SetupLSP()
	autocmd FileType tex call SetupLSP()
	autocmd FileType css,scss call SetupLSP()
augroup END

augroup Highlight
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

colorscheme seoul256
set background=dark

lua require 'plugins'

nnoremap <Leader>f :find **/*
nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <Leader>rd :Pcd<CR>
nnoremap <Leader>a :Ggrep!<Space>
