local M = {}

function M.config()
	require("anywise_reg").setup({
		operators = { "y", "d", "c" },
		textobjects = {
			{ "i", "a" },
			{ "w", "W", "f", "F", "s", "m", "b", "i" },
		},
		paste_keys = { -- map manually to avoid conflicts
			-- ["X"] = "P",
		},
		register_print_cmd = false,
	})
end

function M.map()
	nnoremap("P", "<Cmd>lua require('anywise_reg.handlers').handle_paste('', 'p')<CR>")
	xnoremap("P", "<Cmd>lua require('anywise_reg.handlers').handle_paste('', 'p')<CR>")
end

return M
