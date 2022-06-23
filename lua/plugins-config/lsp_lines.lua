local M = {}

function M.config()
	require("lsp_lines").register_lsp_virtual_lines()
end

return M
