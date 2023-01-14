require'lspconfig'.bashls.setup {
  on_attach = Lsp.on_attach,
  capabilities = Lsp.capabilities,
}
