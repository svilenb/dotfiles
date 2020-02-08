local nvim_lsp = require'nvim_lsp'

nvim_lsp.tsserver.setup{
	cmd = { "typescript-language-server", "--stdio", "--tsserver-path=tsserver" };
}
