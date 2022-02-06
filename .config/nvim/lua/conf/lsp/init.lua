_G.lsp_on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_command("setlocal signcolumn=yes:2")
	_G.set_lsp_buf_shortcuts(client, bufnr)
	-- require'conf.lspsignature'.on_attach()
end

-- LSP Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- for cmp.nvim
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
_G.lsp_capabilities = capabilities

vim.fn.sign_define("LspDiagnosticsSignError", { texthl = "LspDiagnosticsSignError", text = "" })
-- , numhl = "LspDiagnosticsSignError"
vim.fn.sign_define("LspDiagnosticsSignWarning", { texthl = "LspDiagnosticsSignWarning", text = "" })
-- , numhl = "LspDiagnosticsSignWarning"
vim.fn.sign_define("LspDiagnosticsSignHint", { texthl = "LspDiagnosticsSignHint", text = "" })
-- , numhl = "LspDiagnosticsSignHint"
vim.fn.sign_define("LspDiagnosticsSignInformation", { texthl = "LspDiagnosticsSignInformation", text = "" })
-- , numhl = "LspDiagnosticsSignInformation"

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	update_in_insert = false,
	underline = true,
	signs = true,
})

vim.cmd([[
fun! SetDiagnosticAu()
  aug DiagnosticAu
    au!
    autocmd CursorHold * lua vim.diagnostic.open_float()
  aug END
endfun
fun! ToggleDiagnosticsPreviewText()
  if !exists('#DiagnosticAu#CursorHold')
    call SetDiagnosticAu()
  else
    aug DiagnosticAu
      autocmd!
    aug END
  endif
endfun
call SetDiagnosticAu()
]])

-- lsputils
vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler

require("conf.lsp.tsserver")
require("conf.lsp.vuels")
require("conf.lsp.sumneko")
require("conf.lsp.rust_analyzer")
require("conf.lsp.pyright")
require("conf.lsp.jsonls")
require("conf.lsp.bashls")
require("conf.lsp.yamlls")
require("conf.lsp.dockerls")
require("conf.lsp.html")
require("conf.lsp.clangd")
