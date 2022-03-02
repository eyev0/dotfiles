require("nvim-lightbulb").setup({
	ignore = { "sumneko_lua" },
})

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
