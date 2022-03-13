require("persistence").setup({
	dir = vim.fn.expand(vim.fn.stdpath("cache") .. "/sessions/"), -- directory where session files are saved
	options = { "tabpages", "winsize", "help" }, -- sessionoptions used for saving
})
