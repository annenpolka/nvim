local M = {}

function M.config()
	require("anywise_reg").setup({
		operators = { "y", "d", "c" },
		textobjects = {
			{ "i", "a" },
			{ "w", "W", "f", "F", "c", "m", "b" },
		},
		paste_keys = {
			["x"] = "p",
			["X"] = "P",
		},
		register_print_cmd = true,
	})
end

return M
