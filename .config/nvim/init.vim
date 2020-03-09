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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'neovim/nvim-lsp'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tmux-plugins/vim-tmux'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'arcticicestudio/nord-vim'

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
set showtabline=2
set cmdheight=2

if exists('&inccommand')
	set inccommand=split
endif

if executable('ag')
	set grepprg=ag\ --vimgrep
endif

let mapleader = " "

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

function! Grep(args)
	let args = split(a:args, ' ')
	return system(join([&grepprg, shellescape(args[0]), len(args) > 1 ? join(args[1:-1], ' ') : ''], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<q-args>)

augroup Quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

function! SetupLSP()
	setlocal omnifunc=v:lua.vim.lsp.omnifunc

	nnoremap <buffer> gd <cmd>lua vim.lsp.buf.declaration()<CR>
	nnoremap <buffer> gD <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <buffer> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <buffer> K <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <buffer> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
	nnoremap <buffer> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
	nnoremap <buffer> gr <cmd>lua vim.lsp.buf.references()<CR>
	nnoremap <buffer> gR <cmd>lua vim.lsp.buf.rename()<CR>
	nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
	nnoremap <leader>d <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
endfunction

function! LspStatus() abort
	if luaeval('vim.lsp.buf.server_ready()')
		let sl ='E:'
		let sl.=luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")
		let sl.=' W:'
		let sl.=luaeval("vim.lsp.util.buf_diagnostics_count(\"Warning\")")
		return 'LSP('.sl.')'
	else
		return ''
	endif
endfunction

autocmd User Flags call Hoist('buffer', function('LspStatus'))

augroup Filetypes
	autocmd!
	autocmd FileType javascript,javascriptreact call SetupLSP()
	autocmd FileType typescript,typescriptreact call SetupLSP()
	autocmd FileType vim,tex call SetupLSP()
	autocmd FileType css,scss call SetupLSP()
augroup END

let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_underline = 1

set background=dark
colorscheme nord

lua require 'plugins'

if !exists('##TextYankPost')
	map y <Plug>(highlightedyank)
endif

nnoremap <Leader>e :find **/*
nnoremap <Leader>cd :lcd %:p:h<CR>
nnoremap <Leader>rd :Plcd<CR>
nnoremap <Leader>a :Ggrep!<Space>
nnoremap <Leader>m :match StatusLine /\<<C-R><C-W>\>/<CR>
nnoremap <Leader>n :match none<CR>
