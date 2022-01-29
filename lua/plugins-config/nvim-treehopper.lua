local M = {}

function M.map()
	omap("m", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
	vnoremap("m", ":lua require('tsht').nodes()<CR>", { silent = true })
end

return M
