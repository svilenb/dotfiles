call pathogen#infect()

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

if has("vms")
	" do not keep a backup file, use versions instead
	set nobackup
else
	" keep a backup file (restore to previous version)
	set backup
	if has('persistent_undo')
		" keep an undo file (undo changes after closing)
		set undofile
	endif
endif

if &t_Co > 2 || has("gui_running")
	" Switch on highlighting the last used search pattern.
	set hlsearch
endif

" Add optional packages.
if has('packages')
	if !has("patch-8.1.0360")
		packadd diffenhanced
	endif

	if !has("patch-8.1.1270")
		packadd searchindex
	endif

	if !has("patch-8.2.2345")
		packadd tmuxfocusevents
	endif

	" The matchit plugin makes the % command work better, but it is not backwards
	" compatible.
	" The ! means the package won't be loaded right away but when plugins are
	" loaded during initialization.
	if has('syntax') && has('eval')
		packadd! matchit
	endif
endif

set hidden
set incsearch ignorecase smartcase hlsearch
set number relativenumber
set nowrap
set laststatus=2 " flagship plugin
set showtabline=2 " flagship plugin
set cmdheight=2
set clipboard^=unnamed,unnamedplus
set wildmode=list,full
set noerrorbells visualbell t_vb=
set sessionoptions-=options " pathogen
set shortmess-=S " searchindex plugin
set list

let mapleader = " "

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:qf_mapping_ack_style = 1

colorscheme slate

function! TypeScriptCustomNotificationHandler(lspserver, reply) abort
	echom printf("TypeScript Version = %s", a:reply.params.version)
endfunction

function! SetupLSP() abort
	setlocal omnifunc=g:LspOmniFunc

	if exists('+tagfunc')
		setlocal tagfunc=lsp#lsp#TagFunc
	endif

	if exists('+formatexpr')
		setlocal formatexpr=lsp#lsp#FormatExpr()
	endif

	nnoremap <buffer> gd                  <Cmd>LspGotoDefinition<CR>
	nnoremap <buffer> <C-W>gd             <Cmd>topleft LspGotoDefinition<CR>
	nnoremap <buffer> gD                  <Cmd>LspGotoImpl<CR>
	nnoremap <buffer> K                   <Cmd>LspHover<CR>
	nnoremap <buffer> <c-k>               <Cmd>LspShowSignature<CR>
	nnoremap <buffer> 1gD                 <Cmd>LspGotoTypeDef<CR>
	nnoremap <buffer> gr                  <Cmd>LspShowReferences<CR>
	nnoremap <buffer> gW                  <Cmd>LspSymbolSearch<CR>
	nnoremap <buffer> <Leader>rn          <Cmd>LspRename<CR>
	nnoremap <buffer> <Leader>ca          <Cmd>LspCodeAction<CR>
	nnoremap <buffer> <Leader>f           <Cmd>LspFormat<CR>
	nnoremap <buffer> <Leader>m           <Cmd>LspDiag show<CR>
	nnoremap <buffer> <Leader>gH          <Cmd>LspDiag current<CR>
	xnoremap <silent><buffer> <Leader>e   <Cmd>LspSelectionExpand<CR>
	xnoremap <silent><buffer> <Leader>s   <Cmd>LspSelectionShrink<CR>
endfunction

function! MyHighlights() abort
	highlight link LspDiagLine NONE
	highlight link LspReadRef CursorLine
	highlight link LspTextRef CursorLine
endfunction

augroup my
	autocmd!

	autocmd User LspAttached call SetupLSP()
	autocmd ColorScheme * call MyHighlights()
	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
augroup END

map Y y$

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

nnoremap <Leader>ct :ColorToggle<CR>

nnoremap <Leader>h :SidewaysLeft<CR>
nnoremap <Leader>l :SidewaysRight<CR>
nnoremap <Leader>jh :SidewaysJumpLeft<CR>
nnoremap <Leader>jl :SidewaysJumpRight<CR>

nmap <Leader>si <Plug>SidewaysArgumentInsertBefore
nmap <Leader>sa <Plug>SidewaysArgumentAppendAfter
nmap <Leader>sI <Plug>SidewaysArgumentInsertFirst
nmap <Leader>sA <Plug>SidewaysArgumentAppendLast

nmap <Leader>gt <Plug>(qf_qf_toggle)
nmap <Leader>gT <Plug>(qf_loc_toggle)

function! PackInit() abort
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type': 'opt' })

	call minpac#add('editorconfig/editorconfig-vim', { 'name': 'editorconfig' })

	call minpac#add('tpope/vim-sensible', { 'name': 'sensible' })
	call minpac#add('tpope/vim-apathy', { 'name': 'apathy' })
	call minpac#add('tpope/vim-sleuth', { 'name': 'sleuth' })
	call minpac#add('tpope/vim-surround', { 'name': 'surround' })
	call minpac#add('tpope/vim-repeat', { 'name': 'repeat' })
	call minpac#add('tpope/vim-unimpaired', { 'name': 'unimpaired' })
	call minpac#add('tpope/vim-abolish', { 'name': 'abolish' })
	call minpac#add('tpope/vim-commentary', { 'name': 'commentary' })
	call minpac#add('tpope/vim-endwise', { 'name': 'endwise' })
	call minpac#add('tpope/vim-rsi', { 'name': 'rsi' })
	call minpac#add('tpope/vim-jdaddy', { 'name': 'jdaddy' })
	call minpac#add('tpope/vim-speeddating', { 'name': 'speeddating' })
	call minpac#add('tpope/vim-vinegar', { 'name': 'vinegar' })
	call minpac#add('tpope/vim-flagship', { 'name': 'flagship' })
	call minpac#add('tpope/vim-dispatch', { 'name': 'dispatch' })
	call minpac#add('tpope/vim-obsession', { 'name': 'obsession' })
	call minpac#add('tpope/vim-eunuch', { 'name': 'eunuch' })
	call minpac#add('tpope/vim-fugitive', { 'name': 'fugitive' })
	call minpac#add('tpope/vim-rhubarb', { 'name': 'rhubarb' })
	call minpac#add('tpope/vim-projectionist', { 'name': 'projectionist' })
	call minpac#add('tpope/vim-capslock', { 'name': 'capslock' })
	call minpac#add('tpope/vim-scriptease', { 'name': 'scriptease' })
	call minpac#add('tpope/vim-characterize', { 'name': 'characterize' })
	call minpac#add('tpope/vim-tbone', { 'name': 'tbone' })

	call minpac#add('tommcdo/vim-exchange', { 'name': 'exchange' })
	call minpac#add('tommcdo/vim-lion', { 'name': 'lion' })
	call minpac#add('tommcdo/vim-fubitive', { 'name': 'fubitive' })

	call minpac#add('AndrewRadev/splitjoin.vim', { 'name': 'splitjoin' })
	call minpac#add('AndrewRadev/linediff.vim', { 'type': 'opt', 'name': 'linediff' })
	call minpac#add('AndrewRadev/sideways.vim', { 'name': 'sideways' })

	call minpac#add('chrisbra/vim-diff-enhanced', { 'type': 'opt', 'name': 'diffenhanced' }) " for older vim
	call minpac#add('chrisbra/NrrwRgn')
	call minpac#add('chrisbra/Colorizer')

	call minpac#add('romainl/vim-cool', { 'name': 'cool' })
	call minpac#add('romainl/vim-qf', { 'name': 'qf' })

	call minpac#add('yegappan/mru')
	call minpac#add('yegappan/lsp', { 'type': 'opt' })

	call minpac#add('vim/colorschemes')
	call minpac#add('vim/killersheep', { 'type': 'opt' })

	call minpac#add('google/vim-searchindex', { 'type': 'opt', 'name': 'searchindex' }) " for older vim

	call minpac#add('tmux-plugins/vim-tmux-focus-events', { 'type': 'opt', 'name': 'tmuxfocusevents' }) " for older vim
	call minpac#add('tmux-plugins/vim-tmux', { 'name': 'tmux' })
endfunction

function! LspInit() abort
	call LspAddServer([
				\     #{
				\	 name: 'typescriptlang',
				\	 filetype: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
				\	 path: '/usr/local/bin/typescript-language-server',
				\	 args: ['--stdio'],
				\	 customNotificationHandlers: {
				\	   '$/typescriptVersion': function('TypeScriptCustomNotificationHandler')
				\	 }
				\      },
				\   ])

	call LspOptionsSet({
				\ 'autoComplete': v:false,
				\ 'omniComplete': v:true,
				\ 'autoHighlight': v:true,
				\ 'autoHighlightDiags': v:true,
				\ 'autoPopulateDiags': v:false,
				\ 'highlightDiagInline': v:true,
				\ 'showDiagOnStatusLine': v:true,
				\ 'showDiagWithSign': v:true,
				\ 'showDiagWithVirtualText': v:false,
				\ 'useQuickfixForLocations': v:true,
				\ 'hoverInPreview': v:false,
				\ 'outlineWinSize': 60,
				\ })
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
command! StartLsp packadd lsp | call LspInit()
