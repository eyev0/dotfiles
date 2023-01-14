require("yanky").setup({
	highlight = {
		on_put = true,
		on_yank = true,
		timer = 150,
	},
})

vim.api.nvim_set_hl(0, "YankyPut", { link = "IncSearch" })
