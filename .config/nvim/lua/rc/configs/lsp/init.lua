Lsp = {}

Lsp.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  Keymap.set_lsp_buf_shortcuts(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    local ok, navic = pcall(require, "nvim-navic")
    if ok then
      vim.b.navic_lazy_update_context = true
      navic.attach(client, bufnr)
    end
  end
  pcall(function()
    require("lsp-inlayhints").on_attach(client, bufnr)
  end)
end

-- LSP Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
-- for cmp.nvim
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
Lsp.capabilities = capabilities

-- enable utils
require("rc.configs.lsp.util")

-- disable updating diagnostics in insert
vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = false,
})

require("rc.configs.neoconf")
require("rc.configs.neodev")

require("rc.configs.lsp.ls.vuels")
-- require("rc.configs.lsp.ls.eslint")
require("rc.configs.lsp.ls.tsserver")
-- require("rc.configs.lsp.ls.volar")
require("rc.configs.lsp.ls.lua_ls")
-- require("rc.configs.lsp.ls.teal_ls")
-- require("rc.configs.lsp.ls.rust_analyzer")
require("rc.configs.lsp.ls.rls")
require("rc.configs.lsp.ls.solidity")
require("rc.configs.lsp.ls.jdtls")
require("rc.configs.lsp.ls.pyright")
require("rc.configs.lsp.ls.jsonls")
require("rc.configs.lsp.ls.bashls")
require("rc.configs.lsp.ls.yamlls")
require("rc.configs.lsp.ls.dockerls")
require("rc.configs.lsp.ls.html")
require("rc.configs.lsp.ls.clangd")
require("rc.configs.lsp.ls.gopls")
require("rc.configs.lsp.ls.graphql")
