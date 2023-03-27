call pathogen#infect()

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

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
set laststatus=2
set showtabline=2
set cmdheight=2
set clipboard^=unnamed,unnamedplus
set wildoptions=pum
set noerrorbells visualbell t_vb=
set sessionoptions-=options

let mapleader = " "

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0

let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsListSnippets = "<C-R><Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

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
	nmap <buffer> <Leader>rn <plug>(lsp-rename)
	nmap <buffer> <Leader>ca <plug>(lsp-code-action)
	nmap <buffer> <Leader>f  <plug>(lsp-document-format)
	nmap <buffer> <F5>       <plug>(lsp-document-diagnostics)
endfunction

function! MyHighlights() abort
	execute "highlight LspErrorText guifg=" . g:terminal_ansi_colors[1] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspWarningText guifg=" . g:terminal_ansi_colors[3] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspInformationText guifg=" . g:terminal_ansi_colors[4] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspHintText guifg=" . g:terminal_ansi_colors[6] . " guibg=NONE gui=bold cterm=bold"

	execute "highlight LspErrorVirtualText guifg=" . g:terminal_ansi_colors[1] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspWarningVirtualText guifg=" . g:terminal_ansi_colors[3] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspInformationVirtualText guifg=" . g:terminal_ansi_colors[4] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspHintVirtualText guifg=" . g:terminal_ansi_colors[6] . " guibg=NONE gui=bold cterm=bold"

	execute "highlight LspErrorHighlight guifg=" . g:terminal_ansi_colors[1] . " guibg=NONE guisp=" . g:terminal_ansi_colors[1] . " gui=undercurl cterm=undercurl"
	execute "highlight LspWarningHighlight guifg=" . g:terminal_ansi_colors[3] . " guibg=NONE guisp=" . g:terminal_ansi_colors[3] . " gui=undercurl cterm=undercurl"
	execute "highlight LspInformationHighlight guifg=" . g:terminal_ansi_colors[4] . " guibg=NONE guisp=" . g:terminal_ansi_colors[4] . " gui=undercurl cterm=undercurl"
	execute "highlight LspHintHighlight guifg=" . g:terminal_ansi_colors[6] . " guibg=NONE gui=undercurl guisp=" . g:terminal_ansi_colors[6] . " cterm=undercurl"

	highlight! link lspReference CursorLine
endfunction

augroup my
	autocmd!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
	autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme retrobox
set background=light

" delete without yanking
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <Leader>p "_dP

nnoremap <Leader>ew :e <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <Leader>es :sp <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <Leader>ev :vsp <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <Leader>et :tabe <C-R>=fnameescape(expand('%:h')).'/'<CR>

nnoremap <Leader>b :buffer <C-R>=fnameescape(getcwd()).'/**'<CR>
nnoremap <Leader>sb :sbuffer <C-R>=fnameescape(getcwd()).'/**'<CR>

nnoremap <Leader>cd :tcd %:p:h<CR>
nnoremap <Leader>rd :Ptcd<CR>

nnoremap <Leader>a :Ggrep!<Space>

nnoremap <Leader>h :SidewaysLeft<CR>
nnoremap <Leader>l :SidewaysRight<CR>
nnoremap <Leader>jh :SidewaysJumpLeft<CR>
nnoremap <Leader>jl :SidewaysJumpRight<CR>

nmap <Leader>si <Plug>SidewaysArgumentInsertBefore
nmap <Leader>sa <Plug>SidewaysArgumentAppendAfter
nmap <Leader>sI <Plug>SidewaysArgumentInsertFirst
nmap <Leader>sA <Plug>SidewaysArgumentAppendLast

function! PackInit() abort
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type': 'opt' })

	call minpac#add('editorconfig/editorconfig-vim')

	call minpac#add('tpope/vim-sensible')
	call minpac#add('tpope/vim-apathy')
	call minpac#add('tpope/vim-sleuth')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-abolish')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-endwise')
	call minpac#add('tpope/vim-rsi')
	call minpac#add('tpope/vim-jdaddy')
	call minpac#add('tpope/vim-speeddating')
	call minpac#add('tpope/vim-vinegar')
	call minpac#add('tpope/vim-flagship')
	call minpac#add('tpope/vim-dispatch')
	call minpac#add('tpope/vim-obsession')
	call minpac#add('tpope/vim-eunuch')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-rhubarb')
	call minpac#add('tpope/vim-projectionist')
	call minpac#add('tpope/vim-capslock')
	call minpac#add('tpope/vim-characterize')
	call minpac#add('tpope/vim-tbone', { 'type': 'opt', 'name': 'tbone' })
	call minpac#add('tpope/vim-scriptease', { 'type': 'opt', 'name': 'scriptease' })

	call minpac#add('tommcdo/vim-exchange')
	call minpac#add('tommcdo/vim-lion')
	call minpac#add('tommcdo/vim-fubitive')

	call minpac#add('AndrewRadev/splitjoin.vim')
	call minpac#add('AndrewRadev/linediff.vim', { 'type': 'opt', 'name': 'linediff' })
	call minpac#add('AndrewRadev/sideways.vim')

	call minpac#add('chrisbra/NrrwRgn')
	call minpac#add('chrisbra/Colorizer')

	call minpac#add('vim/colorschemes')
	call minpac#add('vim/killersheep', { 'type': 'opt' })

	call minpac#add('tmux-plugins/vim-tmux')

	call minpac#add('honza/vim-snippets')
	call minpac#add('SirVer/ultisnips')

	call minpac#add('prabirshrestha/vim-lsp')

	call minpac#add('HerringtonDarkholme/yats.vim')
	call minpac#add('MaxMEllon/vim-jsx-pretty')
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
