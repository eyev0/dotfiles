require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
		Lsp.on_attach(client, bufnr)
	end,
	capabilities = Lsp.capabilities,
})
