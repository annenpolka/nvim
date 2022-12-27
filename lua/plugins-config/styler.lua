local M = {}

function M.config()
	require("styler").setup({
		themes = {
			markdown = { colorscheme = "oxocarbon" },
			help = { colorscheme = "oxocarbon", background = "dark" },
		},
	})
end

return M
