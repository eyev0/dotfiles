return {
	{ "wbthomason/packer.nvim" },
	{ "lewis6991/impatient.nvim" },
	{
		"nathom/filetype.nvim",
		config = function()
			require("conf.filetype")
		end,
	},
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-unimpaired",
	"svermeulen/vim-cutlass",
	"svermeulen/vim-yoink",
	"svermeulen/vim-subversive",
	{ "unblevable/quick-scope", enabled = false },
	"tommcdo/vim-exchange",
	{ "sgur/vim-textobj-parameter", dependencies = { "kana/vim-textobj-user" } },
	"tpope/vim-obsession",
	"szw/vim-maximizer",
	"lambdalisue/suda.vim",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-tree/nvim-web-devicons",
	"rktjmp/lush.nvim",
	"neoclide/jsonc.vim",
	{
		"folke/which-key.nvim",
		config = function()
			require("conf.which-key")
		end,
	},
	"ThePrimeagen/harpoon",
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("conf.nvim_tree")
		end,
		tag = "nightly",
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("conf.oil")
		end,
	},
	{
		"folke/noice.nvim",
		config = function()
			require("conf.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("conf.todo-comments")
		end,
	},
	{
		"hoob3rt/lualine.nvim",
		config = function()
			require("conf.lualine")
		end,
	},
	{
		"voldikss/vim-floaterm",
		config = function()
			require("conf.floaterm")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("conf.indent_blankline")
		end,
	},
	{ "mbbill/undotree" },
	-- quickfix
	{
		"kevinhwang91/nvim-bqf",
		config = function()
			require("conf.bqf")
		end,
		enabled = true,
		dependencies = {
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		},
	},
	{
		"stefandtw/quickfix-reflector.vim",
		config = function()
			require("utils.pretty_quickfix")
		end,
		enabled = false,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("conf.autopairs")
		end,
	},
	{ "christoomey/vim-tmux-navigator" }, -- navigation perks
	{ "tmux-plugins/vim-tmux" }, -- syntax highlighting for .tmux.conf
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("conf.lastplace")
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("conf.gitsigns")
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("conf.diffview")
		end,
	},
	{ "nvim-telescope/telescope-dap.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("conf.telescope")
		end,
		dependencies = {
			"folke/trouble.nvim",
			config = function()
				require("conf.trouble")
			end,
		},
	},
	{
		"edementyev/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		-- module = "persistence",
		config = function()
			require("conf.persistence")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- module = "nvim-treesitter",
		config = function()
			require("conf.treesitter")
		end,
	},
	{ "p00f/nvim-ts-rainbow", enabled = false },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "theHamsta/nvim-treesitter-pairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("conf.ts-context")
		end,

		after = "nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("conf.treesitter")
			end,
		},
	},
	{
		"nvim-treesitter/playground",
		build = ":TSInstall query",

		after = "nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("conf.treesitter")
			end,
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		config = true,
	},
	{ "RRethy/vim-illuminate" },
	{ "folke/neodev.nvim" },
	{ "folke/neoconf.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
		config = function()
			require("conf.lsp")
		end,
	},
	{ "VonHeikemen/lsp-zero.nvim", enabled = false },
	{
		"j-hui/fidget.nvim",
		config = function()
			require("conf.fidget")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-copilot" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("conf.cmp")
		end,
	},
	{ "rafamadriz/friendly-snippets" },
	{ "onsails/lspkind.nvim" },
	{ "liuchengxu/vista.vim" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("conf.lsp.null-ls")
		end,
	},
	{
		"stevearc/aerial.nvim",
		config = function()
			require("conf.aerial")
		end,
		-- TODO: update neovim
		commit = "6050ff7130885913ea7a48f882fe3f94d46a23cf",
	},
	{ "folke/lsp-colors.nvim" },
	{ "mfussenegger/nvim-jdtls" },
	{
		"kosayoda/nvim-lightbulb",
		config = function()
			require("conf.lightbulb")
		end,
	},
	{ "rafcamlet/nvim-luapad" },
	{
		"ErichDonGubler/lsp_lines.nvim",
		config = true,
	},
	{ "jbyuki/one-small-step-for-vimkind" },
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("conf.dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("conf.dap.ui")
		end,
		after = "nvim-dap",
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("conf.dap.virtual-text")
		end,
		after = "nvim-dap",
	},
	{
		"David-Kunz/jester",
		config = function()
			require("conf.dap.jester")
		end,
	},
	{
		"glacambre/firenvim",
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},
	{ "sainnhe/gruvbox-material" },
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("conf.scrollbar")
		end,
	},
	{ "github/copilot.vim" },
	{
		-- "NTBBloodbath/rest.nvim",
		-- dir = "~/dev/nvim/rest.nvim",
		"edementyev/rest.nvim",
		branch = "local",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("conf.rest")
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("conf.dressing")
		end,
	},
}
