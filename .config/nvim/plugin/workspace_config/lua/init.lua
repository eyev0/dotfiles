local ffi = require("ffi")
local lfs = require("lfs")

ffi.cdef([[
 int getuid(void);
]])

local function file_owned_by_me(file)
	return ffi.C.getuid() == lfs.attributes(file).uid
end

local function load_file(path)
	if file_owned_by_me(path) then
		vim.cmd([[luafile ]] .. path)
		print("loaded " .. path)
		return true
	else
		print(path .. " exists but is not loaded. Security reason: a diffent owner.")
	end
	return false
end

local home = vim.fn.expand("$HOME")
local function load(files)
	local cwd = vim.fn.getcwd()
	for _, file in pairs(files) do
		local dirpath = cwd .. "/"
		local filepath
		while vim.loop.fs_realpath(dirpath) ~= home do
			filepath = dirpath .. file
			if vim.loop.fs_stat(filepath) then
				load_file(filepath)
				break
			else
				dirpath = dirpath .. "../"
			end
		end
	end
end

load({ ".nvim" })

return {
	load = load,
}
