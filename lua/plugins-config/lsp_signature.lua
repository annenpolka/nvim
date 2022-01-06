local M = {}

function M.config()
	require("lsp_signature").setup({
		hint_enable = true,
		max_width = 120,
	})
end

return M
