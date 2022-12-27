local M = {}

function M.config()
	require("styler").setup({
		themes = {
			markdown = { colorscheme = "sherbet" },
			help = { colorscheme = "tokyonight", background = "dark" },
		},
	})
end

return M
