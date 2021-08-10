local root_markers = {"build.gradle", "gradle.build", "pom.xml"}
local root_dir = require("jdtls.setup").find_root(root_markers)
local home = os.getenv("HOME")
local workspace_folder = home .. "/.local/share/eclipse.jdt.ls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local extendedClientCapabilities = require "jdtls".extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
  cmd = {"java-lsp.sh", workspace_folder},
  filetypes = {"java"},
  flags = {
    allow_incremental_sync = true
  },
  on_attach = function(client, bufnr)
    require "jdtls.setup".add_commands()
    -- require'jdtls'.setup_dap()
    client.resolved_capabilities.document_formatting = false
    _G.lsp_on_attach(client, bufnr)

    local function buf_map(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    buf_map("n", "<C-m>", "<Cmd>lua require('jdtls').code_action()<CR>", {noremap = true, silent = true})
    buf_map("v", "<C-m>", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>", {noremap = true, silent = true})
    buf_map(
      "n",
      "<leader>re",
      "<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>",
      {noremap = true, silent = true}
    )
    buf_map("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", {noremap = true, silent = true})
    buf_map("n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", {noremap = true, silent = true})
    buf_map("v", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", {noremap = true, silent = true})
    buf_map("n", "crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", {noremap = true, silent = true})
    buf_map("v", "crc", "<Cmd>lua require'jdtls'.organize_imports()<CR>", {noremap = true, silent = true})
    buf_map("v", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", {noremap = true, silent = true})
  end,
  capabilities = _G.lsp_capabilities,
  init_options = {
    extendedClientCapabilities = extendedClientCapabilities
  },
  settings = {
    java = {
      signatureHelp = {enabled = true},
      contentProvider = {preferred = "fernflower"},
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        }
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999
        }
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      }
    }
  }
}

config.on_init = function(client, _)
  client.notify("workspace/didChangeConfiguration", {settings = config.settings})
end

local bundles = {
  vim.fn.glob(
    home .. "/dev/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
  )
}

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/git/clones/vscode-java-test/server/*.jar"), "\n"))
config.init_options = {
  extendedClientCapabilities = extendedClientCapabilities,
  bundles = bundles
}

return {
  setup = function()
    require("jdtls").start_or_attach(config)
  end
}
