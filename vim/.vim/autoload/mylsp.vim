function! mylsp#LspInit() abort
	packadd lsp

	call LspAddServer([
				\     #{
				\	 name: 'typescriptlang',
				\	 filetype: ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
				\	 path: '/usr/local/bin/typescript-language-server',
				\	 args: ['--stdio'],
				\	 customNotificationHandlers: {
				\	   '$/typescriptVersion': function('s:TypeScriptCustomNotificationHandler')
				\	 }
				\      },
				\   ])

	call LspOptionsSet({
				\ 'autoComplete': v:false,
				\ 'omniComplete': v:true,
				\ 'autoHighlight': v:true,
				\ 'autoHighlightDiags': v:true,
				\ 'autoPopulateDiags': v:false,
				\ 'highlightDiagInline': v:true,
				\ 'showDiagOnStatusLine': v:true,
				\ 'showDiagWithSign': v:true,
				\ 'showDiagWithVirtualText': v:false,
				\ 'useQuickfixForLocations': v:true,
				\ 'hoverInPreview': v:false,
				\ 'outlineWinSize': 60,
				\ })
endfunction

function! mylsp#SetupLSP() abort
	setlocal omnifunc=g:LspOmniFunc

	if exists('+tagfunc')
		setlocal tagfunc=lsp#lsp#TagFunc
	endif

	if exists('+formatexpr')
		setlocal formatexpr=lsp#lsp#FormatExpr()
	endif

	nnoremap <buffer> gd                  <Cmd>LspGotoDefinition<CR>
	nnoremap <buffer> <C-W>gd             <Cmd>topleft LspGotoDefinition<CR>
	nnoremap <buffer> gD                  <Cmd>LspGotoImpl<CR>
	nnoremap <buffer> K                   <Cmd>LspHover<CR>
	nnoremap <buffer> <c-k>               <Cmd>LspShowSignature<CR>
	nnoremap <buffer> 1gD                 <Cmd>LspGotoTypeDef<CR>
	nnoremap <buffer> gr                  <Cmd>LspShowReferences<CR>
	nnoremap <buffer> gW                  <Cmd>LspSymbolSearch<CR>
	nnoremap <buffer> <Leader>rn          <Cmd>LspRename<CR>
	nnoremap <buffer> <Leader>ca          <Cmd>LspCodeAction<CR>
	nnoremap <buffer> <Leader>m           <Cmd>LspDiag show<CR>
	xnoremap <silent><buffer> <Leader>e   <Cmd>LspSelectionExpand<CR>
	xnoremap <silent><buffer> <Leader>s   <Cmd>LspSelectionShrink<CR>
endfunction

function! mylsp#SetHighlights() abort
	highlight link LspDiagLine NONE
	highlight link LspReadRef CursorLine
	highlight link LspTextRef CursorLine
endfunction

function! s:TypeScriptCustomNotificationHandler(lspserver, reply) abort
	echom printf("TypeScript Version = %s", a:reply.params.version)
endfunction
