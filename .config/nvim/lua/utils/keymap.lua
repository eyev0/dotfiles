local M = {}

local vis_modes = { v = "v", V = "V", vs = "vs", Vs = "Vs", ["CTRL-V"] = "CTRL-V", ["CTRL-Vs"] = "CTRL-Vs" }

M.is_vis_mode = function()
	return vis_modes[vim.api.nvim_get_mode().mode] ~= nil
end

return M
