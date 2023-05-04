DEBUG_CONFIG = vim.env.NVIM_DEBUG_MY_CONFIG == 1 and true or false
IS_FIRENVIM = vim.g.started_by_firenvim ~= nil or vim.env.NVIM_FIRENVIM == 1
require("rc")
