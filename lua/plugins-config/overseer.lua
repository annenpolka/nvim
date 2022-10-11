local M = {}

function M.config()
	require("overseer").setup()
end

function M.map()
	vim.keymap.set("n", "<leader>tt", "<Cmd>OverseerToggle<CR>")
	vim.keymap.set("n", "<leader>ta", "<Cmd>OverseerTaskAction<CR>")
	vim.keymap.set("n", "<leader>tr", "<Cmd>OverseerRun<CR>")
end

return M
