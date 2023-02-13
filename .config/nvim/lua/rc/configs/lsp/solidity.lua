require("lspconfig").solidity_ls.setup({
	on_attach = Lsp.on_attach,
	capabilities = Lsp.capabilities,
})
