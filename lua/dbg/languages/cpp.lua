local dap = require("dap")
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}
-- confirm lldb-vscode is installed
local command_exists = require("dbg.utils").file_exists(dap.adapters.lldb.command)
if not command_exists then
	-- for Ubuntu 21.10
	dap.adapters.lldb.command = "/usr/bin/lldb-vscode-13"
end

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
