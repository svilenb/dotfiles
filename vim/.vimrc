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
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set laststatus=2
set showtabline=2
set cmdheight=2
set noerrorbells visualbell t_vb=

let mapleader = " "

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:lsp_diagnostics_float_cursor = 1
let g:fugitive_legacy_commands = 0
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsListSnippets = "<C-R><Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:traces_preview_window = "winwidth('%') > 160 ? 'bot vnew' : 'bot 10new'"
let g:traces_abolish_integration = 1

function! PackInit() abort
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type': 'opt' })

	call minpac#add('tpope/vim-sensible')
	call minpac#add('tpope/vim-apathy')
	call minpac#add('tpope/vim-sleuth')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-abolish')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-endwise')
	call minpac#add('tpope/vim-jdaddy')
	call minpac#add('tpope/vim-vinegar')
	call minpac#add('tpope/vim-flagship')
	call minpac#add('tpope/vim-dispatch')
	call minpac#add('tpope/vim-obsession')
	call minpac#add('tpope/vim-eunuch')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-projectionist')
	call minpac#add('tpope/vim-tbone', { 'type': 'opt', 'name': 'tbone' })
	call minpac#add('tpope/vim-scriptease', { 'type': 'opt', 'name': 'scriptease' })

	call minpac#add('tommcdo/vim-exchange')
	call minpac#add('tommcdo/vim-lion')
	call minpac#add('tommcdo/vim-fubitive')

	call minpac#add('AndrewRadev/splitjoin.vim')
	call minpac#add('AndrewRadev/linediff.vim')
	call minpac#add('AndrewRadev/sideways.vim')

	call minpac#add('markonm/traces.vim')
	call minpac#add('machakann/vim-highlightedyank')
	call minpac#add('editorconfig/editorconfig-vim')
	call minpac#add('SirVer/ultisnips')
	call minpac#add('honza/vim-snippets')
	call minpac#add('prabirshrestha/vim-lsp')
	call minpac#add('mattn/vim-lsp-settings')

	call minpac#add('HerringtonDarkholme/yats.vim')
	call minpac#add('MaxMEllon/vim-jsx-pretty')
	call minpac#add('tmux-plugins/vim-tmux')
	call minpac#add('lifepillar/vim-solarized8')
	call minpac#add('chrisbra/Colorizer')
endfunction

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
	nmap <buffer> <leader>d  <plug>(lsp-document-diagnostics)
	nmap <buffer> <leader>ca <plug>(lsp-code-action)
	nmap <buffer> <leader>f  <plug>(lsp-document-format)
endfunction

function! MyHighlights() abort
	execute "highlight LspErrorText guifg=" . g:terminal_ansi_colors[1] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspWarningText guifg=" . g:terminal_ansi_colors[3] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspInformationText guifg=" . g:terminal_ansi_colors[6] . " guibg=NONE gui=bold cterm=bold"
	execute "highlight LspHintText guifg=" . g:terminal_ansi_colors[6] . " guibg=NONE gui=bold cterm=bold"

	execute "highlight LspErrorHighlight guifg=" . g:terminal_ansi_colors[1] . " guibg=NONE guisp=" . g:terminal_ansi_colors[1] . " gui=undercurl cterm=undercurl"
	execute "highlight LspWarningHighlight guifg=" . g:terminal_ansi_colors[3] . " guibg=NONE guisp=" . g:terminal_ansi_colors[3] . " gui=undercurl cterm=undercurl"
	execute "highlight LspInformationHighlight guifg=" . g:terminal_ansi_colors[6] . " guibg=NONE guisp=" . g:terminal_ansi_colors[6] . " gui=undercurl cterm=undercurl"
	execute "highlight LspHintHighlight guifg=" . g:terminal_ansi_colors[6] . " guibg=NONE gui=undercurl guisp=" . g:terminal_ansi_colors[6] . " cterm=undercurl"

	highlight! link lspReference CursorLine
endfunction

augroup my
	autocmd!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
	autocmd ColorScheme solarized8 call MyHighlights()
augroup END

colorscheme solarized8
set background=light

nnoremap <Leader>cd :tcd %:p:h<CR>
nnoremap <Leader>rd :Ptcd<CR>
nnoremap <Leader>a :Ggrep!<Space>
nnoremap <Leader>rg :Ggrep! <C-R>"<CR>
nnoremap <Leader>h :SidewaysLeft<cr>
nnoremap <Leader>l :SidewaysRight<cr>
nnoremap <Leader>b :SidewaysJumpLeft<cr>
nnoremap <Leader>w :SidewaysJumpRight<cr>

nmap <Leader>si <Plug>SidewaysArgumentInsertBefore
nmap <Leader>sa <Plug>SidewaysArgumentAppendAfter
nmap <Leader>sI <Plug>SidewaysArgumentInsertFirst
nmap <Leader>sA <Plug>SidewaysArgumentAppendLast

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
