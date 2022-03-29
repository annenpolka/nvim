local M = {}

function M.config()
	require("todo-comments").setup()
end

function M.map()
	vim.keymap.set("n", "<leader>tt", ":TodoTrouble<CR>", { noremap = true, silent = true })
end
return M
