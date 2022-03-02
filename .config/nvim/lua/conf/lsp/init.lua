_G.lsp_on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- vim.api.nvim_command("setlocal signcolumn=yes:1")
	_G.set_lsp_buf_shortcuts(client, bufnr)
	-- require("conf.lspsignature").on_attach()
	require("illuminate").on_attach(client)
end
-- LSP Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
-- for cmp.nvim
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
_G.lsp_capabilities = capabilities

-- hover window with borders
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

-- use the same configuration you would use for `vim.lsp.diagnostic.on_publish_diagnostics`.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	-- require("lsp_extensions.workspace.diagnostic").handler,
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		virtual_text = {
			source = "if_many",
			severity = { min = vim.diagnostic.severity.WARN },
		},
		update_in_insert = false,
		severity_sort = true,
		underline = true,
		-- signs = {
		-- 	priority = 2,
		-- },
	}
)

vim.cmd([[
fun! SetDiagnosticAu()
  aug DiagnosticAu
    au!
    autocmd CursorHold * lua vim.diagnostic.open_float({ bufnr = 0, severity_sort = true, source = "if_many", focusable = false, close_events = {"CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave", "BufLeave", "InsertEnter", "InsertLeave", "TextYankPost", "CmdlineChanged", "CmdlineEnter", "CmdlineLeave", "BufModifiedSet"}})
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
" call SetDiagnosticAu()
]])

-- lsputils
-- vim.lsp.handlers["textDocument/codeAction"] = vim.lsp.with(require("lsputil.codeAction").code_action_handler)
-- vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
-- vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
-- vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
-- vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
-- vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
-- vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
-- vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler

require("conf.lsp.vuels")
require("conf.lsp.tsserver")
-- require("conf.lsp.volar")
require("conf.lsp.sumneko")
require("conf.lsp.rust_analyzer")
require("conf.lsp.pyright")
require("conf.lsp.jsonls")
require("conf.lsp.bashls")
require("conf.lsp.yamlls")
require("conf.lsp.dockerls")
require("conf.lsp.html")
require("conf.lsp.clangd")
require("conf.lsp.gopls")
require("conf.lsp.graphql")

vim.cmd([[
augroup JdtlsInit
    autocmd!
    autocmd FileType java lua require'conf.lsp.jdtls'.setup()
augroup end
]])
