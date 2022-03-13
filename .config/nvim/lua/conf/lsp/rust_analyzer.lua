require("lspconfig").rust_analyzer.setup({
	-- on_attach = function(client, bufnr)
	-- 	-- client.resolved_capabilities.document_formatting = false
	-- 	-- client.resolved_capabilities.document_range_formatting = false
	-- 	_G.lsp_on_attach(client, bufnr)
	-- end,
	on_attach = _G.lsp_on_attach,
	capabilities = _G.lsp_capabilities,
})
