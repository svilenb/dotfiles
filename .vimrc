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
Plug 'wellle/targets.vim'
Plug 'markonm/traces.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tmux-plugins/vim-tmux'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'junegunn/seoul256.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

call plug#end()

set hidden
set incsearch ignorecase smartcase nohlsearch
set number relativenumber
set nowrap
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set mouse=a
set laststatus=2
set showtabline=2
set cmdheight=2

let mapleader = " "

let g:seoul256_srgb = 1
let g:flagship_skip = 'fugitive#statusline\|FugitiveStatusline'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:LanguageClient_selectionUI = 'quickfix'
let g:LanguageClient_diagnosticsList = 'Location'

let g:LanguageClient_serverCommands = {
			\ 'javascript': ['typescript-language-server', '--stdio'],
			\ 'javascriptreact': ['typescript-language-server', '--stdio'],
			\ 'typescript': ['typescript-language-server', '--stdio'],
			\ 'typescriptreact': ['typescript-language-server', '--stdio'],
			\ }

function! LC_maps()
	if has_key(g:LanguageClient_serverCommands, &filetype)
		nmap <buffer> <silent> gd <Plug>(lcn-definition)
		nmap <buffer> <silent> gD <Plug>(lcn-implementation)
		nmap <buffer> <silent> <c-]> <Plug>(lcn-definition)
		nmap <buffer> <silent> K <Plug>(lcn-hover)
		nmap <buffer> <silent> 1gD <Plug>(lcn-type-definition)
		nmap <buffer> <silent> gr <Plug>(lcn-references)

		nmap <buffer> <silent> <F2> <Plug>(lcn-rename)
		nmap <buffer> <silent> <leader>d <Plug>(lcn-explain-error)
	endif
endfunction

augroup Filetypes
	autocmd!
	autocmd FileType * call LC_maps()
augroup END

colorscheme seoul256
set background=dark

if !exists('##TextYankPost')
	map y <Plug>(highlightedyank)
endif

nnoremap <Leader>f :find **/*
nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <Leader>rd :Pcd<CR>
nnoremap <Leader>a :Ggrep!<Space>
