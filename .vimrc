execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

if (has("termguicolors"))
    set termguicolors
endif

let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='bg'

colorscheme gruvbox

set hidden
set incsearch ignorecase smartcase
set number relativenumber
set nowrap
set list
set listchars+=eol:$
set completeopt-=preview
set mouse=a
set backupcopy=yes

set statusline=
set statusline+=%{FugitiveStatusline()}\ %f%m%r
set statusline+=%=
set statusline+=%y\ %{strlen(&fenc)?&fenc:'none'}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %P\ %l:%c
set statusline+=\ \[%{LinterStatus()}\]

if exists('&inccommand')
    set inccommand=split
endif

let mapleader = " "

let g:nvim_typescript#server_path = '/usr/local/lib/node_modules/typescript/bin/tsserver'
let g:nvim_typescript#diagnostics_enable = 0

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
            \   'typescript': ['prettier'],
            \   'javascript': ['prettier'],
            \   'jsx': ['prettier'],
            \   'json': ['prettier'],
            \   'css': ['prettier'],
            \   'scss': ['prettier']
            \}

nnoremap <Leader>a :Ggrep!<Space>

nnoremap <Leader>rr :TSRename<Space>
nnoremap <leader>jd :TSDef<CR>
nnoremap <leader>gt :TSType<CR>
nnoremap <leader>gr :TSRefs<CR>
" nnoremap <Leader>b :YcmCompleter Format<CR>
nnoremap <Leader>oi :TSOrganizeImports<CR>

nnoremap <F5> :ALELint<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>d :ALEDetail<CR>

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
