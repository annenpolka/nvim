local M = {}

function M.config()
	require("trevj").setup()
end

function M.map()
	vim.keymap.set("n", "gJ", require("trevj").format_at_cursor, {})
end

return M
