local M = {}

function M.config()
	-- spectre search configuration
	require("spectre").setup({
		live_update = true,
		open_cmd = "vnew",
	})
end

function M.map()
	vim.keymap.set(
		"n",
		"<leader>f",
		"<cmd>lua require('spectre').open()<CR>",
		{ noremap = true, silent = true }
	)
end

return M