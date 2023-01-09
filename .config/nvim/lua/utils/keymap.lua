local M = {}

M.vis_modes = { "v", "V", "vs", "Vs", "CTRL-V", "CTRL-Vs" }

M.in_vis_mode = function()
	return M.vis_modes[vim.api.nvim_get_mode().mode] ~= nil
end

return M
