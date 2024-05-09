if exists('g:loaded_mylsp') || &compatible
	finish
endif
let g:loaded_mylsp = 1

let s:save_cpo = &cpo
set cpo&vim

command! LaunchLsp call mylsp#LspInit()

augroup mylsp
	autocmd!

	autocmd User LspAttached call mylsp#SetupLSP()
	autocmd ColorScheme * call mylsp#SetHighlights()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
