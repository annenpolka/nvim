local M = {}

function M.config() end

function M.map()
	vim.api.nvim_set_keymap("n", "S", ":Pounce<CR>", { noremap = true, silent = true })
end

return M
