function! myutils#RebuildTags() abort
	execute '!ctags -R --exclude="node_modules/*" --exclude="dist/*" .'
endfunction
