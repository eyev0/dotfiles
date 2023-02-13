vim.o.sessionoptions = "winpos,winsize,help,curdir,folds,tabpages"

require("persisted").setup({
  use_git_branch = false,
	telescope = {
		before_source = function()
			-- Close all open buffers
			-- Thanks to https://github.com/avently
      vim.cmd("silent FloatermKill")
			vim.api.nvim_input("<ESC>:%bd<CR>")
		end,
		after_source = function(session)
			print("Loaded session " .. session.name)
		end,
	},
	save_dir = vim.fn.expand(vim.fn.stdpath("cache") .. "/sessions/"), -- directory where session files are saved
})
