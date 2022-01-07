local M = {}

function M.map()
	vim.api.nvim_set_keymap("n", "<C-q>", ":Sayonara<CR>", { silent = true })
end

return M
