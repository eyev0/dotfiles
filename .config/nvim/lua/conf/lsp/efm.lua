local lspconfig = require "lspconfig"

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

local java_google = {formatCommand = "java -jar "..os.getenv('HOME')..'/.local/jar/google-java-format-1.10.0-all-deps.jar '..vim.api.nvim_buf_get_name(0)}

lspconfig.efm.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    _G.lsp_on_attach(client, bufnr)
  end,
  capabilities = _G.lsp_capabilities,
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
    "python",
    "java",
  },
  settings = {
    rootMarkers = {".git/", "package.json", "pyproject.toml", "gradle.build", "build.gradle", "pom.xml"},
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
      python = {black, isort},
      java = {java_google}
    }
  }
}
