require("lspconfig").gopls.setup({
	on_attach = Lsp.on_attach,
	capabilities = Lsp.capabilities,
})
