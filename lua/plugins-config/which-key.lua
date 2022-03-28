local M = {}

function M.config()
	require("which-key").setup({
		plugins = {
			presets = {
				operators = true,
			},
		},
	})
end

return M
