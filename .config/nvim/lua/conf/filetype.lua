require("filetype").setup({
	-- extensions = {
	-- 	c = "c",
	-- },
	function_literal = {
		[".dap-config"] = function()
			vim.bo.filetype = "lua"
			-- print("dap-config is lua")
		end,
		[".nvim"] = function()
			vim.bo.filetype = "lua"
			-- print(".nvim is lua")
		end,
	},
})
