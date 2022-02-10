-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/yev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/yev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/yev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/yev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-npm"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["diffview.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.diffview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["far.vim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.far\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/far.vim",
    url = "https://github.com/brooth/far.vim"
  },
  firenvim = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["gitsigns.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-guides.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22conf.indentguides\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/indent-guides.nvim",
    url = "https://github.com/glepnir/indent-guides.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim",
    url = "https://github.com/nvim-lua/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17conf.lualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mapx.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vglobal\2\nsetup\tmapx\frequire\0" },
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/mapx.nvim",
    url = "https://github.com/b0o/mapx.nvim"
  },
  ["nlua.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nlua.nvim",
    url = "https://github.com/tjdevries/nlua.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21conf.lsp.null-ls\frequire\0" },
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-bufdel"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-bufdel",
    url = "https://github.com/ojroques/nvim-bufdel"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.cmp\frequire\0" },
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-lsputils",
    url = "https://github.com/RishabhRD/nvim-lsputils"
  },
  ["nvim-scrollbar"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.scrollbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.nvim_tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.ts-context\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-pairs"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-pairs",
    url = "https://github.com/theHamsta/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-textobjects"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["telescope.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23conf.todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/edementyev/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.twilight\frequire\0" },
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-cutlass"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-cutlass",
    url = "https://github.com/svermeulen/vim-cutlass"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-floaterm"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.floaterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-subversive"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-subversive",
    url = "https://github.com/svermeulen/vim-subversive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-tmux"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-tmux",
    url = "https://github.com/tmux-plugins/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-yoink"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-yoink",
    url = "https://github.com/svermeulen/vim-yoink"
  },
  vimspector = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.vimspector\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vimspector",
    url = "https://github.com/puremourning/vimspector"
  },
  ["vista.vim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    cond = { "\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\vvscode\6g\bvim\0" },
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.twilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21conf.lsp.null-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: mapx.nvim
time([[Config for mapx.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vglobal\2\nsetup\tmapx\frequire\0", "config", "mapx.nvim")
time([[Config for mapx.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Conditional loads
time([[Conditional loading of vim-fugitive]], true)
  require("packer.load")({"vim-fugitive"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-fugitive]], false)
time([[Conditional loading of telescope.nvim]], true)
  require("packer.load")({"telescope.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope.nvim]], false)
time([[Conditional loading of todo-comments.nvim]], true)
  require("packer.load")({"todo-comments.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of todo-comments.nvim]], false)
time([[Conditional loading of tokyonight.nvim]], true)
  require("packer.load")({"tokyonight.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of tokyonight.nvim]], false)
time([[Conditional loading of firenvim]], true)
  require("packer.load")({"firenvim"}, {}, _G.packer_plugins)
time([[Conditional loading of firenvim]], false)
time([[Conditional loading of gitsigns.nvim]], true)
  require("packer.load")({"gitsigns.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of gitsigns.nvim]], false)
time([[Conditional loading of vim-tmux]], true)
  require("packer.load")({"vim-tmux"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-tmux]], false)
time([[Conditional loading of indent-guides.nvim]], true)
  require("packer.load")({"indent-guides.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of indent-guides.nvim]], false)
time([[Conditional loading of vim-tmux-navigator]], true)
  require("packer.load")({"vim-tmux-navigator"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-tmux-navigator]], false)
time([[Conditional loading of lualine.nvim]], true)
  require("packer.load")({"lualine.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lualine.nvim]], false)
time([[Conditional loading of vista.vim]], true)
  require("packer.load")({"vista.vim"}, {}, _G.packer_plugins)
time([[Conditional loading of vista.vim]], false)
time([[Conditional loading of which-key.nvim]], true)
  require("packer.load")({"which-key.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of which-key.nvim]], false)
time([[Conditional loading of zen-mode.nvim]], true)
  require("packer.load")({"zen-mode.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of zen-mode.nvim]], false)
time([[Conditional loading of nlua.nvim]], true)
  require("packer.load")({"nlua.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of nlua.nvim]], false)
time([[Conditional loading of nvim-autopairs]], true)
  require("packer.load")({"nvim-autopairs"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-autopairs]], false)
time([[Conditional loading of nvim-lspconfig]], true)
  require("packer.load")({"nvim-lspconfig"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lspconfig]], false)
time([[Conditional loading of diffview.nvim]], true)
  require("packer.load")({"diffview.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of diffview.nvim]], false)
time([[Conditional loading of nvim-scrollbar]], true)
  require("packer.load")({"nvim-scrollbar"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-scrollbar]], false)
time([[Conditional loading of nvim-tree.lua]], true)
  require("packer.load")({"nvim-tree.lua"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-tree.lua]], false)
time([[Conditional loading of vim-floaterm]], true)
  require("packer.load")({"vim-floaterm"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-floaterm]], false)
time([[Conditional loading of nvim-treesitter]], true)
  require("packer.load")({"nvim-treesitter"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-treesitter]], false)
time([[Conditional loading of undotree]], true)
  require("packer.load")({"undotree"}, {}, _G.packer_plugins)
time([[Conditional loading of undotree]], false)
time([[Conditional loading of nvim-treesitter-context]], true)
  require("packer.load")({"nvim-treesitter-context"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-treesitter-context]], false)
time([[Conditional loading of nvim-bqf]], true)
  require("packer.load")({"nvim-bqf"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-bqf]], false)
time([[Conditional loading of nvim-treesitter-pairs]], true)
  require("packer.load")({"nvim-treesitter-pairs"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-treesitter-pairs]], false)
time([[Conditional loading of lsp_signature.nvim]], true)
  require("packer.load")({"lsp_signature.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lsp_signature.nvim]], false)
time([[Conditional loading of nvim-treesitter-textobjects]], true)
  require("packer.load")({"nvim-treesitter-textobjects"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-treesitter-textobjects]], false)
time([[Conditional loading of vimspector]], true)
  require("packer.load")({"vimspector"}, {}, _G.packer_plugins)
time([[Conditional loading of vimspector]], false)
time([[Conditional loading of nvim-ts-autotag]], true)
  require("packer.load")({"nvim-ts-autotag"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-ts-autotag]], false)
time([[Conditional loading of nvim-ts-context-commentstring]], true)
  require("packer.load")({"nvim-ts-context-commentstring"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-ts-context-commentstring]], false)
time([[Conditional loading of far.vim]], true)
  require("packer.load")({"far.vim"}, {}, _G.packer_plugins)
time([[Conditional loading of far.vim]], false)
time([[Conditional loading of nvim-ts-rainbow]], true)
  require("packer.load")({"nvim-ts-rainbow"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-ts-rainbow]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
