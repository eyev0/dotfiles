local ffi = require("ffi")
local lfs = require("lfs")
ffi.cdef[[
 int getuid(void);
]]

local function file_owned_by_me(file)
  return ffi.C.getuid() == lfs.attributes(file).uid
end

local function check_and_source(path, load_fn)
  if (file_owned_by_me(path)) then
    load_fn(path)
    print('loaded '..path)
    return true
  else
    print(path .. " exists but is not loaded. Security reason: a diffent owner.")
  end
  return false
end

local function load_file(filename, load)
  local cwd = vim.fn.getcwd()
  local path = cwd..'/'..filename
  local loaded = false
  if vim.loop.fs_stat(path) then
    loaded = check_and_source(path, load)
  else
    -- search up a dir
    path = cwd..'/../'..filename
    if vim.loop.fs_stat(path) then
      loaded = check_and_source(path, load)
    end
  end
  return loaded
end

local function load()
  if load_file('.nvimrc.lua', function (file) vim.cmd([[luafile ]]..file) end) then
    return
  else
    load_file('.nvimrc', function (file) vim.cmd([[source ]]..file) end)
  end
end

return {
  load = load
}
