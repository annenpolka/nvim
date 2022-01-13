local M = {}

function M.config()
	require("todo-comments").setup()
end

function M.map()
	vim.api.nvim_set_keymap("n", "<leader>tt", ":TodoTrouble<CR>", { noremap = true, silent = true })
end
return M
