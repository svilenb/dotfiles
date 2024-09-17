function! mypacker#PackInit() abort
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type': 'opt' })

	call minpac#add('tpope/vim-sensible', { 'name': 'sensible' })
	call minpac#add('tpope/vim-apathy', { 'name': 'apathy' })
	call minpac#add('tpope/vim-sleuth', { 'name': 'sleuth' })
	call minpac#add('tpope/vim-surround', { 'name': 'surround' })
	call minpac#add('tpope/vim-repeat', { 'name': 'repeat' })
	call minpac#add('tpope/vim-unimpaired', { 'name': 'unimpaired' })
	call minpac#add('tpope/vim-abolish', { 'name': 'abolish' })
	call minpac#add('tpope/vim-commentary', { 'name': 'commentary' })
	call minpac#add('tpope/vim-endwise', { 'name': 'endwise' })
	call minpac#add('tpope/vim-rsi', { 'name': 'rsi' })
	call minpac#add('tpope/vim-jdaddy', { 'name': 'jdaddy' })
	call minpac#add('tpope/vim-speeddating', { 'name': 'speeddating' })
	call minpac#add('tpope/vim-vinegar', { 'name': 'vinegar' })
	call minpac#add('tpope/vim-flagship', { 'name': 'flagship' })
	call minpac#add('tpope/vim-dispatch', { 'name': 'dispatch' })
	call minpac#add('tpope/vim-obsession', { 'name': 'obsession' })
	call minpac#add('tpope/vim-eunuch', { 'name': 'eunuch' })
	call minpac#add('tpope/vim-fugitive', { 'name': 'fugitive' })
	call minpac#add('tpope/vim-rhubarb', { 'name': 'rhubarb' })
	call minpac#add('tpope/vim-projectionist', { 'name': 'projectionist' })
	call minpac#add('tpope/vim-capslock', { 'name': 'capslock' })
	call minpac#add('tpope/vim-scriptease', { 'name': 'scriptease' })
	call minpac#add('tpope/vim-characterize', { 'name': 'characterize' })
	call minpac#add('tpope/vim-tbone', { 'name': 'tbone' })
	call minpac#add('tpope/vim-dadbod', { 'type': 'opt', 'name': 'dadbod' })

	call minpac#add('tommcdo/vim-exchange', { 'name': 'exchange' })
	call minpac#add('tommcdo/vim-lion', { 'name': 'lion' })
	call minpac#add('tommcdo/vim-fubitive', { 'name': 'fubitive' })

	call minpac#add('AndrewRadev/splitjoin.vim', { 'name': 'splitjoin' })
	call minpac#add('AndrewRadev/linediff.vim', { 'type': 'opt', 'name': 'linediff' })
	call minpac#add('AndrewRadev/sideways.vim', { 'name': 'sideways' })
	call minpac#add('AndrewRadev/bufferize.vim', { 'name': 'bufferize' })

	call minpac#add('chrisbra/vim-diff-enhanced', { 'type': 'opt', 'name': 'diffenhanced' }) " for older vim
	call minpac#add('chrisbra/NrrwRgn')
	call minpac#add('chrisbra/Colorizer')

	call minpac#add('romainl/vim-cool', { 'name': 'cool' })
	call minpac#add('romainl/vim-qf', { 'name': 'qf' })

	call minpac#add('yegappan/mru')
	call minpac#add('yegappan/lsp', { 'type': 'opt' })

	call minpac#add('google/vim-searchindex', { 'type': 'opt', 'name': 'searchindex' }) " for older vim
	call minpac#add('google/vim-colorscheme-primary')

	call minpac#add('lifepillar/vim-mucomplete', { 'name': 'mucomplete' })
	call minpac#add('lifepillar/vim-solarized8', { 'name': 'solarized8' })

	call minpac#add('tmux-plugins/vim-tmux-focus-events', { 'type': 'opt', 'name': 'tmuxfocusevents' }) " for older vim
	call minpac#add('tmux-plugins/vim-tmux', { 'name': 'tmux' })

	call minpac#add('vim/colorschemes')
	call minpac#add('vim/killersheep', { 'type': 'opt' })
endfunction
