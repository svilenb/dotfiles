local nvim_lsp = require'nvim_lsp'
local colorizer = require'colorizer'

nvim_lsp.tsserver.setup{}
nvim_lsp.cssls.setup{}
nvim_lsp.texlab.setup {
	cmd = { "/opt/texlab/texlab" };
}
colorizer.setup {
	'css';
	'scss';
}
