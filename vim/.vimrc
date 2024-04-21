call pathogen#infect()

if filereadable($VIMRUNTIME . '/defaults.vim')
	unlet! skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
endif

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
	if has("patch-9.1.0000")
		packadd! editorconfig
	endif

	if !has("patch-8.1.0360")
		packadd diffenhanced
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

if exists('+termguicolors')
	set termguicolors " Colorizer plugin
endif

set hidden
set incsearch ignorecase smartcase
set number relativenumber
set nowrap
set laststatus=2 " flagship plugin
set showtabline=2 " flagship plugin
set cmdheight=2
set clipboard^=unnamed,unnamedplus
set wildmode=list:longest,full
set wildcharm=<C-z>
set sessionoptions-=options " pathogen
set shortmess-=S " searchindex plugin
set shortmess+=c " mucomplete plugin
set completeopt+=menuone " mucomplete plugin
set list

" vimfiles
set backupdir^=.backup/
set backupdir^=~/.backup/
set directory^=.swp/
set directory^=~/.swp/
set undodir^=.undo/
set undodir^=~/.undo/

let mapleader = " "

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:qf_mapping_ack_style = 1
let g:colorizer_auto_map = 1

function! MyHighlights() abort
	highlight link LspDiagLine NONE
	highlight link LspReadRef CursorLine
	highlight link LspTextRef CursorLine
endfunction

augroup my
	autocmd!

	autocmd User LspAttached call mylsp#SetupLSP()
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

nnoremap <Leader>ew :edit <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <Leader>es :split <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <Leader>ev :vsplit <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <Leader>et :tabedit <C-R>=fnameescape(expand('%:h')).'/'<CR>

nnoremap <Leader>b :buffer <C-R>=fnameescape(getcwd()).'/**'<CR>
nnoremap <Leader>sb :sbuffer <C-R>=fnameescape(getcwd()).'/**'<CR>

nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <Leader>lcd :lcd %:p:h<CR>
nnoremap <Leader>tcd :tcd %:p:h<CR>

nnoremap <Leader>a :Ggrep!<Space>

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
