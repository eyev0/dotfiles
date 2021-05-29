local function set_buf_maps(client, bufnr)
  local function buf_map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  buf_map("n", "<leader>jd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  buf_map("n", "<leader>jr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  buf_map("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
  buf_map("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
  buf_map("n", "<leader>es", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true, silent = true})
  buf_map("n", "<leader>jt", ":LspTroubleToggle<CR>", {noremap = true, silent = true})
  buf_map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  buf_map("n", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  buf_map("i", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  buf_map("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
  buf_map("n", "<leader>ji", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  if client.resolved_capabilities.document_formatting then
    buf_map("n", "<leader>ef", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_map("v", "<leader>ef", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", {noremap = true, silent = true})
  end
  -- LSPSaga
  buf_map(
    "n",
    "<leader>jk",
    [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]],
    {noremap = true, silent = true}
  )
  buf_map("n", "<C-m>", [[<cmd>:lua require('lspsaga.codeaction').code_action()<CR>]], {noremap = true, silent = true})
  buf_map(
    "v",
    "<C-m>",
    [[<cmd>:lua require('lspsaga.codeaction').range_code_action()<CR>]],
    {noremap = true, silent = true}
  )
end

-- Unused
-- buf_map('n', '<leader>ss', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap=true, silent=true })
-- buf_map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap=true, silent=true })
-- buf_map('n', '<C-m>', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })
-- buf_map('n', '<leader>jD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap=true, silent=true })
-- if client.resolved_capabilities.document_formatting then
--   buf_map("n", "<leader>ef", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap=true, silent=true })
-- end
-- if client.resolved_capabilities.document_range_formatting then
--   buf_map("v", "<leader>ef", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { noremap=true, silent=true })
-- end
-- buf_map('n', '<leader>jp', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], { noremap=true, silent=true })
-- buf_map('n', '<leader>rr', [[<cmd>:lua require'lspsaga.rename'.rename()<CR>]], { noremap=true, silent=true })
-- buf_map('n', 'K', [[<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>]], { noremap=true, silent=true })
-- buf_map('n', '<C-f>', [[<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>]], { noremap=true, silent=true })
-- buf_map('n', '<C-b>', [[<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>]], { noremap=true, silent=true })
-- buf_map('n', '<M-k>', [[<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>]], { noremap=true, silent=true })
-- buf_map('i', '<M-k>', [[<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>]], { noremap=true, silent=true })

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  set_buf_maps(client, bufnr)
  -- if client.resolved_capabilities.signature_help then
  --   require'lsp_signature'.on_attach()
  -- end
end

-- LSP Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {on_attach = on_attach, capabilities = capabilities}
