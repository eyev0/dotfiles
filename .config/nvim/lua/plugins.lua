return {
	{
		"nathom/filetype.nvim",
		config = function()
			require("conf.filetype")
		end,
	},
	"tpope/vim-repeat",
	{
		"kylechui/nvim-surround",
		config = function()
			require("conf.nvim-surround")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("conf.comment")
		end,
	},
	-- "tpope/vim-commentary",
	"tpope/vim-unimpaired",
	{
		"gbprod/yanky.nvim",
		config = function()
			require("conf.yanky")
		end,
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			require("conf.substitute")
		end,
	},
	{ "sgur/vim-textobj-parameter", dependencies = { "kana/vim-textobj-user" } },
	{
		"abecodes/tabout.nvim",
		config = function()
			require("conf.tabout")
		end,
	},
	"szw/vim-maximizer",
	"lambdalisue/suda.vim",
	-- docs
	"nanotee/luv-vimdocs",
	"milisims/nvim-luaref",
	-- deps
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
	{
		"cbochs/portal.nvim",
		config = function()
			require("conf.portal")
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
		enabled = false,
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
		dependencies = {
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("conf.autopairs")
		end,
	},
	-- tmux
	-- navigation perks
	{
		"christoomey/vim-tmux-navigator",
		config = function()
			vim.g.tmux_navigator_no_mappings = 1
		end,
	},
	-- syntax highlighting for .tmux.conf
	{ "tmux-plugins/vim-tmux" },
	{ "danielpieper/telescope-tmuxinator.nvim" },
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
	-- sql
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-ui" },
	-- man
	-- { "paretje/nvim-man" },
	-- telescope
	{ "nvim-telescope/telescope-dap.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
		config = function()
			require("conf.persistence")
		end,
		enabled = false,
	},
	{
		"olimorris/persisted.nvim",
		event = "BufReadPre",
		config = function()
			require("conf.persisted")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("conf.treesitter")
		end,
	},
	{ "mrjones2014/nvim-ts-rainbow", enabled = true },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "theHamsta/nvim-treesitter-pairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "David-Kunz/treesitter-unit" },
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("conf.ts-context")
		end,
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
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				delay = 50,
			})
		end,
	},
	{ "folke/neodev.nvim" },
	{ "folke/neoconf.nvim" },
	{ "gpanders/editorconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
		config = function()
			require("conf.lsp")
		end,
	},
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
	{ "hrsh7th/cmp-omni" },
	{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "lukas-reineke/cmp-under-comparator" },
	{
		"hrsh7th/cmp-copilot",
	},
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "rcarriga/cmp-dap" },
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
	},
	{
		"stevearc/stickybuf.nvim",
		config = function()
			require("stickybuf").setup({
				buftype = {
					help = false,
				},
				filetype = {
					-- NvimTree = "filetype",
          httpResult = "filetype",
					fugitive = "filetype",
					DiffviewFiles = "filetype",
				},
			})
		end,
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
	-- regex
	{
		"bennypowers/nvim-regexplainer",
		config = function()
			require("regexplainer").setup({
				display = "split",
				mappings = {
					toggle = "gR",
				},
			})
		end,
		enabled = false,
	},
	{ "notomo/cmdbuf.nvim" },
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
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("conf.dap.virtual-text")
		end,
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
		config = function()
			vim.g.firenvim_config = {
				["globalSettings"] = { ["takeover"] = "never" },
				-- ["localSettings"] = { [".*"] = { ["takeover"] = "never" } },
			}
		end,
	},
	{
		"sainnhe/gruvbox-material",
		init = function()
			require("colorscheme")
		end,
		config = function()
			-- gruvbox-material
			vim.g.gruvbox_material_foreground = "mix" -- mix, material, original
			vim.g.gruvbox_material_background = "medium" -- soft, medium, hard
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_visual = "reverse"
			vim.g.gruvbox_material_current_word = "grey background"
			vim.cmd("colorscheme gruvbox-material")
		end,
		enabled = true,
	},
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				background = {
					-- light = "latte",
					-- dark = "mocha",
				},
				transparent_background = false,
				integrations = {
					aerial = true,
					notify = true,
					noice = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
		enabled = false,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("conf.scrollbar")
		end,
	},
	{
		"lewis6991/spaceless.nvim",
		config = true,
    enabled = false,
	},
	{
		"github/copilot.vim",
		init = function()
			vim.g.copilot_no_tab_map = true
		end,
		enabled = true,
	},
	{
		-- "NTBBloodbath/rest.nvim",
		-- dir = "~/dev/nvim/rest.nvim",
		-- "edementyev/rest.nvim",
		-- branch = "local",
		"rest-nvim/rest.nvim",
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
	{
		-- "workspace_config",
		dir = vim.fn.stdpath("config") .. "/plugin/workspace_config",
		dev = true,
		dependencies = { "mfussenegger/nvim-dap" },
	},
}
