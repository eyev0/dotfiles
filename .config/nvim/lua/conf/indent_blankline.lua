vim.g.indent_blankline_filetype_exclude = {
	"lspinfo",
	"packer",
	"checkhealth",
	"help",
	"",
	"floaterm",
	"noice",
}
vim.g.indent_blankline_buftype_exclude = { "terminal" }

require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = false,
})
