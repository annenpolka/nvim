local M = {}

function M.config()
	-- Code Biscuits
	local biscuits = require("nvim-biscuits").setup({
		toggle_keybind = "<leader>bs",
		cursor_line_only = true,
		show_on_start = true,
		default_config = {
			max_length = 120,
			min_distance = 3,
			prefix_string = "<- ",
		},
		language_config = {
			python = {
				disabled = true,
			},
		},
	})
end

return M
