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
set statusline+=\ \[%{DiagnosticStatus()}\]

if exists('&inccommand')
    set inccommand=split
endif

let mapleader = " "

augroup Linting
    autocmd!
    autocmd FileType javascript setlocal makeprg=./node_modules/.bin/eslint\ --format\ compact
augroup END

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_always_populate_location_list = 1

nnoremap <Leader>a :Ggrep!<Space>

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader>rr :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>b :YcmCompleter Format<CR>
nnoremap <Leader>oi :YcmCompleter OrganizeImports<CR>

function! DiagnosticStatus() abort
    let l:all_errors = youcompleteme#GetErrorCount()
    let l:all_non_errors = youcompleteme#GetWarningCount()
    let l:total_errors = l:all_errors + l:all_non_errors

    return l:total_errors == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
