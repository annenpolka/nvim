local M = {}

function M.config()
	require("qf_helper").setup({})
end

function M.map()
	vim.api.nvim_set_keymap("n", "q", ":QNext<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "Q", ":QPrev<CR>", { noremap = true, silent = true })
end
return M
