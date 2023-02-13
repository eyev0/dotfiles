return {
  {
    "nathom/filetype.nvim",
    config = function()
      require("rc.plugins.filetype")
    end,
  },
  "tpope/vim-repeat",
  {
    "kylechui/nvim-surround",
    config = function()
      require("rc.plugins.nvim-surround")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("rc.plugins.comment")
    end,
  },
  -- "tpope/vim-commentary",
  -- "tpope/vim-unimpaired",
  {
    "gbprod/yanky.nvim",
    config = function()
      require("rc.plugins.yanky")
    end,
  },
  {
    "gbprod/substitute.nvim",
    config = function()
      require("rc.plugins.substitute")
    end,
  },
  { "sgur/vim-textobj-parameter", dependencies = { "kana/vim-textobj-user" } },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("rc.plugins.tabout")
    end,
    enabled = false,
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
      require("rc.plugins.which-key")
    end,
  },
  -- {
  -- 	"cbochs/portal.nvim",
  -- 	config = function()
  -- 		require("rc.plugins.portal")
  -- 	end,
  -- },
  "ThePrimeagen/harpoon",
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("rc.plugins.nvim_tree")
    end,
    tag = "nightly",
    event = "VimEnter",
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("rc.plugins.oil")
    end,
    enabled = false,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("rc.plugins.noice")
    end,
    dev = true,
    -- TODO: pull request
    -- fix scrollbar
    branch = "local",
    dir = O.pluginspath .. "/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("rc.plugins.todo-comments")
    end,
  },
  {
    "hoob3rt/lualine.nvim",
    config = function()
      require("rc.plugins.lualine")
    end,
    enabled = false,
  },
  {
    "voldikss/vim-floaterm",
    config = function()
      require("rc.plugins.floaterm")
    end,
    enabled = false,
  },
  {
    "akinsho/toggleterm.nvim",
    -- tag = "*",
    config = function()
      require("rc.plugins.toggleterm")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("rc.plugins.indent_blankline")
    end,
  },
  { "mbbill/undotree" },
  -- quickfix
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require("rc.plugins.bqf")
    end,
    -- enabled = false,
    dependencies = {
      "junegunn/fzf",
      build = function()
        vim.fn["fzf#install"]()
      end,
    },
  },
  {
    "kwkarlwang/bufjump.nvim",
    config = function()
      require("bufjump").setup({
        forward = nil,
        backward = nil,
        on_success = nil,
      })
    end,
    enabled = false,
  },
  -- { "gabrielpoca/replacer.nvim" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("rc.plugins.autopairs")
    end,
  },
  -- tmux
  -- navigation perks
  {
    "christoomey/vim-tmux-navigator",
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
  { "tmux-plugins/vim-tmux" }, -- syntax highlighting for .tmux.conf
  { "danielpieper/telescope-tmuxinator.nvim" },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("rc.plugins.lastplace")
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("rc.plugins.gitsigns")
    end,
    event = "ColorScheme",
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("rc.plugins.diffview")
    end,
  },
  -- sql
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  -- man
  -- { "paretje/nvim-man" },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("rc.plugins.telescope")
    end,
    dependencies = {
      {
        "folke/trouble.nvim",
        config = true,
      },
      { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VimEnter",
  },
  {
    "edementyev/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("rc.plugins.persistence")
    end,
    enabled = true,
  },
  {
    "olimorris/persisted.nvim",
    event = "BufReadPre",
    config = function()
      require("rc.plugins.persisted")
    end,
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("rc.plugins.treesitter")
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
      require("rc.plugins.treesitter.context")
    end,
    dev = true,
    branch = "local",
    dir = O.pluginspath .. "/nvim-treesitter-context",
  },
  {
    "nvim-treesitter/playground",
    build = ":TSInstall query",
    lazy = true,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = true,
    event = "VimEnter",
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("rc.plugins.illuminate")
    end,
  },
  { "folke/neodev.nvim" },
  { "folke/neoconf.nvim" },
  { "gpanders/editorconfig.nvim" },
  { "chrisbra/csv.vim", ft = "csv" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("rc.plugins.lsp")
    end,
  },
  { "jose-elias-alvarez/nvim-lsp-ts-utils" },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("nvim-navic").setup({ highlight = true })
    end,
    commit = "11e08391eeed00effa85ca24ff9d1e0472cbcd6a",
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("rc.plugins.fidget")
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
      require("rc.plugins.cmp")
    end,
  },
  { "rafamadriz/friendly-snippets" },
  { "onsails/lspkind.nvim" },
  { "liuchengxu/vista.vim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("rc.plugins.lsp.null-ls")
    end,
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("rc.plugins.aerial")
    end,
    -- TODO: lazy load
    -- lazy = true,
  },
  {
    "stevearc/stickybuf.nvim",
    config = function()
      require("rc.plugins.stickybuf")
    end,
  },
  { "folke/lsp-colors.nvim", enabled = false },
  { "mfussenegger/nvim-jdtls" },
  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("rc.plugins.lightbulb")
    end,
  },
  {
    "rafcamlet/nvim-luapad",
    config = function()
      require("rc.plugins.luapad")
    end,
  },
  -- regex
  {
    "bennypowers/nvim-regexplainer",
    config = function()
      require("rc.plugins.regexplainer")
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
      require("rc.plugins.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("rc.plugins.dap.ui")
    end,
    event = "VimEnter",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("rc.plugins.dap.virtual-text")
    end,
  },
  {
    "David-Kunz/jester",
    config = function()
      require("rc.plugins.dap.jester")
    end,
    event = "VimEnter",
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
    enabled = false,
  },
  {
    "sainnhe/gruvbox-material",
    init = function()
      require("rc.colorscheme")
    end,
    config = function()
      if O.colorscheme == "gruvbox-material" then
        -- gruvbox-material
        vim.g.gruvbox_material_foreground = "mix" -- mix, material, original
        vim.g.gruvbox_material_background = "medium" -- soft, medium, hard
        vim.g.gruvbox_material_better_performance = 1
        vim.g.gruvbox_material_transparent_background = 0
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_visual = "reverse"
        vim.g.gruvbox_material_current_word = "grey background"
        vim.cmd("colorscheme gruvbox-material")
      end
    end,
  },
  {
    "catppuccin/nvim",
    init = function()
      require("rc.colorscheme")
    end,
    config = function()
      if O.colorscheme == "catppuccin" then
        require("catppuccin").setup({
          ---@type "mocha" | "macchiato" | "frappe" | "latte"
          flavour = "mocha",
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
            navic = {
              enabled = true,
              custom_bg = "NONE",
            },
          },
        })
        autocmd("ColorScheme", {
          group = augroup("NoiceVisibleCmdlineCursor", {}),
          callback = function()
            vim.api.nvim_set_hl(0, "NoiceCursor", { link = "Cursor" })
            vim.api.nvim_set_hl(0, "NoiceHiddenCursor", { link = "NoiceCursor" })
          end,
        })
        vim.cmd("colorscheme catppuccin")
      end
    end,
  },
  {
    "rebelot/heirline.nvim",
    config = function()
      require("rc.plugins.heirline")
    end,
    event = "ColorScheme",
    dependencies = {
      "gitsigns.nvim",
    },
  },
  {
    "chomosuke/term-edit.nvim",
    -- ft = "toggleterm",
    version = "1.*",
    enabled = false,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("rc.plugins.scrollbar")
    end,
  },
  {
    "lewis6991/spaceless.nvim",
    config = true,
  },
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    -- "NTBBloodbath/rest.nvim",
    -- dir = "~/dev/nvim/rest.nvim",
    -- "edementyev/rest.nvim",
    -- branch = "local",
    "rest-nvim/rest.nvim",
    config = function()
      require("rc.plugins.rest")
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("rc.plugins.dressing")
    end,
    event = "VimEnter",
  },
  {
    "miversen33/import.nvim",
    config = function()
      require("import")
    end,
  },
  {
    "edementyev/workspace_config.nvim",
    config = true,
    dev = true,
  },
  {
    "edementyev/jumplist.nvim",
    config = function()
      require("jumplist").setup()
    end,
    dependencies = { "edementyev/vlog.nvim" },
    dev = true,
  },
}
