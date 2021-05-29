local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

-- not working?..
-- vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- text editing sugar
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-abolish'
    use 'svermeulen/vim-cutlass'
    use 'svermeulen/vim-yoink'
    use 'svermeulen/vim-subversive'
    use 'unblevable/quick-scope'
    use 'tommcdo/vim-exchange'
    use {'sgur/vim-textobj-parameter', requires = {'kana/vim-textobj-user'}}
    -- buffer stuff
    use 'szw/vim-maximizer'
    use 'ojroques/nvim-bufdel'
    -- filesystem
    use 'tpope/vim-eunuch'
    use 'lambdalisue/suda.vim'
    if vim.g.vscode == nil then
      -- deps
      use 'nvim-lua/plenary.nvim'
      use 'nvim-lua/popup.nvim'
      use 'rktjmp/lush.nvim'
      use 'kyazdani42/nvim-web-devicons'
      -- utils
      use 'tpope/vim-obsession'
      use { "folke/which-key.nvim", config = function() require("which-key").setup() end, }
      -- text editor enhancements
      use { 'kyazdani42/nvim-tree.lua', config = function () require'conf.nvim_tree' end, }
      use { 'hoob3rt/lualine.nvim', config = function() require'conf.lualine' end, }
      use { 'voldikss/vim-floaterm', config = function () require'conf.floaterm' end, }
      use { 'notomo/cmdbuf.nvim', config = function () require'conf.cmdbuf' end }
      use { 'glepnir/indent-guides.nvim', config = function () require'conf.indentguides' end, }
      use 'mbbill/undotree'
      use 'kevinhwang91/nvim-bqf'
      use { 'windwp/nvim-autopairs', config = function () require'conf.autopairs' end, }
      use { 'folke/todo-comments.nvim', config = function() require'todo-comments'.setup() end }
      use { 'brooth/far.vim', config = function () require'conf.far' end }
      use { 'folke/zen-mode.nvim', config = function() require'zen-mode'.setup() end }
      -- tmux
      use 'christoomey/vim-tmux-navigator' -- navigation perks
      use 'tmux-plugins/vim-tmux' -- syntax highlighting for .tmux.conf
      -- git
      use 'tpope/vim-fugitive'
      use {'pwntester/octo.nvim', config = function () require'octo'.setup() end}
      use { 'lewis6991/gitsigns.nvim', config = function() require'conf.gitsigns' end, }
      use { 'sindrets/diffview.nvim', config = function() require'conf.diffview' end, }
      -- telescope
      use { 'nvim-telescope/telescope.nvim', config = function() require'conf.telescope' end, }
      -- lsp
      use { 'neovim/nvim-lspconfig', config = function () require'conf.lsp' end, }
      use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
      use { 'glepnir/lspsaga.nvim', config = function () require'conf.lspsaga' end }
      use { 'hrsh7th/nvim-compe', config = function () require'conf.compe' end }
      use { 'ray-x/lsp_signature.nvim', as = 'lsp_signature', disable = true }
      use 'hrsh7th/vim-vsnip'
      use 'hrsh7th/vim-vsnip-integ'
      use 'rafamadriz/friendly-snippets'
      use { 'folke/lsp-trouble.nvim', config = function () require'conf.lsptrouble' end, }
      -- sql
      use 'tpope/vim-dadbod'
      use 'kristijanhusak/vim-dadbod-ui'
      -- lua stuff
      -- TODO: check it out
      -- use 'bfredl/nvim-luadev'
      use 'tjdevries/nlua.nvim'
      -- debugging
      -- TODO: check out nvim-dap
      -- use 'mfussenegger/nvim-dap'
      use 'puremourning/vimspector'
      -- tags list
      -- symbol outline
      use { 'simrat39/symbols-outline.nvim', config = function() require'conf.outline' end }
      -- use { 'edementyev/symbols-outline.nvim', config = function() require'conf.outline' end }
      -- use 'preservim/tagbar'
      -- file formatting
      use 'dense-analysis/ale'
      -- treesitter - top shit
      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require'conf.treesitter' end }
      use 'nvim-treesitter/nvim-treesitter-refactor'
      use 'nvim-treesitter/nvim-treesitter-textobjects'
      use 'nvim-treesitter/playground'
      use 'theHamsta/nvim-treesitter-pairs'
      use 'windwp/nvim-ts-autotag'
      use 'p00f/nvim-ts-rainbow'
      use 'romgrk/nvim-treesitter-context'
      use 'JoosepAlviste/nvim-ts-context-commentstring'
      -- other --
      use 'glacambre/firenvim'
      -- colors
      use 'folke/tokyonight.nvim'
      use { 'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup() end, }
      use 'tjdevries/colorbuddy.nvim'
    end

    -- vim.cmd[[PackerInstall]]
end)
