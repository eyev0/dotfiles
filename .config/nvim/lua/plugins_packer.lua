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
		})
		use({ "p00f/nvim-ts-rainbow" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })
		use({ "theHamsta/nvim-treesitter-pairs" })
		use({ "windwp/nvim-ts-autotag" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("conf.ts-context")
			end,

			after = "nvim-treesitter",
			requires = {
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
				config = function()
					require("conf.treesitter")
				end,
			},
		})
		use({
			"nvim-treesitter/playground",
			run = ":TSInstall query",

			after = "nvim-treesitter",
			requires = {
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
				config = function()
					require("conf.treesitter")
				end,
			},
		})
		-- use({ "David-Kunz/treesitter-unit" })
		use({
			"ThePrimeagen/refactoring.nvim",
			config = function()
				require("refactoring").setup()
			end,
		})
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
	-- filesystem
	use({ "lambdalisue/suda.vim" })
	-- autosave to trigger rust-analyzer
	-- use({
	-- 	"907th/vim-auto-save",
	-- 	config = function()
	-- 		require("conf.autosave")
	-- 	end,
	-- })
	-- dependency packages
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "rktjmp/lush.nvim" })
	-- plugins not to be used with vscode
	use({ "neoclide/jsonc.vim" })
	use({
		"folke/which-key.nvim",
		config = function()
			require("conf.which-key")
		end,
	})
	-- text editor enhancements
	use({ "ThePrimeagen/harpoon" })
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("conf.nvim_tree")
		end,
		tag = "nightly",
	})
	use({
		"folke/noice.nvim",
		config = function()
			require("conf.noice")
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("conf.todo-comments")
		end,
	})
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("conf.lualine")
		end,
	})
	use({
		"voldikss/vim-floaterm",
		config = function()
			require("conf.floaterm")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("conf.indent_blankline")
		end,
	})
	use({ "mbbill/undotree" })
	use({
		"kevinhwang91/nvim-bqf",
		config = function()
			require("conf.bqf")
		end,
		ft = "qf",
	})
	use({ "stefandtw/quickfix-reflector.vim" })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("conf.autopairs")
		end,
	})
	-- tmux
	use({ "christoomey/vim-tmux-navigator" }) -- navigation perks
	use({ "tmux-plugins/vim-tmux" }) -- syntax highlighting for .tmux.conf
	-- lastplace
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("conf.lastplace")
		end,
	})
	-- git
	use({ "tpope/vim-fugitive" })
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("conf.gitsigns")
		end,
	})
	use({
		"sindrets/diffview.nvim",
		config = function()
			require("conf.diffview")
		end,
	})
	-- telescope extensions
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	-- use({
	-- 	"ahmedkhalf/project.nvim",
	-- 	config = function()
	-- 		require("conf.project")
	-- 	end,
	-- })
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("conf.telescope")
		end,
		requires = {
			-- "edementyev/trouble.nvim",
			"folke/trouble.nvim",
			config = function()
				require("conf.trouble")
			end,
		},
	})
	use({
		"edementyev/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("conf.persistence")
		end,
	})
	-- treesitter - top shit
	load_treesitter_plugins(use)
	use({ "RRethy/vim-illuminate" })
	-- lsp
	-- use({
	-- 	"weilbith/nvim-code-action-menu",
	-- 	config = function()
	-- 		require("conf.code-action-menu")
	-- 	end,
	-- })
	use({ "folke/neodev.nvim" })
	use({ "folke/neoconf.nvim" })
	use({
		"neovim/nvim-lspconfig",
		requires = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
		config = function()
			require("conf.lsp")
		end,
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("conf.fidget")
		end,
	})
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/cmp-copilot" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("conf.cmp")
		end,
	})
	use({ "rafamadriz/friendly-snippets" })
	use({ "onsails/lspkind-nvim" })
	use({ "liuchengxu/vista.vim" })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("conf.lsp.null-ls")
		end,
	})
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("conf.aerial")
		end,
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
	-- lua stuff
	use({ "rafcamlet/nvim-luapad" })
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
		-- commit = "ec98b45c",
	})
	-- debugging
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
	use({ "github/copilot.vim" })
	use({
		-- "NTBBloodbath/rest.nvim",
		"edementyev/rest.nvim",
		branch = "local",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("conf.rest")
		end,
	})
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("conf.dressing")
		end,
	})
	-- unused
	--
	-- markdown
	-- use({ "preservim/vim-markdown", requires = { "godlygeek/tabular" } })
	-- use({
	-- 	"JASONews/glow-hover",
	-- 	config = function()
	-- 		require("conf.glow-hover")
	-- -- require("glow-hover").setup({})
	-- 	end,
	-- })
	-- use({ "ThePrimeagen/git-worktree.nvim" })
	-- use({
	-- 	"glepnir/dashboard-nvim",
	-- 	config = function()
	-- 		require("conf.dashboard")
	-- 	end,
	-- 	disable = true,
	-- })
	-- use({ "RishabhRD/popfix" })
	-- use({ "RishabhRD/nvim-lsputils" })
	-- use({
	-- 	"hood/popui.nvim",
	-- 	config = function()
	-- 		vim.ui.select = require("popui.ui-overrider")
	-- 	end,
	-- 	disable = true,
	-- })
	-- use({
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- 	disable = true,
	-- })
end)
