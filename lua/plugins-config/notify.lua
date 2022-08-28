local M = {}

function M.config()
	-- Replace notify with nvim-notify
	vim.notify = require("notify")
	require("notify").setup({
		background_colour = "#000000",
	})
end

return M