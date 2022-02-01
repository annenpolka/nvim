local dap = require("dap")
dap.adapters.lldb = {
	type = "executable",
	command = "/home/linuxbrew/.linuxbrew/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			return vim.fn.expand("%:r") -- get no-extension filePath
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},

		runInTerminal = false,
	},
}
