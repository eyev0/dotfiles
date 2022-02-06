local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local function not_vscode()
	return vim.g.vscode == nil
end

-- not working?..
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })
	-- text editing sugar
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-unimpaired")
	-- use 'tpope/vim-abolish'
	use("svermeulen/vim-cutlass")
	use("svermeulen/vim-yoink")
	use("svermeulen/vim-subversive")
	use("unblevable/quick-scope")
	use("tommcdo/vim-exchange")
	use({ "sgur/vim-textobj-parameter", requires = { "kana/vim-textobj-user" } })
	-- buffer stuff
	use("szw/vim-maximizer")
	use("ojroques/nvim-bufdel")
	-- filesystem
	use("tpope/vim-eunuch")
	use("lambdalisue/suda.vim")
	-- libraries
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "rktjmp/lush.nvim" })

	-- plugins not to be used with vscode
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
		cond = not_vscode,
	})
	-- text editor enhancements
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("conf.nvim_tree")
		end,
		cond = not_vscode,
	})
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("conf.lualine")
		end,
		cond = not_vscode,
	})
	use({
		"voldikss/vim-floaterm",
		config = function()
			require("conf.floaterm")
		end,
		cond = not_vscode,
	})
	use({
		"glepnir/indent-guides.nvim",
		config = function()
			require("conf.indentguides")
		end,
		cond = not_vscode,
	})
	use({ "mbbill/undotree", cond = not_vscode })
	use({ "kevinhwang91/nvim-bqf", cond = not_vscode })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("conf.autopairs")
		end,
		cond = not_vscode,
	})
	-- use { 'folke/todo-comments.nvim', config = function() require'todo-comments'.setup() end, cond = not_vscode }
	use({
		"brooth/far.vim",
		config = function()
			require("conf.far")
		end,
		cond = not_vscode,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
		cond = not_vscode,
	})
	-- tmux
	use({ "christoomey/vim-tmux-navigator", cond = not_vscode }) -- navigation perks
	use({ "tmux-plugins/vim-tmux", cond = not_vscode }) -- syntax highlighting for .tmux.conf
	-- git
	use({ "tpope/vim-fugitive", cond = not_vscode })
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		config = function()
			require("conf.gitsigns")
		end,
		cond = not_vscode,
	})
	use({
		"sindrets/diffview.nvim",
		config = function()
			require("conf.diffview")
		end,
		-- disable = true,
		cond = not_vscode,
	})
	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("conf.telescope")
		end,
		cond = not_vscode,
	})
	-- use {
	--   "ahmedkhalf/project.nvim",
	--   config = function() require("project_nvim").setup { show_hidden = false, } end
	-- }
	-- lsp
	use({
		"neovim/nvim-lspconfig",
		requires = { "jose-elias-alvarez/nvim-lsp-ts-utils", cond = not_vscode },
		config = function()
			require("conf.lsp")
		end,
		cond = not_vscode,
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("conf.cmp")
		end,
		cond = not_vscode,
	})
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use({ "onsails/lspkind-nvim" })
	use({ "liuchengxu/vista.vim", cond = not_vscode })
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("conf.lsptrouble")
		end,
		cond = not_vscode,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		config = function()
			require("conf.lsp.null-ls")
		end,
		cond = not_vscode,
	})
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")
	-- use { 'simrat39/symbols-outline.nvim', config = function() require'conf.outline' end, cond = not_vscode, disable = true }
	-- lua stuff
	use({ "tjdevries/nlua.nvim", cond = not_vscode })
	-- debugging
	use({ "puremourning/vimspector", cond = not_vscode })
	-- treesitter - top shit
	use({ "p00f/nvim-ts-rainbow", cond = not_vscode })
	use({ "nvim-treesitter/playground", cond = not_vscode })
	use({ "nvim-treesitter/nvim-treesitter-refactor", cond = not_vscode })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", cond = not_vscode })
	use({ "theHamsta/nvim-treesitter-pairs", cond = not_vscode })
	use({ "windwp/nvim-ts-autotag", cond = not_vscode })
	use({ "nvim-treesitter/nvim-treesitter-textobjects", cond = not_vscode })
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("conf.ts-context")
		end,
		-- requires = {
		-- 	{ "nvim-treesitter/nvim-treesitter" },
		-- },
		cond = not_vscode,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("conf.treesitter")
		end,
		cond = not_vscode,
	})
	-- use({
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	config = function()
	-- 		require("refactoring").setup({})
	-- 	end,
	-- -- requires = { "nvim-lua/plenary.nvim", opt = true },
	-- 	requires = {
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 	},
	-- })
	-- neovim browser integration
	use({ "glacambre/firenvim", cond = not_vscode })
	-- colors
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("colorscheme")
		end,
		cond = not_vscode,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		disable = true,
		cond = not_vscode,
	})
end)
