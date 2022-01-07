local M = {}

function M.config()
	require("toggleterm").setup({
		open_mapping = [[<c-Space>]],
	})
end

return M
