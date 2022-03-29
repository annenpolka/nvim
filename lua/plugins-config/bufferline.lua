local M = {}

function M.config()
	require("bufferline").setup({})
end

function M.map()
	-- bufferline configuration
	vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
end

return M
