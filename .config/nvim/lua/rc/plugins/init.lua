return {
  -- docs in neovim
  -- { "paretje/nvim-man" },
  -- dependency packages
  "nvim-lua/popup.nvim",
  "nvim-tree/nvim-web-devicons",
  "rktjmp/lush.nvim",
  -- neovim/lua development
  { "folke/neodev.nvim" },
  { "folke/neoconf.nvim" },
  { "jbyuki/one-small-step-for-vimkind" },
  {
    "miversen33/import.nvim",
    config = function()
      require("import")
    end,
  },
  {
    "rafcamlet/nvim-luapad",
    config = function()
      require("rc.configs.luapad")
    end,
  },
  "nanotee/luv-vimdocs",
  "milisims/nvim-luaref",
  -- editing
  "tpope/vim-repeat",
  {
    "kylechui/nvim-surround",
    config = function()
      require("rc.configs.nvim-surround")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("rc.configs.comment")
    end,
  },
  {
    "gbprod/yanky.nvim",
    config = function()
      require("rc.configs.yanky")
    end,
  },
  {
    "gbprod/substitute.nvim",
    config = function()
      require("rc.configs.substitute")
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("rc.configs.autopairs")
    end,
  },
  { "sgur/vim-textobj-parameter", dependencies = { "kana/vim-textobj-user" } },
  {
    "lewis6991/spaceless.nvim",
    config = true,
  },
  { "mbbill/undotree" },
  "lambdalisue/suda.vim",
  -- filetype-specific
  {
    "nathom/filetype.nvim",
    config = function()
      require("rc.configs.filetype")
    end,
  },
  "neoclide/jsonc.vim",
  { "gpanders/editorconfig.nvim" },
  { "chrisbra/csv.vim", ft = "csv" },
  -- ui/input
  {
    "rebelot/heirline.nvim",
    config = function()
      require("rc.configs.heirline")
    end,
    event = "ColorScheme",
    dependencies = {
      "gitsigns.nvim",
    },
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("rc.configs.scrollbar")
    end,
  },
  {
    "stevearc/stickybuf.nvim",
    config = function()
      require("rc.configs.stickybuf")
    end,
  },
  "szw/vim-maximizer",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("rc.configs.indent_blankline")
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("rc.configs.dressing")
    end,
    event = "VimEnter",
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("rc.configs.which-key")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("rc.configs.nvim_tree")
    end,
    tag = "nightly",
    event = "VimEnter",
  },
  {
    "folke/noice.nvim",
    config = function()
      require("rc.configs.noice")
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
      require("rc.configs.todo-comments")
    end,
  },
  -- treesitter/editing based on treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("rc.configs.treesitter")
    end,
  },
  { "mrjones2014/nvim-ts-rainbow" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "theHamsta/nvim-treesitter-pairs" },
  { "windwp/nvim-ts-autotag" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "David-Kunz/treesitter-unit" },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("rc.configs.treesitter.context")
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
  -- lsp/lsp-based editing/highlighting
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("rc.configs.lsp")
    end,
  },
  { "mfussenegger/nvim-jdtls" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("rc.configs.lsp.null-ls")
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
    "kosayoda/nvim-lightbulb",
    config = function()
      require("rc.configs.lightbulb")
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("rc.configs.fidget")
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = true,
    event = "VimEnter",
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("rc.configs.illuminate")
    end,
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("rc.configs.aerial")
    end,
    -- TODO: lazy load
    -- lazy = true,
  },
  {
    "ErichDonGubler/lsp_lines.nvim",
    config = true,
  },
  -- completion/snippets
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
    "github/copilot.vim",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "hrsh7th/cmp-copilot",
  },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
  { "rcarriga/cmp-dap" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("rc.configs.cmp")
    end,
  },
  { "onsails/lspkind.nvim" },
  { "rafamadriz/friendly-snippets" },
  -- regex
  {
    "bennypowers/nvim-regexplainer",
    config = function()
      require("rc.configs.regexplainer")
    end,
    enabled = false,
  },
  -- navigation
  "ThePrimeagen/harpoon",
  {
    "edementyev/jumplist.nvim",
    config = function()
      require("jumplist").setup()
    end,
    dependencies = { "edementyev/vlog.nvim" },
    dev = true,
  },
  -- terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("rc.configs.toggleterm")
    end,
  },
  {
    "chomosuke/term-edit.nvim",
    version = "1.*",
    enabled = false,
  },
  -- git
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("rc.configs.gitsigns")
    end,
    event = "ColorScheme",
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("rc.configs.diffview")
    end,
  },
  -- quickfix
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require("rc.configs.bqf")
    end,
    -- enabled = false,
    dependencies = {
      "junegunn/fzf",
      build = function()
        vim.fn["fzf#install"]()
      end,
    },
  },
  -- cmdline
  { "notomo/cmdbuf.nvim" },
  -- tmux
  {
    "christoomey/vim-tmux-navigator",
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
  { "tmux-plugins/vim-tmux" }, -- syntax highlighting for .tmux.conf
  { "danielpieper/telescope-tmuxinator.nvim" },
  -- sql
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("rc.configs.telescope")
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
  -- workspace/sessions
  {
    "edementyev/workspace_config.nvim",
    config = true,
    dev = true,
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("rc.configs.lastplace")
    end,
  },
  {
    "edementyev/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("rc.configs.persistence")
    end,
    enabled = true,
  },
  {
    "olimorris/persisted.nvim",
    event = "BufReadPre",
    config = function()
      require("rc.configs.persisted")
    end,
    enabled = false,
  },
  -- debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("rc.configs.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("rc.configs.dap.ui")
    end,
    event = "VimEnter",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("rc.configs.dap.virtual-text")
    end,
  },
  {
    "David-Kunz/jester",
    config = function()
      require("rc.configs.dap.jester")
    end,
    event = "VimEnter",
  },
  -- nvim in browser
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
  -- colorschemes
  { "folke/lsp-colors.nvim", enabled = false },
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
  -- REST
  {
    "rest-nvim/rest.nvim",
    config = function()
      require("rc.configs.rest")
    end,
  },
}
