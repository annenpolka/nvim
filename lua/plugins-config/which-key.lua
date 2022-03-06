local M = {}

function M.config()
	require("which-key").setup({
		plugins = {
			presets = {
				operators = false,
			},
		},
	})
end

return M
