if !has('vim9script') ||  v:version < 900
	finish
endif

vim9script noclear

if exists('g:loaded_myutils') || &compatible
	finish
endif
g:loaded_myutils = 1

import '../autoload/myutils.vim'

augroup myutils
	autocmd!

	# autocmd TextYankPost * myutils.HighlightedYank()
augroup END
