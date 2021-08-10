require'lspconfig'.yamlls.setup {
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
}

