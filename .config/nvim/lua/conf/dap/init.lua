-- source all global configs
require("conf.dap.node2")

local dap = require("dap")

dap.defaults.fallback.terminal_win_cmd = "tabnew DapConsole"
-- load a subset of vscode configurations that are supported
-- require("dap.ext.vscode").load_launchjs()
-- autocomplete in repl
vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])
-- sign for breakpoints
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "", linehl = "", numhl = "" })

-- dap default configuration values per language
DEBUG_CONFIGS_BASE = {
	typescript = {
		type = "node2",
		request = "launch",
		cwd = vim.fn.getcwd(),
		outFiles = {
			"${workspaceFolder}/dist/**/*.js",
			"${workspaceFolder}/dist/*.js",
			"${workspaceFolder}/lib/**/*.js",
			"${workspaceFolder}/lib/*.js",
		},
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	javascript = {
		type = "node2",
		request = "launch",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

local u = require("utils")
-- merge workspace configs with base configs
if table.maxn(DEBUG_CONFIGS) > 0 then
  -- u.tprint(DEBUG_CONFIGS, 3)
	for _, item in pairs(DEBUG_CONFIGS) do
		for lang, configs in pairs(item) do
			if dap.configurations[lang] == nil then
				dap.configurations[lang] = {}
			end
			local merged_configs = {}
			merged_configs[lang] = {}
			u.push_tables(dap.configurations[lang], merged_configs[lang])
			for _, config in pairs(configs) do
				table.insert(merged_configs[lang], u.merge_tables({}, DEBUG_CONFIGS_BASE[lang], config))
			end
			-- insert all merged configs into dap.configurations.language
			u.push_tables(dap.configurations[lang], merged_configs[lang])
		end
	end
end
-- u.tprint(dap.configurations, 3)
