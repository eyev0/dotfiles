local sumneko_root_path = os.getenv("HOME")..'/.local/lsp/lua'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

local config = {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  on_attach = _G.lsp_on_attach,
  capabilities = _G.lsp_capabilities,
}

require'lspconfig'.sumneko_lua.setup(config)
