require("utils.pretty_quickfix")

require("bqf").setup({
  auto_resize_height = true,
	preview = {
    auto_preview = false,
		win_height = 999,
		win_vheight = 22,
	},
  -- Adapt fzf's delimiter in nvim-bqf
	filter = {
		fzf = {
			extra_opts = { "--bind", "ctrl-o:toggle-all", "--exact"},
		},
	},
})
