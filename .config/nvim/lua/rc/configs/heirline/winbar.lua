local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local c = require("rc.configs.heirline.components")

local WinBars = {
  fallthrough = false,
  { -- Hide the winbar for special buffers
    condition = function()
      return conditions.buffer_matches({
        buftype = { "nofile", "prompt", "help", "quickfix" },
        filetype = { "^git.*", "fugitive" },
      })
    end,
    init = function()
      vim.opt_local.winbar = nil
    end,
  },
  { -- A special winbar for terminals
    condition = function()
      return conditions.buffer_matches({ buftype = { "terminal" } })
    end,
    utils.surround({ "", "" }, "dark_red", {
      c.FileType,
      c.Space,
      c.TerminalName,
    }),
  },
  { -- An inactive winbar for regular files
    condition = function()
      return not conditions.is_active()
    end,
    utils.surround(
      { "", "" },
      "bright_bg",
      { hl = { fg = "gray", force = true }, c.FileNameBlockFactory(false) }
    ),
  },
  -- A winbar for regular files
  {
    utils.surround({ "", "" }, "bright_bg", c.FileNameBlockFactory(false)),
    {
      -- update = { "OptionSet", "BufEnter" },
      update = { "OptionSet", "BufEnter" },
      condition = function()
        return vim.g.heirline_show_winbufnrs == true
      end,
      utils.surround({ "", "" }, "bright_bg", c.WinBufNrs),
    },
    c.Space,
    c.Navic,
  },
}

-- show/hide winbar on buftype/filetype
vim.api.nvim_create_autocmd("User", {
  pattern = "HeirlineInitWinbar",
  group = "Heirline",
  callback = function(args)
    local buf = args.buf
    local buftype = vim.tbl_contains({ "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
    local filetype = vim.tbl_contains({ "gitcommit", "fugitive" }, vim.bo[buf].filetype)
    if buftype or filetype then
      vim.opt_local.winbar = nil
    end
  end,
})

return WinBars
