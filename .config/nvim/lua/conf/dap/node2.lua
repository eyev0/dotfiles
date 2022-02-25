local dap = require("dap")

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/nvim/dap/vscode-node-debug2/out/src/nodeDebug.js" },
}

table.insert(DEBUG_CONFIGS, {
	javascript = {
		{
			name = "Launch file",
			program = "${file}",
		},
	},
})

table.insert(DEBUG_CONFIGS, {
	typescript = {
		{
			name = "Launch file",
			program = "${file}",
		},
		{
			name = "Launch file2",
			program = "${file}",
		},
	},
})
