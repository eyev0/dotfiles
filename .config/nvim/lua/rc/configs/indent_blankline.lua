vim.g.indent_blankline_filetype_exclude = {
  "lspinfo",
  "packer",
  "checkhealth",
  "help",
  "",
  "floaterm",
  "noice",
  "notify",
  "ImportManager",
}
vim.g.indent_blankline_buftype_exclude = { "terminal", "quickfix" }

vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_use_treesitter = true

require("indent_blankline").setup({
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = false,
})

-- replace CursorMoved with CursorHold
local id = augroup("IndentBlanklineContextAutogroup", { clear = true })
autocmd("CursorHold", {
  group = id,
  callback = function()
    vim.cmd("IndentBlanklineRefresh")
  end,
})

local max_lines = 5000
local aug_id = augroup("IndentBlanklineCheckThreshold", {})

local set_threshold_filetypes = {
  "json",
  "httpResult",
}

autocmd("BufEnter", {
  group = aug_id,
  callback = function(opts)
    if
      vim.tbl_contains(set_threshold_filetypes, vim.bo[opts.buf].filetype) and vim.fn.line("$") > max_lines
    then
      vim.b[opts.buf].indent_blankline_enabled = false
    end
  end,
})
