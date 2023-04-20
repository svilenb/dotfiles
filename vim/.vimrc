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
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsListSnippets = "<C-R><Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

function! TypeScriptCustomNotificationHandler(lspserver, reply) abort
	echom printf("TypeScript Version = %s", a:reply.params.version)
endfunction

function! SetupLSP() abort
	if exists('+tagfunc')
		setlocal tagfunc=lsp#lsp#TagFunc
	endif

	if exists('+formatexpr')
		setlocal formatexpr=lsp#lsp#FormatExpr()
	endif

	nnoremap <buffer> gd         <Cmd>LspGotoDefinition<CR>
	nnoremap <buffer> gD         <Cmd>LspGotoImpl<CR>
	nnoremap <buffer> K          <Cmd>LspHover<CR>
	nnoremap <buffer> <c-k>      <Cmd>LspShowSignature<CR>
	nnoremap <buffer> 1gD        <Cmd>LspGotoTypeDef<CR>
	nnoremap <buffer> gr         <Cmd>LspShowReferences<CR>
	nnoremap <buffer> gW         <Cmd>LspSymbolSearch<CR>
	nnoremap <buffer> <Leader>rn <Cmd>LspRename<CR>
	nnoremap <buffer> <Leader>ca <Cmd>LspCodeAction<CR>
	nnoremap <buffer> <Leader>f  <Cmd>LspFormat<CR>
	nnoremap <buffer> <Leader>ds <Cmd>LspDiagShow<CR>
	nnoremap <buffer> <Leader>dc <Cmd>LspDiagCurrent<CR>
endfunction

function! MyHighlights() abort
	highlight link LspDiagLine NONE
endfunction

augroup my
	autocmd!
	autocmd User LspAttached call SetupLSP()
	autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme retrobox

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

	call minpac#add('yegappan/mru')
	call minpac#add('yegappan/lsp', { 'type': 'opt' })

	call minpac#add('vim/colorschemes')
	call minpac#add('vim/killersheep', { 'type': 'opt' })

	call minpac#add('tmux-plugins/vim-tmux')

	call minpac#add('MaxMEllon/vim-jsx-pretty')
endfunction

function! LspInit() abort
	let lspServers = [
				\     #{
				\	 name: 'typescriptlang',
				\	 filetype: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
				\	 path: '/Users/svilen.bonev/.nvm/versions/node/v18.9.0/bin/typescript-language-server',
				\	 args: ['--stdio'],
				\	 customNotificationHandlers: {
				\	   '$/typescriptVersion': function('TypeScriptCustomNotificationHandler')
				\	 }
				\      },
				\   ]
	let lspOpts = {
				\ 'autoComplete': v:false,
				\ 'useQuickfixForLocations': v:true,
				\ }

	call LspAddServer(lspServers)
	call LspOptionsSet(lspOpts)
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
command! StartLsp packadd lsp | call LspInit()
