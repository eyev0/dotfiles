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

local function load_treesitter_plugins(use)
	local use_treesitter = true
	if use_treesitter then
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			module = "nvim-treesitter",
			config = function()
				require("conf.treesitter")
			end,
			cond = not_vscode,
		})
		use({ "p00f/nvim-ts-rainbow", cond = not_vscode })
		use({ "JoosepAlviste/nvim-ts-context-commentstring", cond = not_vscode })
		use({ "theHamsta/nvim-treesitter-pairs", cond = not_vscode })
		use({ "windwp/nvim-ts-autotag", cond = not_vscode })
		use({ "nvim-treesitter/nvim-treesitter-textobjects", cond = not_vscode })
		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("conf.ts-context")
			end,
			cond = not_vscode,
			after = "nvim-treesitter",
			requires = {
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
				config = function()
					require("conf.treesitter")
				end,
				cond = not_vscode,
			},
		})
		use({
			"nvim-treesitter/playground",
			run = ":TSInstall query",
			cond = not_vscode,
			after = "nvim-treesitter",
			requires = {
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
				config = function()
					require("conf.treesitter")
				end,
				cond = not_vscode,
			},
		})
		use({ "David-Kunz/treesitter-unit" })
		-- use({
		-- 	"nvim-neorg/neorg",
		-- 	config = function()
		-- 		require("conf.neorg")
		-- 	end,
		-- 	after = "nvim-treesitter",
		-- 	cond = not_vscode,
		-- })
	end
end

-- not working?..
-- vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })
	-- startup
	use({ "lewis6991/impatient.nvim" })
	use({
		"nathom/filetype.nvim",
		config = function()
			require("conf.filetype")
		end,
	})
	-- text editing sugar
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-unimpaired")
	use("svermeulen/vim-cutlass")
	use("svermeulen/vim-yoink")
	use("svermeulen/vim-subversive")
	use("unblevable/quick-scope")
	use("tommcdo/vim-exchange")
	use({ "sgur/vim-textobj-parameter", requires = { "kana/vim-textobj-user" } })
	use("tpope/vim-obsession")
	-- buffer stuff
	use("szw/vim-maximizer")
	use("ojroques/nvim-bufdel")
	use({
		"b0o/mapx.nvim",
		config = function()
			require("mapx").setup({ global = "skip" })
		end,
	})
	-- filesystem
	use({ "lambdalisue/suda.vim" })
	use({
		"907th/vim-auto-save",
		config = function()
			require("conf.autosave")
		end,
	})
	-- dependency packages
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "rktjmp/lush.nvim" })
	-- plugins not to be used with vscode
	use({ "neoclide/jsonc.vim", cond = not_vscode })
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
		cond = not_vscode,
	})
	-- text editor enhancements
	use({ "ThePrimeagen/harpoon" })
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
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("conf.indent_blankline")
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
	-- tmux
	use({ "christoomey/vim-tmux-navigator", cond = not_vscode }) -- navigation perks
	use({ "tmux-plugins/vim-tmux", cond = not_vscode }) -- syntax highlighting for .tmux.conf
	-- lastplace
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("conf.lastplace")
		end,
	})
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
	-- extensions
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("conf.project")
		end,
	})
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
		},
	})
	-- use({
	-- 	"folke/persistence.nvim",
	-- 	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	-- 	module = "persistence",
	-- 	config = function()
	-- 		require("conf.persistence")
	-- 	end,
	-- })
	use({
		"edementyev/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("conf.persistence")
		end,
	})
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("conf.dashboard")
		end,
		disable = true,
	})
	-- treesitter - top shit
	load_treesitter_plugins(use)
	use({ "RRethy/vim-illuminate" })
	-- lsp
	use({
		"weilbith/nvim-code-action-menu",
		config = function()
			require("conf.code-action-menu")
		end,
	})
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
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "David-Kunz/cmp-npm" })
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("conf.cmp")
		end,
	})
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "onsails/lspkind-nvim" })
	use({ "liuchengxu/vista.vim", cond = not_vscode })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("conf.lsp.null-ls")
		end,
	})
	use({ "RishabhRD/popfix" })
	-- use({ "RishabhRD/nvim-lsputils" })
	use({
		"hood/popui.nvim",
		config = function()
			vim.ui.select = require("popui.ui-overrider")
		end,
		disable = false,
	})
	use({ "folke/lsp-colors.nvim" })
	use({ "mfussenegger/nvim-jdtls" })
	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("conf.lightbulb")
		end,
	})
	-- for workspace diagnostics
	-- use({ "nvim-lua/lsp_extensions.nvim" })
	-- lua stuff
	use({ "tjdevries/nlua.nvim", cond = not_vscode })
	use({ "rafcamlet/nvim-luapad" })
	-- debugging
	-- use({ "puremourning/vimspector", cond = not_vscode })
	-- lua
	use({ "jbyuki/one-small-step-for-vimkind" })
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("conf.dap")
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		config = function()
			require("conf.dap.ui")
		end,
		after = "nvim-dap",
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("conf.dap.virtual-text")
		end,
		after = "nvim-dap",
	})
	use({
		"David-Kunz/jester",
		config = function()
			require("conf.dap.jester")
		end,
	})
	-- neovim browser integration
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	-- colors
	use({ "sainnhe/gruvbox-material" })
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("conf.scrollbar")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		disable = true,
	})
end)
