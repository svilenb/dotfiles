local nvim_lsp = require'nvim_lsp'

nvim_lsp.tsserver.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.cssls.setup{}
nvim_lsp.texlab.setup {
	cmd = { "/opt/texlab/texlab" };
}
