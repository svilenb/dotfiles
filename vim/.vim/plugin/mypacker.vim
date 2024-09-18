if exists('g:loaded_mypacker') || &compatible
	finish
endif
let g:loaded_mypacker = 1

let s:save_cpo = &cpo
set cpo&vim

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:qf_mapping_ack_style = 1
let g:colorizer_auto_map = 1

call glaive#Install()

Glaive codefmt plugin[mappings]

" Plugin mappings {{{
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
" }}}

command! PackUpdate call mypacker#PackInit() | call minpac#update()
command! PackClean  call mypacker#PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

let &cpo = s:save_cpo
unlet s:save_cpo
