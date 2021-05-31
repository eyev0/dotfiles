local shared_conf = require'conf.lsp.shared_conf'
local nvim_lsp = require"lspconfig"

nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    -- defaults
    ts_utils.setup {
      disable_commands = false,
      debug = false,
      enable_import_on_completion = false,
      import_on_completion_timeout = 5000,
      -- eslint
      -- eslint_bin = "eslint",
      -- eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
      -- eslint_enable_disable_comments = true,
      -- experimental settings!
      -- eslint diagnostics
      -- eslint_enable_diagnostics = false,
      -- eslint_diagnostics_debounce = 250,
      -- formatting
      enable_formatting = true,
      formatter = "prettierd",
      formatter_args = {"$FILENAME"},
      format_on_save = true,
      no_save_after_format = false,
      -- parentheses completion
      complete_parens = true,
      signature_help_in_parens = false,
    }
    -- required to enable ESLint code actions and formatting
    -- ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})

    -- call regular on_attach
    shared_conf.on_attach(client, bufnr)
  end,
  capabilities = shared_conf.capabilities,
}
