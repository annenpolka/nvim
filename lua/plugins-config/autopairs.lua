local M = {}

function M.config()
	require("nvim-autopairs").setup({
		check_ts = true,
		map_bs = false,
	})
end

return M
