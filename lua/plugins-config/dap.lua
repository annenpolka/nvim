local M = {}

function M.config()
	-- load each language settings
	require("dbg")
	-- initialize dap-ui
	require("dapui").setup()
end

function M.map() end

return M
