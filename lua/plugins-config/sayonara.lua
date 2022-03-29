local M = {}

function M.map()
	vim.keymap.set("n", "<C-q>", ":Sayonara<CR>", { silent = true })
end

return M
