local M = {}

function M.config()
	require("pretty-fold").setup({})
	require("pretty-fold.preview").setup_keybinding()
end

return M
