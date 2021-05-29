local shared_conf = require'conf.lsp.shared_conf'
require'lspconfig'.clangd.setup {
  on_attach = shared_conf.on_attach,
  capabilities = shared_conf.capabilities,
}
