call pathogen#infect()

if filereadable($VIMRUNTIME . '/defaults.vim')
	unlet! skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
endif

if has('vms')
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

if &t_Co > 2 || has('gui_running')
	" Switch on highlighting the last used search pattern.
	set hlsearch
endif

" Add optional packages.
if has('packages')
	if has('patch-9.1.0000')
		packadd! editorconfig
	endif

	if !has('patch-8.1.0360')
		packadd diffenhanced
	endif

	if !has("patch-8.1.1270")
		packadd searchindex
	endif

	if !has('patch-8.2.2345')
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
set list

set completeopt+=menuone " mucomplete plugin

if has('patch-8.1.1880')
	set completeopt-=preview
	set completeopt+=popup
endif

if has('patch-9.1.1243')
	set diffopt+=inline:word
endif

" Vim files {{{
set backupdir^=.backup/
set backupdir^=~/.backup/
set directory^=.swp/
set directory^=~/.swp/

" Neovim has different undo files format.
if !has('nvim')
	set undodir^=.undo/
	set undodir^=~/.undo/
endif
" }}}

colorscheme darkblue

let mapleader = " "

augroup my
	autocmd!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
	autocmd FileType hurl setlocal commentstring=#\ %s
	autocmd FileType typescript,typescriptreact let b:codefmt_formatter = 'prettier'
	autocmd FileType javascript,javascriptreact let b:codefmt_formatter = 'prettier'
	autocmd FileType qf nmap <buffer> <Leader>p <plug>(qf-preview-open)
augroup END

" Core mappings {{{
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
" }}}
