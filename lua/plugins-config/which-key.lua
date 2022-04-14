local M = {}

function M.config()
	require("which-key").setup({
		plugins = {
			presets = {
				operators = true,
			},
			registers = false,
		},
	})
end

return M
