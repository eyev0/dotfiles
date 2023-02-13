local lsputil = require("lspconfig.util")

-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

local config = {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        special = {
          reload = "require",
        },
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
        arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
        await = true,
        paramName = "Disable", -- "All", "Literal", "Disable"
        paramType = false,
        semicolon = "Disable", -- "All", "SameLine", "Disable"
        setType = true,
      },
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        workspaceDelay = -1,
      },
      workspace = {
        -- library = {
        --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        --   [vim.fn.stdpath("config") .. "/lua"] = true,
        --   -- [vim.fn.datapath "config" .. "/lua"] = true,
        -- },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      -- runtime = {
      --   version = "LuaJIT",
      --   -- Setup your lua path
      --   -- path = runtime_path,
      -- },
      -- diagnostics = {
      -- 	-- Get the language server to recognize the `vim` global
      -- 	globals = { "vim" },
      -- },
      -- workspace = {
      --   -- 	-- Make the server aware of Neovim runtime files
      --   -- 	library = {
      --   -- 		[vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --   -- 		[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      --   -- 		[vim.fn.expand("$HOME/.config/nvim")] = true,
      --   -- 	},
      --   checkThirdParty = false,
      -- },
    },
  },
  root_dir = lsputil.root_pattern(".git", ".nvim", ".luacheckrc", ".stylua.toml"),
  on_attach = Lsp.on_attach,
  capabilities = Lsp.capabilities,
}

require("lspconfig").lua_ls.setup(config)
