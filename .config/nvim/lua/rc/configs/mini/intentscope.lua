require("mini.indentscope").setup({
  draw = {
    delay = 70,
    animation = function()
      return 13
    end,
  },
  mappings = {
    -- Textobjects
    object_scope = "iI",
    object_scope_with_border = "aI",
    -- Motions (jump to respective border line; if not present - body line)
    goto_top = "[I",
    goto_bottom = "]I",
  },
  -- symbol = "╎",
  symbol = "│",
})
