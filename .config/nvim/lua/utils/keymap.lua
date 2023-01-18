local M = {}

local vis_modes = { "v", "V", "vs", "Vs", "CTRL-V", "CTRL-Vs" }

M.is_vis_mode = function()
	return U.to_lookup_map(vis_modes)[vim.api.nvim_get_mode().mode] ~= nil
end

return M
