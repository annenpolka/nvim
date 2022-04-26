local M = {}

function M.config()
	require("substitute").setup()
	-- substitute operators
	vim.keymap.set("n", "S", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
	vim.keymap.set("n", "SS", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
	-- vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
	-- vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
	-- exchange operators
	vim.keymap.set("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
	vim.keymap.set("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
	-- vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
	vim.keymap.set("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
end

return M
