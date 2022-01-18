local M = {}

function M.config()
	require("nvim-autopairs").setup({
		check_ts = true,
		map_bs = true,
	})
end

return M
