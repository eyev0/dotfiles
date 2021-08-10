return {
  on_attach = function()
    require "lsp_signature".on_attach {
      -- This is mandatory, otherwise border config won't get registered.
      -- If you want to hook lspsaga or other signature handler, pls set to false
      bind = true,
      -- Number of comment/doc lines(if there are more than this value, they will be truncated);
      -- set to 0 if you DO NOT want any API comments be shown
      -- This setting only take effect in insert mode, it does not affect signature help in normal mode
      doc_lines = 999,
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      hint_enable = true, -- virtual hint enable
      -- hint_prefix = "🐼 ", -- Panda for parameter
      hint_prefix = "@param ",
      hint_scheme = "String",
      use_lspsaga = false, -- set to true if you want to use lspsaga popup
      hi_parameter = "IncSearch", -- how your parameter will be highlight
      handler_opts = {
        border = "shadow" -- double, single, shadow, none
      }
    }
  end
}
