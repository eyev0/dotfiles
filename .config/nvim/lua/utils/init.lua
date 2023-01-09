local M = {}

M.tprint = function(tbl, max_depth, depth)
	if not max_depth then
		max_depth = 2
	end
	if not depth then
		depth = 0
	end
	for k, v in pairs(tbl) do
		local formatting = string.rep("  ", depth) .. k .. ": "
		if type(v) == "table" and depth < max_depth then
			print(formatting)
			M.tprint(v, max_depth, depth + 1)
		else
			print(formatting .. tostring(v))
		end
	end
end

M.merge_tables = function(target, ...)
	local tables = { ... }
	if type(target) == "table" then
		for _, table in pairs(tables) do
			if type(table) == "table" then
				for k, v in pairs(table) do
					target[k] = v
				end
			end
		end
	end
	return target
end

M.insert_tables = function(target, ...)
	local tables = { ... }
	if type(target) == "table" then
		for _, t in pairs(tables) do
			if type(t) == "table" then
				for _, value in pairs(t) do
					table.insert(target, value)
				end
			end
		end
	end
	return target
end

require("utils.trim_whitespace")

return M
