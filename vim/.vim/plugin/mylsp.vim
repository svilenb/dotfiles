if exists('g:loaded_mylsp') || &compatible
	finish
endif
let g:loaded_mylsp = 1

let s:save_cpo = &cpo
set cpo&vim

command! StartLsp call mylsp#LspInit()

let &cpo = s:save_cpo
unlet s:save_cpo
