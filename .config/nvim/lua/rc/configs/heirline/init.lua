local utils = require("heirline.utils")

-- dynamic colors
local function setup_colors()
	return {
		bright_bg = utils.get_highlight("Folded").bg,
		bright_fg = utils.get_highlight("Folded").fg,
		red = utils.get_highlight("DiagnosticError").fg,
		dark_red = utils.get_highlight("DiffDelete").bg,
		green = utils.get_highlight("String").fg,
		blue = utils.get_highlight("Function").fg,
		gray = utils.get_highlight("NonText").fg,
		orange = utils.get_highlight("Constant").fg,
		purple = utils.get_highlight("Statement").fg,
		cyan = utils.get_highlight("Special").fg,
		diag_warn = utils.get_highlight("DiagnosticWarn").fg,
		diag_error = utils.get_highlight("DiagnosticError").fg,
		diag_hint = utils.get_highlight("DiagnosticHint").fg,
		diag_info = utils.get_highlight("DiagnosticInfo").fg,
		git_del = utils.get_highlight("GitSignsDelete").fg,
		git_add = utils.get_highlight("GitSignsAdd").fg,
		git_change = utils.get_highlight("GitSignsChange").fg,
	}
end

require("heirline").load_colors(setup_colors())

local id = vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local colors = setup_colors()
		utils.on_colorscheme(colors)
	end,
	group = id,
})

require("heirline").setup({
	statusline = require("rc.configs.heirline.statusline"),
	winbar = require("rc.configs.heirline.winbar"),
	tabline = require("rc.configs.heirline.tabline"),
  opts = {
  disable_winbar_cb = function(args)
    local buf = args.buf
    local buftype = vim.tbl_contains({ "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
    local filetype = vim.tbl_contains({ "gitcommit", "fugitive", "noice" }, vim.bo[buf].filetype)
    if buftype or filetype then
      vim.opt_local.winbar = nil
    end
  end

  }
})

-- Yep, with heirline we're driving manual!
-- vim.o.showtabline = 2
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])
