-- NOTE: make an issue, jump not working
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    Keymap.set_aerial_buf_shortcuts(bufnr)
  end,
  backends = {
    ["_"] = { "lsp", "treesitter", "markdown", "man" },
    lua = { "lsp", "treesitter"},
  },
  layout = {
    default_direction = "prefer_left",
    placement = "edge",
  },
  -- filter_kind = false,
  filter_kind = {
    "Array",
    "Boolean",
    "Class",
    "Constant",
    "Constructor",
    "Enum",
    "EnumMember",
    "Event",
    "Field",
    "File",
    "Function",
    "Interface",
    "Key",
    "Method",
    "Module",
    "Namespace",
    "Null",
    "Number",
    "Object",
    "Operator",
    "Package",
    "Property",
    "String",
    "Struct",
    "TypeParameter",
    "Variable",
    -- old:
    -- "Class",
    -- "Constructor",
    -- "Enum",
    -- "Function",
    -- "Interface",
    -- "Module",
    -- "Method",
    -- "Struct",
  },
})
