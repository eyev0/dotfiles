require("lspconfig").rust_analyzer.setup(Lsp.make_config())

-- autocmd({ "InsertLeave", "TextChanged" }, {
--   group = augroup("RustAutoSave", {}),
--   pattern = "*.rs",
--   callback = function()
--     vim.cmd("silent! w")
--   end,
-- })
