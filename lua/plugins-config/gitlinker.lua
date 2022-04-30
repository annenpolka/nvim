local M = {}

function M.config()
	require("gitlinker").setup({
		mappings = "<leader>Gl",
	})
end

return M
