if (has('termguicolors'))
	set termguicolors
endif

if exists('&inccommand')
	set inccommand=split
endif

let g:lsp_filetypes = {
			\ 'javascript': 1,
			\ 'javascriptreact': 1,
			\ 'typescript': 1,
			\ 'typescriptreact': 1,
			\ }

function! PackInit() abort
	packadd minpac

	call minpac#init()

	call minpac#add('k-takata/minpac', { 'type': 'opt' })
	call minpac#add('neovim/nvim-lspconfig')
endfunction

function! SetupLSP()
	if has_key(g:lsp_filetypes, &filetype)
		setlocal omnifunc=v:lua.vim.lsp.omnifunc

		nnoremap <buffer> gd         <cmd>lua vim.lsp.buf.declaration()<CR>
		nnoremap <buffer> gD         <cmd>lua vim.lsp.buf.implementation()<CR>
		nnoremap <buffer> <c-]>      <cmd>lua vim.lsp.buf.definition()<CR>
		nnoremap <buffer> K          <cmd>lua vim.lsp.buf.hover()<CR>
		nnoremap <buffer> <c-k>      <cmd>lua vim.lsp.buf.signature_help()<CR>
		nnoremap <buffer> 1gD        <cmd>lua vim.lsp.buf.type_definition()<CR>
		nnoremap <buffer> gr         <cmd>lua vim.lsp.buf.references()<CR>
		nnoremap <buffer> g0         <cmd>lua vim.lsp.buf.document_symbol()<CR>
		nnoremap <silent> gW         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
		nnoremap <buffer> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
		nnoremap <buffer> <leader>d  <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
	endif
endfunction

augroup Filetypes
	autocmd!
	autocmd FileType * call SetupLSP()
	autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

lua require 'plugins'
