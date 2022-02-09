local M = {}

function M.config()
	require("lsp_signature").setup({
		hint_enable = true,
		max_width = 120,
		toggle_key = "<C-s>",
	})
end

return M
