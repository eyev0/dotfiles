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
  local success, result = pcall(loadstring(s))
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
  ["far.vim"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.far\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/far.vim"
  },
  firenvim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/firenvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22conf.indentguides\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/indent-guides.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17conf.lualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nlua.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-bufdel"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-bufdel"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.nvim_tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-pairs"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim"
  },
  undotree = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-cutlass"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-cutlass"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.floaterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-obsession"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-obsession"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-subversive"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-subversive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-tmux"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-yoink"] = {
    loaded = true,
    path = "/home/yev/.local/share/nvim/site/pack/packer/start/vim-yoink"
  },
  vimspector = {
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/vimspector"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/yev/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Conditional loads
time("Condition for { 'vim-tmux', 'nvim-treesitter-pairs', 'vim-tmux-navigator', 'nvim-treesitter-refactor', 'nvim-treesitter-textobjects', 'nvim-ts-autotag', 'vimspector', 'nvim-ts-context-commentstring', 'which-key.nvim', 'nvim-ts-rainbow', 'zen-mode.nvim', 'playground', 'telescope.nvim', 'todo-comments.nvim', 'nvim-treesitter', 'tokyonight.nvim', 'far.vim', 'firenvim', 'gitsigns.nvim', 'indent-guides.nvim', 'undotree', 'vim-floaterm', 'vim-obsession', 'vim-fugitive', 'nlua.nvim', 'lualine.nvim', 'nvim-autopairs', 'nvim-bqf', 'nvim-tree.lua' }", true)
if
try_loadstring("\27LJ\2\n8\0\0\1\0\3\0\t6\0\0\0009\0\1\0009\0\2\0\n\0\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\vvscode\6g\bvim\0", "condition", '{ "vim-tmux", "nvim-treesitter-pairs", "vim-tmux-navigator", "nvim-treesitter-refactor", "nvim-treesitter-textobjects", "nvim-ts-autotag", "vimspector", "nvim-ts-context-commentstring", "which-key.nvim", "nvim-ts-rainbow", "zen-mode.nvim", "playground", "telescope.nvim", "todo-comments.nvim", "nvim-treesitter", "tokyonight.nvim", "far.vim", "firenvim", "gitsigns.nvim", "indent-guides.nvim", "undotree", "vim-floaterm", "vim-obsession", "vim-fugitive", "nlua.nvim", "lualine.nvim", "nvim-autopairs", "nvim-bqf", "nvim-tree.lua" }')
then
time("Condition for { 'vim-tmux', 'nvim-treesitter-pairs', 'vim-tmux-navigator', 'nvim-treesitter-refactor', 'nvim-treesitter-textobjects', 'nvim-ts-autotag', 'vimspector', 'nvim-ts-context-commentstring', 'which-key.nvim', 'nvim-ts-rainbow', 'zen-mode.nvim', 'playground', 'telescope.nvim', 'todo-comments.nvim', 'nvim-treesitter', 'tokyonight.nvim', 'far.vim', 'firenvim', 'gitsigns.nvim', 'indent-guides.nvim', 'undotree', 'vim-floaterm', 'vim-obsession', 'vim-fugitive', 'nlua.nvim', 'lualine.nvim', 'nvim-autopairs', 'nvim-bqf', 'nvim-tree.lua' }", false)
time([[packadd for vim-tmux]], true)
		vim.cmd [[packadd vim-tmux]]
	time([[packadd for vim-tmux]], false)
	time([[packadd for nvim-treesitter-pairs]], true)
		vim.cmd [[packadd nvim-treesitter-pairs]]
	time([[packadd for nvim-treesitter-pairs]], false)
	time([[packadd for vim-tmux-navigator]], true)
		vim.cmd [[packadd vim-tmux-navigator]]
	time([[packadd for vim-tmux-navigator]], false)
	time([[packadd for nvim-treesitter-refactor]], true)
		vim.cmd [[packadd nvim-treesitter-refactor]]
	time([[packadd for nvim-treesitter-refactor]], false)
	time([[packadd for nvim-treesitter-textobjects]], true)
		vim.cmd [[packadd nvim-treesitter-textobjects]]
	time([[packadd for nvim-treesitter-textobjects]], false)
	time([[packadd for nvim-ts-autotag]], true)
		vim.cmd [[packadd nvim-ts-autotag]]
	time([[packadd for nvim-ts-autotag]], false)
	time([[packadd for vimspector]], true)
		vim.cmd [[packadd vimspector]]
	time([[packadd for vimspector]], false)
	time([[packadd for nvim-ts-context-commentstring]], true)
		vim.cmd [[packadd nvim-ts-context-commentstring]]
	time([[packadd for nvim-ts-context-commentstring]], false)
	time([[packadd for which-key.nvim]], true)
		vim.cmd [[packadd which-key.nvim]]
	time([[packadd for which-key.nvim]], false)
	-- Config for: which-key.nvim
	time([[Config for which-key.nvim]], true)
	try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
	time([[Config for which-key.nvim]], false)
	time([[packadd for nvim-ts-rainbow]], true)
		vim.cmd [[packadd nvim-ts-rainbow]]
	time([[packadd for nvim-ts-rainbow]], false)
	time([[packadd for zen-mode.nvim]], true)
		vim.cmd [[packadd zen-mode.nvim]]
	time([[packadd for zen-mode.nvim]], false)
	-- Config for: zen-mode.nvim
	time([[Config for zen-mode.nvim]], true)
	try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
	time([[Config for zen-mode.nvim]], false)
	time([[packadd for playground]], true)
		vim.cmd [[packadd playground]]
	time([[packadd for playground]], false)
	time([[packadd for telescope.nvim]], true)
		vim.cmd [[packadd telescope.nvim]]
	time([[packadd for telescope.nvim]], false)
	-- Config for: telescope.nvim
	time([[Config for telescope.nvim]], true)
	try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.telescope\frequire\0", "config", "telescope.nvim")
	time([[Config for telescope.nvim]], false)
	time([[packadd for todo-comments.nvim]], true)
		vim.cmd [[packadd todo-comments.nvim]]
	time([[packadd for todo-comments.nvim]], false)
	-- Config for: todo-comments.nvim
	time([[Config for todo-comments.nvim]], true)
	try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
	time([[Config for todo-comments.nvim]], false)
	time([[packadd for nvim-treesitter]], true)
		vim.cmd [[packadd nvim-treesitter]]
	time([[packadd for nvim-treesitter]], false)
	-- Config for: nvim-treesitter
	time([[Config for nvim-treesitter]], true)
	try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20conf.treesitter\frequire\0", "config", "nvim-treesitter")
	time([[Config for nvim-treesitter]], false)
	time([[packadd for tokyonight.nvim]], true)
		vim.cmd [[packadd tokyonight.nvim]]
	time([[packadd for tokyonight.nvim]], false)
	-- Config for: tokyonight.nvim
	time([[Config for tokyonight.nvim]], true)
	try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\frequire\0", "config", "tokyonight.nvim")
	time([[Config for tokyonight.nvim]], false)
	time([[packadd for far.vim]], true)
		vim.cmd [[packadd far.vim]]
	time([[packadd for far.vim]], false)
	-- Config for: far.vim
	time([[Config for far.vim]], true)
	try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.far\frequire\0", "config", "far.vim")
	time([[Config for far.vim]], false)
	time([[packadd for firenvim]], true)
		vim.cmd [[packadd firenvim]]
	time([[packadd for firenvim]], false)
	time([[packadd for gitsigns.nvim]], true)
		vim.cmd [[packadd gitsigns.nvim]]
	time([[packadd for gitsigns.nvim]], false)
	-- Config for: gitsigns.nvim
	time([[Config for gitsigns.nvim]], true)
	try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.gitsigns\frequire\0", "config", "gitsigns.nvim")
	time([[Config for gitsigns.nvim]], false)
	time([[packadd for indent-guides.nvim]], true)
		vim.cmd [[packadd indent-guides.nvim]]
	time([[packadd for indent-guides.nvim]], false)
	-- Config for: indent-guides.nvim
	time([[Config for indent-guides.nvim]], true)
	try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22conf.indentguides\frequire\0", "config", "indent-guides.nvim")
	time([[Config for indent-guides.nvim]], false)
	time([[packadd for undotree]], true)
		vim.cmd [[packadd undotree]]
	time([[packadd for undotree]], false)
	time([[packadd for vim-floaterm]], true)
		vim.cmd [[packadd vim-floaterm]]
	time([[packadd for vim-floaterm]], false)
	-- Config for: vim-floaterm
	time([[Config for vim-floaterm]], true)
	try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.floaterm\frequire\0", "config", "vim-floaterm")
	time([[Config for vim-floaterm]], false)
	time([[packadd for vim-obsession]], true)
		vim.cmd [[packadd vim-obsession]]
	time([[packadd for vim-obsession]], false)
	time([[packadd for vim-fugitive]], true)
		vim.cmd [[packadd vim-fugitive]]
	time([[packadd for vim-fugitive]], false)
	time([[packadd for nlua.nvim]], true)
		vim.cmd [[packadd nlua.nvim]]
	time([[packadd for nlua.nvim]], false)
	time([[packadd for lualine.nvim]], true)
		vim.cmd [[packadd lualine.nvim]]
	time([[packadd for lualine.nvim]], false)
	-- Config for: lualine.nvim
	time([[Config for lualine.nvim]], true)
	try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17conf.lualine\frequire\0", "config", "lualine.nvim")
	time([[Config for lualine.nvim]], false)
	time([[packadd for nvim-autopairs]], true)
		vim.cmd [[packadd nvim-autopairs]]
	time([[packadd for nvim-autopairs]], false)
	-- Config for: nvim-autopairs
	time([[Config for nvim-autopairs]], true)
	try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.autopairs\frequire\0", "config", "nvim-autopairs")
	time([[Config for nvim-autopairs]], false)
	time([[packadd for nvim-bqf]], true)
		vim.cmd [[packadd nvim-bqf]]
	time([[packadd for nvim-bqf]], false)
	time([[packadd for nvim-tree.lua]], true)
		vim.cmd [[packadd nvim-tree.lua]]
	time([[packadd for nvim-tree.lua]], false)
	-- Config for: nvim-tree.lua
	time([[Config for nvim-tree.lua]], true)
	try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19conf.nvim_tree\frequire\0", "config", "nvim-tree.lua")
	time([[Config for nvim-tree.lua]], false)
else
time("Condition for { 'vim-tmux', 'nvim-treesitter-pairs', 'vim-tmux-navigator', 'nvim-treesitter-refactor', 'nvim-treesitter-textobjects', 'nvim-ts-autotag', 'vimspector', 'nvim-ts-context-commentstring', 'which-key.nvim', 'nvim-ts-rainbow', 'zen-mode.nvim', 'playground', 'telescope.nvim', 'todo-comments.nvim', 'nvim-treesitter', 'tokyonight.nvim', 'far.vim', 'firenvim', 'gitsigns.nvim', 'indent-guides.nvim', 'undotree', 'vim-floaterm', 'vim-obsession', 'vim-fugitive', 'nlua.nvim', 'lualine.nvim', 'nvim-autopairs', 'nvim-bqf', 'nvim-tree.lua' }", false)
end
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
