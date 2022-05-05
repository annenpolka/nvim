local M = {}

function M.config()
	require("anywise_reg").setup({
		operators = { "y", "d", "c" },
		textobjects = {
			{ "i", "a" },
			{ "w", "W", "f", "F", "s", "m", "b", "i", "{", '"' },
		},
		paste_keys = {
			["P"] = "p",
			-- ["X"] = "P",
		},
		register_print_cmd = true,
	})
end

return M
