local dap = require("dap")
local utils = require("dbg.utils")

-- lldb-vscode
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

-- confirm lldb-vscode is installed
local command_exists = utils.file_exists(dap.adapters.lldb.command)
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

-- -- codelldb
-- dap.adapters.codelldb = {
-- 	type = "server",
-- 	port = "${port}",
-- 	executable = {
-- 		-- CHANGE THIS to your path!
-- 		command = utils.exec_path .. "codelldb",
-- 		args = { "--port", "${port}" },
--
-- 		-- On windows you may have to uncomment this:
-- 		-- detached = false,
-- 	},
-- }
--
-- dap.configurations.cpp = {
-- 	{
-- 		name = "Launch file",
-- 		type = "codelldb",
-- 		request = "launch",
-- 		program = function()
-- 			-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 			return vim.fn.expand("%:r") -- get no-extension filePath
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false,
-- 	},
-- }
