local M = {}

function M.config()
	require("substitute").setup()
	-- operators
	vim.keymap.set("n", "S", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
	vim.keymap.set("n", "SS", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
	-- vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
	-- vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
end

return M
