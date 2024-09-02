if exists('g:loaded_myutils') || &compatible
	finish
endif
let g:loaded_myutils = 1

let s:save_cpo = &cpo
set cpo&vim

import '../autoload/myutils.vim'

command! RebuildTags call myutils.RebuildTags()

augroup myutils
	autocmd!

	autocmd TextYankPost * call myutils.HighlightedYank()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
