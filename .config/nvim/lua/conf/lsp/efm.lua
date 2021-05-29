local lspconfig = require "lspconfig"
local shared_conf = require "conf.lsp.shared_conf"

local prettier = {formatCommand = "prettierd ${INPUT}", formatStdin = true}

local lua_fmt = {
  formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin",
  formatStdin = true
}
-- local lua_format = {
--   formatCommand = [[ lua-format -i --column-limit=100 --indent-width=2 --tab-width=2]],
--   formatStdin = true
-- }

local black = {formatCommand = "black --quiet -", formatStdin = true}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}

lspconfig.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    shared_conf.on_attach(client)
  end,
  capabilities = shared_conf.capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html",
    "css",
    "json",
    "lua",
    "vue",
    "python"
  },
  settings = {
    rootMarkers = {".git/", "package.json", "pyproject.toml"},
    languages = {
      javascript = {prettier},
      javascriptreact = {prettier},
      typescript = {prettier},
      typescriptreact = {prettier},
      json = {prettier},
      html = {prettier},
      css = {prettier},
      vue = {prettier},
      lua = {lua_fmt},
      python = {black, isort}
    }
  }
}
