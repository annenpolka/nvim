local M = {}

function M.config()
	-- Replace vim.notify with nvim-notify
	-- vim.notify = require("notify")

	require("notify").setup({
		background_colour = "#000000",
		fps = 60,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		minimum_width = 50,
		render = "default",
		stages = "fade_in_slide_out",
		timeout = 1500,
		top_down = true,
	})
end

return M
