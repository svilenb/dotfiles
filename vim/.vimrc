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
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-flagship'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'markonm/traces.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'prabirshrestha/vim-lsp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/seoul256.vim'

Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

if executable('ag')
    set grepprg=ag\ --vimgrep
endif

set hidden
set incsearch ignorecase smartcase nohlsearch
set number relativenumber
set nowrap
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set mouse=a
set laststatus=2
set showtabline=2
set cmdheight=2
set noerrorbells visualbell t_vb=

let mapleader = " "

let g:seoul256_srgb = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:lsp_diagnostics_float_cursor = 1
let g:UltiSnipsListSnippets = "<C-R><Tab>"

if executable('typescript-language-server')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'typescript-language-server',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
				\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
				\ 'whitelist': ['typescript', 'typescriptreact', 'javascript', 'javascriptreact'],
				\ })
endif

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes

	if exists('+tagfunc')
		setlocal tagfunc=lsp#tagfunc
	endif

	nmap <buffer> gd         <plug>(lsp-definition)
	nmap <buffer> gD         <plug>(lsp-implementation)
	nmap <buffer> K          <plug>(lsp-hover)
	nmap <buffer> <c-k>      <plug>(lsp-signature-help)
	nmap <buffer> 1gD        <plug>(lsp-type-definition)
	nmap <buffer> gr         <plug>(lsp-references)
	nmap <buffer> g0         <plug>(lsp-document-symbol)
	nmap <buffer> gW         <plug>(lsp-workspace-symbol)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> <F5>       <plug>(lsp-document-diagnostics)
endfunction

augroup lsp_install
	autocmd!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

colorscheme seoul256
set background=dark

if !exists('##TextYankPost')
	map y <Plug>(highlightedyank)
endif

nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <Leader>rd :Pcd<CR>
nnoremap <Leader>a :Ggrep!<Space>
