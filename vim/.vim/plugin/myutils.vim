if exists('g:loaded_myutils') || &compatible
	finish
endif
let g:loaded_myutils = 1

let s:save_cpo = &cpo
set cpo&vim

command! RebuildTags call myutils#RebuildTags()

let &cpo = s:save_cpo
unlet s:save_cpo
