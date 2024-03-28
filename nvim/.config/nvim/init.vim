set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if exists("g:neovide")
	colorscheme solarized8
	set background=dark
endif
