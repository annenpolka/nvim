local M = {}

function M.config()
	require("bufferline").setup({})
end

function M.map()
	-- bufferline configuration
	vim.api.nvim_set_keymap("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
end

return M
