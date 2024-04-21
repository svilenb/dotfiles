if exists('g:loaded_mypacker') || &compatible
	finish
endif
let g:loaded_mypacker = 1

let s:save_cpo = &cpo
set cpo&vim

command! PackUpdate call mypacker#PackInit() | call minpac#update()
command! PackClean  call mypacker#PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

let &cpo = s:save_cpo
unlet s:save_cpo
