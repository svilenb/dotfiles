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

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_detailed_diagnostics = ''

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

nnoremap <Leader>rr :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>b :YcmCompleter Format<CR>
nnoremap <Leader>oi :YcmCompleter OrganizeImports<CR>

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
