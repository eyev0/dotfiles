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

_G.not_vscode = not_vscode

-- not working?..
-- vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

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
	-- use({ "wellle/targets.vim" })
	use({ "sgur/vim-textobj-parameter", requires = { "kana/vim-textobj-user" } })
	use("tpope/vim-obsession")
	-- buffer stuff
	use("szw/vim-maximizer")
	use("ojroques/nvim-bufdel")
	use({
		"b0o/mapx.nvim",
		config = function()
			require("mapx").setup({ global = true })
		end,
	})
	-- filesystem
	use("tpope/vim-eunuch")
	use("lambdalisue/suda.vim")
	-- dependency packages
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
	use({
		"folke/twilight.nvim",
		config = function()
			require("conf.twilight")
		end,
	})
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("conf.todo-comments")
		end,
		cond = not_vscode,
	})
	--TODO
	--FIXME
	--BUG
	--HACK
	--PERF
	--NOTE
	-- tmux
	use({ "christoomey/vim-tmux-navigator", cond = not_vscode }) -- navigation perks
	use({ "tmux-plugins/vim-tmux", cond = not_vscode }) -- syntax highlighting for .tmux.conf
	-- markdown
	-- use({ "preservim/vim-markdown", requires = { "godlygeek/tabular" } })
	-- git
	use({ "tpope/vim-fugitive", cond = not_vscode })
	use({
		"lewis6991/gitsigns.nvim",
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
		requires = {
			"edementyev/trouble.nvim",
			config = function()
				require("conf.trouble")
			end,
			cond = not_vscode,
		},
		cond = not_vscode,
	})
	-- treesitter - top shit
	use({ "p00f/nvim-ts-rainbow", cond = not_vscode })
	-- use({ "nvim-treesitter/playground", cond = not_vscode })
	-- use({ "nvim-treesitter/nvim-treesitter-refactor", cond = not_vscode })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", cond = not_vscode })
	use({ "theHamsta/nvim-treesitter-pairs", cond = not_vscode })
	use({ "windwp/nvim-ts-autotag", cond = not_vscode })
	use({ "nvim-treesitter/nvim-treesitter-textobjects", cond = not_vscode })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("conf.treesitter")
		end,
		cond = not_vscode,
	})
	-- lsp
	use({ "ray-x/lsp_signature.nvim", cond = not_vscode })
	use({ "weilbith/nvim-code-action-menu" })
	use({
		"neovim/nvim-lspconfig",
		requires = { "jose-elias-alvarez/nvim-lsp-ts-utils", cond = not_vscode },
		config = function()
			require("conf.lsp")
		end,
		cond = not_vscode,
	})
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	-- use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({
		"David-Kunz/cmp-npm",
	})
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("conf.cmp")
		end,
	})
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "onsails/lspkind-nvim" })
	use({ "liuchengxu/vista.vim", cond = not_vscode })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("conf.lsp.null-ls")
		end,
	})
	use({ "RishabhRD/popfix" })
	use({ "RishabhRD/nvim-lsputils" })
	use({ "folke/lsp-colors.nvim" })
	-- for workspace diagnostics
	use({ "nvim-lua/lsp_extensions.nvim" })
	-- use { 'simrat39/symbols-outline.nvim', config = function() require'conf.outline' end, cond = not_vscode, disable = true }
	-- lua stuff
	use({ "tjdevries/nlua.nvim", cond = not_vscode })
	-- debugging
	use({
		"puremourning/vimspector",
		config = function()
			require("conf.vimspector")
		end,
		cond = not_vscode,
	})
	-- context
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("conf.ts-context")
		end,
		cond = not_vscode,
	})
	-- use({
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	config = function()
	-- 		require("refactoring").setup()
	-- 	end,
	-- 	requires = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		run = ":TSUpdate",
	-- 		config = function()
	-- 			require("conf.treesitter")
	-- 		end,
	-- 		cond = not_vscode,
	-- 	},
	-- 	cond = not_vscode,
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
		"petertriho/nvim-scrollbar",
		config = function()
			require("conf.scrollbar")
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
