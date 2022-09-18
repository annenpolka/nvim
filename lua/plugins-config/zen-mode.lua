local M = {}

function M.config()
	require("zen-mode").setup()
end

function M.map()
	nnoremap("<leader>Z", ":ZenMode<CR>", { silent = true })
end

return M
